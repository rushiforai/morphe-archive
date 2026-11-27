// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redditshare

import java.net.InetAddress
import java.net.URI
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class RedditShareLinksTest {
    private val start = URI("https://www.reddit.com/r/example/s/Aa12")

    @Test
    fun acceptsShareVariantsWithCaseSensitivePathsAndTokens() {
        for (segment in listOf("r", "u", "user")) {
            for (host in listOf("WWW.Reddit.com", "np.reddit.com", "new.reddit.com")) {
                val rawPath = "/$segment/User-Name/s/aAbB123/"
                assertEquals("https://${host.lowercase()}$rawPath",
                    RedditShareLinks.parse("HTTPS://$host:443$rawPath?tracking=1#ignored").toString())
                assertEquals("https://www.reddit.com$rawPath", RedditShareLinks.parse(rawPath).toString())
            }
        }
    }

    @Test
    fun upgradesStandardHttpAndCanonicalizesIncomingAliases() {
        for (url in listOf("http://www.reddit.com/r/example/s/Aa12", "HTTP://alias.reddit.com:80/r/example/s/Aa12",
            "https://two.labels.reddit.com/r/example/s/Aa12", "https://api.reddit.com/r/example/s/Aa12")) {
            assertEquals(url, start, RedditShareLinks.parse(url))
        }
        val redirects = RedditShareLinks.Redirects(start)
        assertNull(redirects.follow(start, 302, listOf("https://alias.reddit.com/comments/abc")))
    }

    @Test
    fun rejectsUntrustedAuthorityAndMalformedSharePaths() {
        for (url in listOf(
            "http://www.reddit.com:443/r/example/s/Aa12",
            "ftp://www.reddit.com/r/example/s/Aa12",
            "https://www.reddit.com:80/r/example/s/Aa12",
            "https://www.reddit.com:/r/example/s/Aa12",
            "https://user@www.reddit.com/r/example/s/Aa12",
            "https://@www.reddit.com/r/example/s/Aa12",
            "https://www.reddit.com:444/r/example/s/Aa12",
            "https://www.reddit.com.evil.test/r/example/s/Aa12",
            "https://notreddit.com/r/example/s/Aa12",
            "https://reddit.com.evil.test/r/example/s/Aa12",
            "//www.reddit.com/r/example/s/Aa12",
            "/R/example/s/Aa12", "/r/example/S/Aa12", "/users/example/s/Aa12",
            "/u/example/s/Aa12/extra", "/r/example/s/", "/u/example/s/AA%2fBB",
            "/u/exa%2fmple/s/Aa12", "/user/example/s/?token=Aa12",
        )) assertNull(url, RedditShareLinks.parse(url))
    }

    @Test
    fun resolvesPostCommentAndProfilesAcrossTwoHops() {
        for (path in listOf("/r/Topic/comments/abc/title/def/?context=3#comment", "/comments/abc",
            "/user/Example_Name/comments/abc/title/", "/u/Example_Name/", "/user/Example_Name")) {
            val chain = RedditShareLinks.Redirects(start)
            val first = chain.follow(start, 302, listOf("https://np.reddit.com/r/example/s/More"))
                as RedditShareLinks.Next.Request
            val second = chain.follow(first.url, 307, listOf("https://NEW.reddit.com:443$path"))
                as RedditShareLinks.Next.Link
            assertEquals("https://www.reddit.com$path", second.destination.url)
            if ("/comments" in path) {
                assertNull(second.destination.profileName)
                assertEquals(second.destination.url, second.destination.syncUrl())
            } else {
                assertEquals("Example_Name", second.destination.profileName)
                assertEquals("https://www.reddit.com/user/Example_Name", second.destination.syncUrl())
            }
        }
    }

    @Test
    fun encodedPostTitlesRemainTerminalWithoutDecodingIdsOrPathSeparators() {
        for (path in listOf("/r/example/comments/abc/caf%C3%A9/", "/comments/abc/a%20title/def/?context=3")) {
            val next = RedditShareLinks.Redirects(start).follow(start, 302, listOf(path)) as RedditShareLinks.Next.Link
            assertEquals("https://www.reddit.com$path", next.destination.url)
            assertEquals(next.destination.url, next.destination.syncUrl())
        }
        for (path in listOf("/comments/%61bc/title", "/comments/abc/title/%64ef",
            "/comments/abc/a%2Fb", "/comments/abc/%2e%2e", "/comments/abc/title/bad-id")) {
            assertTrue(path, RedditShareLinks.Redirects(start).follow(start, 302, listOf(path)) is RedditShareLinks.Next.Request)
        }
    }

    @Test
    fun adaptsPostUrlsToSyncsStockIdParser() {
        val suffix = "/u/Example_Name/comments/abc/title/def?context=3#comment"
        val terminal = RedditShareLinks.Redirects(start).follow(start, 302, listOf(suffix))
            as RedditShareLinks.Next.Link
        assertEquals("https://www.reddit.com$suffix", terminal.destination.url)
        assertEquals("https://www.reddit.com/user/Example_Name/comments/abc/title/def/?context=3#comment",
            terminal.destination.syncUrl())
    }

    @Test
    fun enforcesEveryRedirectAndBoundsChains() {
        val disallowed = listOf("http://new.reddit.com/comments/abc", "https://np.reddit.com:444/comments/abc",
            "https://fake@np.reddit.com/comments/abc", "https://np.reddit.com.evil.test/comments/abc",
            "https://127.0.0.1/comments/abc", "https://[::1]/comments/abc")
        for (target in disallowed) {
            val chain = RedditShareLinks.Redirects(start)
            assertNull(target, chain.follow(start, 302, listOf(target)))
            val first = chain.follow(start, 302, listOf("/r/example/s/Second")) as RedditShareLinks.Next.Request
            assertNull(target, chain.follow(first.url, 302, listOf(target)))
        }
        for (nearMiss in listOf("/username/Alice", "/user/Alice/extras", "/user/Alice%2FBob",
            "/r/Topic/comments/abc/a/b/c", "/comments/")) {
            val next = RedditShareLinks.Redirects(start).follow(start, 302, listOf(nearMiss))
            assertTrue(nearMiss, next is RedditShareLinks.Next.Request)
        }
        val chain = RedditShareLinks.Redirects(start)
        assertNull(chain.follow(start, 200, listOf("/comments/abc")))
        assertNull(chain.follow(start, 302, listOf("/comments/abc", "/comments/def")))
        var current = start
        repeat(3) {
            current = (chain.follow(current, 302, listOf("/r/example/s/Next$it")) as RedditShareLinks.Next.Request).url
        }
        assertNull(chain.follow(current, 302, listOf("/r/example/s/TooFar")))
        val loop = RedditShareLinks.Redirects(start)
        assertNull(loop.follow(start, 302, listOf("$start#fragment")))
    }

    @Test
    fun permitsPublicIpv4AndIpv6AndExcludesLocalOrSpecialAddresses() {
        for (address in listOf("8.8.8.8", "2606:4700::1111", "2a00:1450::1")) {
            assertTrue(address, RedditShareLinks.isPublic(InetAddress.getByName(address)))
        }
        for (address in listOf("127.0.0.1", "100.64.0.1", "10.1.1.1", "192.0.2.1", "203.0.113.1", "::1",
            "fe80::1", "fc00::1", "2001:db8::1", "3fff::1", "2002:ac10:202::1", "::ffff:127.0.0.1")) {
            assertFalse(address, RedditShareLinks.isPublic(InetAddress.getByName(address)))
        }
    }
}
