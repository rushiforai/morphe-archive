package app.template.patches.steamlink

import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.*
import app.template.patches.steamlink.binary.*
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import app.template.patches.steamlink.identity.galaxyXrVendorDriverPatch
import app.template.patches.shared.assertPatchDescriptionContract
import com.google.gson.JsonParser
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import util.ReleaseChannel
import util.buildPatchListJson

/** These checks need only compiled declarations, never decoded APKs or stale release catalogs. */
class PatchCategoriesTest {
    private val groups = linkedMapOf(
        "Image quality" to listOf(
            xrGalaxyXrHighResolutionPatch, oledCalibrationPatch, blueNoisePatch,
            xrFovealCanvasPatch, xrAlpha0TriggerPatch,
        ),
        "Tracking & audio" to listOf(
            hmdOnlyPatch, gxrFacebridgePatch,
            xrInputRoutingConfigPatch, microphoneInputPresetPatch,
        ),
        "Startup & permissions" to listOf(
            xrStartupPermissionsPatch, xrLauncherBootstrapPatch,
            unrestrictedBatteryUsagePatch, appearOnTopPatch,
        ),
        "App & device identity" to listOf(
            changePackageNamePatch, deviceIdentityPatch,
            galaxyXrVendorDriverPatch, performanceBoostPatch,
        ),
        "Advanced XR compatibility" to listOf(
            xrCoreRuntimePatch, xrDeviceConfigBaselinePatch, xrManifestCapabilityPackPatch,
            androidXrNativePermissionNamesPatch, forceHmdInitializationGatesPatch,
            forceLobbyPermissionStateGatePatch, forceStreamXrGatesPatch,
        ),
        "Controller" to listOf(
            controllerPoseExtrapolationPatch, controllerVelocityFramePatch,
            controllerPoseTimePatch,
        ),
        "Controllers (Shizuku)" to listOf(
            controllerGripHapticsPatch, controllerHalPosePatch,
        ),
        "Streaming & network" to listOf(
            xrCodecsSupportPatch,
            networkOptimizationsPatch,
        ),
    )
    private val publicPatches: Set<Patch<*>> = groups.values.flatten().toSet()

    @Test
    fun `every public patch carries its agreed category and default`() {
        assertEquals(31, publicPatches.size)
        assertEquals(listOf(5, 4, 4, 4, 7, 3, 2, 2), groups.values.map { it.size })
        groups.forEach { (category, patches) ->
            patches.forEach { patch ->
                assertEquals(category, patch.category, patch.name)
            }
        }
        assertEquals(
            setOf(
                androidXrNativePermissionNamesPatch, forceHmdInitializationGatesPatch,
                forceLobbyPermissionStateGatePatch, forceStreamXrGatesPatch,
                gxrFacebridgePatch,
                xrGalaxyXrHighResolutionPatch, microphoneInputPresetPatch,
                oledCalibrationPatch, unrestrictedBatteryUsagePatch,
                hmdOnlyPatch, xrCoreRuntimePatch, xrDeviceConfigBaselinePatch,
                xrInputRoutingConfigPatch, xrLauncherBootstrapPatch,
                xrStartupPermissionsPatch, xrManifestCapabilityPackPatch,
                deviceIdentityPatch,
                xrCodecsSupportPatch,
                networkOptimizationsPatch, blueNoisePatch,
                controllerVelocityFramePatch,
            ),
            publicPatches.filter { it.default }.toSet(),
        )
        val visited = mutableSetOf<Patch<*>>()
        fun visit(patch: Patch<*>) {
            if (!visited.add(patch)) return
            if (patch.name == null) assertEquals(null, patch.category)
            patch.dependencies.forEach(::visit)
        }
        publicPatches.forEach(::visit)
    }

    @Test
    fun `every public description names exactly its compatible build codes`() {
        publicPatches.forEach(::assertPatchDescriptionContract)
    }

    @Test
    fun `generated catalogs carry the live categories without changing channel filtering`() {
        // Generation depends on build/tests. Testing generated entries rather than previous
        // release snapshots lets a metadata edit pass tests and then regenerate its catalogs.
        ReleaseChannel.entries.forEach { channel ->
            val generated = JsonParser.parseString(buildPatchListJson(
                "test-version", publicPatches, channel,
            )).asJsonObject
            val name = channel.name
            assertEquals(channel.name.lowercase(), generated.get("channel").asString)
            val entries = generated.getAsJsonArray("patches").map { it.asJsonObject }
            assertEquals(if (channel == ReleaseChannel.STABLE) 23 else 31, entries.size, name)
            val names = entries.map { it.get("name").asString }
            assertEquals(names.sorted(), names, name)
            assertEquals(names.size, names.toSet().size, name)
            entries.forEach { entry ->
                assertTrue(entry.get("category").asString in groups.keys, entry.get("name").asString)
                val patch = publicPatches.single { it.name == entry.get("name").asString }
                assertEquals(patch.category, entry.get("category").asString, patch.name)
                assertEquals(patch.default, entry.get("default").asBoolean, patch.name)
            }
            assertEquals(if (channel == ReleaseChannel.STABLE) 1 else 3,
                entries.count { it.get("category").asString == "Controller" }, name)
            assertEquals(if (channel == ReleaseChannel.STABLE) 0 else 2,
                entries.count { it.get("category").asString == "Controllers (Shizuku)" }, name)
        }
    }
}
