/*
 * Ported from ajstrick81's Pluto TV Android TV "Mask live ad breaks" patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/pluto/ads
 * ALL CREDIT FOR THE ORIGINAL DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.pluto.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants

private const val LIVE_MASK = "Lsemicoloncolonel/mobilestream/extension/pluto/ads/PlutoLiveMask;"

// The ad detector: Pluto's ID3Tag model (sr8 in 17.2.0). The TV patch hooks
// ID3AdsBeaconTracker.consumeID3; on the phone the tag passes through several
// renamed trackers, so the patch hooks where every tag is created instead.
// One parser builds them, and only for ad ID3 frames.
internal object Id3TagToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    strings = listOf("ID3Tag(creativeId="),
    custom = { method, _ -> method.name == "toString" }
)

// The cover hosts: on-demand plays in VideoPlayerActivity, live TV plays
// inline in MainActivity (17.2.0 on-device: the live break showed the mask's
// "no player activity" warning while MainActivity was in front).
private val PLAYER_HOSTS = listOf(
    "Lcom/paramount/android/pplus/player/mobile/integration/ui/VideoPlayerActivity;",
    "Lcom/cbs/app/screens/main/MainActivity;",
)

@Suppress("unused")
val maskLiveAdsPatch = bytecodePatch(
    name = "Mask live ad breaks (black screen + mute)",
    description = "Live TV ads are part of the broadcast and cannot be cut out. During a live " +
        "break this covers the video with a black screen and mutes the audio, then restores " +
        "both when the show returns. Detection uses Pluto's own ad tags, which appear only " +
        "while an ad plays. To turn it off without re-patching, create a file named slate_off " +
        "in Android/data/tv.pluto.android/files; a file named pluto_slate_mode containing " +
        "black or mute picks cover-only or mute-only.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // 1) Every ad tag is a tick. Call the helper with the finished tag
        //    (p0) before each return in the constructor, after the fields
        //    are set, so the helper can read the ad's timing from it.
        Id3TagToStringFingerprint.classDef.methods
            .filter { it.name == "<init>" }
            .forEach { constructor ->
                val returns = constructor.implementation!!.instructions
                    .withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                returns.reversed().forEach { index ->
                    constructor.addInstructions(
                        index,
                        "invoke-static/range { p0 .. p0 }, $LIVE_MASK->onAdTick(Ljava/lang/Object;)V",
                    )
                }
            }

        // 2) The activity the cover goes over: register on resume, lift on
        //    pause (so the media volume is never left at zero while the user
        //    is in another app), forget on destroy.
        val hooks = mapOf(
            "onResume" to "registerActivity",
            "onPause" to "onPlayerPause",
            "onDestroy" to "unregisterActivity",
        )
        PLAYER_HOSTS.forEach { host ->
            val methods = mutableClassDefBy(host).methods
            hooks.forEach { (lifecycle, helper) ->
                val method = methods.firstOrNull {
                    it.name == lifecycle && it.parameterTypes.isEmpty() && it.returnType == "V"
                } ?: error("Pluto live mask: $host has no $lifecycle()")
                method.addInstructions(
                    0,
                    "invoke-static/range { p0 .. p0 }, $LIVE_MASK->$helper(Landroid/app/Activity;)V",
                )
            }
        }

        // 3) The player to mute, through Avia's readable mute(boolean).
        AviaStartExoplayerFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $LIVE_MASK->setAviaPlayer(Ljava/lang/Object;)V",
        )
    }
}
