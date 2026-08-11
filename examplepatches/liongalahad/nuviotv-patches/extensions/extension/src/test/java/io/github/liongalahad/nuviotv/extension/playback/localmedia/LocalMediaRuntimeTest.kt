package io.github.liongalahad.nuviotv.extension.playback.localmedia

import android.app.Application
import android.net.Uri
import androidx.test.core.app.ApplicationProvider
import androidx.media3.common.Player
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class LocalMediaRuntimeTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit()
            .remove(LocalMediaRuntime.ENABLED_KEY)
            .remove(LocalMediaRuntime.TREE_URI_KEY)
            .commit()
    }

    @Test
    fun `local playback defaults off and owns its namespaced setting`() {
        assertEquals("playback.local_media.enabled", LocalMediaRuntime.ENABLED_KEY)
        assertFalse(LocalMediaRuntime.isEnabled())

        LocalMediaRuntime.setEnabled(true)

        assertTrue(LocalMediaRuntime.isEnabled())
    }

    @Test
    fun `default storage location is Movies Nuvio`() {
        assertEquals("Movies/Nuvio", LocalMediaRuntime.DEFAULT_FOLDER_LABEL)
        assertEquals("primary:Movies/Nuvio", LocalMediaRuntime.DEFAULT_DOCUMENT_ID)
        assertEquals("Movies/Nuvio", LocalMediaRuntime.folderDisplayLabel())
    }

    @Test
    fun `selected tree replaces the default folder`() {
        val selected = Uri.parse(
            "content://com.android.externalstorage.documents/tree/primary%3ADownload%2FTV"
        )

        assertTrue(LocalMediaRuntime.setTreeUri(application, selected))

        assertEquals(selected.toString(), LocalMediaRuntime.treeUriString())
        assertEquals("Download/TV", LocalMediaRuntime.folderDisplayLabel())
    }

    @Test
    fun `supported files are classified without accepting subtitles as videos`() {
        assertTrue(LocalMediaRuntime.isSupportedVideoName("Movie.MKV"))
        assertTrue(LocalMediaRuntime.isSupportedVideoName("clip.mp4"))
        assertFalse(LocalMediaRuntime.isSupportedVideoName("Movie.srt"))
        assertFalse(LocalMediaRuntime.isSupportedVideoName("README"))
        assertTrue(LocalMediaRuntime.isSupportedSubtitleName("Movie.SRT"))
        assertTrue(LocalMediaRuntime.isSupportedSubtitleName("Movie.ass"))
    }

    @Test
    fun `only exact same-basename sidecars are attached to each video`() {
        val videos = listOf(
            raw("content://test/Movie", "Movie.mkv"),
            raw("content://test/Other", "Other.mp4")
        )
        val subtitles = listOf(
            raw("content://test/MovieSrt", "movie.SRT"),
            raw("content://test/MovieAss", "Movie.ass"),
            raw("content://test/LanguageTagged", "Movie.en.srt"),
            raw("content://test/Unrelated", "Unrelated.srt")
        )

        val matched = LocalMediaRuntime.matchSidecars(videos, subtitles)

        assertEquals(listOf("Movie.ass", "movie.SRT"), matched[0].subtitles.map { it.name })
        assertTrue(matched[1].subtitles.isEmpty())
    }

    @Test
    fun `player route preserves local URI filename identity and file size`() {
        val route = LocalMediaRuntime.buildPlayerRoute(
            "content://com.android.externalstorage.documents/document/primary%3AMovies%2FNuvio%2FTest.mkv",
            "Test Clip.mkv",
            1_048_576L
        )

        assertTrue(route.startsWith("player/content%3A%2F%2F"))
        assertTrue(route.contains("/Test%20Clip?streamName=Local%20Storage"))
        assertTrue(route.contains("&contentId=&contentType=movie"))
        assertTrue(route.contains("&videoId=local%3A"))
        assertTrue(route.contains("&contentType=movie"))
        assertTrue(route.contains("&filename=Test%20Clip.mkv"))
        assertTrue(route.contains("&videoSize=1048576"))
        assertTrue(route.contains("&launchStartedAtMs="))
    }

    @Test
    fun `local EOF exits once only after the matching player became ready`() {
        val uri = "content://picker/tree/folder/document/movie.mkv"
        val player = Any()
        LocalMediaRuntime.beginLocalPlaybackForTesting(uri)

        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(player, uri, Player.STATE_ENDED))
        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(player, "content://other", Player.STATE_READY))
        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(player, uri, Player.STATE_READY))
        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(player, uri, Player.STATE_BUFFERING))
        assertTrue(LocalMediaRuntime.shouldExitForPlaybackState(player, uri, Player.STATE_ENDED))
        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(player, uri, Player.STATE_ENDED))
    }

    @Test
    fun `local EOF ignores a different player instance`() {
        val uri = "content://picker/tree/folder/document/movie.mkv"
        val localPlayer = Any()
        LocalMediaRuntime.beginLocalPlaybackForTesting(uri)

        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(localPlayer, uri, Player.STATE_READY))
        assertFalse(LocalMediaRuntime.shouldExitForPlaybackState(Any(), uri, Player.STATE_ENDED))
    }

    @Test
    fun `local playback restores the captured Storage selection once`() {
        var restored: TestLibraryMode? = null
        assertTrue(LocalMediaRuntime.isStorageMode(TestLibraryMode.Storage))
        val selector: (Any?) -> Unit = { mode ->
            restored = mode as TestLibraryMode
            Unit
        }
        LocalMediaRuntime.observeLibraryModeSelection(TestLibraryMode.Storage, selector)
        LocalMediaRuntime.beginLocalPlaybackForTesting("content://picker/movie.mkv")

        val restoredSelection = LocalMediaRuntime.restorePendingStorageSelectionForTesting()
        assertTrue(restoredSelection)
        assertEquals(TestLibraryMode.Storage, restored)
        assertFalse(LocalMediaRuntime.restorePendingStorageSelectionForTesting())
    }

    @Test
    fun `default folder creation creates nested directories and is idempotent`() {
        val folder = temporaryFolder.root.resolve("Movies/Nuvio")

        assertTrue(LocalMediaRuntime.ensureDirectory(folder))
        assertTrue(folder.isDirectory)
        assertTrue(LocalMediaRuntime.ensureDirectory(folder))
    }

    @Test
    fun `default folder creation rejects an existing file`() {
        val file = temporaryFolder.newFile("Nuvio")

        assertFalse(LocalMediaRuntime.ensureDirectory(file))
    }

    private fun raw(uri: String, name: String) = LocalMediaRuntime.RawDocument(
        Uri.parse(uri), name, 100L, 200L
    )

    private enum class TestLibraryMode { Saved, Storage }
}
