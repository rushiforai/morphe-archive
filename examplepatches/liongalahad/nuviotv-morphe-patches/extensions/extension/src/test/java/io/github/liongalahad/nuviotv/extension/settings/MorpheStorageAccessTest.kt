package io.github.liongalahad.nuviotv.extension.settings

import android.content.Intent
import org.junit.Assert.assertFalse
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

    @Test fun `writable-directory probe creates no lasting file`() {
        val folder = temporaryFolder.newFolder("selected")

        assertTrue(MorpheStoragePath.isWritableDirectory(folder))
        assertTrue(folder.listFiles().orEmpty().isEmpty())
    }

    @Test fun `writable-directory probe rejects missing paths and regular files`() {
        val regularFile = temporaryFolder.newFile("not-a-folder")
        val missing = temporaryFolder.root.resolve("missing")

        assertFalse(MorpheStoragePath.isWritableDirectory(regularFile))
        assertFalse(MorpheStoragePath.isWritableDirectory(missing))
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
}
