package semicoloncolonel.mobilestream.patches.primevideotv.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.primevideotv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Force highest quality (OPT-IN, default OFF, experimental).
//
// Prime Video picks the video rendition from what the device reports it can
// decode. The media pipeline queries each codec and resolution through the
// native device layer and gets back a CodecQueryResult(isSupported,
// isHardwareAccelerated, isSmooth); a rendition whose query is not supported or
// not smooth is dropped, so the app can settle below the panel's real
// capability. The three fields are forced true in the result's constructor, so
// every queried rendition is treated as fully decodable and the app offers the
// highest stream.
//
// EXPERIMENTAL: on a device that genuinely cannot decode the top rendition
// (for example a 1080p box asked to play 4K), forcing isSupported true can make
// playback stutter or fail. Intended for a capable 4K/HDR device.
//
// The class name is public API (not renamed per build), so it is matched by
// descriptor.
// ─────────────────────────────────────────────────────────────────────────────

private const val CODEC_QUERY_RESULT =
    "Lcom/amazon/avod/mpb/api/query/CodecQueryResult;"

@Suppress("unused")
val forceHighestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Reports every video quality as fully supported, so the app streams the " +
        "highest available. Experimental: can stutter or fail on a device that cannot decode " +
        "the top quality.",
    default = false,
) {
    category("Video")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val clazz = classDefByOrNull(CODEC_QUERY_RESULT)
            ?: throw PatchException("CodecQueryResult not found")

        // CodecQueryResult(boolean isSupported, boolean isHardwareAccelerated,
        // boolean isSmooth): the three params (p1,p2,p3 = v1,v2,v3) are stored
        // into fields a, b, c. Force each to true before the stores. The super()
        // call uses only v0, so setting v1..v3 at the top is safe.
        val constructor = mutableClassDefBy(CODEC_QUERY_RESULT).methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map { it.toString() } == listOf("Z", "Z", "Z") &&
                method.implementation != null
        } ?: throw PatchException("CodecQueryResult(ZZZ) constructor not found")

        constructor.addInstructions(
            0,
            """
                const/4 v1, 0x1
                const/4 v2, 0x1
                const/4 v3, 0x1
            """.trimIndent(),
        )
    }
}
