/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
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
import java.nio.ByteBuffer
import java.security.MessageDigest
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

/**
 * Reads the classes a fixture test needs out of a Telegram build, one dex at a time, so no APK lands
 * on disk and no more than one dex is held at once. A build is an .apkm or .xapk, whose base APK is
 * read from inside it, or a merged .apk. What it hands back are immutable copies, which keep none
 * of the dex they came from. Repeated fixed queries retain only class positions for exact input
 * hashes; each read still creates new immutable copies for independent mutable patch contexts.
 */
internal object FixtureDex {
    private val DEX = Regex("""classes\d*\.dex""")

    /** One fixed structural query. Only positions are retained, never classes or DEX buffers. */
    class ClassCensus {
        private val retained = LinkedHashMap<String, List<Pair<Int, Int>>>(2, 0.75f, true)

        @Synchronized
        internal fun locations(identity: String) = retained[identity]

        @Synchronized
        internal fun remember(identity: String, locations: List<Pair<Int, Int>>) {
            // Large queries keep the streaming reader's memory bound. Two content identities
            // cover the declared fixture pair without growing with changed or copied APKs.
            if (locations.size > 128) return
            retained[identity] = locations.toList()
            while (retained.size > 2) retained.remove(retained.keys.first())
        }
    }

    /** The base APK's entry in a bundle: base.apk in an .apkm, the package's name in an .xapk. */
    private val BASE_NAMES = listOf("base.apk", "com.instagram.barcelona.apk")

    private fun forEachDex(build: File, visit: (DexBackedDexFile) -> Unit) {
        fun read(apk: InputStream) = ZipInputStream(apk.buffered()).use { entries ->
            while (true) {
                val entry = entries.nextEntry ?: break
                if (DEX.matches(entry.name)) visit(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(entries.readBytes())))
            }
        }
        if (build.extension == "apk") return ZipFile(build).use { zip ->
            // Reading the DEX entries directly avoids inflating unrelated libraries/resources
            // while ZipInputStream advances to the next entry.
            for (entry in zip.entries()) if (DEX.matches(entry.name)) {
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                visit(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)))
            }
        }
        ZipFile(build).use { zip ->
            val base = BASE_NAMES.firstNotNullOfOrNull { zip.getEntry(it) }
                ?: error("${build.name} holds none of ${BASE_NAMES.joinToString()}")
            zip.getInputStream(base).use(::read)
        }
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

    /** Reuses the whole-APK census of one fixed query, with fresh immutable results each time. */
    fun classesWhere(build: File, census: ClassCensus, dexFilter: (DexBackedDexFile) -> Boolean,
                     wanted: (Method) -> Boolean): List<ClassDef> {
        val identity = inputIdentity(build)
        val retained = census.locations(identity)
        val byDex = retained?.groupBy({ it.first }, { it.second }).orEmpty()
        val locations = mutableListOf<Pair<Int, Int>>()
        val found = mutableListOf<ClassDef>()
        var nextDex = 0
        forEachDex(build) { dex ->
            val dexIndex = nextDex++
            if (retained != null) {
                for (index in byDex[dexIndex].orEmpty()) found += ImmutableClassDef.of(dex.classSection[index])
            } else if (dexFilter(dex)) {
                for ((index, classDef) in dex.classSection.withIndex()) if (classDef.methods.any(wanted)) {
                    locations += dexIndex to index
                    found += ImmutableClassDef.of(classDef)
                }
            }
        }
        check(inputIdentity(build) == identity) { "${build.name} changed during its DEX census" }
        if (retained == null) census.remember(identity, locations)
        return found
    }

    private fun inputIdentity(build: File): String {
        val digest = MessageDigest.getInstance("SHA-256")
        build.inputStream().use { input ->
            val buffer = ByteArray(256 * 1024)
            while (true) {
                val count = input.read(buffer)
                if (count < 0) break
                digest.update(buffer, 0, count)
            }
        }
        return build.extension + ":" + digest.digest().joinToString("") { "%02x".format(it) }
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
