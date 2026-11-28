package semicoloncolonel.mobilestream.patches.hbomax.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Force decode capability (OPT-IN, default OFF, experimental).
//
// The dual to Video quality. Video quality overrides which rendition the player
// PICKS; this overrides which renditions the player believes it CAN decode,
// before selection ever sees them. A device that can play 4K but reports a codec
// as not supported at that size and frame rate (or not at all) never requests
// the 4K rendition, so the app serves a lower one even though the panel and
// decoder are capable.
//
// Media3 decides decodability in MediaCodecInfo:
//   isVideoSizeAndRateSupportedV21(width, height, frameRate) — can this codec do
//     this size at this rate (the performance-point / "smooth" gate). The common
//     soft cap. SAFE: forced true, so every size and rate is accepted while the
//     codec, profile, and mime checks stay honest.
//   isFormatSupported(Context, Format) — the full per-format check. AGGRESSIVE
//     (option): forced true, so every format is treated as decodable.
//
// EXPERIMENTAL: forcing a format the device genuinely cannot decode makes
// playback stutter or fail. Safe mode keeps the hard checks, so it is the one to
// try first. Aggressive is for a device that under-reports even codec support.
// Pair with Video quality set to 2160p.
// ─────────────────────────────────────────────────────────────────────────────

private const val MEDIACODEC_INFO = "Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;"

internal object VideoSizeAndRateSupportedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == MEDIACODEC_INFO &&
            method.name == "isVideoSizeAndRateSupportedV21" &&
            method.returnType == "Z"
    },
)

internal object IsFormatSupportedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == MEDIACODEC_INFO &&
            method.name == "isFormatSupported" &&
            method.returnType == "Z" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes.first().toString() == "Landroid/content/Context;"
    },
)

@Suppress("unused")
val forceDecodeCapabilityPatch = bytecodePatch(
    name = "Force decode capability (experimental)",
    description = "Reports video as decodable at every size and frame rate, so the app can " +
        "request the highest rendition. Experimental: can stutter or fail on a device that " +
        "cannot decode it. Pair with Video quality set to 2160p.",
    default = false,
) {
    category("Playback")
    // Phone only: the Android TV build ships a different media3 whose
    // MediaCodecInfo capability methods are not present, so there is nothing to
    // force there. The TV build reaches 4K through Video quality (track
    // selection) instead.
    compatibleWith(Constants.PHONE_COMPATIBILITY, Constants.STREAM_PHONE_COMPATIBILITY)

    val aggressive by booleanOption(
        key = "aggressive",
        default = false,
        title = "Aggressive",
        description = "Also report every format as fully supported, not just its size and frame " +
            "rate. Only for a device that under-reports codec support; more likely to break " +
            "playback.",
    )

    execute {
        val returnTrue = "const/4 v0, 0x1\nreturn v0"
        var patched = 0

        // SAFE: the size/rate performance gate always allows the rendition.
        // methodOrNull so a build that inlines or renames it is skipped, not a
        // hard failure that aborts every other HBO Max patch.
        VideoSizeAndRateSupportedFingerprint.methodOrNull?.apply {
            addInstructions(0, returnTrue)
            patched++
        }

        // AGGRESSIVE: the full per-format check always passes.
        if (aggressive == true) {
            IsFormatSupportedFingerprint.methodOrNull?.apply {
                addInstructions(0, returnTrue)
                patched++
            }
        }

        if (patched == 0) {
            throw app.morphe.patcher.patch.PatchException(
                "No MediaCodecInfo capability method found to force; this build may not be supported.",
            )
        }
    }
}
