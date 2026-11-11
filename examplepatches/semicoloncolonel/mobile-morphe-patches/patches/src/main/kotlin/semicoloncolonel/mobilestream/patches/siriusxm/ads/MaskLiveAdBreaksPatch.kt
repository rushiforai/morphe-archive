package semicoloncolonel.mobilestream.patches.siriusxm.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.siriusxm.shared.Constants
import semicoloncolonel.mobilestream.patches.siriusxm.shared.filterDecodedJson

// SiriusXM 2610.4.0. Commercial breaks on live talk, news, and sports
// channels are part of the broadcast audio, so they cannot be removed. But
// SiriusXM's live data marks each commercial with isAd, and the app then
// titles the now-playing item "Ad - Advertiser" (for example "Ad -
// UncommonGoods.com/Radio") in its media session, and shows ADVERTISEMENT
// in the player. LiveAdMute watches that title, which the app sets when the
// break reaches the listener, and holds the player's volume at 0 until the
// show's title returns.
//
// The advertiser's name is replaced in the live data with "(muted speaker)
// Commercial break", so the player shows "Ad - (muted speaker) Commercial
// break". The title still starts with "Ad - ", which LiveAdMute watches.
//
// The title comes through every call to the framework's
// MediaSession.setMetadata, which R8 cannot rename. Media3 keeps the names
// of ExoPlayerImpl, whose setVolume now passes through LiveAdMute.volume.

private const val LIVE_AD_MUTE = "Lsemicoloncolonel/mobilestream/extension/siriusxm/LiveAdMute;"
private const val EXOPLAYER_IMPL = "Landroidx/media3/exoplayer/ExoPlayerImpl;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

internal object MutePromosFingerprint : Fingerprint(
    definingClass = LIVE_AD_MUTE,
    name = "mutePromos",
    returnType = "Z",
)

private fun Instruction.isSetMetadata(): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL &&
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == "Landroid/media/session/MediaSession;" && it.name == "setMetadata"
        } == true

@Suppress("unused")
val maskLiveAdBreaksPatch = bytecodePatch(
    name = "Mask live ad breaks",
    description = "Mutes live channels while SiriusXM shows an ad, and turns the sound back on when the show returns. " +
        "The player shows \"Commercial break\" instead of the advertiser's name.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val mutePromos by booleanOption(
        key = "mutePromos",
        default = false,
        title = "Also mute promos and PSAs",
        description = "Also mutes SiriusXM's own channel promos and public service announcements, " +
            "which SiriusXM does not label as ads. A promo is recognized after the app has seen it once " +
            "in the channel's schedule, so the first airing of a new one can still play.",
    )

    execute {
        if (mutePromos == true) {
            MutePromosFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        filterDecodedJson("$LIVE_AD_MUTE->filterJson(Ljava/lang/String;)Ljava/lang/String;")

        val player = classDefByOrNull(EXOPLAYER_IMPL)
            ?: throw PatchException("SiriusXM: Media3's ExoPlayerImpl not found")
        val methods = player.methods.associateBy { it.name + it.parameterTypes.joinToString("") }
        if ("setVolumeF" !in methods || "setPlayWhenReadyZ" !in methods || "getApplicationLooper" !in methods) {
            throw PatchException("SiriusXM: ExoPlayerImpl methods not found")
        }
        mutableClassDefBy(EXOPLAYER_IMPL).methods.forEach { method ->
            when (method.name + method.parameterTypes.joinToString("")) {
                "setVolumeF" -> method.addInstructions(
                    0,
                    """
                        invoke-static { p0, p1 }, $LIVE_AD_MUTE->volume(Ljava/lang/Object;F)F
                        move-result p1
                    """,
                )
                "setPlayWhenReadyZ" -> method.addInstructions(
                    0,
                    "invoke-static { p0 }, $LIVE_AD_MUTE->track(Ljava/lang/Object;)V",
                )
            }
        }

        // Every MediaSession.setMetadata call outside the extension.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(EXTENSION_PACKAGE) &&
                classDef.methods.any { method -> method.implementation?.instructions?.any { it.isSetMetadata() } == true }
            ) {
                targets += classDef.type
            }
        }
        if (targets.isEmpty()) throw PatchException("SiriusXM: no MediaSession.setMetadata calls found")
        val replacement = "$LIVE_AD_MUTE->setMetadata(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V"
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    if (!instruction.isSetMetadata()) return@forEachIndexed
                    val smali = when (instruction) {
                        is FiveRegisterInstruction ->
                            "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $replacement"
                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${instruction.startRegister} .. " +
                                "v${instruction.startRegister + 1} }, $replacement"
                        else -> return@forEachIndexed
                    }
                    method.replaceInstruction(index, smali)
                }
            }
        }
    }
}
