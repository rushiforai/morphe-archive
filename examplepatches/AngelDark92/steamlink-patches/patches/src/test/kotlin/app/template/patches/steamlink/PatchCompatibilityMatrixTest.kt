package app.template.patches.steamlink

import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.appearOnTopPatch
import app.template.patches.steamlink.androidxr.androidXrUiExtensionPatch
import app.template.patches.steamlink.androidxr.controllerVelocityPatch
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.gxrModernTongueBridgePatch
import app.template.patches.steamlink.androidxr.unrestrictedBatteryUsagePatch
import app.template.patches.steamlink.androidxr.xrCoreRuntimePatch
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch
import app.template.patches.steamlink.androidxr.xrDirectInputFixPatch
import app.template.patches.steamlink.androidxr.xrGalaxyXrHighResolutionPatch
import app.template.patches.steamlink.androidxr.xrInputRoutingConfigPatch
import app.template.patches.steamlink.androidxr.xrLauncherBootstrapPatch
import app.template.patches.steamlink.androidxr.xrManifestCapabilityPackPatch
import app.template.patches.steamlink.androidxr.xrPermissionSettingsBootstrapPatch
import app.template.patches.steamlink.androidxr.xrStartupPermissionsPatch
import app.template.patches.steamlink.binary.androidXrNativePermissionNamesPatch
import app.template.patches.steamlink.binary.forceHmdInitializationGatesPatch
import app.template.patches.steamlink.binary.forceLobbyPermissionStateGatePatch
import app.template.patches.steamlink.binary.forceStreamXrGatesPatch
import app.template.patches.steamlink.binary.hmdOnlyPatch
import app.template.patches.steamlink.binary.microphoneInputPresetPatch
import app.template.patches.steamlink.binary.oledCalibrationPatch
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PatchCompatibilityMatrixTest {
    @Test
    fun individual_patches_are_not_globally_recommended() {
        allIndividualPatches.forEach { patch ->
            assertFalse(patch.default, patch.name)
        }
        recommendedBundles.forEach { patch ->
            assertTrue(patch.default, patch.name)
            assertTrue(oledCalibrationPatch in patch.dependencyClosure(), patch.name)
            assertEquals("srgb8-highp", oledCalibrationPatch.options["outputPrecision"].default)
            assertEquals("off", oledCalibrationPatch.options["dithering"].default)
        }
        assertEquals("Appear on top (legacy)", appearOnTopPatch.name)
        assertEquals("GXR face bridge (version 5002318 and below)", gxrFacebridgePatch.name)
        assertEquals("GXR tongue bridge (version 5002322 and above)", gxrModernTongueBridgePatch.name)
    }

    @Test
    fun exact_builds_select_one_recommendation_bundle() {
        assertEquals(
            listOf(galaxyXrRecommended5001712Patch),
            recommendedFor("2.0.20", 5001712),
        )
        assertEquals(
            listOf(galaxyXrRecommended5002322Patch),
            recommendedFor("2.0.22", 5002322),
        )
        assertEquals(
            listOf(galaxyXrRecommended5002363Patch),
            recommendedFor("2.0.23", 5002363),
        )
        assertEquals(
            listOf(galaxyXrRecommended5002318Patch),
            recommendedFor("2.0.22", 5002318),
        )
        listOf(
            "2.0.20" to 5001740,
            "2.0.22" to 5002244,
        ).forEach { (version, versionCode) ->
            assertEquals(
                listOf(galaxyXrLegacyFoundationPatch),
                recommendedFor(version, versionCode),
                "$version/$versionCode",
            )
        }
        listOf(5002296, 5002313).forEach { versionCode ->
            assertTrue(recommendedFor("2.0.22", versionCode).isEmpty(), "$versionCode")
        }
        assertTrue(recommendedFor("2.0.22", 5002243).isEmpty())
        assertTrue(recommendedFor("2.0.20", 5002322).isEmpty())
        listOf("2.0.22" to 5002363, "2.0.23" to 5002322, "2.0.23" to 5002364)
            .forEach { (version, versionCode) ->
                assertTrue(recommendedFor(version, versionCode).isEmpty(), "$version/$versionCode")
            }
    }

    @Test
    fun modern_bundles_contain_only_the_requested_six_patches() {
        listOf(galaxyXrRecommended5002322Patch, galaxyXrRecommended5002363Patch).forEach { bundle ->
            assertEquals(
                setOf(
                    xrGalaxyXrHighResolutionPatch,
                    gxrModernTongueBridgePatch,
                    microphoneInputPresetPatch,
                    unrestrictedBatteryUsagePatch,
                    hmdOnlyPatch,
                    oledCalibrationPatch,
                ),
                bundle.dependencies.toSet(),
            )
            assertFalse(deviceIdentityPatch in bundle.dependencyClosure())
            listOf(
                forceHmdInitializationGatesPatch,
                forceLobbyPermissionStateGatePatch,
                forceStreamXrGatesPatch,
                xrLauncherBootstrapPatch,
                xrStartupPermissionsPatch,
            ).forEach { patch ->
                assertFalse(patch in bundle.dependencyClosure(), "${bundle.name}: ${patch.name}")
            }
        }
        assertTrue(oledCalibrationPatch.supports("2.0.22", 5002322))
        assertEquals("voice-recognition", microphoneInputPresetPatch.options["preset"].default)
        assertEquals(60, hmdOnlyPatch.options["offsetMs"].default)
        assertEquals("final-balanced", oledCalibrationPatch.options["profile"].default)
        assertEquals("off", oledCalibrationPatch.options["dithering"].default)
        assertEquals("srgb8-highp", oledCalibrationPatch.options["outputPrecision"].default)
        assertFalse(deviceIdentityPatch in galaxyXrRecommended5002322Patch.dependencyClosure())
        assertTrue(deviceIdentityPatch.supports("2.0.22", 5002322))
        assertFalse(deviceIdentityPatch.supports("2.0.20", 5002322))
        assertFalse(deviceIdentityPatch.default)
        assertFalse(gxrFacebridgePatch.supports("2.0.22", 5002322))
        assertTrue(gxrModernTongueBridgePatch.supports("2.0.22", 5002322))
        listOf(forceHmdInitializationGatesPatch, forceLobbyPermissionStateGatePatch, forceStreamXrGatesPatch)
            .forEach { assertFalse(it in galaxyXrRecommended5002322Patch.dependencyClosure()) }
        listOf(
            xrLauncherBootstrapPatch,
            xrStartupPermissionsPatch,
        ).forEach { patch ->
            assertFalse(patch in galaxyXrRecommended5002322Patch.dependencyClosure(), patch.name)
        }
    }

    @Test
    fun new_native_base_exposes_exactly_seven_individual_patches_and_no_legacy_mutations() {
        val expected = setOf(
            xrGalaxyXrHighResolutionPatch,
            gxrModernTongueBridgePatch,
            microphoneInputPresetPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            oledCalibrationPatch,
            deviceIdentityPatch,
        )
        assertEquals(expected, allIndividualPatches.filter { it.supports("2.0.23", 5002363) }.toSet())
        assertEquals(expected, allIndividualPatches.filter { it.supports("2.0.22", 5002322) }.toSet())
        listOf("2.0.22" to 5002363, "2.0.23" to 5002322, "2.0.23" to 5002364)
            .forEach { (version, versionCode) ->
                allIndividualPatches.forEach { patch ->
                    assertFalse(patch.supports(version, versionCode), "${patch.name}: $version/$versionCode")
                }
            }
        val excludedPublicPatches = allIndividualPatches.toSet() - expected
        assertEquals(14, excludedPublicPatches.size)
        assertTrue(
            galaxyXrRecommended5002363Patch.dependencyClosure().intersect(excludedPublicPatches).isEmpty(),
        )
    }

    @Test
    fun previous_native_bundle_preserves_the_verified_safe_set() {
        assertEquals(
            setOf(
                xrGalaxyXrHighResolutionPatch,
                gxrFacebridgePatch,
                microphoneInputPresetPatch,
                unrestrictedBatteryUsagePatch,
                hmdOnlyPatch,
                oledCalibrationPatch,
                deviceIdentityPatch,
                xrLauncherBootstrapPatch,
                xrStartupPermissionsPatch,
            ),
            galaxyXrRecommended5002318Patch.dependencies.toSet(),
        )
        (legacyFoundationPatches - deviceIdentityPatch - xrLauncherBootstrapPatch).forEach { patch ->
            assertFalse(patch.supports("2.0.22", 5002318), patch.name)
        }
        assertTrue(appearOnTopPatch.supports("2.0.22", 5002318))
        assertFalse(appearOnTopPatch.supports("2.0.22", 5002322))
        assertTrue(gxrFacebridgePatch.supports("2.0.22", 5002318))
        assertFalse(gxrModernTongueBridgePatch.supports("2.0.22", 5002318))
    }

    @Test
    fun both_legacy_bundles_preserve_startup_behavior_through_explicit_patches() {
        val expected = setOf(
            androidXrNativePermissionNamesPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            xrGalaxyXrHighResolutionPatch,
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
            deviceIdentityPatch,
        )
        listOf(galaxyXrRecommended5001712Patch, galaxyXrLegacyFoundationPatch).forEach { bundle ->
            assertEquals(expected, bundle.dependencies.toSet(), bundle.name)
            val closure = bundle.dependencyClosure()
            listOf(appearOnTopPatch, changePackageNamePatch, controllerVelocityPatch)
                .forEach { assertFalse(it in closure, "${bundle.name} unexpectedly includes ${it.name}") }
        }
        assertFalse(forceHmdInitializationGatesPatch.default)
        assertFalse(forceLobbyPermissionStateGatePatch.default)
        assertFalse(forceStreamXrGatesPatch.default)
        assertFalse(controllerVelocityPatch.default)
        assertFalse(changePackageNamePatch.default)
        assertFalse(appearOnTopPatch.default)
    }

    @Test
    fun previous_verified_compatibility_is_preserved() {
        listOf(5002244, 5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertTrue(xrGalaxyXrHighResolutionPatch.supports("2.0.22", versionCode), "$versionCode")
        }
        assertTrue(xrGalaxyXrHighResolutionPatch.supports("2.0.20", 5001712))
        assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.20", 5001740))
        assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.22", 5001712))
        assertFalse(xrGalaxyXrHighResolutionPatch.supports("2.0.22", 5002243))

        val legacyCommon = listOf(
            deviceIdentityPatch,
            microphoneInputPresetPatch,
            oledCalibrationPatch,
            gxrFacebridgePatch,
            unrestrictedBatteryUsagePatch,
        )
        listOf(5001712, 5001740).forEach { versionCode ->
            legacyCommon.forEach { patch ->
                assertTrue(patch.supports("2.0.20", versionCode), "${patch.name} on $versionCode")
            }
        }
        legacyCommon.forEach { patch ->
            assertTrue(patch.supports("2.0.22", 5002313), patch.name)
        }
        assertTrue(hmdOnlyPatch.supports("2.0.20", 5001712))
        assertTrue(hmdOnlyPatch.supports("2.0.20", 5001740))
        listOf(5002244, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertTrue(hmdOnlyPatch.supports("2.0.22", versionCode), "$versionCode")
        }
    }

    @Test
    fun recursive_foundation_dependencies_remain_wired_and_guarded() {
        val identityClosure = deviceIdentityPatch.dependencyClosure()
        assertTrue(xrDeviceConfigBaselinePatch in identityClosure)
        assertTrue(xrCoreRuntimePatch in identityClosure)
        assertTrue(androidXrUiExtensionPatch in identityClosure)
        assertTrue(xrDirectInputFixPatch in identityClosure)

        val routingClosure = xrInputRoutingConfigPatch.dependencyClosure()
        assertFalse(xrLauncherBootstrapPatch in routingClosure)
        assertTrue(xrManifestCapabilityPackPatch in routingClosure)
        assertTrue(xrCoreRuntimePatch in routingClosure)

        listOf(xrGalaxyXrHighResolutionPatch, gxrFacebridgePatch, gxrModernTongueBridgePatch).forEach { patch ->
            val closure = patch.dependencyClosure()
            assertFalse(xrLauncherBootstrapPatch in closure, patch.name)
            assertFalse(xrPermissionSettingsBootstrapPatch in closure, patch.name)
            assertFalse(xrStartupPermissionsPatch in closure, patch.name)
        }
    }

    private fun recommendedFor(version: String, versionCode: Int): List<Patch<*>> =
        recommendedBundles.filter { patch ->
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
        val recommendedBundles = listOf(
            galaxyXrRecommended5001712Patch,
            galaxyXrRecommended5002322Patch,
            galaxyXrRecommended5002363Patch,
            galaxyXrRecommended5002318Patch,
            galaxyXrLegacyFoundationPatch,
        )

        val legacyFoundationPatches = listOf(
            androidXrNativePermissionNamesPatch,
            deviceIdentityPatch,
            xrCoreRuntimePatch,
            xrDeviceConfigBaselinePatch,
            xrManifestCapabilityPackPatch,
            xrLauncherBootstrapPatch,
            xrInputRoutingConfigPatch,
        )

        val allIndividualPatches = listOf(
            xrStartupPermissionsPatch,
            androidXrNativePermissionNamesPatch,
            appearOnTopPatch,
            changePackageNamePatch,
            controllerVelocityPatch,
            deviceIdentityPatch,
            forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch,
            forceStreamXrGatesPatch,
            gxrFacebridgePatch,
            gxrModernTongueBridgePatch,
            xrGalaxyXrHighResolutionPatch,
            microphoneInputPresetPatch,
            oledCalibrationPatch,
            unrestrictedBatteryUsagePatch,
            hmdOnlyPatch,
            xrCoreRuntimePatch,
            xrDeviceConfigBaselinePatch,
            xrManifestCapabilityPackPatch,
            xrLauncherBootstrapPatch,
            xrInputRoutingConfigPatch,
        )
    }
}
