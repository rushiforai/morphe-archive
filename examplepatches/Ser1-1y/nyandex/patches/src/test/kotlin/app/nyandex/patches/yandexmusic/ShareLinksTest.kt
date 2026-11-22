/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic

import java.io.File
import java.net.URLClassLoader
import javax.tools.ToolProvider
import kotlin.io.path.createTempDirectory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

/** Unit tests of the share link cleaner, compiled from the extension module source. */
class ShareLinksTest {
    private val shareLinks: Class<*> by lazy { compile() }

    private fun clean(url: String?): String? =
        shareLinks.getMethod("clean", String::class.java).invoke(null, url) as String?

    @Test
    fun `tracking parameters are removed`() {
        assertEquals(
            "https://music.yandex.ru/album/123/track/456",
            clean("https://music.yandex.ru/album/123/track/456?utm_medium=copy_link&ref_id=3f2b9c1e-0000-4000-8000-000000000000"),
        )
        assertEquals(
            "https://music.yandex.ru/artist/42",
            clean("https://music.yandex.ru/artist/42?UTM_SOURCE=x&utm_campaign=y&ref_id=z"),
        )
    }

    @Test
    fun `invitations and functional parameters stay`() {
        assertEquals(
            "https://music.yandex.ru/playlists/abc?openTrailer=true&invite_id=inv1",
            clean("https://music.yandex.ru/playlists/abc?openTrailer=true&utm_medium=copy_link&invite_id=inv1&ref_id=r"),
        )
        assertEquals(
            "https://music.yandex.ru/video/?ids=1",
            clean("https://music.yandex.ru/video/?ids=1&utm_medium=copy_link&ref_id=r"),
        )
    }

    @Test
    fun `links without tracking are unchanged`() {
        assertEquals("https://music.yandex.ru/chart", clean("https://music.yandex.ru/chart"))
        assertEquals("https://music.yandex.ru/a?x=1#top", clean("https://music.yandex.ru/a?x=1&ref_id=2#top"))
        assertEquals("https://music.yandex.ru/a#top", clean("https://music.yandex.ru/a?utm_term=1#top"))
        assertEquals("https://music.yandex.ru/a?ref_idx=1", clean("https://music.yandex.ru/a?ref_idx=1"))
        assertNull(clean(null))
    }

    private fun compile(): Class<*> {
        val root = generateSequence(File("").absoluteFile) { it.parentFile }
            .first { File(it, "extensions/share-links").isDirectory }
        val source = File(
            root,
            "extensions/share-links/src/main/java/app/nyandex/extension/yandexmusic/share/ShareLinks.java",
        )
        val output = createTempDirectory("share-links").toFile()
        val result = ToolProvider.getSystemJavaCompiler().run(null, null, null, "-d", output.path, "--release", "17", source.path)
        assertEquals(0, result, "ShareLinks.java did not compile")
        return URLClassLoader(arrayOf(output.toURI().toURL()), javaClass.classLoader)
            .loadClass("app.nyandex.extension.yandexmusic.share.ShareLinks")
    }
}
