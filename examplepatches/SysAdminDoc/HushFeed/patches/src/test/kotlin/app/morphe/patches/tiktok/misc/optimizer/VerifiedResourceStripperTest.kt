package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

class VerifiedResourceStripperTest {
    @get:Rule
    val temporary = TemporaryFolder()

    @Test
    fun `a bad digest stops the whole group before any file is changed`() {
        val root = temporary.newFolder("bad-digest")
        val first = root.write("assets/group/first.bin", "first")
        val second = root.write("assets/group/second.bin", "changed")
        val profile = ResourceProfile(
            "fixture",
            listOf(
                ResourceFileContract("assets/group/first.bin", sha256("first")),
                ResourceFileContract("assets/group/second.bin", sha256("second")),
            ),
        )

        val error = assertThrows(PatchException::class.java) {
            stripVerifiedResources(root, "Test resources", listOf("assets/group"), emptyList(), listOf(profile))
        }

        assertTrue(error.message.orEmpty().contains("Test resources"))
        assertTrue(error.message.orEmpty(), error.message.orEmpty().endsWith(UNREVIEWED_BUILD_HINT))
        assertArrayEquals("first".toByteArray(), first.readBytes())
        assertArrayEquals("changed".toByteArray(), second.readBytes())
    }

    @Test
    fun `missing and extra files are rejected before mutation`() {
        val missingRoot = temporary.newFolder("missing")
        val only = missingRoot.write("assets/group/first.bin", "first")
        val profile = ResourceProfile(
            "fixture",
            listOf(
                ResourceFileContract("assets/group/first.bin", sha256("first")),
                ResourceFileContract("assets/group/second.bin", sha256("second")),
            ),
        )
        assertThrows(PatchException::class.java) {
            stripVerifiedResources(missingRoot, "Test resources", listOf("assets/group"), emptyList(), listOf(profile))
        }
        assertArrayEquals("first".toByteArray(), only.readBytes())

        val extraRoot = temporary.newFolder("extra")
        val first = extraRoot.write("assets/group/first.bin", "first")
        extraRoot.write("assets/group/second.bin", "second")
        extraRoot.write("assets/group/unreviewed.bin", "extra")
        assertThrows(PatchException::class.java) {
            stripVerifiedResources(extraRoot, "Test resources", listOf("assets/group"), emptyList(), listOf(profile))
        }
        assertArrayEquals("first".toByteArray(), first.readBytes())
    }

    @Test
    fun `a verified set is emptied and reapplication is idempotent`() {
        val root = temporary.newFolder("repeat")
        root.write("assets/group/first.bin", "first")
        root.write("lib/arm64-v8a/second.so", "second")
        val profile = ResourceProfile(
            "fixture",
            listOf(
                ResourceFileContract("assets/group/first.bin", sha256("first")),
                ResourceFileContract("lib/arm64-v8a/second.so", sha256("second")),
            ),
        )

        val first = stripVerifiedResources(
            root,
            "Test resources",
            listOf("assets/group"),
            listOf("lib/arm64-v8a/second.so"),
            listOf(profile),
        )
        val second = stripVerifiedResources(
            root,
            "Test resources",
            listOf("assets/group"),
            listOf("lib/arm64-v8a/second.so"),
            listOf(profile),
        )

        assertEquals(2, first.files)
        assertEquals(11L, first.bytes)
        assertFalse(first.alreadyStripped)
        assertTrue(second.alreadyStripped)
        assertTrue(root.resolve("assets/group/first.bin").readBytes().isEmpty())
        assertTrue(root.resolve("lib/arm64-v8a/second.so").readBytes().isEmpty())
    }

    @Test
    fun `standalone files are staged lazily before the complete group is verified`() {
        val root = temporary.newFolder("lazy-standalone")
        val path = "lib/arm64-v8a/lazy.so"
        val staged = root.resolve(path)
        var resolverCalls = 0
        val profile = ResourceProfile(
            "fixture",
            listOf(ResourceFileContract(path, sha256("archive bytes"))),
        )

        val result = stripVerifiedResources(
            root,
            "Test resources",
            emptyList(),
            listOf(path),
            listOf(profile),
            resolveStandaloneFile = { requested ->
                assertEquals(path, requested)
                resolverCalls++
                staged.also {
                    it.parentFile.mkdirs()
                    it.writeText("archive bytes")
                }
            },
        )

        assertEquals(1, resolverCalls)
        assertEquals(1, result.files)
        assertEquals(13L, result.bytes)
        assertTrue(staged.readBytes().isEmpty())
    }

    @Test
    fun `a standalone resolver cannot redirect a reviewed path outside the APK root`() {
        val root = temporary.newFolder("resolver-root")
        val outside = temporary.newFile("outside.so").also { it.writeText("archive bytes") }
        val path = "lib/arm64-v8a/lazy.so"
        val profile = ResourceProfile(
            "fixture",
            listOf(ResourceFileContract(path, sha256("archive bytes"))),
        )

        assertThrows(PatchException::class.java) {
            stripVerifiedResources(
                root,
                "Test resources",
                emptyList(),
                listOf(path),
                listOf(profile),
                resolveStandaloneFile = { outside },
            )
        }
        assertArrayEquals("archive bytes".toByteArray(), outside.readBytes())
    }

    @Test
    fun `a partly emptied group is rejected`() {
        val root = temporary.newFolder("partial")
        root.write("assets/group/first.bin", "")
        root.write("assets/group/second.bin", "second")
        val profile = ResourceProfile(
            "fixture",
            listOf(
                ResourceFileContract("assets/group/first.bin", sha256("first")),
                ResourceFileContract("assets/group/second.bin", sha256("second")),
            ),
        )

        assertThrows(PatchException::class.java) {
            stripVerifiedResources(root, "Test resources", listOf("assets/group"), emptyList(), listOf(profile))
        }
        assertArrayEquals("second".toByteArray(), root.resolve("assets/group/second.bin").readBytes())
    }

