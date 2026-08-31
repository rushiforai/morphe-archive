package io.github.liongalahad.nuviotv.extension.playback.localmedia

import android.app.Application
import android.net.Uri
import android.view.KeyEvent
import androidx.test.core.app.ApplicationProvider
import androidx.media3.common.Player
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import io.github.liongalahad.nuviotv.extension.storage.segmented.SegmentedMedia
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.FileOutputStream

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
        LocalMediaRuntime.finishHeldSelectCycle()
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit()
            .remove(LocalMediaRuntime.ENABLED_KEY)
            .remove(LocalMediaRuntime.TREE_URI_KEY)
            .remove(LocalMediaRuntime.LEGACY_TREE_URI_KEY)
            .putBoolean(LocalMediaRuntime.ENABLED_KEY, false)
            .commit()
    }

    @Test
    fun `local playback defaults on and a stored choice remains authoritative`() {
        assertEquals("playback.local_media.enabled", LocalMediaRuntime.ENABLED_KEY)
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().remove(LocalMediaRuntime.ENABLED_KEY).commit()
        assertTrue(LocalMediaRuntime.isEnabled())

        LocalMediaRuntime.setEnabled(false)

        assertFalse(LocalMediaRuntime.isEnabled())
    }

    @Test
    fun `default storage location is Movies Nuvio`() {
        assertEquals("Movies/Nuvio", LocalMediaRuntime.DEFAULT_FOLDER_LABEL)
        assertEquals("primary:Movies/Nuvio", LocalMediaRuntime.DEFAULT_DOCUMENT_ID)
        assertEquals("Movies/Nuvio", LocalMediaRuntime.folderDisplayLabel())
    }

    @Test
    fun `selected tree replaces the default folder but requires its persisted read grant`() {
        val selected = Uri.parse(
            "content://com.android.externalstorage.documents/tree/primary%3ADownload%2FTV"
        )

        assertTrue(LocalMediaRuntime.setTreeUri(application, selected))

        assertEquals(selected.toString(), LocalMediaRuntime.treeUriString())
        assertEquals("Download/TV", LocalMediaRuntime.folderDisplayLabel())
        assertFalse(LocalMediaRuntime.hasStorageAccess(application))
        assertFalse(LocalMediaRuntime.scan(application).hasFolderAccess)
    }

    @Test
    fun `legacy Local Media path migrates into the shared storage key`() {
        val selected = "content://com.android.externalstorage.documents/tree/primary%3ADownload%2FLegacy"
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.LEGACY_TREE_URI_KEY, selected).commit()

        assertEquals(selected, LocalMediaRuntime.treeUriString())
        val preferences = application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
        assertEquals(selected, preferences.getString(LocalMediaRuntime.TREE_URI_KEY, null))
        assertFalse(preferences.contains(LocalMediaRuntime.LEGACY_TREE_URI_KEY))
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
    fun `exact and language tagged sidecars are attached to each video`() {
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

        assertEquals(
            listOf("Movie.ass", "Movie.en.srt", "movie.SRT"),
            matched[0].subtitles.map { it.name }
        )
        assertTrue(matched[1].subtitles.isEmpty())
        assertTrue(LocalMediaRuntime.isVideoSidecar("Movie", "Movie.en.2"))
        assertFalse(LocalMediaRuntime.isVideoSidecar("Movie", "Movie director cut"))
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
    @Config(sdk = [28, 30, 35])
    fun `player route UTF-8 encoding works across supported Android TV APIs`() {
        val route = LocalMediaRuntime.buildPlayerRoute(
            "file:///storage/emulated/0/Movies/Nuvio/Amélie & 50%.mp4",
            "Amélie & 50%.mp4",
            2_048L
        )

        assertTrue(route.startsWith("player/file%3A%2F%2F%2F"))
        assertTrue(route.contains("Am%C3%A9lie%20%26%2050%25"))
        assertTrue(route.contains("filename=Am%C3%A9lie%20%26%2050%25.mp4"))
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

    @Test
    fun `select key hold is consumed once as a long press`() {
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 100L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        assertTrue(LocalMediaRuntime.isSelectKeyDown())
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 700L, KeyEvent.ACTION_UP,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))

        assertFalse(LocalMediaRuntime.isSelectKeyDown())
        assertTrue(LocalMediaRuntime.consumeSelectLongPress())
        assertFalse(LocalMediaRuntime.consumeSelectLongPress())
    }

    @Test
    fun `ordinary select release is not consumed as a long press`() {
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 100L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 180L, KeyEvent.ACTION_UP,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))

        assertFalse(LocalMediaRuntime.isSelectKeyDown())
        assertFalse(LocalMediaRuntime.consumeSelectLongPress())
    }

    @Test
    fun `zero-repeat down events cannot restart an active TV hold`() {
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 100L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        // Several TV remotes report a held repeat as a fresh zero-repeat DOWN with a new
        // downTime. It is still the same physical press because no UP has been received.
        LocalMediaRuntime.observeKeyEvent(KeyEvent(400L, 650L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))

        assertTrue(LocalMediaRuntime.isSelectKeyDown())
        assertTrue(LocalMediaRuntime.consumeSelectLongPress())
        LocalMediaRuntime.observeKeyEvent(KeyEvent(400L, 700L, KeyEvent.ACTION_UP,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        assertFalse(LocalMediaRuntime.consumeSelectLongPress())
    }

    @Test
    fun `remote long press flag is retained until the select click callback`() {
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 100L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 120L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 1, 0, 0, 0, KeyEvent.FLAG_LONG_PRESS))
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 140L, KeyEvent.ACTION_UP,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))

        assertTrue(LocalMediaRuntime.consumeSelectLongPress())
        assertFalse(LocalMediaRuntime.consumeSelectLongPress())
    }

    @Test
    fun `remote long press can be consumed while the select key is still held`() {
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 100L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 650L, KeyEvent.ACTION_DOWN,
            KeyEvent.KEYCODE_DPAD_CENTER, 1, 0, 0, 0, KeyEvent.FLAG_LONG_PRESS))

        assertTrue(LocalMediaRuntime.consumeSelectLongPress())
        LocalMediaRuntime.observeKeyEvent(KeyEvent(100L, 700L, KeyEvent.ACTION_UP,
            KeyEvent.KEYCODE_DPAD_CENTER, 0))
        assertFalse(LocalMediaRuntime.consumeSelectLongPress())
    }

    @Test
    fun `deleting a storage file also deletes matching subtitles and empty folder`() {
        val root = temporaryFolder.newFolder("storage")
        val folder = root.resolve("Silo - Season 3").apply { mkdirs() }
        val media = folder.resolve("episode.mkv").apply { writeText("video") }
        val subtitle = folder.resolve("episode.en.srt").apply { writeText("subtitle") }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()
        val file = LocalMediaRuntime.LocalMediaFile(
            Uri.parse(media.toURI().toString()), media.name, "Silo - Season 3/${media.name}",
            media.length(), media.lastModified(),
            listOf(LocalMediaRuntime.LocalSubtitle(Uri.parse(subtitle.toURI().toString()), subtitle.name))
        )

        val result = LocalMediaRuntime.deleteFile(application, file)

        assertTrue(result.complete)
        assertFalse(media.exists())
        assertFalse(subtitle.exists())
        assertFalse(folder.exists())
    }

    @Test
    fun `file deletion removes folder when no playable files remain`() {
        val root = temporaryFolder.newFolder("storage-keep")
        val folder = root.resolve("Movie").apply { mkdirs() }
        val media = folder.resolve("movie.mp4").apply { writeText("video") }
        val notes = folder.resolve("notes.txt").apply { writeText("keep") }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()
        val file = LocalMediaRuntime.LocalMediaFile(
            Uri.parse(media.toURI().toString()), media.name, "Movie/${media.name}",
            media.length(), media.lastModified(), emptyList()
        )

        assertTrue(LocalMediaRuntime.deleteFile(application, file).complete)
        assertFalse(folder.exists())
        assertFalse(notes.exists())
    }

    @Test
    fun `file deletion preserves folder while another playable file remains`() {
        val root = temporaryFolder.newFolder("storage-keep-video")
        val folder = root.resolve("Movie").apply { mkdirs() }
        val media = folder.resolve("movie.mp4").apply { writeText("video") }
        val sibling = folder.resolve("extra.mkv").apply { writeText("keep video") }
        val notes = folder.resolve("notes.txt").apply { writeText("keep") }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()
        val file = LocalMediaRuntime.LocalMediaFile(
            Uri.parse(media.toURI().toString()), media.name, "Movie/${media.name}",
            media.length(), media.lastModified(), emptyList()
        )

        assertTrue(LocalMediaRuntime.deleteFile(application, file).complete)
        assertTrue(folder.exists())
        assertTrue(sibling.exists())
        assertTrue(notes.exists())
    }

    @Test
    fun `mirrored segmented bundle is one library file with sidecars and whole bundle deletion`() {
        val root = temporaryFolder.newFolder("storage-segmented")
        val folder = root.resolve("Movie").apply { mkdirs() }
        val bundle = folder.resolve("Movie [12345678]").apply { mkdirs() }
        val first = bundle.resolve("${SegmentedMedia.BUNDLE_PART_PREFIX}0001")
            .apply { writeBytes("abcd".toByteArray()) }
        val second = bundle.resolve("${SegmentedMedia.BUNDLE_PART_PREFIX}0002")
            .apply { writeBytes("EFG".toByteArray()) }
        val subtitle = bundle.resolve("Movie.en.srt").apply { writeText("subtitle") }
        val manifestFile = bundle.resolve(SegmentedMedia.BUNDLE_MANIFEST)
        val manifest = SegmentedMedia.Manifest(
            "library-bundle", "Movie.mkv", "video/x-matroska", "Movie",
            listOf(first, second).map { SegmentedMedia.Segment(Uri.fromFile(it), it.length()) }
        )
        FileOutputStream(manifestFile).use { SegmentedMedia.write(it, manifest) }

        val scanMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "scanFileChildren", android.content.Context::class.java, java.io.File::class.java,
            String::class.java, String::class.java, Uri::class.java,
            java.util.List::class.java
        ).apply { isAccessible = true }
        val buckets = mutableListOf<Any>()
        scanMethod.invoke(null, application, root, "", null, null, buckets)
        val buildMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "buildSnapshot", Boolean::class.javaPrimitiveType, String::class.java,
            java.util.List::class.java, String::class.java
        ).apply { isAccessible = true }
        val snapshot = buildMethod.invoke(null, true, "Test", buckets, null)
                as LocalMediaRuntime.LibrarySnapshot

        assertEquals(1, snapshot.files.size)
        val logical = snapshot.files.single()
        assertEquals("Movie.mkv", logical.name)
        assertEquals(7L, logical.size)
        assertEquals(1, logical.subtitles.size)
        assertTrue(logical.uri.authority!!.endsWith(SegmentedMedia.AUTHORITY_SUFFIX))

        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()
        assertTrue(LocalMediaRuntime.deleteFile(application, logical).complete)
        assertFalse(first.exists())
        assertFalse(second.exists())
        assertFalse(manifestFile.exists())
        assertFalse(subtitle.exists())
        assertFalse(bundle.exists())
        assertFalse(folder.exists())
    }

    @Test
    fun `legacy flat segmented manifests remain visible`() {
        val root = temporaryFolder.newFolder("storage-segmented-legacy")
        val part = root.resolve(".morphe-legacy${SegmentedMedia.PART_MARKER}0001")
            .apply { writeText("legacy") }
        val manifestFile = root.resolve("Legacy.mp4${SegmentedMedia.MANIFEST_SUFFIX}")
        FileOutputStream(manifestFile).use {
            SegmentedMedia.write(it, SegmentedMedia.Manifest(
                "legacy", "Legacy.mp4", "video/mp4",
                listOf(SegmentedMedia.Segment(Uri.fromFile(part), part.length()))
            ))
        }
        val scanMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "scanFileChildren", android.content.Context::class.java, java.io.File::class.java,
            String::class.java, String::class.java, Uri::class.java,
            java.util.List::class.java
        ).apply { isAccessible = true }
        val buckets = mutableListOf<Any>()
        scanMethod.invoke(null, application, root, "", null, null, buckets)
        val buildMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "buildSnapshot", Boolean::class.javaPrimitiveType, String::class.java,
            java.util.List::class.java, String::class.java
        ).apply { isAccessible = true }
        val snapshot = buildMethod.invoke(null, true, "Test", buckets, null)
                as LocalMediaRuntime.LibrarySnapshot

        assertEquals(listOf("Legacy.mp4"), snapshot.files.map { it.name })
    }

    @Test
    fun `deleting one hidden bundle preserves its logical sibling`() {
        val root = temporaryFolder.newFolder("storage-segmented-siblings")
        val folder = root.resolve("Movies").apply { mkdirs() }
        val store = folder.resolve(SegmentedMedia.STORE_DIRECTORY).apply { mkdirs() }
        listOf("First.mp4", "Second.mp4").forEachIndexed { index, name ->
            val bundle = store.resolve("bundle-$index").apply { mkdirs() }
            val part = bundle.resolve("part-0001").apply { writeText("video-$index") }
            FileOutputStream(bundle.resolve(SegmentedMedia.BUNDLE_MANIFEST)).use {
                SegmentedMedia.write(it, SegmentedMedia.Manifest(
                    "bundle-$index", name, "video/mp4",
                    listOf(SegmentedMedia.Segment(Uri.fromFile(part), part.length()))
                ))
            }
        }
        val scanMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "scanFileChildren", android.content.Context::class.java, java.io.File::class.java,
            String::class.java, String::class.java, Uri::class.java,
            java.util.List::class.java
        ).apply { isAccessible = true }
        val buildMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "buildSnapshot", Boolean::class.javaPrimitiveType, String::class.java,
            java.util.List::class.java, String::class.java
        ).apply { isAccessible = true }
        fun snapshot(): LocalMediaRuntime.LibrarySnapshot {
            val buckets = mutableListOf<Any>()
            scanMethod.invoke(null, application, root, "", null, null, buckets)
            return buildMethod.invoke(null, true, "Test", buckets, null)
                    as LocalMediaRuntime.LibrarySnapshot
        }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()

        val before = snapshot()
        assertEquals(listOf("First.mp4", "Second.mp4"), before.files.map { it.name }.sorted())
        assertTrue(LocalMediaRuntime.deleteFile(
            application, before.files.first { it.name == "First.mp4" }).complete)
        assertTrue(folder.exists())
        assertTrue(store.resolve("bundle-1").exists())
        assertEquals(listOf("Second.mp4"), snapshot().files.map { it.name })
    }

    @Test
    fun `mirrored show season mixes ordinary and split episodes without a visual distinction`() {
        val root = temporaryFolder.newFolder("storage-mirrored-show")
        val seasonStore = root.resolve("Silo - Season 1").apply { mkdirs() }
        listOf(
            Triple("episode-one", "Silo.S01E01.mkv", "S01E01 - Freedom Day"),
            Triple("episode-two", "Silo.S01E02.mkv", "S01E02 - Holston's Pick")
        ).forEach { (bundleId, filename, label) ->
            val bundle = seasonStore.resolve("$label [12345678]").apply { mkdirs() }
            val part = bundle.resolve("$label - part 0001.bin").apply { writeText(bundleId) }
            bundle.resolve(filename.removeSuffix(".mkv") + ".en.srt").writeText("subtitle")
            FileOutputStream(bundle.resolve("$label - playback manifest.json")).use {
                SegmentedMedia.write(it, SegmentedMedia.Manifest(
                    bundleId, filename, "video/x-matroska", "Silo - Season 1",
                    listOf(SegmentedMedia.Segment(Uri.fromFile(part), part.length()))
                ))
            }
        }
        seasonStore.resolve("Silo.S01E03.mkv").writeText("ordinary episode")
        seasonStore.resolve("Silo.S01E03.en.srt").writeText("ordinary subtitle")
        val scanMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "scanFileChildren", android.content.Context::class.java, java.io.File::class.java,
            String::class.java, String::class.java, Uri::class.java,
            java.util.List::class.java
        ).apply { isAccessible = true }
        val buildMethod = LocalMediaRuntime::class.java.getDeclaredMethod(
            "buildSnapshot", Boolean::class.javaPrimitiveType, String::class.java,
            java.util.List::class.java, String::class.java
        ).apply { isAccessible = true }
        fun snapshot(): LocalMediaRuntime.LibrarySnapshot {
            val buckets = mutableListOf<Any>()
            scanMethod.invoke(null, application, root, "", null, null, buckets)
            return buildMethod.invoke(null, true, "Test", buckets, null)
                    as LocalMediaRuntime.LibrarySnapshot
        }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()

        val before = snapshot()
        assertEquals(listOf("Silo.S01E01.mkv", "Silo.S01E02.mkv", "Silo.S01E03.mkv"),
            before.files.map { it.name }.sorted())
        assertTrue(before.files.all { it.relativePath.startsWith("Silo - Season 1/") })
        assertTrue(before.files.all { it.subtitles.size == 1 })
        val season = before.entries.single()
        assertTrue(season.folder)
        assertEquals("Silo - Season 1", season.name)
        assertEquals(3, season.files.size)

        assertTrue(LocalMediaRuntime.deleteFolder(application, season).complete)
        assertFalse(seasonStore.exists())
        assertTrue(root.exists())
        assertTrue(snapshot().files.isEmpty())
    }

    @Test
    fun `explicit folder deletion removes only selected root child`() {
        val root = temporaryFolder.newFolder("storage-folder")
        val target = root.resolve("Delete me").apply { mkdirs() }
        target.resolve("nested").apply { mkdirs(); resolve("movie.mp4").writeText("video") }
        val keep = root.resolve("Keep me").apply { mkdirs(); resolve("movie.mp4").writeText("keep") }
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString(LocalMediaRuntime.TREE_URI_KEY, root.toURI().toString()).commit()
        val entry = LocalMediaRuntime.LocalMediaEntry.folder("Delete me", emptyList())

        assertTrue(LocalMediaRuntime.deleteFolder(application, entry).complete)
        assertFalse(target.exists())
        assertTrue(keep.exists())
    }

    @Test
    fun `storage long press action menu creates for a pending folder`() {
        val pendingField = LocalMediaRuntime::class.java.getDeclaredField("pendingDelete").apply {
            isAccessible = true
        }
        pendingField.set(null, LocalMediaRuntime.PendingDelete.folder(
            LocalMediaRuntime.LocalMediaEntry.folder("Test folder", emptyList()), false
        ))

        val controller = Robolectric.buildActivity(LocalMediaActionActivity::class.java)
        controller.create().resume()

        assertNotNull(controller.get())
        controller.pause().destroy()
        pendingField.set(null, null)
    }

    @Test
    fun `row owned storage target opens its menu at timeout before release`() {
        val pendingField = LocalMediaRuntime::class.java.getDeclaredField("pendingDelete").apply {
            isAccessible = true
        }
        pendingField.set(null, null)
        val entry = LocalMediaRuntime.LocalMediaEntry.folder("Held folder", emptyList())
        LocalMediaLibraryUi.pressStorageEntryForTesting(entry)

        assertTrue(LocalMediaLibraryUi.onSelectLongPressTimeout())
        val pending = pendingField.get(null) as LocalMediaRuntime.PendingDelete
        assertEquals("Held folder", pending.name)
        assertTrue(pending.folder)

        LocalMediaRuntime.cancelPendingDelete()
        LocalMediaLibraryUi.pressStorageEntryForTesting(null)
    }

    private fun raw(uri: String, name: String) = LocalMediaRuntime.RawDocument(
        Uri.parse(uri), name, 100L, 200L
    )

    private enum class TestLibraryMode { Saved, Storage }
}
