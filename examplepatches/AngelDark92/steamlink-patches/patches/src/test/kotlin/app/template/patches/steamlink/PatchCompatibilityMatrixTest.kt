package app.template.patches.steamlink

import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.appearOnTopPatch
import app.template.patches.steamlink.androidxr.androidXrUiExtensionPatch
import app.template.patches.steamlink.androidxr.controllerVelocityFramePatch
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.surfaceVideoTriggerPatch
import app.template.patches.steamlink.androidxr.unrestrictedBatteryUsagePatch
import app.template.patches.steamlink.androidxr.performanceBoostPatch
import app.template.patches.steamlink.androidxr.xrCodecsSupportPatch
import app.template.patches.steamlink.androidxr.xrCoreRuntimePatch
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch
import app.template.patches.steamlink.androidxr.xrDirectInputFixPatch
import app.template.patches.steamlink.androidxr.alpha0HighResolutionTriggerPatch
import app.template.patches.steamlink.androidxr.xrInputRoutingConfigPatch
import app.template.patches.steamlink.androidxr.xrLauncherBootstrapPatch
import app.template.patches.steamlink.androidxr.xrManifestCapabilityPackPatch
import app.template.patches.steamlink.androidxr.xrPermissionSettingsBootstrapPatch
import app.template.patches.steamlink.androidxr.xrStartupPermissionsPatch
import app.template.patches.steamlink.binary.androidXrNativePermissionNamesPatch
import app.template.patches.steamlink.binary.blueNoisePatch
import app.template.patches.steamlink.binary.forceHmdInitializationGatesPatch
import app.template.patches.steamlink.binary.forceLobbyPermissionStateGatePatch
import app.template.patches.steamlink.binary.forceStreamXrGatesPatch
import app.template.patches.steamlink.binary.hmdOnlyPatch
import app.template.patches.steamlink.binary.microphoneInputPresetPatch
import app.template.patches.steamlink.binary.networkOptimizationsPatch
import app.template.patches.steamlink.binary.oledCalibrationPatch
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PatchCompatibilityMatrixTest {
    @Test
    fun `every pre-2363 build recommends the same set`() {
        val expected = legacyRecommendedPatches
        assertEquals(21, expected.size)
        assertEquals(expected, recommendedFor("2.0.20", 5001712).toSet(), "2.0.20/5001712")
        assertEquals(expected, recommendedFor("2.0.20", 5001812).toSet(), "2.0.20/5001812")
        assertEquals(expected, recommendedFor("2.0.21", 5001968).toSet(), "2.0.21/5001968")
        assertEquals(expected, recommendedFor("2.0.22", 5002244).toSet(), "2.0.22/5002244")
        expected.forEach { assertTrue(it.default, it.name) }
    }

    @Test
    fun `native build recommends its own set`() {
        listOf("2.0.23" to 5002363, "2.0.24" to 5002395).forEach { (version, code) ->
            assertEquals(nativeRecommendedPatches, recommendedFor(version, code).toSet())
            assertFalse(deviceIdentityPatch.supports(version, code))
        }
        nativeRecommendedPatches.forEach { assertTrue(it.default, it.name) }
    }

    @Test
    fun `exact pairs only`() {
        listOf(
            "2.0.20" to 5001740,
            "2.0.20" to 5001813,
            "2.0.20" to 5002363,
            "2.0.23" to 5001712,
            "2.0.21" to 5001969,
            "2.0.20" to 5002322,
            "2.0.22" to 5002243,
            "2.0.22" to 5002296,
            "2.0.22" to 5002313,
            "2.0.22" to 5002318,
            "2.0.22" to 5002322,
            "2.0.22" to 5002363,
            "2.0.23" to 5002322,
            "2.0.23" to 5002364,
            "2.0.24" to 5002363,
            "2.0.24" to 5002394,
            "2.0.23" to 5002395,
        ).forEach { (version, versionCode) ->
            assertTrue(recommendedFor(version, versionCode).isEmpty(), "$version/$versionCode")
        }
    }

    @Test
    fun `legacy base exposes every standalone patch with matching defaults`() {
        val reference = allIndividualPatches.filter { it.supports("2.0.20", 5001712) }.toSet()
        assertEquals(25, reference.size)
        recommendedFor("2.0.20", 5001712).forEach { assertTrue(it.default, it.name) }
        (reference - legacyRecommendedPatches).forEach { patch ->
            assertFalse(patch.default, patch.name)
        }
    }

    @Test
    fun `native base exposes its expected individual patches`() {
        val expected = setOf(
            alpha0HighResolutionTriggerPatch,
            gxrFacebridgePatch,
            microphoneInputPresetPatch,
            networkOptimizationsPatch,
            blueNoisePatch,
            xrCodecsSupportPatch,
            performanceBoostPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            controllerVelocityFramePatch,
        )
        assertEquals(expected, allIndividualPatches.filter { it.supports("2.0.23", 5002363) }.toSet())
        assertEquals(expected, allIndividualPatches.filter { it.supports("2.0.24", 5002395) }.toSet())
        listOf("2.0.22" to 5002322, "2.0.22" to 5002363, "2.0.23" to 5002322, "2.0.23" to 5002364,
            "2.0.24" to 5002363, "2.0.24" to 5002394)
            .forEach { (version, versionCode) ->
                allIndividualPatches.forEach { patch ->
                    assertFalse(patch.supports(version, versionCode), "${patch.name}: $version/$versionCode")
                }
            }
        val excludedPublicPatches = allIndividualPatches.toSet() - expected
        assertEquals(14, excludedPublicPatches.size)
        val modernClosure = nativeRecommendedPatches.flatMap { it.dependencyClosure() }.toSet()
        assertTrue(modernClosure.intersect(excludedPublicPatches).isEmpty())
    }

    @Test
    fun `recursive foundation dependencies remain wired and guarded`() {
        val identityClosure = deviceIdentityPatch.dependencyClosure()
        assertTrue(xrDeviceConfigBaselinePatch in identityClosure)
        assertTrue(xrCoreRuntimePatch in identityClosure)
        assertTrue(androidXrUiExtensionPatch in identityClosure)
        assertTrue(xrDirectInputFixPatch in identityClosure)

        val routingClosure = xrInputRoutingConfigPatch.dependencyClosure()
        assertFalse(xrLauncherBootstrapPatch in routingClosure)
        assertTrue(xrManifestCapabilityPackPatch in routingClosure)
        assertTrue(xrCoreRuntimePatch in routingClosure)

        listOf(alpha0HighResolutionTriggerPatch, gxrFacebridgePatch).forEach { patch ->
            val closure = patch.dependencyClosure()
            assertFalse(xrLauncherBootstrapPatch in closure, patch.name)
            assertFalse(xrPermissionSettingsBootstrapPatch in closure, patch.name)
            assertFalse(xrStartupPermissionsPatch in closure, patch.name)
        }
    }

    @Test
    fun `controller velocity is recommended on every supported build`() {
        listOf("2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968,
            "2.0.22" to 5002244, "2.0.23" to 5002363, "2.0.24" to 5002395).forEach { (version, code) ->
            assertTrue(controllerVelocityFramePatch.supports(version, code), "$version/$code")
            assertTrue(controllerVelocityFramePatch.default)
        }
    }

    private fun recommendedFor(version: String, versionCode: Int): List<Patch<*>> =
        allIndividualPatches.filter { patch ->
            patch.default && patch.supports(version, versionCode)
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
        val allIndividualPatches = listOf(
            xrStartupPermissionsPatch,
            androidXrNativePermissionNamesPatch,
            appearOnTopPatch,
            changePackageNamePatch,
            deviceIdentityPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            alpha0HighResolutionTriggerPatch,
            microphoneInputPresetPatch,
            networkOptimizationsPatch, blueNoisePatch,
            xrCodecsSupportPatch,
            performanceBoostPatch,
            oledCalibrationPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            xrCoreRuntimePatch,
            xrDeviceConfigBaselinePatch,
            xrManifestCapabilityPackPatch,
            xrLauncherBootstrapPatch,
            xrInputRoutingConfigPatch,
            controllerVelocityFramePatch,
            surfaceVideoTriggerPatch,
        )

        val legacyRecommendedPatches = setOf(
            androidXrNativePermissionNamesPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            alpha0HighResolutionTriggerPatch,
            microphoneInputPresetPatch,
            oledCalibrationPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            xrCoreRuntimePatch,
            xrDeviceConfigBaselinePatch,
            xrInputRoutingConfigPatch,
            xrLauncherBootstrapPatch,
            xrStartupPermissionsPatch,
            xrManifestCapabilityPackPatch,
            deviceIdentityPatch, blueNoisePatch,
            xrCodecsSupportPatch,
            networkOptimizationsPatch,
            controllerVelocityFramePatch,
        )

        val nativeRecommendedPatches = setOf(
            alpha0HighResolutionTriggerPatch,
            gxrFacebridgePatch,
            microphoneInputPresetPatch,
            networkOptimizationsPatch,
            xrCodecsSupportPatch,
            blueNoisePatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            controllerVelocityFramePatch,
        )
    }
}
