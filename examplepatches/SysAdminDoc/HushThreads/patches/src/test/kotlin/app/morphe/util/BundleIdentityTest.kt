/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at a788c516 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.util

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.assertThrows
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File
import java.net.URLClassLoader
import java.util.jar.JarFile
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class BundleIdentityTest {
    private class Anchor
    @get:Rule val temporary = TemporaryFolder()
    private val commit = "1".repeat(40)
    private val tree = "2".repeat(40)
    private val inputs = "3".repeat(64)

    private fun entries(state: String = "clean", source: String = commit, sourceTree: String = tree) = linkedMapOf(
        "META-INF/MANIFEST.MF" to ("Manifest-Version: 1.0\r\nVersion: 9.9.9\r\n" +
            "HushThreads-Source-State: $state\r\nHushThreads-Source-Commit: $source\r\n" +
            "HushThreads-Source-Tree: $sourceTree\r\nHushThreads-Input-SHA256: $inputs\r\n\r\n").toByteArray(),
        "classes.dex" to byteArrayOf(1, 2, 3),
        "extensions/shared.mpe" to byteArrayOf(4, 5),
        "extensions/threads.mpe" to byteArrayOf(6, 7),
    )

    private fun write(contents: Map<String, ByteArray>, reversed: Boolean = false, time: Long = 0): File {
        val file = temporary.newFile()
        ZipOutputStream(file.outputStream()).use { output ->
            val entries = if (reversed) contents.entries.reversed() else contents.entries.toList()
            for ((name, bytes) in entries) {
                output.putNextEntry(ZipEntry(name).apply { this.time = time })
                output.write(bytes)
                output.closeEntry()
            }
        }
        return file
    }

    private fun stamped(contents: Map<String, ByteArray>): Pair<File, String> {
        val hash = JarFile(write(contents)).use { BundleIdentity.payloadSha256(it) }
        return write(contents + (BundleIdentity.ENTRY to (BundleIdentity.SCHEMA + "\n" + hash + "\n").toByteArray())) to hash
    }

    private fun identity(file: File) = JarFile(file).use { BundleIdentity.fromJar(it) }

    @Test fun `old bundles have unknown provenance without being modified`() {
        val file = write(entries() + ("META-INF/MANIFEST.MF" to "Manifest-Version: 1.0\r\nVersion: 9.9.9\r\n\r\n".toByteArray()))
        val bytes = file.readBytes()
        assertEquals("unknown", identity(file))
        assertTrue(bytes.contentEquals(file.readBytes()))
    }

    @Test fun `removing identity metadata cannot downgrade a current bundle to legacy`() {
        assertEquals("unverified", identity(write(entries())))
        val legacy = entries() + ("META-INF/MANIFEST.MF" to "Manifest-Version: 1.0\r\nVersion: 9.9.9\r\n\r\n".toByteArray())
        assertEquals("unverified", identity(write(legacy + ("app/morphe/util/BundleIdentity.class" to byteArrayOf(1)))))
    }

    @Test fun `standalone verification refuses source claims with removed identity even after rehashing`() {
        val dex = ByteArray(100).apply {
            "dex\n035\u0000".toByteArray().copyInto(this)
            this[96] = 1 // The verifier needs a nonempty class table before checking identity.
        }
        val bundle = write(entries().mapValues { (name, bytes) -> if (name.endsWith(".dex") || name.endsWith(".mpe")) dex else bytes })
        val checksum = temporary.newFile().apply {
            writeText(java.security.MessageDigest.getInstance("SHA-256").digest(bundle.readBytes()).joinToString("") { "%02x".format(it) })
        }
        val catalog = temporary.newFile().apply { writeText("{\"version\":\"v9.9.9\",\"patches\":[]}") }
        val refused = assertThrows(IllegalArgumentException::class.java) {
            BundleVerifier.main(arrayOf(bundle.path, catalog.path, "9.9.9", checksum.path))
        }
        assertEquals("Bundle identity is missing or does not match its packaged inputs", refused.message)
    }

    @Test fun `verified identity names exact payload and producer inputs`() {
        val (file, hash) = stamped(entries())
        assertEquals("sha256=$hash; source=clean:$commit; tree=$tree; inputs=$inputs", identity(file))
    }

    @Test fun `zip order and timestamps do not change payload identity`() {
        val contents = entries()
        val original = JarFile(write(contents)).use { BundleIdentity.payloadSha256(it) }
        val reordered = JarFile(write(contents, reversed = true, time = 1700000000000)).use { BundleIdentity.payloadSha256(it) }
        assertEquals(original, reordered)
        val stamp = BundleIdentity.ENTRY to (BundleIdentity.SCHEMA + "\n" + original + "\n").toByteArray()
        assertEquals(identity(write(contents + stamp)), identity(write(contents + stamp, reversed = true, time = 1700000000000)))
    }

    @Test fun `different packaged payloads have different verified identities`() {
        val original = identity(stamped(entries()).first)
        for (name in listOf("classes.dex", "extensions/shared.mpe", "extensions/threads.mpe")) {
            val changed = identity(stamped(entries() + (name to byteArrayOf(99))).first)
            assertTrue(name, changed.startsWith("sha256="))
            assertFalse(name, original == changed)
        }
    }

    @Test fun `changed JVM and extension bytes cannot retain a copied clean identity`() {
        val contents = entries()
        val (_, hash) = stamped(contents)
        for (name in listOf("classes.dex", "extensions/shared.mpe", "extensions/threads.mpe")) {
            val changed = contents + (name to byteArrayOf(99)) +
                (BundleIdentity.ENTRY to (BundleIdentity.SCHEMA + "\n" + hash + "\n").toByteArray())
            assertEquals(name, "unverified", identity(write(changed)))
        }
    }

    @Test fun `source metadata is covered by the payload digest`() {
        val (_, hash) = stamped(entries())
        val changed = entries(source = "4".repeat(40)) +
            (BundleIdentity.ENTRY to (BundleIdentity.SCHEMA + "\n" + hash + "\n").toByteArray())
        assertEquals("unverified", identity(write(changed)))
    }

    @Test fun `added removed and renamed entries invalidate stale identity`() {
        val contents = entries()
        val (_, hash) = stamped(contents)
        val stamp = BundleIdentity.ENTRY to (BundleIdentity.SCHEMA + "\n" + hash + "\n").toByteArray()
        for (changed in listOf(contents + ("extra" to byteArrayOf(1)), contents - "classes.dex",
                contents - "classes.dex" + ("renamed.dex" to contents.getValue("classes.dex")))) {
            assertEquals("unverified", identity(write(changed + stamp)))
        }
    }

    @Test fun `dirty identity cannot pretend to be the clean base commit`() {
        val (file, hash) = stamped(entries(state = "dirty"))
        val identity = identity(file)
        assertEquals("sha256=$hash; source=dirty:$commit; tree=$tree; inputs=$inputs", identity)
        assertFalse(identity.contains("source=clean"))
    }

    @Test fun `an archive identifies bytes while its source remains unknown`() {
        val (file, hash) = stamped(entries(state = "unknown", source = "unknown", sourceTree = "unknown"))
        assertEquals("sha256=$hash; source=unknown; inputs=$inputs", identity(file))
    }

    @Test fun `incomplete source claims remain unverified even with matching bytes`() {
        for (contents in listOf(entries(source = "unknown"), entries(sourceTree = "wrong"),
                entries(state = "invented"), entries(state = "unknown"))) {
            assertEquals("unverified", identity(stamped(contents).first))
        }
    }

    @Test fun `corrupted identity is bounded and nonfatal`() {
        for (record in listOf("", "invented\n" + "0".repeat(64) + "\n", "x".repeat(1024),
                BundleIdentity.SCHEMA + "\n" + "0".repeat(64) + "\nsecret=do-not-export\n")) {
            assertEquals("unverified", identity(write(entries() + (BundleIdentity.ENTRY to record.toByteArray()))))
        }
    }

    @Test fun `classes run from a directory never borrow the checkout commit`() {
        assertEquals("unknown", BundleIdentity.forClass(BundleIdentityTest::class.java))
    }

    @Test fun `identity comes from the jar that actually loaded the patch class`() {
        val path = Anchor::class.java.name.replace('.', '/') + ".class"
        val bytes = Anchor::class.java.classLoader.getResourceAsStream(path)!!.use { it.readBytes() }
        val (file, hash) = stamped(entries() + (path to bytes))
        URLClassLoader(arrayOf(file.toURI().toURL()), null).use { loader ->
            val anchor = Class.forName(Anchor::class.java.name, false, loader)
            assertEquals("sha256=$hash; source=clean:$commit; tree=$tree; inputs=$inputs", BundleIdentity.forClass(anchor))
        }
    }

    @Test fun `resource shadowing cannot substitute a different loaded bundle`() {
        val path = Anchor::class.java.name.replace('.', '/') + ".class"
        val bytes = Anchor::class.java.classLoader.getResourceAsStream(path)!!.use { it.readBytes() }
        val (actual, hash) = stamped(entries() + (path to bytes))
        val (other, _) = stamped(entries(state = "dirty") + (path to bytes))
        val shadow = java.net.URI("jar:${other.toURI()}!/$path").toURL()
        val loader = object : URLClassLoader(arrayOf(actual.toURI().toURL()), null) {
            override fun getResource(name: String?): java.net.URL? = if (name == path) shadow else super.getResource(name)
        }
        loader.use {
            val anchor = Class.forName(Anchor::class.java.name, false, it)
            assertEquals("sha256=$hash; source=clean:$commit; tree=$tree; inputs=$inputs", BundleIdentity.forClass(anchor))
        }
    }

    @Test fun `bundle replacement after loading cannot adopt a new artifact identity`() {
        val path = Anchor::class.java.name.replace('.', '/') + ".class"
        val bytes = Anchor::class.java.classLoader.getResourceAsStream(path)!!.use { it.readBytes() }
        val (actual, hash) = stamped(entries() + (path to bytes))
        val (replacement, _) = stamped(entries(state = "dirty") + (path to bytes))
        URLClassLoader(arrayOf(actual.toURI().toURL()), null).use { loader ->
            val anchor = Class.forName(Anchor::class.java.name, false, loader)
            val readAtInjection = BundleIdentity.boundToClass(anchor)
            assertEquals("sha256=$hash; source=clean:$commit; tree=$tree; inputs=$inputs", readAtInjection())
            actual.outputStream().use { it.write(replacement.readBytes()) }
            assertEquals("unverified", readAtInjection())
        }
    }

    @Test fun `a loader without CodeSource still verifies its bundle resource`() {
        val path = Anchor::class.java.name.replace('.', '/') + ".class"
        val bytes = Anchor::class.java.classLoader.getResourceAsStream(path)!!.use { it.readBytes() }
        val (file, hash) = stamped(entries() + (path to bytes))
        val resource = java.net.URI("jar:${file.toURI()}!/$path").toURL()
        val loader = object : ClassLoader(null) {
            override fun findClass(name: String): Class<*> {
                if (name != Anchor::class.java.name) throw ClassNotFoundException(name)
                return defineClass(name, bytes, 0, bytes.size)
            }
            override fun getResource(name: String?): java.net.URL? = if (name == path) resource else null
            override fun getResources(name: String?): java.util.Enumeration<java.net.URL> =
                java.util.Collections.enumeration(if (name == path) listOf(resource) else emptyList())
        }
        val anchor = Class.forName(Anchor::class.java.name, false, loader)
        assertEquals(null, anchor.protectionDomain?.codeSource?.location)
        assertEquals("sha256=$hash; source=clean:$commit; tree=$tree; inputs=$inputs", BundleIdentity.forClass(anchor))
    }

    @Test fun `a loader without CodeSource cannot choose among different bundle resources`() {
        val path = Anchor::class.java.name.replace('.', '/') + ".class"
        val bytes = Anchor::class.java.classLoader.getResourceAsStream(path)!!.use { it.readBytes() }
        val (file, _) = stamped(entries() + (path to bytes))
        val (other, _) = stamped(entries(state = "dirty") + (path to bytes))
        val resources = listOf(file, other).map { java.net.URI("jar:${it.toURI()}!/$path").toURL() }
        val loader = object : ClassLoader(null) {
            override fun findClass(name: String): Class<*> {
                if (name != Anchor::class.java.name) throw ClassNotFoundException(name)
                return defineClass(name, bytes, 0, bytes.size)
            }
            override fun getResource(name: String?): java.net.URL? = if (name == path) resources[0] else null
            override fun getResources(name: String?): java.util.Enumeration<java.net.URL> =
                java.util.Collections.enumeration(if (name == path) resources else emptyList())
        }
        val anchor = Class.forName(Anchor::class.java.name, false, loader)
        assertEquals(null, anchor.protectionDomain?.codeSource?.location)
        assertEquals("unverified", BundleIdentity.forClass(anchor))
    }
}
