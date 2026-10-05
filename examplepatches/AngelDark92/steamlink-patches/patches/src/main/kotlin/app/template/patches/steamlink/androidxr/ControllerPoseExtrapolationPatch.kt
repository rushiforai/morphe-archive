package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories

internal const val CONTROLLER_EXTRAPOLATION_LIBRARY = "libgxr_controller_extrapolation.so"
internal const val CONTROLLER_EXTRAPOLATION_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_controller_extrapolation.json"

private data class ControllerExtrapolationBuild(val version: String, val versionCode: Int, val measured: Boolean)

// The layer edits no Steam Link code and hooks only the runtime's own library, so it does not
// depend on the base. Its effect was measured on 5002363 only.
private val CONTROLLER_EXTRAPOLATION_BUILDS = listOf(
    ControllerExtrapolationBuild("2.0.20", 5001712, measured = false),
    ControllerExtrapolationBuild("2.0.20", 5001812, measured = false),
    ControllerExtrapolationBuild("2.0.21", 5001968, measured = false),
    ControllerExtrapolationBuild("2.0.22", 5002244, measured = false),
    ControllerExtrapolationBuild("2.0.23", 5002363, measured = true),
)

internal fun isControllerExtrapolationBuild(version: String, versionCode: String): Boolean =
    CONTROLLER_EXTRAPOLATION_BUILDS.any {
        it.version == version && it.versionCode.toString() == versionCode
    }

internal fun controllerExtrapolationResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

@Suppress("unused")
val controllerPoseExtrapolationPatch = rawResourcePatch(
    name = "Controller pose extrapolation (experimental)",
    description = "Makes the Galaxy XR runtime extrapolate controller poses to the time VRLink requests. Stock, the runtime returns one controller sample per display frame, so 3 of VRLink's 4 pose sends per frame repeat it. Adds an OpenXR API layer; no Steam Link code is changed.",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*CONTROLLER_EXTRAPOLATION_BUILDS.map { build ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = "com.valvesoftware.steamlinkvr",
            targets = listOf(AppTarget(
                version = build.version,
                versionCodes = SupportedAbi.entries.associateWith { build.versionCode },
                description = "Controller pose extrapolation layer for exact Steam Link " +
                    "${build.version}/${build.versionCode}; " +
                    if (build.measured) "measured on a Galaxy XR headset."
                    else "measured on 2.0.23/5002363 only, not run on this base.",
            )),
        )
    }.toTypedArray())

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (!isControllerExtrapolationBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }

        val library = get("lib/arm64-v8a/$CONTROLLER_EXTRAPOLATION_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(controllerExtrapolationResource(CONTROLLER_EXTRAPOLATION_LIBRARY))

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_EXTRAPOLATION_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(controllerExtrapolationResource(CONTROLLER_EXTRAPOLATION_MANIFEST))
    }
}
