/*
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe

import java.io.File
import java.net.HttpURLConnection
import java.net.URL
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Every mirror URL in a source notice answers.
 *
 * <p>The notices that cite `github.com/ReVanced/revanced-patches` point at a repository GitHub
 * has blocked under a DMCA notice since 2026-03-24, and CONTRIBUTING keeps those lines as the
 * record of which revision the code came from. The line beside each is the GitLab mirror, which
 * is the one a reader can open. This fetches each distinct mirror once, so the next takedown is
 * found by the suite rather than by a reader, and it is the only test here that needs the
 * network: a machine with none fails it by name rather than passing over it.
 *
 * <p>GitLab answers a burst of these with 429 Too Many Requests, which says nothing about the
 * file (HushGram's preflight 2026-10-18, with the other Hush repos checking the same mirrors). The
 * requests are spaced, and a 429 is asked again after the wait GitLab names, a few times at most;
 * a mirror still turning the check away after that fails like any other.
 *
 * <p>A redirect is followed only while it keeps the path. GitLab answers a blob that isn't there
 * with a 302 to the folder's tree page, whose 200 once passed a notice citing a file the mirror
 * never had (AppCompatibilities.kt, found at the 0.19.0 preflight).
 */
class OriginNoticeMirrorsTest {
    @Test
    fun `every mirror cited by a source notice answers 200`() {
        val root = generateSequence(File("").absoluteFile) { it.parentFile }
            .first { File(it, "extensions").isDirectory && File(it, "CONTRIBUTING.md").isFile }
        val mirrors = listOf(File(root, "extensions"), File(root, "patches/src")).asSequence()
            .flatMap { tree -> tree.walkTopDown().onEnter { it.name != "build" } }
            // This file's own sample URLs aren't notices.
            .filter { it.isFile && (it.extension == "java" || it.extension == "kt") && it.name != "OriginNoticeMirrorsTest.kt" }
            .flatMap { file -> MIRROR.findAll(file.readText()).map { it.value } }
            .toSortedSet()
        assertTrue("no source notice cites a mirror, so the block has nothing beside it", mirrors.isNotEmpty())

        val failures = mirrors.mapNotNull { mirror ->
            Thread.sleep(SPACING_MS)
            val status = runCatching { statusAfterThrottling(mirror) }.getOrElse { error -> "no answer: ${error.message}" }
            if (status == "200") null else "$status  $mirror"
        }
        assertTrue("mirrors that do not answer 200:\n" + failures.joinToString("\n"), failures.isEmpty())
    }

    @Test
    fun `a wait GitLab names is kept within the cap`() {
        assertEquals(7_000L, waitMillis("7"))
        assertEquals(MAX_WAIT_MS, waitMillis("600"))
        assertEquals(DEFAULT_WAIT_MS, waitMillis(null))
        assertEquals(DEFAULT_WAIT_MS, waitMillis("Wed, 21 Oct 2026 07:28:00 GMT"))
    }

    @Test
    fun `a redirect counts only when it keeps the file's path`() {
        val blob = URL("https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/A.kt")
        assertTrue(keepsPath(blob, URL("http://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/A.kt")))
        assertFalse(keepsPath(blob, URL(blob, "/ReVanced/revanced-patches/-/tree/main")))
        assertFalse(keepsPath(blob, URL(blob, "/users/sign_in")))
    }

    private fun statusAfterThrottling(url: String): String {
        var answer = status(url)
        repeat(THROTTLED_TRIES - 1) {
            if (answer.first != "429") return answer.first
            Thread.sleep(waitMillis(answer.second))
            answer = status(url)
        }
        return answer.first
    }

    private fun waitMillis(retryAfter: String?): Long {
        val seconds = retryAfter?.trim()?.toLongOrNull() ?: return DEFAULT_WAIT_MS
        return (seconds * 1_000).coerceIn(0, MAX_WAIT_MS)
    }

    private fun keepsPath(from: URL, to: URL) = from.host == to.host && from.path == to.path

    /** The status and the Retry-After header that came with it; a redirect elsewhere is its own answer. */
    private fun status(url: String): Pair<String, String?> {
        val start = URL(url)
        var current = start
        repeat(MAX_HOPS) {
            val connection = current.openConnection() as HttpURLConnection
            connection.requestMethod = "HEAD"
            connection.instanceFollowRedirects = false
            connection.connectTimeout = 20_000
            connection.readTimeout = 20_000
            connection.setRequestProperty("User-Agent", "hushfacebook-origin-notice-check")
            try {
                val code = connection.responseCode
                if (code !in 300..399) return code.toString() to connection.getHeaderField("Retry-After")
                val location = connection.getHeaderField("Location") ?: return "$code with no Location" to null
                val next = URL(current, location)
                if (!keepsPath(start, next)) return "$code to $next" to null
                current = next
            } finally {
                connection.disconnect()
            }
        }
        return "more than $MAX_HOPS redirects" to null
    }

    private companion object {
        val MIRROR = Regex("""https://gitlab\.com/ReVanced/revanced-patches/[^\s"]+""")
        const val SPACING_MS = 400L
        const val THROTTLED_TRIES = 4
        const val DEFAULT_WAIT_MS = 10_000L
        const val MAX_WAIT_MS = 60_000L
        const val MAX_HOPS = 5
    }
}
