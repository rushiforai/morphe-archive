package app.pigfoot.patches

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.OptionException
import app.pigfoot.patches.railsgo.busUpdatePatch
import app.pigfoot.patches.railsgo.parallelInstallPatch
import app.pigfoot.patches.railsgo.startupCompatibilityPatch
import org.junit.Assert.*
import org.junit.Test

class RailsGoSelectionTest {
    @Test fun busDependencyClosureNeverPullsInPackageRenaming() {
        assertEquals(setOf(startupCompatibilityPatch), busUpdatePatch.dependencies)
        assertTrue(startupCompatibilityPatch.dependencies.isEmpty())
        assertTrue(parallelInstallPatch.dependencies.isEmpty())
        assertFalse(parallelInstallPatch.default)
    }

    @Test fun standardAndShizukuRequireStartupButLeaveRenamingOptIn() {
        for (installer in listOf(InstallerType.STANDARD, InstallerType.SHIZUKU)) {
            assertEquals(PatchAvailability.REQUIRED, startupCompatibilityPatch.availability!!
                .resolve(installer, ApkArchitecture.ARM64_V8A))
            assertEquals(PatchAvailability.DISABLED, parallelInstallPatch.availability!!
                .resolve(installer, ApkArchitecture.ARM64_V8A))
            assertEquals(PatchAvailability.ENABLED, busUpdatePatch.availability!!
                .resolve(installer, ApkArchitecture.ARM64_V8A))
        }
    }

    @Test fun unqualifiedMountCannotSelectThesePatches() {
        for (patch in listOf(busUpdatePatch, parallelInstallPatch, startupCompatibilityPatch)) {
            assertEquals(PatchAvailability.UNAVAILABLE, patch.availability!!
                .resolve(InstallerType.MOUNT, ApkArchitecture.ARM64_V8A))
        }
    }

    @Test fun renameOptionsRetainUpdateContinuityAndRejectCollisions() {
        val option = parallelInstallPatch.options["packageName"]!!
        assertEquals("com.waccliu.taiwanrail.morphe", option.default)
        assertTrue(option.required)
        assertFalse(parallelInstallPatch.default)
        try {
            for (valid in listOf("com.waccliu.taiwanrail.morphe", "com.example.railsgo", "com.example.railsgo_two")) {
                parallelInstallPatch.options["packageName"] = valid
                assertEquals(valid, option.value)
            }
            for (invalid in listOf("com.waccliu.taiwanrail", "com.waccliu.taiwanrail.diagnostic", "bad", "com.123", "com.bad-name", "", "com." + "a".repeat(201))) {
                assertThrows(OptionException.ValueValidationException::class.java) {
                    parallelInstallPatch.options["packageName"] = invalid
                }
            }
            assertThrows(OptionException.ValueRequiredException::class.java) {
                parallelInstallPatch.options.set<String>("packageName", null)
            }
        } finally {
            option.reset()
        }
    }
}
