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

import app.morphe.patcher.PatcherContext
import app.morphe.util.names.TelegramNames
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
 * [getOrPut] for one build's slice of fixture classes. A cached slice comes back without its dex
 * being read again, which is what points the ambient names at a build, so they're pointed at the
 * slice's build here: a test reading source names off it before it makes a context would otherwise
 * read them through whichever build an earlier test or loop left behind.
 */
internal inline fun <K> MutableMap<K, List<ClassDef>>.hostsOf(key: K, read: () -> List<ClassDef>): List<ClassDef> =
    getOrPut(key, read).also { slice ->
        slice.firstNotNullOfOrNull { (it as? FixtureDex.FixtureClassDef)?.versionCode }
            ?.let(TelegramNames::forVersionCode)?.let { TelegramNames.ambient = it }
    }

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

    /**
     * A class read from a fixture, carrying the build's version code so a patch context made from it
     * picks that build's name table (see [PatchContexts]).
     */
    class FixtureClassDef(val versionCode: String, c: ImmutableClassDef) : ImmutableClassDef(
        c.type, c.accessFlags, c.superclass, c.interfaces, c.sourceFile, c.annotations, c.fields, c.methods,
    )

    private fun copy(classDef: ClassDef, table: TelegramNames.Table): ClassDef =
        if (table.isIdentity) ImmutableClassDef.of(classDef) else FixtureClassDef(table.build, ImmutableClassDef.of(classDef))

    private fun forEachDex(build: File, visit: (DexBackedDexFile) -> Unit) {
        // A resource id 13.2 inlined into a const names its R field through the current context's
        // table, which a context made earlier for another build would answer. The scan puts that
        // context aside, so what it reads goes by this build's table, and restores it after.
        val current = PatcherContext::class.java.getDeclaredField("current").apply { isAccessible = true }
        val before = TelegramNames.currentContext()?.let(TelegramNames::of)
        val patcher = current.get(null)
        current.set(null, null)
        var read: TelegramNames.Table? = null
        try {
            readDex(build) { dex ->
                if (read == null || read!!.isIdentity) read = TelegramNames.forDex(dex)
                visit(dex)
            }
        } finally {
            // A context for the other build is one an earlier test or loop left behind. Kept, it would
            // name the R fields of the consts read here after the scan, so it goes until the next
            // context is made, and the names go by this build's table meanwhile.
            if (before == null || read == null || before == read) current.set(null, patcher)
        }
    }

    private fun readDex(build: File, visit: (DexBackedDexFile) -> Unit) {
        // Names read off the copies made here, which no longer know their dex, come from this build.
        val named: (DexBackedDexFile) -> Unit = { dex ->
            TelegramNames.ambient = TelegramNames.forDex(dex)
            visit(dex)
        }
        fun read(apk: InputStream) = ZipInputStream(apk.buffered()).use { entries ->
            while (true) {
                val entry = entries.nextEntry ?: break
                if (DEX.matches(entry.name)) named(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(entries.readBytes())))
            }
        }
        if (build.extension == "apk") return ZipFile(build).use { zip ->
            // Reading the DEX entries directly avoids inflating unrelated libraries/resources
            // while ZipInputStream advances to the next entry.
            for (entry in zip.entries()) if (DEX.matches(entry.name)) {
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                named(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)))
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

    /**
     * Runs [block] with [build]'s names. A helper that reads a resource id 13.2 inlined into a const
     * off copies it kept, outside any scan, would otherwise name it through whichever context a test
     * made last, which may be the other build's.
     */
    fun <T> namedBy(build: File, block: () -> T): T {
        val current = PatcherContext::class.java.getDeclaredField("current").apply { isAccessible = true }
        val patcher = current.get(null)
        current.set(null, null)
        TelegramNames.forVersionCode(build.nameWithoutExtension.substringAfterLast('-'))?.let { TelegramNames.ambient = it }
        try {
            return block()
        } finally {
            current.set(null, patcher)
        }
    }

    /** The classes of [types] (source names) the build carries, keyed by those names. */
    fun classes(build: File, types: Set<String>): Map<String, ClassDef> {
        val found = mutableMapOf<String, ClassDef>()
        forEachDex(build) { dex ->
            val table = TelegramNames.forDex(dex)
            val wanted = types.associateBy(table::type)
            for (classDef in dex.classes) {
                val source = wanted[classDef.type] ?: continue
                if (source !in found) found[source] = copy(classDef, table)
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
            val table = TelegramNames.forDex(dex)
            for (classDef in dex.classes) {
                if (classDef.methods.any(wanted)) found += copy(classDef, table)
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
            val table = TelegramNames.forDex(dex)
            if (retained != null) {
                for (index in byDex[dexIndex].orEmpty()) found += copy(dex.classSection[index], table)
            } else if (dexFilter(dex)) {
                for ((index, classDef) in dex.classSection.withIndex()) if (classDef.methods.any(wanted)) {
                    locations += dexIndex to index
                    found += copy(classDef, table)
                }
            }
        }
        check(inputIdentity(build) == identity) { "${build.name} changed during its DEX census" }
        if (retained == null) census.remember(identity, locations)
        return found
    }

    fun inputIdentity(build: File): String {
        // Tests key their kept copies of a build's classes by this identity and then read names off
        // them without reading the fixture again, so the names have to come from this build's table.
        TelegramNames.forVersionCode(build.nameWithoutExtension.substringAfterLast('-'))?.let { TelegramNames.ambient = it }
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
