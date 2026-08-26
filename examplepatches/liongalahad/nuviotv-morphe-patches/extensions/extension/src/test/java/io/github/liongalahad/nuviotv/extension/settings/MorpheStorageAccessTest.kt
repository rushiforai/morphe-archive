package io.github.liongalahad.nuviotv.extension.settings

import android.content.Intent
import android.content.pm.ActivityInfo
import android.content.pm.ResolveInfo
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28])
class MorpheStorageAccessTest {
    @Test fun `TV framework document stub is not treated as a folder picker`() {
        val stub = ResolveInfo().apply {
            activityInfo = ActivityInfo().apply {
                packageName = "com.android.tv.frameworkpackagestubs"
            }
        }
        val picker = ResolveInfo().apply {
            activityInfo = ActivityInfo().apply {
                packageName = "com.google.android.documentsui"
            }
        }

        assertFalse(MorpheStorageFolderPickerActivity.isUsableTreePicker(stub))
        assertTrue(MorpheStorageFolderPickerActivity.isUsableTreePicker(picker))
    }

    @Test fun `app folder fallback intent skips broad storage access`() {
        val intent = MorpheStorageFolderPickerActivity.appFolderFallbackIntent(
            ApplicationProvider.getApplicationContext(),
            true
        )

        assertEquals(
            MorpheStorageInternalFolderPickerActivity::class.java.name,
            intent.component?.className
        )
        assertTrue(intent.getBooleanExtra(
            MorpheStorageFolderPickerActivity.EXTRA_REQUIRE_WRITE,
            false
        ))
        assertTrue(intent.getBooleanExtra(
            MorpheStorageInternalFolderPickerActivity.EXTRA_SHOW_APP_FOLDER_FALLBACK,
            false
        ))
    }

    @get:Rule val temporaryFolder = TemporaryFolder()

    @Test fun `legacy reader remains usable while writer also requires write permission`() {
        assertTrue(MorpheStorageInternalFolderPickerActivity.hasLegacyDirectAccess(
            true, false, false
        ))
        assertFalse(MorpheStorageInternalFolderPickerActivity.hasLegacyDirectAccess(
            true, false, true
        ))
        assertTrue(MorpheStorageInternalFolderPickerActivity.hasLegacyDirectAccess(
            true, true, true
        ))
        assertFalse(MorpheStorageInternalFolderPickerActivity.hasLegacyDirectAccess(
            false, true, true
        ))
    }

    @Test fun `document selection requires a write grant only for writers`() {
        val read = Intent.FLAG_GRANT_READ_URI_PERMISSION
        val readWrite = read or Intent.FLAG_GRANT_WRITE_URI_PERMISSION

        assertTrue(MorpheStorageFolderPickerActivity.hasRequiredGrant(read, false))
        assertFalse(MorpheStorageFolderPickerActivity.hasRequiredGrant(read, true))
        assertTrue(MorpheStorageFolderPickerActivity.hasRequiredGrant(readWrite, true))
        assertFalse(MorpheStorageFolderPickerActivity.hasRequiredGrant(
            Intent.FLAG_GRANT_WRITE_URI_PERMISSION,
            true
        ))
    }

    @Test fun `read-write-directory probe verifies data and creates no lasting file`() {
        val folder = temporaryFolder.newFolder("selected")

        val result = MorpheStoragePath.probeReadWriteDirectory(folder)

        assertTrue(result.success)
        assertTrue(result.visibleMessage().contains("PASS"))
        assertTrue(folder.listFiles().orEmpty().isEmpty())
    }

    @Test fun `writable-directory probe rejects missing paths and regular files`() {
        val regularFile = temporaryFolder.newFile("not-a-folder")
        val missing = temporaryFolder.root.resolve("missing")

        val fileResult = MorpheStoragePath.probeReadWriteDirectory(regularFile)
        val missingResult = MorpheStoragePath.probeReadWriteDirectory(missing)

        assertFalse(fileResult.success)
        assertTrue(fileResult.visibleMessage().contains("NOT_DIRECTORY"))
        assertFalse(missingResult.success)
        assertTrue(missingResult.visibleMessage().contains("NOT_FOUND"))
    }

    @Test fun `only an explicitly creatable directory is prepared for writing`() {
        val rejected = temporaryFolder.root.resolve("rejected")
        val created = temporaryFolder.root.resolve("created")

        assertFalse(MorpheStoragePath.prepareWritableDirectory(rejected, false))
        assertFalse(rejected.exists())
        assertTrue(MorpheStoragePath.prepareWritableDirectory(created, true))
        assertTrue(created.isDirectory)
        assertTrue(created.listFiles().orEmpty().isEmpty())
    }

    @Test fun `raw writer uses all-files access on Android 11 and legacy write below it`() {
        assertTrue(MorpheStoragePath.hasRawWriteAccess(28, false, true))
        assertFalse(MorpheStoragePath.hasRawWriteAccess(28, true, false))
        assertTrue(MorpheStoragePath.hasRawWriteAccess(30, true, false))
        assertFalse(MorpheStoragePath.hasRawWriteAccess(30, false, true))
    }

    @Test fun `app-specific fallback uses the patched app package and not Morphe Manager`() {
        val root = temporaryFolder.newFolder("7736-1C22")

        val folder = MorpheStoragePath.appSpecificDownloadsCandidate(root, "com.nuvio.morphe")

        assertEquals(
            root.resolve("Android/data/com.nuvio.morphe/files/Downloads").path,
            folder!!.path
        )
        assertFalse(folder.path.contains("app.morphe.manager"))
        assertTrue(MorpheStoragePath.isOwnedAppSpecificFolder(
            folder, listOf(root), "com.nuvio.morphe"
        ))
        assertFalse(MorpheStoragePath.isOwnedAppSpecificFolder(
            root.resolve("Android/data/app.morphe.manager/files"),
            listOf(root),
            "com.nuvio.morphe"
        ))
    }

    @Test fun `document picker starts at the selected folder on primary or removable storage`() {
        val primary = temporaryFolder.newFolder("primary")
        val removable = temporaryFolder.newFolder("7736-1C22")
        val primaryFolder = primary.resolve("Movies/Nuvio").apply { mkdirs() }
        val usbFolder = removable.resolve("Folder").apply { mkdirs() }

        assertEquals(
            "primary:Movies/Nuvio",
            MorpheStoragePath.documentIdForPath(primary, primary, primaryFolder)
        )
        assertEquals(
            "7736-1C22:Folder",
            MorpheStoragePath.documentIdForPath(removable, primary, usbFolder)
        )
        assertNull(MorpheStoragePath.documentIdForPath(
            removable, primary, primaryFolder
        ))
    }
}
