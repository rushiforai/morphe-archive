package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories

internal const val CONTROLLER_VELOCITY_FRAME_LIBRARY = "libgxr_controller_velocity_frame.so"
internal const val CONTROLLER_VELOCITY_FRAME_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_controller_velocity_frame.json"

private data class ControllerVelocityFrameBuild(val version: String, val versionCode: Int, val measured: Boolean)

// The layer edits no Steam Link code, but it keys on VRLink's pose action name and its angles
// depend on the controller pose offset. The legacy bases use the same action name and, with this
// repository's controller_config.json, the same offset; the angles were measured on 5002363 only.
// The bases differ in the frame VRLink reads the angular velocity in, so each group has its own
// patch that writes that frame into the library.
private val CONTROLLER_VELOCITY_FRAME_NATIVE_BUILDS = listOf(
    ControllerVelocityFrameBuild("2.0.23", 5002363, measured = true),
)
private val CONTROLLER_VELOCITY_FRAME_LEGACY_BUILDS = listOf(
    ControllerVelocityFrameBuild("2.0.20", 5001712, measured = false),
    ControllerVelocityFrameBuild("2.0.20", 5001812, measured = false),
    ControllerVelocityFrameBuild("2.0.21", 5001968, measured = false),
    ControllerVelocityFrameBuild("2.0.22", 5002244, measured = false),
)

private fun List<ControllerVelocityFrameBuild>.has(version: String, versionCode: String): Boolean =
    any { it.version == version && it.versionCode.toString() == versionCode }

internal fun isControllerVelocityFrameNativeBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_VELOCITY_FRAME_NATIVE_BUILDS.has(version, versionCode)

internal fun isControllerVelocityFrameLegacyBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_VELOCITY_FRAME_LEGACY_BUILDS.has(version, versionCode)

internal fun isControllerVelocityFrameBuild(version: String, versionCode: String): Boolean =
    isControllerVelocityFrameNativeBuild(version, versionCode) ||
        isControllerVelocityFrameLegacyBuild(version, versionCode)

internal fun controllerVelocityFrameResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

internal fun controllerVelocityFrameLibrary(angularWorld: Boolean): ByteArray =
    controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_LIBRARY)
        .withAngularVelocityFrame(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC, angularWorld)

private const val CONTROLLER_VELOCITY_FRAME_DESCRIPTION =
    "Rotates the controller velocities the Galaxy XR runtime reports into the frames SteamVR reads them in. Stock, they arrive in a frame attached to the controller, so thrown objects leave in the wrong direction. Adds an OpenXR API layer; no Steam Link code is changed."

private fun controllerVelocityFramePatchFor(
    name: String,
    baseNote: String,
    builds: List<ControllerVelocityFrameBuild>,
    angularWorld: Boolean,
) = rawResourcePatch(
    name = name,
    description = "$CONTROLLER_VELOCITY_FRAME_DESCRIPTION $baseNote",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*builds.map { build ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = "com.valvesoftware.steamlinkvr",
            targets = listOf(AppTarget(
                version = build.version,
                versionCodes = SupportedAbi.entries.associateWith { build.versionCode },
                description = "Controller velocity frame layer for exact Steam Link " +
                    "${build.version}/${build.versionCode}; " +
                    if (build.measured) "measured on a Galaxy XR headset."
                    else "measured on 2.0.23/5002363 only, not run on this base. " +
                        "Do not combine with Controller velocity fix.",
            )),
        )
    }.toTypedArray())

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (!builds.has(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }

        val library = get("lib/arm64-v8a/$CONTROLLER_VELOCITY_FRAME_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(controllerVelocityFrameLibrary(angularWorld))

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_VELOCITY_FRAME_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_MANIFEST))
    }
}

@Suppress("unused")
val controllerVelocityFramePatch = controllerVelocityFramePatchFor(
    name = "Controller velocity frame (experimental)",
    baseNote = "Steam Link 2.0.23: the angular velocity is reported local to the streamed pose, as its VRLink reads it.",
    builds = CONTROLLER_VELOCITY_FRAME_NATIVE_BUILDS,
    angularWorld = false,
)

@Suppress("unused")
val controllerVelocityFrameLegacyPatch = controllerVelocityFramePatchFor(
    name = "Controller velocity frame, 2.0.20 - 2.0.22 (experimental)",
    baseNote = "Steam Link 2.0.20 - 2.0.22: the angular velocity is reported in the base space, as their VRLink reads it.",
    builds = CONTROLLER_VELOCITY_FRAME_LEGACY_BUILDS,
    angularWorld = true,
)
