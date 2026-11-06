package app.template.patches.mubi.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags

// Bias MUBI's adaptive bitrate selection toward the highest rendition.
//
// MUBI exposes a "maximum resolution" preference but no minimum-quality floor;
// users on good connections still report the player dropping to ~480p. The
// player is ExoPlayer/Media3, whose ABR decisions are driven by
// DefaultBandwidthMeter.getBitrateEstimate().
//
// This patch rewrites that getter in both known package layouts to report a
// 1 Gbps link:
//
//   com.google.android.exoplayer2.upstream.DefaultBandwidthMeter   (ExoPlayer 2)
//   androidx.media3.exoplayer.upstream.DefaultBandwidthMeter       (Media3)
//
// Consequences:
//   • ABR will usually start and stay on the top rendition MUBI serves.
//   • On a genuinely slow link this trades quality for more buffering, so the
//     patch is opt-in (default = false).
//   • It cannot exceed what the server/licence allows: if MUBI caps a title at
//     720p for a device or account, this patch will not raise that cap.
//
// Fail-safe: if MUBI uses a custom bandwidth meter, or the getter has fewer
// than two local registers to hold a long, the patch skips that class and the
// app keeps stock behavior.

private val BANDWIDTH_METER_CLASSES = listOf(
    "Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;",
    "Landroidx/media3/exoplayer/upstream/DefaultBandwidthMeter;",
)

// 1 Gbps, as a smali long literal.
private const val SPOOFED_BITRATE_SMALI = "const-wide v0, 0x3B9ACA00L\nreturn-wide v0"

@Suppress("unused")
val mubiForceHighestQualityPatch = bytecodePatch(
    name = "Force highest video quality",
    description = "Reports a 1 Gbps connection to ExoPlayer/Media3 so MUBI picks the " +
        "highest available rendition instead of downshifting. May increase data use " +
        "and buffering on slow connections; server-side caps still apply.",
    default = false,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        BANDWIDTH_METER_CLASSES.forEach { className ->
            val bandwidthMeter = mutableClassDefByOrNull(className) ?: return@forEach

            bandwidthMeter.methods
                .filter { method ->
                    method.name == "getBitrateEstimate" &&
                        method.returnType == "J" &&
                        method.parameterTypes.isEmpty()
                }
                .forEach methodLoop@ { method ->
                    val implementation = method.implementation ?: return@methodLoop

                    val isStatic = method.accessFlags and AccessFlags.STATIC.value != 0
                    val parameterRegisterCount =
                        method.parameterTypes.size + if (isStatic) 0 else 1

                    // return-wide needs a two-register local pair (v0/v1).
                    if (implementation.registerCount - parameterRegisterCount < 2) {
                        return@methodLoop
                    }

                    method.clearBody()
                    method.addInstructions(0, SPOOFED_BITRATE_SMALI)
                }
        }
    }
}
