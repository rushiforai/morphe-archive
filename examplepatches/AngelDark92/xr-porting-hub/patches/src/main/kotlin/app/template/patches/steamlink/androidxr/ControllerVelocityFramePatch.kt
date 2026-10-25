package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel

internal const val CONTROLLER_VELOCITY_FRAME_LIBRARY = "libgxr_controller_velocity_frame.so"
internal const val CONTROLLER_VELOCITY_FRAME_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_controller_velocity_frame.json"

private data class ControllerVelocityFrameBuild(
    val version: String,
    val versionCode: Int,
    val angularWorld: Boolean,
)

// The layer edits no Steam Link code, but it keys on VRLink's pose action name and its angles
// depend on the controller pose offset. Both bases use the same action name and, with this
// repository's controller_config.json, the same offset; the angles were measured on 5002363 only.
// One patch covers both bases; the angular-velocity frame written into the bundled layer differs
// per build (2.0.23: the streamed-pose frame; 2.0.20/5001712: the base-space frame). Because the
// 2.0.23 layer already reports the angular velocity local to the streamed pose, no separate
// world-to-local adapter is needed on that base.
private val CONTROLLER_VELOCITY_FRAME_BUILDS = listOf(
    ControllerVelocityFrameBuild("2.0.23", 5002363, angularWorld = false),
    ControllerVelocityFrameBuild("2.0.24", 5002395, angularWorld = false),
    ControllerVelocityFrameBuild("2.0.20", 5001712, angularWorld = true),
    ControllerVelocityFrameBuild("2.0.20", 5001812, angularWorld = true),
    ControllerVelocityFrameBuild("2.0.21", 5001968, angularWorld = true),
    ControllerVelocityFrameBuild("2.0.22", 5002244, angularWorld = true),
)

private fun List<ControllerVelocityFrameBuild>.has(version: String, versionCode: String): Boolean =
    any { it.version == version && it.versionCode.toString() == versionCode }

internal fun isControllerVelocityFrameNativeBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_VELOCITY_FRAME_BUILDS.filter { !it.angularWorld }.has(version, versionCode)

internal fun isControllerVelocityFrameLegacyBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_VELOCITY_FRAME_BUILDS.filter { it.angularWorld }.has(version, versionCode)

internal fun isControllerVelocityFrameBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_VELOCITY_FRAME_BUILDS.has(version, versionCode)

internal fun controllerVelocityFrameResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

internal fun controllerVelocityFrameLibrary(angularWorld: Boolean): ByteArray =
    controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_LIBRARY)
        .withAngularVelocityFrame(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC, angularWorld)

private const val CONTROLLER_VELOCITY_FRAME_DESCRIPTION =
    "Fixes thrown-object directions by rotating controller speeds into the frame SteamVR expects."

@Suppress("unused")
val controllerVelocityFramePatch = rawResourcePatch(
    name = "Controller velocity frame",
    description = "$CONTROLLER_VELOCITY_FRAME_DESCRIPTION " +
        buildLabel(COMPATIBILITIES_STEAM_LINK) +
        " Angular velocity is local to the streamed pose on 2.0.23/5002363 and in the base space on older builds; measured on 2.0.23/5002363. " +
        STEAM_LINK_CONTROLLER_CREDIT,
    default = true,
) {
    category(PatchCategories.CONTROLLER)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        val build = CONTROLLER_VELOCITY_FRAME_BUILDS.singleOrNull {
            it.version == packageMetadata.versionName &&
                it.versionCode.toString() == packageMetadata.versionCode
        } ?: return@execute

        val library = get("lib/arm64-v8a/$CONTROLLER_VELOCITY_FRAME_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(controllerVelocityFrameLibrary(build.angularWorld))

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_VELOCITY_FRAME_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_MANIFEST))
    }
}
