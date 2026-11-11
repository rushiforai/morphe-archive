package app.template.patches.steamlink

import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.androidXrUiExtensionPatch
import app.template.patches.steamlink.androidxr.controllerGripHapticsPatch
import app.template.patches.steamlink.androidxr.controllerHalPosePatch
import app.template.patches.steamlink.androidxr.controllerPoseExtrapolationPatch
import app.template.patches.steamlink.androidxr.controllerPoseTimePatch
import app.template.patches.steamlink.androidxr.controllerVelocityFramePatch
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.nativeQuadCompositionPatch
import app.template.patches.steamlink.androidxr.stockQuadCompositionPatch
import app.template.patches.steamlink.androidxr.unrestrictedBatteryUsagePatch
import app.template.patches.steamlink.androidxr.performanceBoostPatch
import app.template.patches.steamlink.androidxr.xrCodecsSupportPatch
import app.template.patches.steamlink.androidxr.xrCoreRuntimePatch
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch
import app.template.patches.steamlink.androidxr.xrDirectInputFixPatch
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
import app.template.patches.steamlink.identity.galaxyXrVendorDriverPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PatchCompatibilityMatrixTest {
    @Test
    fun `every pre-2363 build recommends its own set`() {
        // Network Optimizations is supported on every verified base but is no longer recommended;
        // each loaded build still dispatches to its own layout.
        val recommended = legacyRecommendedPatches
        assertEquals(20, recommended.size)
        listOf("2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244)
            .forEach { (version, code) ->
                assertEquals(recommended, recommendedFor(version, code).toSet(), "$version/$code")
                assertTrue(networkOptimizationsPatch.supports(version, code), "$version/$code")
                assertTrue(stockQuadCompositionPatch.supports(version, code), "$version/$code")
            }
        recommended.forEach { assertTrue(it.default, it.name) }
    }
    @Test
    fun `earlier native builds recommend their own set`() {
        listOf("2.0.23" to 5002363, "2.0.24" to 5002395).forEach { (version, code) ->
            assertEquals(nativeRecommendedPatches, recommendedFor(version, code).toSet(), "$version/$code")
            assertFalse(deviceIdentityPatch.supports(version, code))
            assertTrue(networkOptimizationsPatch.supports(version, code), "$version/$code")
        }
        nativeRecommendedPatches.forEach { assertTrue(it.default, it.name) }
    }

    @Test
    fun `5002527 recommends exactly the adapted set and nothing unadapted`() {
        assertEquals(
            setOf(
                gxrFacebridgePatch, // tongue only on this base
                microphoneInputPresetPatch,
                hmdOnlyPatch, // Visual Delay Fix
                xrCodecsSupportPatch,
                unrestrictedBatteryUsagePatch,
                oledCalibrationPatch,
                controllerVelocityFramePatch,
                blueNoisePatch, // fovea and background options are both default-on
            ),
            recommendedFor("2.0.24", 5002527).toSet(),
        )
        recommendedFor("2.0.24", 5002527).forEach { assertTrue(it.default, it.name) }
        assertFalse(deviceIdentityPatch.supports("2.0.24", 5002527))
        assertTrue(networkOptimizationsPatch.supports("2.0.24", 5002527))
        val blueNoiseOptions = blueNoisePatch.options.values.filter { it.default == true }
        assertEquals(2, blueNoiseOptions.size, "both blue-noise layers are on by default")
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
            "2.0.24" to 5002526,
            "2.0.24" to 5002528,
            "2.0.23" to 5002527,
            "2.0.25" to 5002527,
            "2.0.22" to 5002527,
            "2.0.20" to 5002527,
        ).forEach { (version, versionCode) ->
            assertTrue(recommendedFor(version, versionCode).isEmpty(), "$version/$versionCode")
            allIndividualPatches.forEach { patch ->
                assertFalse(patch.supports(version, versionCode), "${patch.name}: $version/$versionCode")
            }
        }
    }

    @Test
    fun `legacy base exposes every standalone patch with matching defaults`() {
        val reference = allIndividualPatches.filter { it.supports("2.0.20", 5001712) }.toSet()
        assertEquals(allIndividualPatches.toSet(), reference)
        assertEquals(29, reference.size)
        recommendedFor("2.0.20", 5001712).forEach { assertTrue(it.default, it.name) }
        (reference - legacyRecommendedPatches).forEach { patch ->
            assertFalse(patch.default, patch.name)
        }
    }

    @Test
    fun `native bases expose exactly their individual patches`() {
        val earlierNative = setOf(
            nativeQuadCompositionPatch,
            networkOptimizationsPatch,
            gxrFacebridgePatch,
            microphoneInputPresetPatch,
            blueNoisePatch,
            xrCodecsSupportPatch,
            performanceBoostPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            controllerVelocityFramePatch,
            stockQuadCompositionPatch,
            galaxyXrVendorDriverPatch,
            controllerGripHapticsPatch,
            controllerHalPosePatch,
            controllerPoseExtrapolationPatch,
            controllerPoseTimePatch,
        )
        // Only adapted patches follow the registry onto 5002527. Stock quad, OpenXR BOOST,
        // the identity driver and the legacy patches keep their old scope; Network Optimizations covers it.
        val expected5002527 = setOf(
            networkOptimizationsPatch,
            gxrFacebridgePatch,
            microphoneInputPresetPatch,
            blueNoisePatch,
            xrCodecsSupportPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            controllerVelocityFramePatch,
            controllerGripHapticsPatch,
            controllerHalPosePatch,
            controllerPoseExtrapolationPatch,
            controllerPoseTimePatch,
        )
        assertEquals(earlierNative, allIndividualPatches.filter { it.supports("2.0.23", 5002363) }.toSet())
        assertEquals(earlierNative, allIndividualPatches.filter { it.supports("2.0.24", 5002395) }.toSet())
        assertEquals(expected5002527, allIndividualPatches.filter { it.supports("2.0.24", 5002527) }.toSet())
        listOf(
            stockQuadCompositionPatch, performanceBoostPatch,
            galaxyXrVendorDriverPatch, deviceIdentityPatch,
        ).forEach { assertFalse(it.supports("2.0.24", 5002527), it.name) }
        listOf("2.0.22" to 5002322, "2.0.22" to 5002363, "2.0.23" to 5002322, "2.0.23" to 5002364,
            "2.0.24" to 5002363, "2.0.24" to 5002394)
            .forEach { (version, versionCode) ->
                allIndividualPatches.forEach { patch ->
                    assertFalse(patch.supports(version, versionCode), "${patch.name}: $version/$versionCode")
                }
            }
        assertEquals(29, allIndividualPatches.size)
        assertEquals(12, allIndividualPatches.toSet().size - earlierNative.size)
        val modernClosure = nativeRecommendedPatches.flatMap { it.dependencyClosure() }.toSet()
        assertTrue(modernClosure.intersect(allIndividualPatches.toSet() - earlierNative).isEmpty())
        val closure5002527 = recommendedFor("2.0.24", 5002527).flatMap { it.dependencyClosure() }.toSet()
        assertTrue(closure5002527.intersect(allIndividualPatches.toSet() - expected5002527).isEmpty())
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

        listOf(stockQuadCompositionPatch, gxrFacebridgePatch).forEach { patch ->
            val closure = patch.dependencyClosure()
            assertFalse(xrLauncherBootstrapPatch in closure, patch.name)
            assertFalse(xrPermissionSettingsBootstrapPatch in closure, patch.name)
            assertFalse(xrStartupPermissionsPatch in closure, patch.name)
        }
    }

    @Test
    fun `controller velocity is recommended on every supported build`() {
        supportedBuilds.forEach { (version, code) ->
            assertTrue(controllerVelocityFramePatch.supports(version, code), "$version/$code")
            assertTrue(controllerVelocityFramePatch.default)
        }
    }

    @Test
    fun `all five controller patches cover every supported build and only velocity is recommended`() {
        val controllers = listOf(
            controllerVelocityFramePatch, controllerGripHapticsPatch, controllerHalPosePatch,
            controllerPoseExtrapolationPatch, controllerPoseTimePatch,
        )
        assertEquals(5, controllers.toSet().size)
        controllers.forEach { patch ->
            supportedBuilds.forEach { (version, code) ->
                assertTrue(patch.supports(version, code), "${patch.name}: $version/$code")
            }
            assertEquals(patch === controllerVelocityFramePatch, patch.default, patch.name)
            assertTrue(patch in allIndividualPatches, "${patch.name} missing from the matrix inventory")
        }
    }

    @Test
    fun `every public patch is inventoried and registry growth cannot widen the unadapted ones`() {
        // The inventory is the 28 public patches (PatchCategoriesTest owns the category map).
        assertEquals(allIndividualPatches.size, allIndividualPatches.toSet().size)
        listOf(performanceBoostPatch, galaxyXrVendorDriverPatch).forEach { patch ->
            // Previously supported on both earlier native builds, never on 5002527.
            assertTrue(patch.supports("2.0.23", 5002363), patch.name)
            assertTrue(patch.supports("2.0.24", 5002395), patch.name)
            assertFalse(patch.supports("2.0.24", 5002527), patch.name)
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
        val supportedBuilds = listOf(
            "2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968,
            "2.0.22" to 5002244, "2.0.23" to 5002363, "2.0.24" to 5002395, "2.0.24" to 5002527,
        )

        val allIndividualPatches = listOf(
            xrStartupPermissionsPatch,
            androidXrNativePermissionNamesPatch,
            changePackageNamePatch,
            deviceIdentityPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            stockQuadCompositionPatch,
            nativeQuadCompositionPatch,
            microphoneInputPresetPatch,
            networkOptimizationsPatch,
            blueNoisePatch,
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
            controllerGripHapticsPatch,
            controllerHalPosePatch,
            controllerPoseExtrapolationPatch,
            controllerPoseTimePatch,
            galaxyXrVendorDriverPatch,
        )

        val legacyRecommendedPatches = setOf(
            androidXrNativePermissionNamesPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            stockQuadCompositionPatch,
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
            controllerVelocityFramePatch,
        )

        // 2.0.23/5002363 and 2.0.24/5002395.
        val nativeRecommendedPatches = setOf(
            stockQuadCompositionPatch,
            gxrFacebridgePatch,
            microphoneInputPresetPatch,
            xrCodecsSupportPatch,
            blueNoisePatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            controllerVelocityFramePatch,
        )
    }
}
