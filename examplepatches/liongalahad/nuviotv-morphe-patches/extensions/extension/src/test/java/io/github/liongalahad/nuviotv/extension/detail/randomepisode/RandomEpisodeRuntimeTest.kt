package io.github.liongalahad.nuviotv.extension.detail.randomepisode

import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test
import java.time.LocalDate

class RandomEpisodeRuntimeTest {
    @After
    fun tearDown() {
        RandomEpisodeRuntime.resetForTests()
    }

    @Test
    fun `eligible videos exclude specials invalid coordinates current episode and future releases`() {
        val current = Video("current", 1, 2, "2026-01-01")
        val eligible = Video("eligible", 2, 3, LocalDate.now().toString())
        val malformedDate = Video("malformed", 3, 1, "not-a-date")
        val result = RandomEpisodeRuntime.eligibleVideos(
            listOf(
                Video("special", 0, 1, "2020-01-01"),
                Video("invalid", 1, 0, "2020-01-01"),
                current,
                Video("future", 2, 1, LocalDate.now().plusDays(1).toString()),
                eligible,
                malformedDate
            ),
            1,
            2
        )

        assertEquals(listOf(eligible, malformedDate), result)
    }

    @Test
    fun `inactive next episode preserves Nuvio result and active mode excludes current`() {
        val normal = Video("normal", 1, 2, "2020-01-01")
        assertSame(
            normal,
            RandomEpisodeRuntime.chooseNextEpisode(normal, listOf(normal), 1, 1)
        )

        RandomEpisodeRuntime.setRandomSessionForTests(true)
        val onlyAlternative = Video("random", 3, 4, "2020-01-01")
        assertSame(
            onlyAlternative,
            RandomEpisodeRuntime.chooseNextEpisode(
                normal,
                listOf(Video("current", 1, 1, "2020-01-01"), onlyAlternative),
                1,
                1
            )
        )
        assertNull(
            RandomEpisodeRuntime.chooseNextEpisode(
                normal,
                listOf(Video("current", 1, 1, "2020-01-01")),
                1,
                1
            )
        )
    }

    @Test
    fun `random route rewrites episode fields and leaves show metadata intact`() {
        val random = Video(
            id = "episode/42",
            season = 4,
            episode = 7,
            released = "2020-01-01",
            title = "A Random & Episode",
            thumbnail = "https://img.test/random poster.jpg",
            runtime = 51
        )
        val original = "stream/original/series/Show%20Name" +
            "?poster=old&backdrop=show-backdrop&logo=show-logo&season=1&episode=2" +
            "&episodeName=Old&genres=Drama&year=2026&contentId=show-id" +
            "&contentName=Show%20Name&runtime=40&manualSelection=false" +
            "&returnToDetailOnBack=true&returnToHomeOnBack=false" +
            "&startFromBeginning=false&contentLanguage=en"

        RandomEpisodeRuntime.beginRandomForTests(random)
        assertEquals("S4 E7", RandomEpisodeRuntime.rewriteManualSubtitle("S1 E2"))
        val rewritten = RandomEpisodeRuntime.rewriteStreamRoute(original)

        assertTrue(rewritten.startsWith("stream/episode%2F42/series/Show%20Name?"))
        assertTrue(rewritten.contains("poster=https%3A%2F%2Fimg.test%2Frandom%20poster.jpg"))
        assertTrue(rewritten.contains("season=4&episode=7"))
        assertTrue(rewritten.contains("episodeName=A%20Random%20%26%20Episode"))
        assertTrue(rewritten.contains("runtime=51"))
        assertTrue(rewritten.contains("contentId=show-id"))
        assertTrue(RandomEpisodeRuntime.shouldSkipTracking())
    }

    @Test
    fun `ordinary route is immutable and clears stale random session`() {
        val route = "stream/normal/series/Show?season=1&episode=1"
        assertEquals(route, RandomEpisodeRuntime.rewriteStreamRoute(route))
        assertFalse(RandomEpisodeRuntime.shouldSkipTracking())

        RandomEpisodeRuntime.setRandomSessionForTests(true)
        assertEquals(route, RandomEpisodeRuntime.rewriteStreamRoute(route))
        assertFalse(RandomEpisodeRuntime.shouldSkipTracking())
    }

    @Test
    fun `random return clears detail focus and finishes the session`() {
        RandomEpisodeRuntime.setRandomSessionForTests(true)

        assertNull(RandomEpisodeRuntime.filterReturnFocusSeason(4))
        assertTrue(RandomEpisodeRuntime.shouldSkipTracking())
        assertNull(RandomEpisodeRuntime.filterReturnFocusEpisode(7))
        assertFalse(RandomEpisodeRuntime.shouldSkipTracking())

        assertEquals(1, RandomEpisodeRuntime.filterReturnFocusSeason(1))
        assertEquals(2, RandomEpisodeRuntime.filterReturnFocusEpisode(2))
    }

    data class Video(
        val id: String,
        val season: Int?,
        val episode: Int?,
        val released: String?,
        val title: String = id,
        val thumbnail: String? = null,
        val runtime: Int? = null
    )
}