    @Test
    fun `language selection keeps English and both Android aliases`() {
        val available = setOf("en", "es", "he", "iw", "id", "in")

        assertEquals(setOf("en", "he", "iw"), parseLanguageSelection("he", available))
        assertEquals(setOf("en", "id", "in"), parseLanguageSelection("in", available))
        assertThrows(PatchException::class.java) {
            parseLanguageSelection("xx", available)
        }
    }

    @Test
    fun `language inventory is verified before selected packs are emptied`() {
        val root = temporary.newFolder("languages")
        root.write("assets/strings#lang_en/en.xrsc", "english")
        root.write("assets/strings#lang_es/es.xrsc", "spanish")
        val contract = languageContract(root, setOf("en", "es"))

        val first = stripVerifiedLanguagePacks(root, "en", listOf(contract))
        val second = stripVerifiedLanguagePacks(root, "en", listOf(contract))

        assertEquals(1, first.files)
        assertEquals(7L, first.bytes)
        assertFalse(first.alreadyStripped)
        assertTrue(second.alreadyStripped)
        assertArrayEquals("english".toByteArray(), root.resolve("assets/strings#lang_en/en.xrsc").readBytes())
        assertTrue(root.resolve("assets/strings#lang_es/es.xrsc").readBytes().isEmpty())
    }

    @Test
    fun `an altered language inventory does not empty another pack`() {
        val root = temporary.newFolder("altered-languages")
        root.write("assets/strings#lang_en/en.xrsc", "english")
        root.write("assets/strings#lang_es/es.xrsc", "spanish")
        val contract = languageContract(root, setOf("en", "es"))
        root.resolve("assets/strings#lang_en/en.xrsc").writeText("altered")

        assertThrows(PatchException::class.java) {
            stripVerifiedLanguagePacks(root, "en", listOf(contract))
        }
        assertArrayEquals("spanish".toByteArray(), root.resolve("assets/strings#lang_es/es.xrsc").readBytes())
    }

    @Test
    fun `a bundle merged with only some languages is refused, says why, and empties nothing`() {
        // Issue #9: a split bundle merged on the phone kept 25 of the 64 #lang_ directories.
        val root = temporary.newFolder("partial-languages")
        root.write("assets/strings#lang_en/en.xrsc", "english")
        root.write("assets/strings#lang_es/es.xrsc", "spanish")
        val contract = languageContract(root, setOf("en", "es", "fr"))

        val error = assertThrows(PatchException::class.java) {
            stripVerifiedLanguagePacks(root, "en", listOf(contract))
        }

        val message = error.message.orEmpty()
        assertTrue(message, message.contains("found 2 language directories, but the reviewed set has 3."))
        assertTrue(message, message.endsWith(UNREVIEWED_BUILD_HINT))
        assertArrayEquals("spanish".toByteArray(), root.resolve("assets/strings#lang_es/es.xrsc").readBytes())
    }

    @Test
    fun `the inventory whose directory set matches is the one that is checked`() {
        // A merged split bundle carries fewer language directories than the universal APK, so a
        // build has one reviewed inventory per shape and the directory set picks between them.
        val full = temporary.newFolder("full-languages")
        full.write("assets/strings#lang_en/en.xrsc", "english")
        full.write("assets/strings#lang_es/es.xrsc", "spanish")
        full.write("assets/strings#lang_fr/fr.xrsc", "french")
        val partial = temporary.newFolder("bundle-languages")
        partial.write("assets/strings#lang_en/en.xrsc", "english")
        partial.write("assets/strings#lang_es/es.xrsc", "spanish")
        val contracts = listOf(
            languageContract(full, setOf("en", "es", "fr")),
            languageContract(partial, setOf("en", "es")),
        )

        assertEquals(2, stripVerifiedLanguagePacks(full, "en", contracts).files)
        assertEquals(1, stripVerifiedLanguagePacks(partial, "en", contracts).files)
        assertTrue(partial.resolve("assets/strings#lang_es/es.xrsc").readBytes().isEmpty())
        assertArrayEquals("english".toByteArray(), partial.resolve("assets/strings#lang_en/en.xrsc").readBytes())

        val other = temporary.newFolder("other-languages")
        other.write("assets/strings#lang_en/en.xrsc", "english")
        val error = assertThrows(PatchException::class.java) {
            stripVerifiedLanguagePacks(other, "en", contracts)
        }
        assertTrue(error.message, error.message.orEmpty().contains("found 1 language directories, but the reviewed sets have 2 or 3."))
    }

    private fun languageContract(root: File, directories: Set<String>): LanguageInventoryContract {
        val files = root.resolve("assets").walkTopDown().filter(File::isFile).toList()
        return LanguageInventoryContract(
            directories,
            sha256(files.sortedBy { it.relativeTo(root).invariantSeparatorsPath }
                .joinToString("") { it.relativeTo(root).invariantSeparatorsPath + "\n" }),
            setOf(manifestDigest(root, files)),
        )
    }

    private fun manifestDigest(root: File, files: List<File>): String = sha256(
        files.sortedBy { it.relativeTo(root).invariantSeparatorsPath }.joinToString("") { file ->
            file.relativeTo(root).invariantSeparatorsPath + "\u0000" + sha256(file.readBytes()) + "\n"
        },
    )

    private fun File.write(path: String, text: String): File = resolve(path).also {
        it.parentFile.mkdirs()
        it.writeText(text)
    }

    private fun sha256(text: String): String = sha256(text.toByteArray())

    private fun sha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
        .digest(bytes)
        .joinToString("") { "%02x".format(it) }
}
