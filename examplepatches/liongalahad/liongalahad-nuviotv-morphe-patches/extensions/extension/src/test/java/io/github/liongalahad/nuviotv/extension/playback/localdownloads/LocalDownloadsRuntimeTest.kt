package io.github.liongalahad.nuviotv.extension.playback.localdownloads

import android.app.Application
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.ListView
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import java.net.HttpURLConnection
import java.net.URL
import kotlin.coroutines.Continuation
import kotlin.jvm.functions.Function0
import kotlin.jvm.functions.Function1

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class LocalDownloadsRuntimeTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().clear()
            .putBoolean(LocalDownloadsSettings.ENABLED_KEY, false)
            .putBoolean(LocalDownloadsSettings.AUTOPLAY_KEY, false)
            .commit()
        resetActiveDownloadState()
        setStaticField("pendingAction", null)
        setStaticField("pendingRoute", null)
        (getStaticField("cancelRequested") as java.util.concurrent.atomic.AtomicBoolean).set(false)
    }

    @Test
    fun `download settings default on and use the requested slider steps`() {
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit()
            .remove(LocalDownloadsSettings.ENABLED_KEY)
            .remove(LocalDownloadsSettings.AUTOPLAY_KEY)
            .commit()
        assertTrue(LocalDownloadsSettings.isEnabled())
        assertTrue(LocalDownloadsSettings.isAutoplayEnabled())
        assertEquals(80, LocalDownloadsSettings.freePercent())

        LocalDownloadsSettings.setEnabled(false)
        LocalDownloadsSettings.setAutoplayEnabled(false)
        LocalDownloadsSettings.setFreePercent(35)

        assertFalse(LocalDownloadsSettings.isEnabled())
        assertFalse(LocalDownloadsSettings.isAutoplayEnabled())
        assertEquals(35, LocalDownloadsSettings.freePercent())
        assertEquals(7, LocalDownloadsSettings.sliderIndex())
        assertEquals(1, LocalDownloadsSettings.percentageAtSliderIndex(0))
        assertEquals(100, LocalDownloadsSettings.percentageAtSliderIndex(20))
    }

    @Test
    fun `storage slider bridge accepts the 0_8_7 native shape`() {
        assertTrue(
            LocalDownloadsSettingsContent.matchesNativeSliderParametersForTesting(
                arrayOf(
                    Any::class.java,
                    String::class.java,
                    Int::class.javaPrimitiveType!!,
                    String::class.java,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!,
                    Function1::class.java,
                    String::class.java,
                    Function0::class.java,
                    Boolean::class.javaPrimitiveType!!,
                    Any::class.java,
                    Any::class.java,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!
                )
            )
        )
    }

    @Test(expected = IllegalArgumentException::class)
    fun `unsupported percentage is rejected`() {
        LocalDownloadsSettings.setFreePercent(0)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `percentage between slider steps is rejected`() {
        LocalDownloadsSettings.setFreePercent(37)
    }

    @Test
    fun `legacy arbitrary percentage is migrated to the nearest slider step`() {
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putInt(LocalDownloadsSettings.FREE_PERCENT_KEY, 37).commit()

        assertEquals(35, LocalDownloadsSettings.freePercent())
    }

    @Test
    fun `storage allowance uses the selected percentage without overflow`() {
        assertEquals(250L, LocalDownloadsService.allowedBytes(1000L, 25))
        assertFalse(LocalDownloadsService.isTooLarge(250L, 1000L, 25))
        assertTrue(LocalDownloadsService.isTooLarge(251L, 1000L, 25))
        assertTrue(LocalDownloadsService.allowedBytes(Long.MAX_VALUE, 90) > 0L)
    }

    @Test
    fun `source metadata after a video extension is removed from the stored filename`() {
        assertEquals(
            "Bluey.S01E03.Keepy.Uppy.mkv",
            LocalDownloadsService.safeVideoFilename(
                "Bluey.S01E03.Keepy.Uppy.mkv1080pMKVWEB-DLx2641080pmkvweb-dlx264",
                "https://example.test/download"
            )
        )
        assertEquals(
            "Bluey.S01E03.Keepy.Uppy.mp4",
            LocalDownloadsService.safeVideoFilename(
                "Bluey.S01E03.Keepy.Uppy.mp4?token=ignored",
                "https://example.test/download"
            )
        )
    }

    @Test
    fun `stream route keeps exact series identity and manual flag`() {
        val route = "stream/tt100%3A1%3A2/series/Episode%20Two" +
            "?contentId=tt100&contentName=Example%20Show&season=1&episode=2" +
            "&episodeName=Second&manualSelection=true&poster=poster"

        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(route)

        assertNotNull(identity)
        assertEquals("tt100:1:2", identity.videoId)
        assertEquals("tt100", identity.contentId)
        assertEquals("Example Show", identity.contentName)
        assertEquals(1, identity.season)
        assertEquals(2, identity.episode)
        assertTrue(identity.manualSelection)
    }

    @Test
    fun `only direct progressive HTTP selections become download requests`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Test?contentId=tt1&manualSelection=true"
        )
        val direct = FakePlaybackInfo(url = "https://example.test/tiny.mp4", filename = "tiny.mp4")
        val hls = FakePlaybackInfo(url = "https://example.test/live.m3u8", filename = "live.m3u8")
        val torrent = FakePlaybackInfo(url = null, isTorrent = true)

        assertNotNull(LocalDownloadsRuntime.DownloadRequest.from(direct, identity!!))
        assertNull(LocalDownloadsRuntime.DownloadRequest.from(hls, identity))
        assertNull(LocalDownloadsRuntime.DownloadRequest.from(torrent, identity))
    }

    @Test
    fun `compact dex fields are read independently of reflection order`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Test?contentId=tt1&manualSelection=true"
        )!!

        val request = LocalDownloadsRuntime.DownloadRequest.from(CompactPlaybackInfo(), identity)

        assertNotNull(request)
        assertEquals("https://example.test/episode.mkv", request.url)
        assertEquals("episode.mkv", request.filename)
        assertTrue(request.declaredSize!! in 279_864_934L..279_864_936L)
        assertEquals("https://example.test/", request.headers["Referer"])
    }

    @Test
    fun `downloaded entry player route preserves catalogue identity`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=1&episodeName=Pilot&contentLanguage=en"
        )
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity!!,
            "file:///storage/emulated/0/Movies/Nuvio/Show/Pilot.mp4",
            "Pilot.mp4",
            1024,
            listOf("file:///storage/emulated/0/Movies/Nuvio/Show/Pilot.en.srt")
        )

        val route = entry.playerRoute()

        assertTrue(route.startsWith("player/file%3A%2F%2F%2F"))
        assertTrue(route.contains("&contentId=tt1&contentType=series&contentName=Show"))
        assertTrue(route.contains("&videoId=tt1%3A1%3A1&season=1&episode=1"))
        assertTrue(route.contains("&filename=Pilot.mp4&videoHash=&videoSize=1024"))
    }

    @Test
    @Config(sdk = [28, 30, 35])
    fun `downloaded player route UTF-8 encoding works across supported Android TV APIs`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt2/movie/Am%C3%A9lie?contentId=tt2&contentName=Am%C3%A9lie%20%26%20Co"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity,
            "file:///storage/emulated/0/Movies/Nuvio/Amélie & Co/Amélie 50%.mp4",
            "Amélie 50%.mp4",
            2_048,
            emptyList()
        )

        val route = entry.playerRoute()

        assertTrue(route.startsWith("player/file%3A%2F%2F%2F"))
        assertTrue(route.contains("contentName=Am%C3%A9lie%20%26%20Co"))
        assertTrue(route.contains("filename=Am%C3%A9lie%2050%25.mp4"))
    }

    @Test
    fun `series labels include zero-padded season and episode`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt111%3A2%3A1/series/Episode?contentId=tt111" +
                "&contentName=House%20of%20the%20Dragon&season=2&episode=1" +
                "&episodeName=A%20Son%20for%20a%20Son"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest.from(
            FakePlaybackInfo(url = "https://example.test/episode.mp4"), identity
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, "file:///tmp/episode.mp4", "episode.mp4", 1024, emptyList()
        )

        assertEquals("House of the Dragon · S02E01", request.progressTitle())
        assertEquals("House of the Dragon · S02E01", entry.displayLabel())
        assertEquals("Movie", LocalDownloadsRuntime.mediaLabel("Movie", null, null))
    }

    @Test
    fun `indexed download playback navigates to its local player route`() {
        val media = temporaryFolder.newFile("play-me.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=2&episodeName=Second"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        val controller = FakeNavController()
        setStaticField("navController", controller)
        FakeNavController.lastRoute = null

        try {
            assertTrue(LocalDownloadsRuntime.playDownloadedEntry(entry))
            assertTrue(FakeNavController.lastRoute!!.startsWith("player/file%3A"))
            assertTrue(FakeNavController.lastRoute!!.contains("&season=1&episode=2"))
        } finally {
            setStaticField("navController", null)
            FakeNavController.lastRoute = null
        }
    }

    @Test
    fun `episode coordinates match when an addon changes its video id`() {
        val downloaded = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/addon-old-id/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=1&episodeName=Pilot"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            downloaded, "file:///tmp/Pilot.mkv", "Pilot.mkv", 1024, emptyList()
        )
        val sameEpisode = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/addon-new-id/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=1&episodeName=Pilot"
        )!!
        val otherEpisode = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/addon-new-id/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=2&episodeName=Second"
        )!!

        assertTrue(entry.matches(sameEpisode))
        assertFalse(entry.matches(otherEpisode))
    }

    @Test
    fun `movie detail lookup uses stable content id when its video id differs`() {
        val media = temporaryFolder.newFile("movie-detail.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/source-specific-id/movie/Movie?contentId=tt2543164&contentName=Movie"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        val values = org.json.JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()
        LocalDownloadsSettings.setEnabled(true)
        LocalDownloadsRuntime.observeHero(
            FakeMovieMeta("tt2543164", "Movie"), FakeMovieVideo("catalogue-video-id")
        )

        assertTrue(LocalDownloadsRuntime.isTargetDownloaded(null))
    }

    @Test
    fun `older movie download without content id matches its detail title`() {
        val media = temporaryFolder.newFile("legacy-movie.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/source-specific-id/movie/Arrival?contentName=Arrival"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        val values = org.json.JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()
        LocalDownloadsSettings.setEnabled(true)
        LocalDownloadsRuntime.observeHero(
            FakeMovieMeta("tt-missing-from-index", "Arrival"), FakeMovieVideo("catalogue-video-id")
        )

        assertTrue(LocalDownloadsRuntime.isTargetDownloaded(null))
    }

    @Test
    fun `series downloads use title and season folder while movies keep title folder`() {
        val episodeIdentity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A3%3A2/series/Episode?contentId=tt1&contentName=Silo&season=3&episode=2"
        )!!
        val movieIdentity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt2/movie/Movie?contentId=tt2&contentName=Arrival"
        )!!
        val episode = LocalDownloadsRuntime.DownloadRequest(
            episodeIdentity, "https://example.test/e.mp4", "Episode", "e.mp4",
            emptyMap(), 10L, 10L, ""
        )
        val movie = LocalDownloadsRuntime.DownloadRequest(
            movieIdentity, "https://example.test/m.mp4", "Movie", "m.mp4",
            emptyMap(), 10L, 10L, ""
        )

        assertEquals("Silo - Season 3", LocalDownloadsService.downloadFolderName(episode))
        assertEquals("Arrival", LocalDownloadsService.downloadFolderName(movie))
    }

    @Test
    fun `subtitle language filter accepts only primary and secondary aliases`() {
        val preferred = linkedSetOf("en", "it")

        assertTrue(LocalDownloadsRuntime.isPreferredSubtitleLanguage("English", preferred))
        assertTrue(LocalDownloadsRuntime.isPreferredSubtitleLanguage("ITA", preferred))
        assertTrue(LocalDownloadsRuntime.isPreferredSubtitleLanguage("en-US", preferred))
        assertFalse(LocalDownloadsRuntime.isPreferredSubtitleLanguage("Portuguese", preferred))
        assertFalse(LocalDownloadsRuntime.isPreferredSubtitleLanguage("und", preferred))
        assertEquals("pt-br", LocalDownloadsRuntime.normalizeLanguage("Portuguese-Brazil"))
    }

    @Test
    fun `preferred subtitle settings are found without architecture-specific class names`() {
        val viewModel = FakeStreamViewModel(FakePlaybackSettings(FakeSubtitleStyle("Italian", "pt-BR")))

        assertEquals(
            linkedSetOf("it", "pt-br"),
            LocalDownloadsRuntime.preferredSubtitleLanguages(viewModel)
        )
    }

    @Test
    fun `missing secondary subtitle setting keeps only the primary language`() {
        val viewModel = FakeStreamViewModel(FakePlaybackSettings(FakeSubtitleStyle("English", null)))

        assertEquals(
            linkedSetOf("en"),
            LocalDownloadsRuntime.preferredSubtitleLanguages(viewModel)
        )
    }

    @Test
    fun `subtitle worker arguments support split and universal APK signatures`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=2"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest(
            identity, "https://example.test/episode.mp4", "Episode", "episode.mp4",
            emptyMap(), 1234L, 4321L, "abc123"
        )
        val repository = FakeSubtitleRepository()

        val split = LocalDownloadsRuntime.subtitleWorkerArguments(
            FakeSplitSubtitleWorker::class.java.declaredConstructors.single(),
            repository, request, 999L
        )
        val universal = LocalDownloadsRuntime.subtitleWorkerArguments(
            FakeUniversalSubtitleWorker::class.java.declaredConstructors.single(),
            repository, request, 999L
        )

        assertNotNull(split)
        assertEquals(10, split!!.size)
        assertEquals("abc123", split[6])
        assertEquals(4321L, split[7])
        assertEquals("episode.mp4", split[8])
        assertNotNull(universal)
        assertEquals(9, universal!!.size)
        assertEquals("abc123", universal[5])
        assertEquals(4321L, universal[6])
        assertEquals("episode.mp4", universal[7])
    }

    @Test
    fun `patch resolved subtitle worker locates repository in stream view model`() {
        val repository = FakeSubtitleRepository()
        val viewModel = FakeSubtitleWorkerViewModel(repository)

        assertTrue(
            repository === LocalDownloadsRuntime.findSubtitleRepository(
                viewModel, FakeSplitSubtitleWorker::class.java
            )
        )
    }

    @Test
    fun `failed transfer keeps download retry armed for the source picker`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Episode?contentId=tt1&contentName=Show&season=1&episode=1"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest(
            identity, "https://example.test/dead.mp4", "Episode", "dead.mp4",
            emptyMap(), 10L, 10L, ""
        )

        try {
            setStaticField("activeRequest", request)
            setStaticField("pendingAction", null)
            setStaticField("pendingRoute", null)
            LocalDownloadsRuntime.failDownload("Episode", "Download failed: reset")

            assertEquals(identity, getStaticField("pendingRoute"))
            assertEquals("DOWNLOAD", getStaticField("pendingAction").toString())
        } finally {
            setStaticField("activeRequest", null)
            setStaticField("pendingAction", null)
            setStaticField("pendingRoute", null)
        }
    }

    @Test
    fun `successful source selection keeps download mode armed for the picker session`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Episode?contentId=tt1&contentName=Show&season=1&episode=2"
        )!!
        val direct = FakePlaybackInfo(
            url = "https://example.test/tiny.mp4",
            filename = "tiny.mp4",
            videoSize = 1024
        )

        try {
            setStaticField("pendingAction", enumValue("PendingAction", "DOWNLOAD"))
            setStaticField("pendingRoute", identity)
            assertTrue(LocalDownloadsRuntime.interceptResolvedSelection(direct))

            assertEquals("DOWNLOAD", getStaticField("pendingAction").toString())
            assertEquals(identity, getStaticField("pendingRoute"))
        } finally {
            setStaticField("activeRequest", null)
            setStaticField("pendingAction", null)
            setStaticField("pendingRoute", null)
            setStaticField("downloadState", LocalDownloadsRuntime.DownloadState.idle())
        }
    }

    @Test
    fun `source picker destination detection is limited to stream routes`() {
        assertTrue(LocalDownloadsRuntime.isSourcePickerDestination(
            "NavDestination(0x1) route=stream/tt1%3A1%3A2/series/Episode"
        ))
        assertFalse(LocalDownloadsRuntime.isSourcePickerDestination(
            "NavDestination(0x2) route=details/series/tt1"
        ))
        assertFalse(LocalDownloadsRuntime.isSourcePickerDestination(null))
    }

    @Test
    fun `deleting indexed download removes media sidecars and empty folder`() {
        val folder = temporaryFolder.newFolder("Silo - Season 3")
        val media = folder.resolve("episode.mkv").apply { writeText("video") }
        val english = folder.resolve("episode.en.srt").apply { writeText("sub") }
        val italian = folder.resolve("episode.it.srt").apply { writeText("sub") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A3%3A2/series/Episode?contentId=tt1&contentName=Silo&season=3&episode=2"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), folder.toURI().toString(), media.name,
            media.length(), listOf(english.toURI().toString(), italian.toURI().toString())
        )

        val result = LocalDownloadsRuntime.deleteEntryFiles(application, entry)

        assertTrue(result.complete)
        assertFalse(media.exists())
        assertFalse(english.exists())
        assertFalse(italian.exists())
        assertFalse(folder.exists())
    }

    @Test
    fun `download folder cleanup preserves unrelated files`() {
        val folder = temporaryFolder.newFolder("Movie")
        val media = folder.resolve("movie.mp4").apply { writeText("video") }
        val unrelated = folder.resolve("notes.txt").apply { writeText("keep") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt2/movie/Movie?contentId=tt2&contentName=Movie"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), folder.toURI().toString(), media.name,
            media.length(), emptyList()
        )

        assertTrue(LocalDownloadsRuntime.deleteEntryFiles(application, entry).complete)
        assertTrue(folder.exists())
        assertTrue(unrelated.exists())
    }

    @Test
    fun `delete all removes only indexed downloads and keeps manually copied files`() {
        val folder = temporaryFolder.newFolder("Downloaded season")
        val first = folder.resolve("episode-1.mp4").apply { writeText("video") }
        val firstSub = folder.resolve("episode-1.en.srt").apply { writeText("sub") }
        val second = folder.resolve("episode-2.mp4").apply { writeText("video") }
        val manual = folder.resolve("manual-copy.mkv").apply { writeText("keep") }
        val firstId = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/One?contentId=tt1&contentName=Show&season=1&episode=1"
        )!!
        val secondId = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Two?contentId=tt1&contentName=Show&season=1&episode=2"
        )!!
        val entries = listOf(
            LocalDownloadsRuntime.DownloadedEntry(firstId, first.toURI().toString(),
                folder.toURI().toString(), first.name, first.length(), listOf(firstSub.toURI().toString())),
            LocalDownloadsRuntime.DownloadedEntry(secondId, second.toURI().toString(),
                folder.toURI().toString(), second.name, second.length(), emptyList())
        )
        val json = org.json.JSONArray()
        entries.forEach { json.put(it.toJson()) }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", json.toString()).commit()

        val result = LocalDownloadsRuntime.deleteAllIndexedDownloads(application)

        assertEquals(2, result.deleted)
        assertEquals(0, result.failures)
        assertFalse(first.exists())
        assertFalse(firstSub.exists())
        assertFalse(second.exists())
        assertTrue(manual.exists())
        assertTrue(folder.exists())
        assertTrue(LocalDownloadsRuntime.entries().isEmpty())
    }

    @Test
    fun `selected storage caption uses one decimal GB and percentage`() {
        val gib = 1_073_741_824L
        val caption = LocalDownloadsStorageStats.Snapshot(5 * gib, 20 * gib).caption()

        assertEquals("5.0 GB used / 20.0 GB total (25% full)", caption)
    }

    @Test
    fun `unavailable selected storage does not fall back to internal storage`() {
        val snapshot = LocalDownloadsStorageStats.Snapshot.unavailable()

        assertFalse(snapshot.isAvailable())
        assertEquals(0L, snapshot.availableBytes)
        assertEquals("Selected storage usage unavailable", snapshot.caption())
    }

    @Test
    fun `downloads manager creates and resumes with an empty index`() {
        val controller = Robolectric.buildActivity(LocalDownloadsManagerActivity::class.java)

        controller.create().resume()

        assertNotNull(controller.get())
        controller.pause().destroy()
    }

    @Test
    fun `downloads manager exposes cursor spacing and click playback`() {
        val media = temporaryFolder.newFile("listed.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=1&episodeName=Pilot"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        val values = org.json.JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()
        val controller = Robolectric.buildActivity(LocalDownloadsManagerActivity::class.java)
            .create().resume()
        val list = LocalDownloadsManagerActivity::class.java.getDeclaredField("list").run {
            isAccessible = true
            get(controller.get()) as ListView
        }

        assertEquals(1, list.adapter.count)
        assertTrue(list.dividerHeight > 0)
        assertNotNull(list.divider)
        assertNotNull(list.selector)
        assertNotNull(list.onItemClickListener)

        controller.pause().destroy()
    }

    @Test
    fun `downloads list hides files deleted outside the downloads patch`() {
        val media = temporaryFolder.newFile("externally-removed.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=2&episodeName=Second"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        val values = org.json.JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()

        assertEquals(1, LocalDownloadsRuntime.availableEntries().size)
        assertTrue(media.delete())
        assertTrue(LocalDownloadsRuntime.availableEntries().isEmpty())
        // Keep the raw record so a temporarily disconnected removable drive can recover.
        assertEquals(1, LocalDownloadsRuntime.entries().size)
        media.writeText("video")
        assertEquals(1, LocalDownloadsRuntime.availableEntries().size)
    }

    @Test
    fun `downloads manager omits a stale indexed file after resume`() {
        val missing = temporaryFolder.root.resolve("missing.mp4")
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt2/movie/Missing?contentId=tt2&contentName=Missing"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, missing.toURI().toString(), missing.name, 100L, emptyList()
        )
        val values = org.json.JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()
        val controller = Robolectric.buildActivity(LocalDownloadsManagerActivity::class.java)
            .create().resume()
        val list = LocalDownloadsManagerActivity::class.java.getDeclaredField("list").run {
            isAccessible = true
            get(controller.get()) as ListView
        }

        assertEquals(0, list.adapter.count)
        controller.pause().destroy()
    }

    @Test
    fun `download action menu contains play and delete`() {
        val media = temporaryFolder.newFile("action.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A1/series/Episode?contentId=tt1&contentName=Show" +
                "&season=1&episode=1&episodeName=Pilot"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        setStaticField("pendingDelete", entry)
        val controller = Robolectric.buildActivity(LocalDownloadsEntryActionActivity::class.java)
            .create().resume()

        try {
            val labels = buttonLabels(controller.get().window.decorView)
            assertTrue(labels.contains("Play local file"))
            assertTrue(labels.contains("Delete local file"))
        } finally {
            controller.pause().destroy()
            setStaticField("pendingDelete", null)
        }
    }

    @Test
    fun `movie detail action shows download for an undownloaded movie and Back clears it`() {
        LocalDownloadsRuntime.prepareMovieActionForTesting(
            null, FakeMovieMeta("tt1", "Undownloaded Movie")
        )
        val controller = Robolectric.buildActivity(LocalDownloadsMovieActionActivity::class.java)
            .create().resume()

        assertEquals(listOf("Download to storage"), buttonLabels(controller.get().window.decorView))
        controller.get().onBackPressed()
        assertFalse(LocalDownloadsRuntime.hasPendingMovieAction())
        controller.pause().destroy()
    }

    @Test
    fun `hidden active movie download action restores its progress popup`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/source-id/movie/Movie?contentId=tt1&contentName=Movie"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest.from(
            FakePlaybackInfo(url = "https://example.test/movie.mp4", filename = "movie.mp4"),
            identity
        )!!
        setStaticField("activeRequest", request)
        setStaticField("downloadState", LocalDownloadsRuntime.DownloadState.preparing("Movie"))
        setStaticField("dialogHidden", true)
        setStaticField("progressDialogVisible", false)
        LocalDownloadsRuntime.prepareMovieActionForTesting(
            null, FakeMovieMeta("tt1", "Movie")
        )
        val controller = Robolectric.buildActivity(LocalDownloadsMovieActionActivity::class.java)
            .create().resume()

        try {
            assertEquals(
                listOf(LocalDownloadsRuntime.DOWNLOAD_IN_PROGRESS_LABEL),
                buttonLabels(controller.get().window.decorView)
            )
            findButton(
                controller.get().window.decorView,
                LocalDownloadsRuntime.DOWNLOAD_IN_PROGRESS_LABEL
            )!!.performClick()

            assertFalse(getStaticField("dialogHidden") as Boolean)
            assertTrue(getStaticField("progressDialogVisible") as Boolean)
            assertFalse(LocalDownloadsRuntime.hasPendingMovieAction())
            assertEquals(
                LocalDownloadsProgressActivity::class.java.name,
                shadowOf(application).nextStartedActivity.component!!.className
            )
        } finally {
            controller.pause().destroy()
            resetActiveDownloadState()
        }
    }

    @Test
    fun `only the exact active episode replaces download with progress action`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/tt1%3A1%3A2/series/Second?contentId=tt1&contentName=Show" +
                "&season=1&episode=2&episodeName=Second"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest.from(
            FakePlaybackInfo(url = "https://example.test/second.mp4", filename = "second.mp4"),
            identity
        )!!
        setStaticField("activeRequest", request)
        setStaticField(
            "downloadState",
            LocalDownloadsRuntime.DownloadState.downloading("Show · S01E02", 50, 100)
        )

        try {
            val sameEpisode = FakeEpisodeTarget("tt1:1:2", "tt1", 1, 2, "Second")
            val nextEpisode = FakeEpisodeTarget("tt1:1:3", "tt1", 1, 3, "Second")

            assertTrue(LocalDownloadsRuntime.isTargetDownloadRunning(sameEpisode))
            assertEquals(
                LocalDownloadsRuntime.DOWNLOAD_IN_PROGRESS_LABEL,
                LocalDownloadsRuntime.downloadActionLabel(sameEpisode)
            )
            assertFalse(LocalDownloadsRuntime.isTargetDownloadRunning(nextEpisode))
            assertEquals(
                "Download to storage",
                LocalDownloadsRuntime.downloadActionLabel(nextEpisode)
            )
        } finally {
            resetActiveDownloadState()
        }
    }

    @Test
    fun `native episode overlay receives the download action`() {
        LocalDownloadsSettings.setEnabled(true)
        val action: () -> kotlin.Unit = {}
        val actions = mutableListOf<Any>(FakeEpisodeAction("Play", true, action))
        LocalDownloadsRuntime.prepareOptions(
            FakeEpisodeTarget("tt1:1:2", "tt1", 1, 2, "Second"),
            action,
            true
        )

        LocalDownloadsRuntime.appendEpisodeOptions(actions)

        assertEquals(listOf("Play", "Download to storage"), actions.map {
            (it as FakeEpisodeAction).label
        })
    }

    @Test
    fun `movie detail action shows play and delete for a downloaded movie`() {
        val media = temporaryFolder.newFile("movie-action.mp4").apply { writeText("video") }
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/source-id/movie/Movie?contentId=tt1&contentName=Movie"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, media.toURI().toString(), media.name, media.length(), emptyList()
        )
        LocalDownloadsRuntime.prepareMovieActionForTesting(entry, FakeMovieMeta("tt1", "Movie"))
        val controller = Robolectric.buildActivity(LocalDownloadsMovieActionActivity::class.java)
            .create().resume()

        try {
            val labels = buttonLabels(controller.get().window.decorView)
            assertTrue(labels.contains("Play local file"))
            assertTrue(labels.contains("Delete local file"))
        } finally {
            controller.get().onBackPressed()
            controller.pause().destroy()
        }
    }

    @Test
    fun `duplicate long press callbacks open only one download action`() {
        LocalDownloadsRuntime.finishEntryAction()
        try {
            assertTrue(LocalDownloadsRuntime.beginEntryActionForTesting())
            assertFalse(LocalDownloadsRuntime.beginEntryActionForTesting())
        } finally {
            LocalDownloadsRuntime.finishEntryAction()
        }
        assertTrue(LocalDownloadsRuntime.beginEntryActionForTesting())
        LocalDownloadsRuntime.finishEntryAction()
    }

    @Test
    fun `cancel disconnects a source check that is still blocked`() {
        val controller = Robolectric.buildService(LocalDownloadsService::class.java).create()
        val connection = TrackingConnection()
        val field = LocalDownloadsService::class.java.getDeclaredField("activeConnection").apply {
            isAccessible = true
        }
        field.set(controller.get(), connection)
        val cancelled = getStaticField("cancelRequested") as java.util.concurrent.atomic.AtomicBoolean

        try {
            cancelled.set(false)
            LocalDownloadsRuntime.cancelDownload()

            assertTrue(connection.disconnected)
            assertTrue(LocalDownloadsRuntime.isCancelRequested())
        } finally {
            cancelled.set(false)
            controller.destroy()
        }
    }

    @Suppress("unused")
    private class FakeStreamViewModel(val playbackSettings: FakePlaybackSettings)

    @Suppress("unused")
    private class FakePlaybackSettings(val subtitleStyle: FakeSubtitleStyle)

    private class FakeSubtitleStyle(
        private val primary: String,
        private val secondary: String?
    ) {
        override fun toString() =
            "SubtitleStyleSettings(preferredLanguage=$primary, " +
                "secondaryPreferredLanguage=$secondary, useForcedSubtitles=false)"
    }

    private class FakeSubtitleRepository

    @Suppress("unused")
    private class FakeSubtitleWorkerViewModel(val subtitleRepository: FakeSubtitleRepository)

    @Suppress("unused")
    private data class FakeMovieMeta(
        private val id: String,
        private val name: String
    ) {
        fun getId() = id
        fun getName() = name
        fun getApiType() = "movie"
    }

    @Suppress("unused")
    private data class FakeMovieVideo(private val id: String) {
        fun getId() = id
    }

    @Suppress("unused")
    private data class FakeEpisodeTarget(
        private val id: String,
        private val contentId: String,
        private val season: Int,
        private val episode: Int,
        private val title: String
    ) {
        fun getId() = id
        fun getVideoId() = id
        fun getContentId() = contentId
        fun getSeason() = season
        fun getEpisode() = episode
        fun getTitle() = title
    }

    private data class FakeEpisodeAction(
        val label: String,
        val enabled: Boolean,
        val onClick: () -> kotlin.Unit
    )

    private class TrackingConnection : HttpURLConnection(URL("https://example.test/video.mp4")) {
        var disconnected = false
        override fun disconnect() { disconnected = true }
        override fun usingProxy() = false
        override fun connect() = Unit
    }

    private class FakeNavController {
        companion object {
            var lastRoute: String? = null

            @JvmStatic
            @Suppress("UNUSED_PARAMETER")
            fun navigate(controller: FakeNavController, route: String, options: Any?, mask: Int) {
                lastRoute = route
            }
        }
    }

    private fun buttonLabels(view: View): List<String> {
        val own = if (view is Button) listOf(view.text.toString()) else emptyList()
        if (view !is ViewGroup) return own
        return own + (0 until view.childCount).flatMap { buttonLabels(view.getChildAt(it)) }
    }

    private fun findButton(view: View, label: String): Button? {
        if (view is Button && view.text.toString() == label) return view
        if (view !is ViewGroup) return null
        return (0 until view.childCount).firstNotNullOfOrNull {
            findButton(view.getChildAt(it), label)
        }
    }

    private fun resetActiveDownloadState() {
        setStaticField("activeRequest", null)
        setStaticField("downloadState", LocalDownloadsRuntime.DownloadState.idle())
        setStaticField("dialogHidden", false)
        setStaticField("progressDialogVisible", false)
        setStaticField("activeHeroMeta", null)
        setStaticField("activeHeroVideo", null)
        LocalDownloadsRuntime.cancelPendingMovieAction()
    }

    @Suppress("UNUSED_PARAMETER")
    private class FakeSplitSubtitleWorker(
        repository: FakeSubtitleRepository,
        type: String,
        id: String,
        videoId: String?,
        onProgress: Function3<Any?, Any?, Any?, Any?>?,
        onAddon: Function1<Any?, Any?>?,
        hash: String?,
        size: Long?,
        filename: String,
        continuation: Continuation<Any?>?
    )

    @Suppress("UNUSED_PARAMETER")
    private class FakeUniversalSubtitleWorker(
        repository: FakeSubtitleRepository,
        type: String,
        id: String,
        videoId: String?,
        onProgress: Function3<Any?, Any?, Any?, Any?>?,
        hash: String?,
        size: Long?,
        filename: String,
        continuation: Continuation<Any?>?
    )

    @Suppress("unused")
    private data class FakePlaybackInfo(
        val url: String?,
        val title: String = "Tiny episode",
        val streamName: String = "Test",
        val year: String? = null,
        val isExternal: Boolean = false,
        val isTorrent: Boolean = false,
        val infoHash: String? = null,
        val ytId: String? = null,
        val headers: Map<String, String>? = mapOf("Referer" to "https://example.test/"),
        val contentId: String? = "tt1",
        val contentType: String? = "series",
        val contentName: String? = "Show",
        val poster: String? = null,
        val backdrop: String? = null,
        val logo: String? = null,
        val videoId: String? = "tt1:1:1",
        val season: Int? = 1,
        val episode: Int? = 1,
        val episodeTitle: String? = "Pilot",
        val bingeGroup: String? = null,
        val filename: String? = null,
        val videoHash: String? = null,
        val videoSize: Long? = 1024,
        val addonName: String? = "Test",
        val addonLogo: String? = null,
        val streamDescription: String? = null,
        val fileIdx: Int? = null,
        val sources: List<String>? = null,
        val contentLanguage: String? = "en"
    )

    private fun setStaticField(name: String, value: Any?) {
        LocalDownloadsRuntime::class.java.getDeclaredField(name).apply {
            isAccessible = true
            set(null, value)
        }
    }

    private fun getStaticField(name: String): Any? =
        LocalDownloadsRuntime::class.java.getDeclaredField(name).run {
            isAccessible = true
            get(null)
        }

    private fun enumValue(simpleName: String, value: String): Any {
        val enumClass = LocalDownloadsRuntime::class.java.declaredClasses.single {
            it.simpleName == simpleName
        }
        return enumClass.enumConstants!!.single { (it as Enum<*>).name == value }
    }

    @Suppress("unused")
    private class CompactPlaybackInfo {
        @JvmField val a = "https://example.test/episode.mkv"
        @JvmField val b = "Tiny episode"
        @JvmField val f = false
        @JvmField val h: String? = null
        @JvmField val i = mapOf("Referer" to "https://example.test/")
        @JvmField val u = "episode.mkv"
        @JvmField val w: Long? = null
        @JvmField val z = "Episode source — 📦 266.9 MB"
    }
}
