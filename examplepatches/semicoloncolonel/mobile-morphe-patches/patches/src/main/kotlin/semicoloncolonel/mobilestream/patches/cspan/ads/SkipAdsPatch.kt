package semicoloncolonel.mobilestream.patches.cspan.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cspan.shared.Constants

// C-SPAN Now 1.25.0. Archive and on-demand videos get their pre-roll from
// ExoPlayer: the app's playlist data source builds each HLS media item with an
// AdsConfiguration holding its ad-tag URL (the ad_tag_url string), and
// ExoPlayer's media source factory wraps any item that has one in an ad
// source that plays the IMA pre-roll first. The data source now hands the
// media item no AdsConfiguration, so the video is never wrapped and plays
// directly. No ad is requested, so the player never waits on one.
//
// Live-channel ads are stitched into the stream server-side (Google DAI) and
// cannot be removed here.

private fun Instruction.directCall(): MethodReference? {
    if (opcode != Opcode.INVOKE_DIRECT && opcode != Opcode.INVOKE_DIRECT_RANGE) return null
    return (this as? ReferenceInstruction)?.reference as? MethodReference
}

// ExoPlayer is obfuscated here, so its classes are found by shape.
// MediaItem.LocalConfiguration's constructor is
// (Uri, String mimeType, DrmConfiguration, AdsConfiguration, List streamKeys,
//  String customCacheKey, ImmutableList subtitles, Object tag), so its fourth
// parameter names the AdsConfiguration class.
private fun MethodReference.adsConfigurationOfLocalConfiguration(): String? {
    if (name != "<init>") return null
    val p = parameterTypes.map { it.toString() }
    if (p.size != 8) return null
    if (p[0] != "Landroid/net/Uri;" || p[1] != "Ljava/lang/String;" ||
        p[4] != "Ljava/util/List;" || p[7] != "Ljava/lang/Object;"
    ) return null
    return p[3]
}

private fun Method.adsConfigurationType(): String? =
    implementation?.instructions?.firstNotNullOfOrNull { it.directCall()?.adsConfigurationOfLocalConfiguration() }

// The AdsConfiguration(Builder) constructor call for that class.
private fun Instruction.isAdsConfigurationInit(adsType: String): Boolean {
    val call = directCall() ?: return false
    return call.definingClass == adsType && call.name == "<init>" &&
        call.parameterTypes.singleOrNull()?.toString() == adsType.removeSuffix(";") + "\$a;"
}

// PlaylistM3uDataSource.createMediaItem: builds an HLS media item (the
// "application/x-mpegURL" MIME type) together with its AdsConfiguration.
internal object CreateMediaItemFingerprint : Fingerprint(
    strings = listOf("application/x-mpegURL"),
    custom = { method, _ ->
        val adsType = method.adsConfigurationType()
        adsType != null && method.implementation!!.instructions.any { it.isAdsConfigurationInit(adsType) }
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the pre-roll ads before archive and on-demand videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        CreateMediaItemFingerprint.method.apply {
            val adsType = adsConfigurationType() ?: throw PatchException("LocalConfiguration not found")
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst { it.isAdsConfigurationInit(adsType) }
            if (index < 0) throw PatchException("AdsConfiguration constructor not found")
            val register = when (val call = instructions[index]) {
                is FiveRegisterInstruction -> call.registerC
                is RegisterRangeInstruction -> call.startRegister
                else -> throw PatchException("Unexpected AdsConfiguration call")
            }
            // Right after the object is built, replace it with null, so the
            // media item is created without an AdsConfiguration.
            addInstruction(index + 1, "const/16 v$register, 0x0")
        }
    }
}
