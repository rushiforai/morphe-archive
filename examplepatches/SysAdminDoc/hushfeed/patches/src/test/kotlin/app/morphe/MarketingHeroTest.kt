/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */

package app.morphe

import java.io.File
import java.security.MessageDigest
import java.util.HexFormat
import javax.imageio.ImageIO
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class MarketingHeroTest {
    private val root = File("..").canonicalFile.takeIf { File(it, "README.md").isFile }
        ?: File(".").canonicalFile

    @Test
    fun `the selected hero is the first README content and appears once`() {
        val readme = File(root, "README.md").readText()
        val heroPath = "assets/readme-hero.png"
        val firstContent = readme.lineSequence().first { it.isNotBlank() }

        assertTrue("the README must lead with the marketing hero", firstContent.contains(heroPath))
        assertEquals("the selected hero must not be inserted twice", 1, readme.windowed(heroPath.length).count { it == heroPath })
        assertFalse("the retired header must stay out of the README", readme.contains("assets/readme-header.png"))
    }

    @Test
    fun `the README keeps a canonical Morphe source link and manual fallback`() {
        val readme = File(root, "README.md").readText()
        val canonicalLink = "https://morphe.software/add-source?github=SysAdminDoc%2Fhushfeed"
        val addSourceLinks = Regex("""https://morphe\.software/add-source\?github=[^)\s]+""")
            .findAll(readme)
            .map { it.value }
            .toList()

        assertTrue("the README must include an add-source link", addSourceLinks.isNotEmpty())
        assertTrue(
            "every add-source link must use the encoded repository slug",
            addSourceLinks.all { it == canonicalLink },
        )
        assertTrue(
            "the README must explain the manual Manager fallback",
            readme.contains("paste `https://github.com/SysAdminDoc/hushfeed`"),
        )
    }

    /**
     * The fork cleanup retired the upstream author's Ko-fi (P5P5YOUU7), not this project's own.
     * a2371055 read it as "no Ko-fi at all" and removed the support button; this holds both apart.
     */
    @Test
    fun `the README keeps the project Ko-fi above the title and leaves out the inherited one`() {
        val readme = File(root, "README.md").readText()
        val link = readme.indexOf("https://ko-fi.com/X8K126YVER")

        assertTrue("the README must keep the project support link", link >= 0)
        assertTrue("the support button belongs above the title", link < readme.indexOf("\n# Hushfeed"))
        assertFalse("the inherited upstream donation link returned", readme.contains("ko-fi.com/P5P5YOUU7", ignoreCase = true))
    }

    @Test
    fun `the hero keeps its review size and version-free source`() {
        val hero = ImageIO.read(File(root, "assets/readme-hero.png"))
        assertEquals(1600, hero.width)
        assertEquals(900, hero.height)

        val generator = File(root, "concepts/marketing/2026-09-12/generate_hero.py").readText()
        assertFalse(
            "release numbers make hero artwork stale",
            Regex("""\bv?\d+\.\d+\.\d+\b""").containsMatchIn(generator),
        )
    }

    @Test
    fun `the approved H and hero stay byte exact`() {
        // The concept archive's duplicate images were removed; pin the reviewed bytes themselves.
        assertArrayEquals(
            "the approved H changed",
            HexFormat.of().parseHex("950a4ebd6361b01153abbd44040b6616ceea49344c8ceb55b53425246baedf15"),
            digest(File(root, "patches-bundle.png")),
        )
        assertArrayEquals(
            "the selected hero changed",
            HexFormat.of().parseHex("5a2a2fd68c5e01dc199d558e8f546b0335f27d7da6d6b7b3463f2e99d8058df9"),
            digest(File(root, "assets/readme-hero.png")),
        )
    }

    private fun digest(file: File): ByteArray {
        assertTrue("missing reviewed marketing file: $file", file.isFile)
        return MessageDigest.getInstance("SHA-256").digest(file.readBytes())
    }
}
