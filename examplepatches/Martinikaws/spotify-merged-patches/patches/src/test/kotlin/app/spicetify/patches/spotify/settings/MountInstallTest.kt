package app.spicetify.patches.spotify.settings

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.ResourcePatch
import app.spicetify.patches.spotify.localfiles.localFilesFromServerPatch
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

class MountInstallTest {
    // A root mount install keeps the stock manifest, so anything a resource patch adds to the
    // manifest never exists for the system.
    @Test
    fun `settings add no manifest components`() {
        assertTrue(settingsPatch.dependencies.none { it is ResourcePatch })
    }

    @Test
    fun `server files cannot be selected for a mount install`() {
        val availability = requireNotNull(localFilesFromServerPatch.availability)
        assertEquals(PatchAvailability.UNAVAILABLE,
            availability.resolve(InstallerType.MOUNT, ApkArchitecture.ARM64_V8A))
        assertEquals(PatchAvailability.DISABLED,
            availability.resolve(InstallerType.STANDARD, ApkArchitecture.ARM64_V8A))
        assertEquals(PatchAvailability.DISABLED,
            availability.resolve(InstallerType.SHIZUKU, ApkArchitecture.ARM64_V8A))
    }
}
