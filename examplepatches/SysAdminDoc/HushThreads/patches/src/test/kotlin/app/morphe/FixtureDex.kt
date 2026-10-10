/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.io.InputStream
import java.lang.ref.SoftReference
import java.nio.ByteBuffer
import java.nio.file.Files
import java.nio.file.attribute.BasicFileAttributes
import java.nio.file.attribute.FileTime
import java.util.concurrent.ConcurrentHashMap
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

private val DEX = Regex("""classes\d*\.dex""")

/** The base APK's entry in a bundle: base.apk in an .apkm, the package's name in an .xapk. */
private val BASE_NAMES = listOf("base.apk", "com.instagram.barcelona.apk")

/**
 * The bytes of every dex in a Threads build, in order, streamed out of the APK so no APK lands on
 * disk. A build is an .apkm or .xapk, whose base APK is read from inside it, or a merged .apk.
 */
internal fun fixtureDexBytes(build: File, visit: (ByteArray) -> Unit) {
    fun read(apk: InputStream) = ZipInputStream(apk.buffered()).use { entries ->
        while (true) {
            val entry = entries.nextEntry ?: break
            if (DEX.matches(entry.name)) visit(entries.readBytes())
        }
    }
    if (build.extension == "apk") return build.inputStream().use(::read)
    ZipFile(build).use { zip ->
        val base = BASE_NAMES.firstNotNullOfOrNull { zip.getEntry(it) }
            ?: error("${build.name} holds none of ${BASE_NAMES.joinToString()}")
        zip.getInputStream(base).use(::read)
    }
}

/**
 * Reads the classes a fixture test needs out of a Threads build. Each build's dex files are read
 * and parsed once per test JVM (FixtureParseMemo) and held softly, so the fixture task's heap
 * decides how long they stay. What it hands back are immutable copies, which keep none of the dex
 * they came from.
 */
internal object FixtureDex {
    private val parsed = FixtureParseMemo(::fixtureDexBytes) { bytes ->
        DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes))
    }

    private fun forEachDex(build: File, visit: (DexBackedDexFile) -> Unit) {
        for (dex in parsed.get(build)) visit(dex)
    }

    /**
     * Every dex of the build, one at a time, for a test that looks for several things in one pass.
     * Whatever [visit] keeps has to be copied out, as the other readers here do.
     */
    fun forEach(build: File, visit: (DexBackedDexFile) -> Unit) = forEachDex(build, visit)

    /** The classes of [types] the build carries, by type. */
    fun classes(build: File, types: Set<String>): Map<String, ClassDef> {
        val found = mutableMapOf<String, ClassDef>()
        forEachDex(build) { dex ->
            for (classDef in dex.classes) {
                if (classDef.type in types && classDef.type !in found) found[classDef.type] = ImmutableClassDef.of(classDef)
            }
        }
        return found
    }

    /**
     * Every class with a method that [wanted] picks, in the dex files [dexFilter] lets through. The
     * filter is how a whole-APK search stays quick: a call needs its target in the dex's method
     * section, and a string needs to be in its string section, so a dex without them can be
     * skipped unread.
     */
    fun classesWhere(build: File, dexFilter: (DexBackedDexFile) -> Boolean, wanted: (Method) -> Boolean): List<ClassDef> {
        val found = mutableListOf<ClassDef>()
        forEachDex(build) { dex ->
            if (!dexFilter(dex)) return@forEachDex
            for (classDef in dex.classes) {
                if (classDef.methods.any(wanted)) found += ImmutableClassDef.of(classDef)
            }
        }
        return found
    }

    /** Every method that [wanted] picks, in the dex files [dexFilter] lets through. */
    fun methodsWhere(build: File, dexFilter: (DexBackedDexFile) -> Boolean, wanted: (Method) -> Boolean): List<Method> {
        val found = mutableListOf<Method>()
        forEachDex(build) { dex ->
            if (!dexFilter(dex)) return@forEachDex
            for (classDef in dex.classes) {
                for (method in classDef.methods) {
                    if (wanted(method)) found += ImmutableMethod.of(method)
                }
            }
        }
        return found
    }
}

/**
 * Each build's dex files, read and parsed once per test JVM and kept softly. [read] hands over a
 * build's dex bytes in order (fixtureDexBytes), and [parse] turns each into what the callers walk.
 *
 * The fixture tests ask for the same declared builds again and again, a few times in each test.
 * Inflating the base APK out of the bundle and parsing every dex in it again on every ask was most
 * of their time, so it happens on the first ask now and the parsed set answers the rest. A build is
 * known again by its real path, size, modification time and file key, and one replaced under the
 * same path in a way that moves any of those is read afresh. A swap that keeps all four is left to
 * :patches:fixtureTest, which holds the fixture folder's SHA-256 digests from its start to its end.
 * A heap that runs short drops a parsed set, and the next ask reads the build again.
 */
internal class FixtureParseMemo<T : Any>(
    private val read: (File, (ByteArray) -> Unit) -> Unit,
    private val parse: (ByteArray) -> T,
) {
    private data class Identity(val path: String, val size: Long, val modified: FileTime, val key: Any?)
    private val parsed = ConcurrentHashMap<Identity, SoftReference<List<T>>>()

    fun get(build: File): List<T> {
        val identity = identity(build)
        parsed[identity]?.get()?.let { return it }
        synchronized(parsed) {
            parsed[identity]?.get()?.let { return it }
            val files = mutableListOf<T>()
            read(build) { bytes -> files += parse(bytes) }
            check(identity(build) == identity) { "Fixture changed while reading: ${build.name}" }
            // An earlier version of the same file is no use to anyone now.
            parsed.keys.removeIf { it.path == identity.path }
            val kept = files.toList()
            parsed[identity] = SoftReference(kept)
            return kept
        }
    }

    private fun identity(build: File): Identity {
        val path = build.toPath().toRealPath()
        val attributes = Files.readAttributes(path, BasicFileAttributes::class.java)
        return Identity(path.toString(), attributes.size(), attributes.lastModifiedTime(), attributes.fileKey())
    }
}
