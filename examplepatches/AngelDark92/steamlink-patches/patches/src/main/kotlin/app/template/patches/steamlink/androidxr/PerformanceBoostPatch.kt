package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL_THROUGH_5002395
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel

internal const val PERFORMANCE_BOOST_LIBRARY = "libgxr_performance_boost.so"
internal const val PERFORMANCE_BOOST_MANIFEST = "XR_APILAYER_local_GalaxyXR_performance_boost.json"

private fun matchesPerformanceBoostTarget(
    compatibilities: List<Compatibility>, packageName: String, version: String, code: String,
): Boolean = compatibilities.any { compatibility ->
    compatibility.packageName == packageName && compatibility.targets.any { target ->
        target.version == version && target.versionCodes?.values?.any { it.toString() == code } == true
    }
}
// Not adapted to 2.0.24/5002527: the exact scope stays the pre-5002527 experimental list.
private val PERFORMANCE_BOOST_COMPATIBILITIES = COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL_THROUGH_5002395

internal fun isPerformanceBoostTarget(packageName: String, version: String, code: String): Boolean =
    matchesPerformanceBoostTarget(PERFORMANCE_BOOST_COMPATIBILITIES, packageName, version, code)
internal fun performanceBoostResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing performance boost resource: $name")).use { it.readBytes() }

@Suppress("unused")
val performanceBoostPatch = rawResourcePatch(
    name = "OpenXR CPU and GPU BOOST (experimental)",
    description = "Asks OpenXR for the CPU and GPU BOOST hint at session start; unsupported devices continue without it. " +
        buildLabel(PERFORMANCE_BOOST_COMPATIBILITIES),
    default = false,
) {
    category(PatchCategories.APP_AND_DEVICE_IDENTITY)
    compatibleWith(*PERFORMANCE_BOOST_COMPATIBILITIES.toTypedArray())
    execute {
        if (!matchesPerformanceBoostTarget(PERFORMANCE_BOOST_COMPATIBILITIES, packageMetadata.packageName,
                packageMetadata.versionName, packageMetadata.versionCode)) return@execute
        if (!get("lib/arm64-v8a/libopenxr_loader.so").isFile) {
            throw PatchException("OpenXR BOOST requires the ARM64 Steam Link OpenXR loader")
        }
        val payload = performanceBoostResource(PERFORMANCE_BOOST_LIBRARY)
        val manifest = performanceBoostResource(PERFORMANCE_BOOST_MANIFEST)
        val libraryFile = get("lib/arm64-v8a/$PERFORMANCE_BOOST_LIBRARY")
        val manifestFile = get("assets/openxr/1/api_layers/implicit.d/$PERFORMANCE_BOOST_MANIFEST")
        libraryFile.parentFile!!.mkdirs(); manifestFile.parentFile!!.mkdirs()
        libraryFile.writeBytes(payload); manifestFile.writeBytes(manifest)
    }
}
