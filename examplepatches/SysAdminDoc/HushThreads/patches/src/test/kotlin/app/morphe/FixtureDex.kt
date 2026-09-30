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
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

/**
 * Reads the classes a fixture test needs out of a Threads build, one dex at a time, so no APK lands
 * on disk and no more than one dex is held at once. A build is an .apkm or .xapk, whose base APK is
 * read from inside it, or a merged .apk. What it hands back are immutable copies, which keep none
 * of the dex they came from.
 */
internal object FixtureDex {
    private val DEX = Regex("""classes\d*\.dex""")

    /** The base APK's entry in a bundle: base.apk in an .apkm, the package's name in an .xapk. */
    private val BASE_NAMES = listOf("base.apk", "com.instagram.barcelona.apk")

    private fun forEachDex(build: File, visit: (DexBackedDexFile) -> Unit) {
        fun read(apk: InputStream) = ZipInputStream(apk.buffered()).use { entries ->
            while (true) {
                val entry = entries.nextEntry ?: break
                if (DEX.matches(entry.name)) visit(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(entries.readBytes())))
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
