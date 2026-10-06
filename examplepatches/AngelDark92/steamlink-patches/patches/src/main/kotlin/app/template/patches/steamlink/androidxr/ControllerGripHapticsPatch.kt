package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import app.template.patches.shared.PatchCategories

internal const val CONTROLLER_GRIP_HAPTICS_LIBRARY = "libgxr_haptic_main.so"
internal const val CONTROLLER_GRIP_HAPTICS_MANIFEST = "XR_APILAYER_local_GalaxyXR_haptic_main.json"
internal const val CONTROLLER_GRIP_HAPTICS_EXTENSION = "extensions/controller-grip-haptics.mpe"

// The layer hooks only xrApplyHapticFeedback/xrStopHapticFeedback, which every supported base
// calls the same way, so it is not tied to one native layout.
internal fun isControllerGripHapticsBuild(version: String, versionCode: String): Boolean =
    isShizukuBridgeBuild(version, versionCode)

internal fun controllerGripHapticsResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/$name")
        ?: throw PatchException("Missing bundled resource: $name"))
        .use { it.readBytes() }

// gxr.haptic.*; no fragment of an existing Steam Link class.
private val controllerGripHapticsExtensionPatch = bytecodePatch {
    extendWith(CONTROLLER_GRIP_HAPTICS_EXTENSION)
}

@Suppress("unused")
val controllerGripHapticsPatch = rawResourcePatch(
    name = "Controller grip haptics through Shizuku (experimental)",
    description = "Sends controller vibration to the vibrator in the grip instead of the one at the trigger. Galaxy XR routes every OpenXR vibration to the trigger vibrator; the grip one is reachable only with shell rights, so this needs Shizuku running and its permission granted to Steam Link. Without Shizuku vibration stays as it is.",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.toTypedArray())
    dependsOn(
        shizukuBridgeExtensionPatch,
        shizukuBridgeManifestPatch,
        controllerGripHapticsExtensionPatch,
    )

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (!isControllerGripHapticsBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }

        val library = get("lib/arm64-v8a/$CONTROLLER_GRIP_HAPTICS_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY"),
        )

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_GRIP_HAPTICS_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_MANIFEST"),
        )
    }
}
