package app.template.patches.steamlink

import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.appearOnTopPatch
import app.template.patches.steamlink.androidxr.androidXrUiExtensionPatch
import app.template.patches.steamlink.androidxr.controllerVelocityPatch
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.unrestrictedBatteryUsagePatch
import app.template.patches.steamlink.androidxr.xrDirectInputFixPatch
import app.template.patches.steamlink.androidxr.xrCoreRuntimePatch
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch
import app.template.patches.steamlink.androidxr.xrInputRoutingConfigPatch
import app.template.patches.steamlink.androidxr.xrLauncherBootstrapPatch
import app.template.patches.steamlink.androidxr.xrManifestCapabilityPackPatch
import app.template.patches.steamlink.androidxr.xrGalaxyXrHighResolutionPatch
import app.template.patches.steamlink.binary.androidXrNativePermissionNamesPatch
import app.template.patches.steamlink.binary.forceHmdInitializationGatesPatch
import app.template.patches.steamlink.binary.forceLobbyPermissionStateGatePatch
import app.template.patches.steamlink.binary.forceStreamXrGatesPatch
import app.template.patches.steamlink.binary.hmdOnlyPatch
import app.template.patches.steamlink.binary.microphoneInputPresetPatch
import app.template.patches.steamlink.binary.oledCalibrationPatch
import app.template.patches.steamlink.binary.videoDitherPatch
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PatchCompatibilityMatrixTest {
    @Test
    fun `native builds expose only the supported stable and experimental patches`() {
        allowedNativeXr.forEach { patch ->
            assertTrue(patch.supports("2.0.22", 5002318), "${patch.name} on 5002318")
        }
        excludedNativeXr.forEach { patch ->
            assertFalse(patch.supports("2.0.22", 5002318), "${patch.name} on 5002318")
        }
        latestCompatible.forEach { patch ->
            assertTrue(patch.supports("2.0.22", 5002322), "${patch.name} on 5002322")
        }
        latestExcluded.forEach { patch ->
            assertFalse(patch.supports("2.0.22", 5002322), "${patch.name} on 5002322")
        }
        assertTrue(xrGalaxyXrHighResolutionPatch.supports("2.0.22", 5002322))
        assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.22", 5002318))
        assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.22", 5002244))
        assertTrue(xrGalaxyXrHighResolutionPatch.default)
        assertFalse(appearOnTopPatch.supports("2.0.22", 5002322))
        assertEquals("Appear on top (legacy)", appearOnTopPatch.name)
        assertFalse(appearOnTopPatch.default)
        (allowedNativeXr + excludedNativeXr).forEach { patch ->
            assertEquals(
                patch in recommendedDefaults,
                patch.default,
                "${patch.name} has the wrong global recommendation default",
            )
        }
    }

    @Test
    fun `previous verified build compatibility is preserved`() {
        (allowedNativeXr + excludedNativeXr).forEach { patch ->
            assertTrue(patch.supports("2.0.22", 5002313), patch.name)
        }
    }

    @Test
    fun `all legacy patches support exact 2_0_20 builds`() {
        listOf(5001712, 5001740).forEach { versionCode ->
            (allowedNativeXr + excludedNativeXr).forEach { patch ->
                assertTrue(patch.supports("2.0.20", versionCode), "${patch.name} on $versionCode")
            }
            assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.20", versionCode))
        }
        (allowedNativeXr + excludedNativeXr).forEach { patch ->
            assertFalse(patch.supports("2.0.22", 5001712), "${patch.name} on wrong versionName")
        }
    }

    @Test
    fun `latest build recommends exactly the final six patches`() {
        val recommended = (latestCompatible + latestExcluded)
            .filter { patch -> patch.default && patch.supports("2.0.22", 5002322) }
            .mapNotNullTo(mutableSetOf()) { it.name }

        assertEquals(
            setOf(
                "Galaxy XR high-resolution 3-projection fix",
                "GXR face bridge",
                "Microphone input preset",
                "Unrestricted battery usage",
                "Video dither",
                "Visual Delay Fix",
            ),
            recommended,
        )
        assertTrue(oledCalibrationPatch in videoDitherPatch.dependencyClosure())
    }

    @Test
    fun `legacy automatic dependency behavior remains wired for older builds`() {
        val identityClosure = deviceIdentityPatch.dependencyClosure()
        assertTrue(xrDeviceConfigBaselinePatch in identityClosure)
        assertTrue(xrCoreRuntimePatch in identityClosure)
        assertTrue(androidXrUiExtensionPatch in identityClosure)
        assertTrue(xrDirectInputFixPatch in identityClosure)

        listOf(
            appearOnTopPatch,
            unrestrictedBatteryUsagePatch,
            xrGalaxyXrHighResolutionPatch,
        ).forEach { patch ->
            assertTrue(xrLauncherBootstrapPatch in patch.dependencyClosure(), patch.name)
        }
    }

    private fun Patch<*>.supports(version: String, versionCode: Int): Boolean =
        compatibility.orEmpty().any { compatibility ->
            compatibility.targets.any { target ->
                target.version == version && target.versionCodes?.values?.contains(versionCode) == true
            }
        }

    private fun Patch<*>.dependencyClosure(visited: MutableSet<Patch<*>> = mutableSetOf()): Set<Patch<*>> {
        dependencies.forEach { dependency ->
            if (visited.add(dependency)) dependency.dependencyClosure(visited)
        }
        return visited
    }

    private companion object {
        val allowedNativeXr = listOf(
            deviceIdentityPatch,
            microphoneInputPresetPatch,
            oledCalibrationPatch,
            appearOnTopPatch,
            gxrFacebridgePatch,
            hmdOnlyPatch,
            unrestrictedBatteryUsagePatch,
            videoDitherPatch,
        )

        val excludedNativeXr = listOf(
            changePackageNamePatch,
            androidXrNativePermissionNamesPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            controllerVelocityPatch,
            xrCoreRuntimePatch,
            xrDeviceConfigBaselinePatch,
            xrManifestCapabilityPackPatch,
            xrLauncherBootstrapPatch,
            xrInputRoutingConfigPatch,
        )

        val latestCompatible = allowedNativeXr - listOf(
            deviceIdentityPatch,
            oledCalibrationPatch,
            appearOnTopPatch,
        ) + listOf(
            xrGalaxyXrHighResolutionPatch,
        )

        val latestExcluded = excludedNativeXr + listOf(
            deviceIdentityPatch,
            oledCalibrationPatch,
            appearOnTopPatch,
        )

        val recommendedDefaults = setOf(
            deviceIdentityPatch,
            microphoneInputPresetPatch,
            oledCalibrationPatch,
            gxrFacebridgePatch,
            unrestrictedBatteryUsagePatch,
            videoDitherPatch,
            hmdOnlyPatch,
            xrGalaxyXrHighResolutionPatch,
        )
    }
}
