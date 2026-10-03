/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.nio.ByteBuffer
import java.nio.file.Files
import java.nio.file.LinkOption.NOFOLLOW_LINKS
import java.nio.file.Path
import java.security.DigestOutputStream
import java.security.MessageDigest
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.locks.ReentrantReadWriteLock
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream

/**
 * Reads one cached dex at a time. Only expanded dex files land in the worker's temporary directory;
 * no whole APK is buffered. Returned immutable copies keep none of the dex they came from.
 */
internal object FixtureDex {
    private val cache = FixtureDexCache().also { cache ->
        Runtime.getRuntime().addShutdownHook(Thread({ cache.close() }, "fixture-dex-cleanup"))
    }

    private fun forEachDex(bundle: File, visit: (DexBackedDexFile) -> Unit) {
        cache.forEach(bundle) { bytes ->
            visit(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)))
        }
    }

    /**
     * Every dex of the bundle, one at a time, for a test that looks for several things in one
     * pass. Whatever [visit] keeps has to be copied out, as the other readers here do.
     */
    fun forEach(bundle: File, visit: (DexBackedDexFile) -> Unit) = forEachDex(bundle, visit)

    /** The classes of [types] the bundle carries, by type. */
    fun classes(bundle: File, types: Set<String>): Map<String, ClassDef> {
        val found = mutableMapOf<String, ClassDef>()
        forEachDex(bundle) { dex ->
            for (classDef in dex.classes) {
                if (classDef.type in types && classDef.type !in found) found[classDef.type] = ImmutableClassDef.of(classDef)
            }
        }
        return found
    }

    /**
     * Every method that [wanted] picks, in the dex files [dexFilter] lets through. The filter is how
     * a whole-APK search stays quick: a call needs its target in the dex's method section, and a
     * name needs to be in its string section, so a dex without them can be skipped unread.
     */
    fun methodsWhere(bundle: File, dexFilter: (DexBackedDexFile) -> Boolean, wanted: (Method) -> Boolean): List<Method> {
        val found = mutableListOf<Method>()
        forEachDex(bundle) { dex ->
            if (!dexFilter(dex)) return@forEachDex
            for (classDef in dex.classes) {
                for (method in classDef.methods) {
                    if (wanted(method)) found += ImmutableMethod.of(method)
                }
            }
        }
        return found
    }

    /** Every class with a method that loads exactly [string]. Only the dex files holding it are walked. */
    fun classesHolding(bundle: File, string: String): List<ClassDef> {
        val found = mutableListOf<ClassDef>()
        forEachDex(bundle) { dex ->
            if (dex.stringSection.none { it == string }) return@forEachDex
            for (classDef in dex.classes) {
                if (classDef.methods.any { holdsString(it, string) }) found += ImmutableClassDef.of(classDef)
            }
        }
        return found
    }
}

/** Content-bound files belong only to this cache. Publication waits for complete extraction. */
internal class FixtureDexCache : AutoCloseable {
    internal val directory: Path = Files.createTempDirectory("hushfacebook-fixture-dex-")
    private data class Entry(val path: Path, val size: Long, val sha256: String)
    private val expanded = ConcurrentHashMap<String, List<Entry>>()
    private val lifecycle = ReentrantReadWriteLock()
    private var closed = false

    fun forEach(bundle: File, visit: (ByteArray) -> Unit) {
        val lock = lifecycle.readLock()
        lock.lock()
        try {
            check(!closed) { "Fixture cache is closed" }
            val content = hash(bundle)
            val entries = expanded.computeIfAbsent(content) { expand(bundle, content) }
            for (entry in entries) {
                check(Files.isRegularFile(entry.path, NOFOLLOW_LINKS) && Files.size(entry.path) == entry.size) {
                    "Fixture cache file changed: ${entry.path.fileName}"
                }
                val bytes = Files.readAllBytes(entry.path)
                check(bytes.size.toLong() == entry.size && digest(MessageDigest.getInstance("SHA-256").digest(bytes)) == entry.sha256) {
                    "Fixture cache bytes changed: ${entry.path.fileName}"
                }
                visit(bytes)
            }
            check(hash(bundle) == content) { "Fixture changed while reading: ${bundle.name}" }
        } finally {
            lock.unlock()
        }
    }

    private fun expand(bundle: File, content: String): List<Entry> {
        val work = Files.createTempDirectory(directory, "bundle-")
        try {
            val entries = mutableListOf<Entry>()
            ZipFile(bundle).use { zip ->
                val base = checkNotNull(zip.getEntry("base.apk")) { "${bundle.name} holds no base.apk" }
                ZipInputStream(zip.getInputStream(base).buffered()).use { apk ->
                    while (true) {
                        val entry = apk.nextEntry ?: break
                        if (!DEX.matches(entry.name)) continue
                        check(!entry.isDirectory && entries.none { it.path.fileName.toString() == entry.name }) {
                            "Duplicate or invalid fixture dex: ${entry.name}"
                        }
                        val path = work.resolve(entry.name)
                        val sha = MessageDigest.getInstance("SHA-256")
                        DigestOutputStream(Files.newOutputStream(path), sha).use { apk.copyTo(it) }
                        val size = Files.size(path)
                        check(size in 1..Int.MAX_VALUE.toLong()) { "Invalid fixture dex size: ${entry.name}" }
                        entries += Entry(path, size, digest(sha.digest()))
                    }
                }
            }
            check(entries.isNotEmpty()) { "${bundle.name} holds no dex files" }
            check(hash(bundle) == content) { "Fixture changed while expanding: ${bundle.name}" }
            return entries.toList()
        } catch (failure: Throwable) {
            try { remove(work) } catch (cleanup: Exception) { failure.addSuppressed(cleanup) }
            throw failure
        }
    }

    override fun close() {
        val lock = lifecycle.writeLock()
        lock.lock()
        try {
            if (closed) return
            remove(directory)
            expanded.clear()
            closed = true
        } finally {
            lock.unlock()
        }
    }

    private fun hash(file: File): String {
        val sha = MessageDigest.getInstance("SHA-256")
        file.inputStream().buffered().use { stream ->
            val buffer = ByteArray(64 * 1024)
            while (true) {
                val count = stream.read(buffer)
                if (count < 0) break
                sha.update(buffer, 0, count)
            }
        }
        return digest(sha.digest())
    }

    private fun digest(bytes: ByteArray) = bytes.joinToString("") { (it.toInt() and 255).toString(16).padStart(2, '0') }

    private fun remove(root: Path) {
        // Files.walk does not follow symlinks. Never traverse outside our owned temporary tree.
        Files.walk(root).use { paths -> paths.sorted(Comparator.reverseOrder()).forEach { Files.deleteIfExists(it) } }
    }

    companion object {
        private val DEX = Regex("""classes\d*\.dex""")
    }
}
