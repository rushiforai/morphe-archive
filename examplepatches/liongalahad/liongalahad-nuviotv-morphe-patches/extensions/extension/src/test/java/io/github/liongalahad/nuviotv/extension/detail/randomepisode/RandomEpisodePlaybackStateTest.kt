package io.github.liongalahad.nuviotv.extension.detail.randomepisode

import android.app.Application
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.time.LocalDate

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class RandomEpisodePlaybackStateTest {
    private lateinit var application: Application
    private val showKey = "series:show-id"

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().clear().commit()
        RandomEpisodeRuntime.resetForTests()
    }

    @After
    fun tearDown() {
        RandomEpisodeRuntime.resetForTests()
    }

    @Test
    fun `detail toggle uses Nuvio's packaged Material shuffle-on drawable`() {
        assertEquals(0x7f0800ee, RandomEpisodeRuntime.shuffleDrawableIdForTests())
    }

    @Test
    fun `explicit episode and Continue Watching routes arm random continuation without rewriting`() {
        val videos = videos()
        val meta = Meta("show-id", "series", videos)
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureDetailState(meta, emptySet<Pair<Int, Int>>())
        val route = route("e2", 1, 2)

        assertEquals(route, RandomEpisodeRuntime.rewriteStreamRoute(route))
        assertTrue(RandomEpisodeRuntime.isRandomSessionActiveForTests())
        val selected = RandomEpisodeRuntime.chooseNextEpisode(videos[2], videos, 1, 2)
        assertTrue(selected === videos[0] || selected === videos[2])
    }

    @Test
    fun `unwatched continuation excludes Nuvio merged watched keys and stops when exhausted`() {
        val videos = videos()
        val meta = Meta("show-id", "tv", videos)
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_UNWATCHED)
        RandomEpisodeRuntime.captureDetailState(meta, setOf(1 to 1, 1 to 3))
        RandomEpisodeRuntime.rewriteStreamRoute(route("e2", 1, 2))

        assertEquals(null, RandomEpisodeRuntime.chooseNextEpisode(videos[2], videos, 1, 2))

        RandomEpisodeRuntime.captureDetailState(meta, setOf(1 to 1))
        RandomEpisodeRuntime.rewriteStreamRoute(route("e2", 1, 2))
        assertSame(videos[2], RandomEpisodeRuntime.chooseNextEpisode(videos[0], videos, 1, 2))
    }

    @Test
    fun `random progress remains native and completion snapshot uses the ninety percent threshold`() {
        val videos = videos()
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureDetailState(
            Meta("show-id", "series", videos), emptySet<Pair<Int, Int>>()
        )
        RandomEpisodeRuntime.rewriteStreamRoute(route("e2", 1, 2))

        RandomEpisodeRuntime.recordProgress(89, 100, false)
        assertFalse(RandomEpisodeSettings.watchedEpisodes(showKey).contains("1:2"))
        RandomEpisodeRuntime.recordProgress(90, 100, false)
        assertTrue(RandomEpisodeSettings.watchedEpisodes(showKey).contains("1:2"))
        assertFalse(RandomEpisodeRuntime.shouldSkipTracking())
    }

    @Test
    fun `disabled show leaves ordinary route and sequential next untouched`() {
        val videos = videos()
        val route = route("e1", 1, 1)
        assertEquals(route, RandomEpisodeRuntime.rewriteStreamRoute(route))
        assertFalse(RandomEpisodeRuntime.isRandomSessionActiveForTests())
        assertSame(videos[1], RandomEpisodeRuntime.chooseNextEpisode(videos[1], videos, 1, 1))
    }

    @Test
    fun `no-progress hero displays one stable random episode for the current visit`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e1", 1, 1, "S1E1")
        val visitAction: () -> Unit = {}
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.setRandomSeedForTests(31)

        val first = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, native, visitAction
        ) as NextToWatch
        val selected = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video
        val recomposed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, native, visitAction
        ) as NextToWatch

        assertEquals(selected.id, first.nextVideoId)
        assertEquals(selected.season, first.nextSeason)
        assertEquals(selected.episode, first.nextEpisode)
        assertEquals("Play S${selected.season} E${selected.episode}", first.displayText)
        assertEquals(first, recomposed)
        assertSame(selected, RandomEpisodeRuntime.selectedHeroVideoForTests())
    }

    @Test
    fun `late episode-list expansion keeps the episode selected for this visit`() {
        val native = NextToWatch(null, false, "e1", 1, 1, "Play S1 E1")
        val visitAction: () -> Unit = {}
        RandomEpisodeSettings.setShowEnabled(showKey, true)

        val partial = Meta("show-id", "series", listOf(videos()[0]))
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(partial, native, visitAction)
        assertEquals("e1", (RandomEpisodeRuntime.selectedHeroVideoForTests() as Video).id)

        val expanded = Meta("show-id", "series", videos())
        val refreshed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            expanded, native, visitAction
        ) as NextToWatch

        assertEquals("e1", refreshed.nextVideoId)
        assertEquals("Play S1 E1", refreshed.displayText)
    }

    @Test
    fun `new play callbacks from trailer and source picker keep the visit episode`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e1", 1, 1, "S1E1")
        RandomEpisodeSettings.setShowEnabled(showKey, true)

        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) {}
        val first = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) { Unit }
        val afterTrailer = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) { Unit }
        val afterSourcePicker = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video

        assertSame(first, afterTrailer)
        assertSame(first, afterSourcePicker)
    }

    @Test
    fun `returning Home ends the visit and re-entry chooses another episode`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e1", 1, 1, "S1E1")
        RandomEpisodeSettings.setShowEnabled(showKey, true)

        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) {}
        val first = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video
        RandomEpisodeRuntime.enterHome()
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) {}
        val second = RandomEpisodeRuntime.selectedHeroVideoForTests() as Video

        assertNotEquals(first.id, second.id)
    }

    @Test
    fun `native in-progress Resume takes precedence over an enabled random show`() {
        val meta = Meta("show-id", "series", videos())
        val resume = NextToWatch(Any(), true, "e2", 1, 2, "Resume S1E2")
        RandomEpisodeSettings.setShowEnabled(showKey, true)

        val result = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, resume) {}

        assertSame(resume, result)
        assertEquals(null, RandomEpisodeRuntime.selectedHeroVideoForTests())
    }

    @Test
    fun `Continue Watching is the Resume source of truth for label and both playback stages`() {
        val meta = Meta("show-id", "series", videos())
        val progress = Progress(
            "show-id", "series", "e2", 1, 2, position = 25, duration = 100
        )
        val staleNative = NextToWatch(Any(), true, "e1", 1, 1, "Resume S1 E1")
        var routed: String? = null
        val entryAction: () -> Unit = {
            routed = RandomEpisodeRuntime.rewriteStreamRoute(route("e1", 1, 1))
        }
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.prepareContinueWatchingItem(ContinueItem(progress))

        val displayed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, staleNative, entryAction
        ) as NextToWatch
        RandomEpisodeRuntime.heroPlayActionForTests()!!.invoke()

        assertSame(progress, displayed.watchProgress)
        assertTrue(displayed.isResume)
        assertEquals("e2", displayed.nextVideoId)
        assertEquals(1, displayed.nextSeason)
        assertEquals(2, displayed.nextEpisode)
        assertEquals("Resume S1 E2", displayed.displayText)
        assertEquals(route("e2", 1, 2), routed)
        assertTrue(RandomEpisodeRuntime.isRandomSessionActiveForTests())
        val next = RandomEpisodeRuntime.chooseNextEpisode(videos()[0], videos(), 1, 2) as Video
        assertNotEquals("e2", next.id)
    }

    @Test
    fun `removing Continue Watching while random is off cannot restore Resume when enabled`() {
        val meta = Meta("show-id", "series", videos())
        val progress = Progress(
            "show-id", "series", "e2", 1, 2, position = 25, duration = 100
        )
        val resume = NextToWatch(progress, true, "e2", 1, 2, "Resume S1 E2")
        val playNext = NextToWatch(null, false, "e1", 1, 1, "Play Next S1 E1")
        RandomEpisodeSettings.setShowEnabled(showKey, false)
        RandomEpisodeRuntime.prepareContinueWatchingItem(ContinueItem(progress))

        val beforeRemoval = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, resume
        ) {} as NextToWatch
        val afterRemoval = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, playNext
        ) {} as NextToWatch

        assertSame(resume, beforeRemoval)
        assertSame(playNext, afterRemoval)

        RandomEpisodeSettings.setShowEnabled(showKey, true)
        val randomized = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, playNext
        ) {} as NextToWatch

        assertFalse(randomized.isResume)
        assertEquals(null, randomized.watchProgress)
        assertTrue(randomized.displayText.startsWith("Play "))
        assertTrue(randomized !== playNext)
    }

    @Test
    fun `completed Continue Watching payload is ignored instead of forcing Resume`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e1", 1, 1, "Play S1 E1")
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.prepareContinueWatchingItem(
            ContinueItem(Progress(
                "show-id", "series", "e2", 1, 2, position = 90, duration = 100
            ))
        )

        val displayed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) {}
                as NextToWatch

        assertFalse(displayed.isResume)
        assertTrue(displayed.displayText.startsWith("Play "))
    }

    @Test
    fun `remote percentage-only Continue Watching progress can be authoritative`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e1", 1, 1, "Play S1 E1")
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.prepareContinueWatchingItem(
            ContinueItem(RemoteProgress("show-id", "series", "e3", 1, 3, 0.25f))
        )

        val displayed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, native) {}
                as NextToWatch

        assertTrue(displayed.isResume)
        assertEquals("e3", displayed.nextVideoId)
        assertEquals("Resume S1 E3", displayed.displayText)
    }

    @Test
    fun `native Resume for a completed episode is treated as stale`() {
        val meta = Meta("show-id", "series", videos())
        val stale = NextToWatch(Any(), true, "e2", 1, 2, "Resume S1 E2")
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureDetailState(meta, setOf(1 to 2))

        val displayed = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, stale) {}
                as NextToWatch

        assertFalse(displayed.isResume)
        assertTrue(displayed.displayText.startsWith("Play "))
    }

    @Test
    fun `turning random off restores the native oldest-unwatched hero value`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e2", 1, 2, "S1E2")
        val visitAction: () -> Unit = {}
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        val randomized = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, native, visitAction
        )
        assertTrue(randomized !== native)

        RandomEpisodeSettings.setShowEnabled(showKey, false)
        val restored = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, native, visitAction
        )

        assertSame(native, restored)
        assertEquals(null, RandomEpisodeRuntime.selectedHeroVideoForTests())
    }

    @Test
    fun `unwatched hero selection uses only that show's merged watched state`() {
        val meta = Meta("show-id", "series", videos())
        val native = NextToWatch(null, false, "e2", 1, 2, "S1E2")
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_UNWATCHED)
        RandomEpisodeRuntime.captureDetailState(meta, setOf(1 to 1, 1 to 2))

        val selected = RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, native
        ) {} as NextToWatch

        assertEquals("e3", selected.nextVideoId)
        assertEquals("Play S1 E3", selected.displayText)
    }

    @Test
    fun `Continue Watching identity accepts progress and next-up payloads`() {
        assertEquals(
            showKey,
            RandomEpisodeRuntime.showKeyForContinueItemForTests(
                ContinueItem(Progress("show-id", "series"))
            )
        )
        assertEquals(
            showKey,
            RandomEpisodeRuntime.showKeyForContinueItemForTests(
                ContinueItem(NextUp("show-id", "tv"))
            )
        )
    }

    @Test
    fun `Continue Watching artwork activation restores the item bound to its inner lambda`() {
        val first = ContinueItem(Progress("first-show", "series"))
        val second = ContinueItem(Progress("second-show", "series"))
        val innerArtwork = Any()

        RandomEpisodeRuntime.prepareContinueWatchingItem(first)
        RandomEpisodeRuntime.bindContinueWatchingContent(innerArtwork)
        RandomEpisodeRuntime.prepareContinueWatchingItem(second)
        assertEquals("series:second-show", RandomEpisodeRuntime.activeContinueShowKeyForTests())

        RandomEpisodeRuntime.activateContinueWatchingContent(innerArtwork)

        assertEquals("series:first-show", RandomEpisodeRuntime.activeContinueShowKeyForTests())
    }

    @Test
    fun `random Next Up card is stable for one Home visit and changes on re-entry`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2", "e3")
        )
        val native = nextUpItem("show-id")
        RandomEpisodeRuntime.setRandomSeedForTests(9)

        RandomEpisodeRuntime.enterHome()
        val first = RandomEpisodeRuntime.rewriteHomeContinueItem(native) as NextUpItem
        RandomEpisodeRuntime.enterHome()
        val recomposed = RandomEpisodeRuntime.rewriteHomeContinueItem(native) as NextUpItem

        assertSame(first, recomposed)
        RandomEpisodeRuntime.leaveHomeForTests()
        RandomEpisodeRuntime.enterHome()
        val second = RandomEpisodeRuntime.rewriteHomeContinueItem(native) as NextUpItem

        assertNotEquals(first.info.videoId, second.info.videoId)
    }

    @Test
    fun `random future Next Up is rewritten as aired before native section classification`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        RandomEpisodeRuntime.enterHome()
        val future = nextUpItem("show-id", hasAired = false)

        val rewritten = RandomEpisodeRuntime.rewriteHomeContinueItems(listOf(future))

        assertEquals(1, rewritten.size)
        val random = rewritten.single() as NextUpItem
        assertTrue(random.info.hasAired)
        assertTrue(random.info.videoId == "e1" || random.info.videoId == "e2")
        assertFalse(random.info.isReleaseAlert)
        assertFalse(random.info.isNewSeasonRelease)
        assertSame(random, RandomEpisodeRuntime.rewriteHomeContinueItem(random))
    }

    @Test
    fun `disabled future Next Up retains native Upcoming classification and list identity`() {
        val future = nextUpItem("show-id", hasAired = false)
        val nativeItems = listOf(future)

        val rewritten = RandomEpisodeRuntime.rewriteHomeContinueItems(nativeItems)

        assertSame(nativeItems, rewritten)
        assertSame(future, rewritten.single())
        assertFalse((rewritten.single() as NextUpItem).info.hasAired)
    }

    @Test
    fun `pre-classification rewrite changes only enabled Next Up and never duplicates items`() {
        val secondShowKey = "series:second-show"
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("random-1", "random-2")
        )
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("second-show"), homeVideos("second-1")
        )
        RandomEpisodeRuntime.enterHome()
        val enabledFuture = nextUpItem("show-id", hasAired = false)
        val disabledFuture = nextUpItem("second-show", hasAired = false)
        val resume = ContinueItem(
            Progress("resume-show", "series", "resume-1", 1, 1, position = 25, duration = 100)
        )

        val rewritten = RandomEpisodeRuntime.rewriteHomeContinueItems(
            listOf(enabledFuture, disabledFuture, resume)
        )

        assertEquals(3, rewritten.size)
        val random = rewritten[0] as NextUpItem
        assertTrue(random.info.hasAired)
        assertSame(disabledFuture, rewritten[1])
        assertFalse((rewritten[1] as NextUpItem).info.hasAired)
        assertSame(resume, rewritten[2])
        assertEquals(3, rewritten.toSet().size)
        assertFalse(RandomEpisodeSettings.isShowEnabled(secondShowKey))
    }

    @Test
    fun `exhausted Unwatched pool removes only its enabled Upcoming item`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_UNWATCHED)
        RandomEpisodeSettings.replaceWatchedEpisodes(showKey, setOf("1:1", "1:2"))
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        RandomEpisodeRuntime.enterHome()
        val exhaustedFuture = nextUpItem("show-id", hasAired = false)
        val unrelatedFuture = nextUpItem("second-show", hasAired = false)

        val rewritten = RandomEpisodeRuntime.rewriteHomeContinueItems(
            listOf(exhaustedFuture, unrelatedFuture)
        )

        assertEquals(1, rewritten.size)
        assertSame(unrelatedFuture, rewritten.single())
        assertFalse((rewritten.single() as NextUpItem).info.hasAired)
    }

    @Test
    fun `retained Home split moves a show both ways when its detail toggle changes`() {
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        val future = nextUpItem("show-id", hasAired = false)
        val sourceItems = listOf<Any>(future)
        val continueItems = mutableListOf<Any>()
        val upcomingItems = mutableListOf<Any>(future)
        val retainedState = TestHomeState(emptyList(), continueItems, upcomingItems)
        val stateHolder = TestHomeStateHolder(retainedState)
        RandomEpisodeRuntime.enterHome(TestHomeOwner(stateHolder))

        assertSame(sourceItems, RandomEpisodeRuntime.rewriteHomeContinueItems(sourceItems))
        RandomEpisodeRuntime.captureHomeContinueSplit(Pair(continueItems, upcomingItems))
        RandomEpisodeRuntime.captureHomeState(retainedState, continueItems, upcomingItems)

        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.onEpisodePoolChanged(showKey)
        assertTrue(continueItems.isEmpty())
        assertSame(future, upcomingItems.single())
        val enabledState = stateHolder.value as TestHomeState
        assertTrue(enabledState.c.isEmpty())
        val random = enabledState.b.single() as NextUpItem
        assertTrue(random.info.hasAired)
        assertTrue(random.info.videoId == "e1" || random.info.videoId == "e2")

        RandomEpisodeSettings.setShowEnabled(showKey, false)
        RandomEpisodeRuntime.onEpisodePoolChanged(showKey)
        val disabledState = stateHolder.value as TestHomeState
        assertTrue(disabledState.b.isEmpty())
        assertSame(future, disabledState.c.single())
        assertFalse((disabledState.c.single() as NextUpItem).info.hasAired)
    }

    @Test
    fun `cold random Home recomposition still restores the native Upcoming episode`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        val future = nextUpItem("show-id", hasAired = false)
        val stateHolder = TestHomeStateHolder(TestHomeState(emptyList(), emptyList(), emptyList()))
        RandomEpisodeRuntime.enterHome(TestHomeOwner(stateHolder))

        val rewritten = RandomEpisodeRuntime.rewriteHomeContinueItems(listOf<Any>(future))
        val random = rewritten.single() as NextUpItem
        val continueItems = mutableListOf<Any>(random)
        val upcomingItems = mutableListOf<Any>()
        val retainedState = TestHomeState(emptyList(), continueItems, upcomingItems)
        stateHolder.value = retainedState
        RandomEpisodeRuntime.captureHomeContinueSplit(Pair(continueItems, upcomingItems))
        RandomEpisodeRuntime.captureHomeState(retainedState, continueItems, upcomingItems)

        // A cold enabled Home recomposes from its already-rewritten retained lists. This
        // replaces the captured split input, but must not discard the native future item.
        assertSame(
            continueItems,
            RandomEpisodeRuntime.rewriteHomeContinueItems(continueItems)
        )
        RandomEpisodeRuntime.captureHomeContinueSplit(Pair(continueItems, upcomingItems))

        RandomEpisodeSettings.setShowEnabled(showKey, false)
        RandomEpisodeRuntime.onEpisodePoolChanged(showKey)

        val disabledState = stateHolder.value as TestHomeState
        assertTrue(disabledState.b.isEmpty())
        assertSame(future, disabledState.c.single())
        assertFalse((disabledState.c.single() as NextUpItem).info.hasAired)
    }

    @Test
    fun `disabling after a later randomized Home visit restores original future Upcoming item`() {
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        val future = nextUpItem("show-id", hasAired = false)
        val stateHolder = TestHomeStateHolder(TestHomeState(emptyList(), emptyList(), emptyList()))
        val owner = TestHomeOwner(stateHolder)
        RandomEpisodeRuntime.enterHome(owner)
        RandomEpisodeSettings.setShowEnabled(showKey, true)

        val firstRandom = requireNotNull(RandomEpisodeRuntime.rewriteHomeContinueItems(
            listOf<Any>(future)
        ).single())
        val firstContinue = mutableListOf(firstRandom)
        val firstUpcoming = mutableListOf<Any>()
        val firstState = TestHomeState(emptyList(), firstContinue, firstUpcoming)
        stateHolder.value = firstState
        RandomEpisodeRuntime.captureHomeContinueSplit(Pair(firstContinue, firstUpcoming))
        RandomEpisodeRuntime.captureHomeState(firstState, firstContinue, firstUpcoming)

        // A later Home visit clears the current selection. Nuvio clones its retained card,
        // so neither the outer card nor its identity mapping survives the re-entry.
        RandomEpisodeRuntime.leaveHomeForTests()
        RandomEpisodeRuntime.enterHome(owner)
        val clonedFirstRandom = cloneNextUpItem(
            firstRandom as NextUpItem, "getter-does-not-match-catalog-id"
        )
        val secondRandom = requireNotNull(RandomEpisodeRuntime.rewriteHomeContinueItems(
            listOf<Any>(clonedFirstRandom)
        ).single())
        val secondContinue = mutableListOf(secondRandom)
        val secondUpcoming = mutableListOf<Any>()
        val secondState = TestHomeState(emptyList(), secondContinue, secondUpcoming)
        stateHolder.value = secondState
        RandomEpisodeRuntime.captureHomeContinueSplit(Pair(secondContinue, secondUpcoming))
        RandomEpisodeRuntime.captureHomeState(secondState, secondContinue, secondUpcoming)

        RandomEpisodeRuntime.leaveHomeForTests()
        RandomEpisodeSettings.setShowEnabled(showKey, false)
        RandomEpisodeRuntime.onEpisodePoolChanged(showKey)

        val disabledState = stateHolder.value as TestHomeState
        assertTrue(disabledState.b.isEmpty())
        assertSame(future, disabledState.c.single())
        assertFalse((disabledState.c.single() as NextUpItem).info.hasAired)
    }

    @Test
    fun `disabling rebuilds an already stale Home card from native detail next episode`() {
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        val stale = nextUpItem("show-id", hasAired = true)
        val continueItems = mutableListOf<Any>(stale)
        val upcomingItems = mutableListOf<Any>()
        val state = TestHomeState(emptyList(), continueItems, upcomingItems)
        val stateHolder = TestHomeStateHolder(state)
        RandomEpisodeRuntime.enterHome(TestHomeOwner(stateHolder))
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeContinueSplit(
            Pair(RandomEpisodeRuntime.rewriteHomeContinueItems(continueItems), upcomingItems)
        )
        RandomEpisodeRuntime.captureHomeState(state, continueItems, upcomingItems)

        val futureDate = LocalDate.now().plusDays(4).toString()
        val future = Video(
            "future", 3, 10, futureDate, "Troy", "future-thumb"
        )
        val meta = Meta("show-id", "series", videos() + future)
        val nativeNext = NextToWatch(
            null, false, "future", 3, 10, "Next S3 E10"
        )
        RandomEpisodeRuntime.captureDetailState(
            meta, emptySet<Pair<Int, Int>>()
        )
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(meta, nativeNext) {}
        RandomEpisodeRuntime.prepareHeroNextToWatchForTests(
            meta, NextToWatch(null, false, "e2", 2, 1, "Play S2 E1")
        ) {}
        RandomEpisodeRuntime.prepareNativeHomeSourceForTests(showKey)
        RandomEpisodeSettings.setShowEnabled(showKey, false)
        RandomEpisodeRuntime.onEpisodePoolChanged(showKey)

        val disabledState = stateHolder.value as TestHomeState
        assertTrue(disabledState.b.isEmpty())
        val restored = disabledState.c.single() as NextUpItem
        assertEquals("future", restored.info.videoId)
        assertEquals(3, restored.info.season)
        assertEquals(10, restored.info.episode)
        assertEquals("Troy", restored.info.episodeTitle)
        assertFalse(restored.info.hasAired)
        assertEquals("Airs in 4 Days", restored.info.airDateLabel)
    }

    @Test
    fun `random Home rewrite leaves Resume cards untouched`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        val resume = ContinueItem(
            Progress("show-id", "series", "e1", 1, 1, position = 20, duration = 100)
        )
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        RandomEpisodeRuntime.enterHome()

        assertSame(resume, RandomEpisodeRuntime.rewriteHomeContinueItem(resume))
    }

    @Test
    fun `Unwatched Home pool filters watched episodes and hides an exhausted card`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_UNWATCHED)
        RandomEpisodeSettings.replaceWatchedEpisodes(showKey, setOf("1:1"))
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        RandomEpisodeRuntime.enterHome()

        val selected = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("show-id")
        ) as NextUpItem
        assertEquals("e2", selected.info.videoId)

        RandomEpisodeSettings.markEpisodeWatched(showKey, 1, 2)
        RandomEpisodeRuntime.leaveHomeForTests()
        RandomEpisodeRuntime.enterHome()
        assertEquals(null, RandomEpisodeRuntime.rewriteHomeContinueItem(nextUpItem("show-id")))
    }

    @Test
    fun `All Home pool retains watched candidates`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_ALL)
        RandomEpisodeSettings.replaceWatchedEpisodes(showKey, setOf("1:1", "1:2"))
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2")
        )
        RandomEpisodeRuntime.enterHome()

        val selected = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("show-id")
        ) as NextUpItem
        assertTrue(selected.info.videoId == "e1" || selected.info.videoId == "e2")
    }

    @Test
    fun `Home random selections are independent per show`() {
        val secondShowKey = "series:second-show"
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeSettings.setShowEnabled(secondShowKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("first-1", "first-2")
        )
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("second-show"), homeVideos("second-1", "second-2")
        )
        RandomEpisodeRuntime.enterHome()

        val first = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("show-id")
        ) as NextUpItem
        val second = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("second-show")
        ) as NextUpItem

        assertTrue(first.info.videoId.startsWith("first-"))
        assertTrue(second.info.videoId.startsWith("second-"))
        assertEquals("show-id", first.info.contentId)
        assertEquals("second-show", second.info.contentId)
    }

    @Test
    fun `Home catalogue excludes specials future and unavailable episodes`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"),
            listOf(
                CwVideoSummary("special", "Special", "2020-01-01", null, 0, 1, null, true),
                CwVideoSummary("future", "Future", "2999-01-01", null, 1, 1, null, true),
                CwVideoSummary("blocked", "Blocked", "2020-01-01", null, 1, 2, null, false),
                CwVideoSummary("eligible", "Eligible", "2020-01-01", "thumb", 1, 3, "Overview", true)
            )
        )
        RandomEpisodeRuntime.enterHome()

        val selected = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("show-id")
        ) as NextUpItem

        assertEquals("eligible", selected.info.videoId)
        assertEquals("Eligible", selected.info.episodeTitle)
        assertEquals("thumb", selected.info.thumbnail)
        assertFalse(selected.info.isReleaseAlert)
        assertFalse(selected.info.isNewSeasonRelease)
    }

    @Test
    fun `Home card click routes the exact episode displayed on the card`() {
        RandomEpisodeSettings.setShowEnabled(showKey, true)
        RandomEpisodeRuntime.captureHomeCatalog(
            CwMetaSummary("show-id"), homeVideos("e1", "e2", "e3")
        )
        RandomEpisodeRuntime.enterHome()
        val displayed = RandomEpisodeRuntime.rewriteHomeContinueItem(
            nextUpItem("show-id")
        ) as NextUpItem
        var routed: String? = null
        val wrapped = RandomEpisodeRuntime.wrapHomeContinuePlay(displayed) {
            routed = RandomEpisodeRuntime.rewriteStreamRoute(
                "stream/native/series/Show?contentId=show-id&season=9&episode=9" +
                    "&episodeName=Native&runtime=45"
            )
        }

        wrapped!!.invoke()

        assertTrue(routed!!.startsWith("stream/${displayed.info.videoId}/series/Show?"))
        assertTrue(routed!!.contains("season=${displayed.info.season}"))
        assertTrue(routed!!.contains("episode=${displayed.info.episode}"))
        assertTrue(routed!!.contains("episodeName=${displayed.info.episodeTitle}"))
        assertTrue(routed!!.contains("runtime=45"))
    }

    private fun videos() = listOf(
        Video("e1", 1, 1, "2020-01-01"),
        Video("e2", 1, 2, "2020-01-01"),
        Video("e3", 1, 3, "2020-01-01")
    )

    private fun route(videoId: String, season: Int, episode: Int) =
        "stream/$videoId/series/Show?contentId=show-id&season=$season&episode=$episode"

    private fun homeVideos(vararg ids: String) = ids.mapIndexed { index, id ->
        CwVideoSummary(
            id, id, "2020-01-01", "$id-thumb", 1, index + 1, "$id-overview", true
        )
    }

    private fun cloneNextUpItem(item: NextUpItem, videoId: String): NextUpItem {
        val info = item.info
        return NextUpItem(
            NextUpInfo(
                info.contentId, info.contentType, info.name, info.poster, info.backdrop,
                info.logo, videoId, info.season, info.episode, info.episodeTitle,
                info.episodeDescription, info.thumbnail, info.released, info.hasAired,
                info.airDateLabel, info.lastWatched, info.imdbRating, info.genres,
                info.releaseInfo, info.sortTimestamp, info.releaseTimestamp,
                info.isReleaseAlert, info.isNewSeasonRelease, info.seedSeason,
                info.seedEpisode, info.contentLanguage
            )
        )
    }

    private fun nextUpItem(contentId: String, hasAired: Boolean = true) = NextUpItem(
        NextUpInfo(
            contentId, "series", "Show", "poster", "backdrop", "logo",
            "native", 9, 9, "Native", "Native overview", "native-thumb",
            "2020-01-01", hasAired, null, 50L, null, emptyList(), null,
            100L, 100L, false, false, 9, 8, "en"
        )
    )

    data class Meta(val id: String, val apiType: String, val videos: List<Video>)
    data class Video(
        val id: String,
        val season: Int?,
        val episode: Int?,
        val released: String?,
        val title: String = id,
        val thumbnail: String? = null,
        val runtime: Int? = 30
    )
    data class NextToWatch(
        val watchProgress: Any?,
        val isResume: Boolean,
        val nextVideoId: String?,
        val nextSeason: Int?,
        val nextEpisode: Int?,
        val displayText: String
    )
    data class Progress(
        val contentId: String,
        val contentType: String,
        val videoId: String? = null,
        val season: Int? = null,
        val episode: Int? = null,
        val position: Long = 0,
        val duration: Long = 0
    )
    data class NextUp(val contentId: String, val contentType: String)
    data class RemoteProgress(
        val contentId: String,
        val contentType: String,
        val videoId: String,
        val season: Int,
        val episode: Int,
        val progressPercentage: Float
    )
    data class ContinueItem(val progress: Any)

    class CwMetaSummary(@JvmField val rawId: String)

    class CwVideoSummary(
        @JvmField val rawId: String,
        @JvmField val rawTitle: String?,
        @JvmField val rawReleased: String?,
        @JvmField val rawThumbnail: String?,
        @JvmField val rawSeason: Int?,
        @JvmField val rawEpisode: Int?,
        @JvmField val rawOverview: String?,
        @JvmField val rawAvailable: Boolean?
    )

    class NextUpItem(val info: NextUpInfo) {
        override fun toString() = "NextUp(info=$info)"
    }

    class TestHomeOwner(@JvmField val state: TestHomeStateHolder)

    class TestHomeStateHolder(@JvmField var value: Any) {
        fun getValue(): Any = value
        fun setValue(replacement: Any) {
            value = replacement
        }
    }

    class TestHomeState(
        @JvmField var a: List<Any>,
        @JvmField var b: List<Any>,
        @JvmField var c: List<Any>
    )

    class NextUpInfo(
        val contentId: String,
        val contentType: String,
        val name: String,
        val poster: String?,
        val backdrop: String?,
        val logo: String?,
        val videoId: String,
        val season: Int,
        val episode: Int,
        val episodeTitle: String?,
        val episodeDescription: String?,
        val thumbnail: String?,
        val released: String?,
        val hasAired: Boolean,
        val airDateLabel: String?,
        val lastWatched: Long,
        val imdbRating: Float?,
        val genres: List<String>,
        val releaseInfo: String?,
        val sortTimestamp: Long,
        val releaseTimestamp: Long?,
        val isReleaseAlert: Boolean,
        val isNewSeasonRelease: Boolean,
        val seedSeason: Int?,
        val seedEpisode: Int?,
        val contentLanguage: String?
    ) {
        override fun toString() =
            "NextUpInfo(contentId=$contentId, contentType=$contentType, name=$name)"
    }
}
