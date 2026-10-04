/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.util

import java.io.IOException
import java.net.JarURLConnection
import java.nio.ByteBuffer
import java.security.MessageDigest
import java.util.jar.JarFile

/** Producer identity is a consistency check, not a signature or a safety verdict. */
internal object BundleIdentity {
    const val ENTRY = "META-INF/hushfacebook-build.identity"
    const val SCHEMA = "hushfacebook-bundle-1"

    /**
     * Sorted non-directory entries, except the digest container. Each UTF-8 name and uncompressed
     * content is preceded by its big-endian length (32 and 64 bits respectively). ZIP order,
     * compression and entry timestamps aren't inputs. The manifest, including source linkage, is.
     */
    fun payloadSha256(jar: JarFile): String {
        val entries = jar.entries().asSequence().toList()
        require(entries.map { it.name }.distinct().size == entries.size) { "Duplicate bundle entry" }
        val digest = MessageDigest.getInstance("SHA-256")
        digest.update((SCHEMA + "\n").toByteArray(Charsets.US_ASCII))
        for (entry in entries.filterNot { it.isDirectory || it.name == ENTRY }.sortedBy { it.name }) {
            val name = entry.name.toByteArray(Charsets.UTF_8)
            require(entry.size >= 0) { "Unknown bundle entry size" }
            digest.update(ByteBuffer.allocate(4).putInt(name.size).array())
            digest.update(name)
            digest.update(ByteBuffer.allocate(8).putLong(entry.size).array())
            var count = 0L
            jar.getInputStream(entry).use { input ->
                val buffer = ByteArray(65536)
                while (true) {
                    val read = input.read(buffer)
                    if (read < 0) break
                    count += read
                    require(count <= entry.size) { "Bundle entry grew while reading" }
                    digest.update(buffer, 0, read)
                }
            }
            require(count == entry.size) { "Bundle entry is truncated" }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }

    /** Missing legacy metadata is unknown. Corrupt or unbound metadata never claims cleanliness. */
    fun fromJar(jar: JarFile): String {
        return try {
            val entry = jar.getJarEntry(ENTRY) ?: return "unknown"
            if (entry.size !in 1..128) return "unverified"
            val buffer = ByteArray(129)
            var length = 0
            jar.getInputStream(entry).use { input ->
                while (length < buffer.size) {
                    val read = input.read(buffer, length, buffer.size - length)
                    if (read < 0) break
                    length += read
                }
            }
            val record = String(buffer, 0, length, Charsets.US_ASCII)
            if (!Regex("$SCHEMA\n[0-9a-f]{64}\n").matches(record)) return "unverified"
            val expected = record.lines()[1]
            if (payloadSha256(jar) != expected) return "unverified"
            val attributes = jar.manifest?.mainAttributes ?: return "unverified"
            val state = attributes.getValue("Hushfacebook-Source-State")
            val commit = attributes.getValue("Hushfacebook-Source-Commit")
            val tree = attributes.getValue("Hushfacebook-Source-Tree")
            val inputs = attributes.getValue("Hushfacebook-Input-SHA256") ?: return "unverified"
            if (!inputs.matches(Regex("[0-9a-f]{64}"))) return "unverified"
            val source = when (state) {
                "clean", "dirty" -> {
                    if (commit?.matches(Regex("[0-9a-f]{40}")) != true ||
                        tree?.matches(Regex("[0-9a-f]{40}")) != true) return "unverified"
                    "$state:$commit; tree=$tree"
                }
                "unknown" -> {
                    if (commit != "unknown" || tree != "unknown") return "unverified"
                    "unknown"
                }
                else -> return "unverified"
            }
            "sha256=$expected; source=$source; inputs=$inputs"
        } catch (_: IOException) {
            "unverified"
        } catch (_: IllegalArgumentException) {
            "unverified"
        } catch (_: SecurityException) {
            "unverified"
        }
    }

    /** The bundle that supplied the patch class, never Git metadata from the patching machine. */
    fun boundToClass(anchor: Class<*>): () -> String {
        val loaded = forClass(anchor)
        return { if (forClass(anchor) == loaded) loaded else "unverified" }
    }

    fun forClass(anchor: Class<*>): String {
        return try {
            // CodeSource names the defining archive even when resource lookup delegates elsewhere.
            // Android loaders can omit it, so retain the JAR resource route used by the patch bundle.
            val url = anchor.protectionDomain?.codeSource?.location ?: run {
                val resources = anchor.classLoader?.getResources(anchor.name.replace('.', '/') + ".class")
                    ?.asSequence()?.toList().orEmpty()
                if (resources.isEmpty()) return "unknown"
                val archives = resources.map {
                    (it.openConnection() as? JarURLConnection)?.jarFileURL ?: return "unverified"
                }.distinct()
                if (archives.size != 1) return "unverified"
                archives.single()
            }
            if (url.protocol != "file") return "unknown"
            val file = java.io.File(url.toURI())
            if (!file.isFile) return "unknown"
            JarFile(file).use(::fromJar)
        } catch (_: IOException) {
            "unverified"
        } catch (_: java.net.URISyntaxException) {
            "unverified"
        } catch (_: IllegalArgumentException) {
            "unverified"
        } catch (_: SecurityException) {
            "unverified"
        }
    }
}
