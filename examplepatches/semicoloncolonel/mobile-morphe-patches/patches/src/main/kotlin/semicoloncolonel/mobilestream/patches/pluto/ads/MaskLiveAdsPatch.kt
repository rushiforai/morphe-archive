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

// The cover hosts.
// - Phone: on-demand plays in VideoPlayerActivity, live TV plays inline in
//   MainActivity (17.2.0 on-device: the live break showed the mask's "no
//   player activity" warning while MainActivity was in front).
// - Android TV (17.3.0, same package): on-demand plays in the TV
//   VideoPlayerActivity, live TV in LiveTvFullScreenActivity, and the home
//   screen (HomeActivity) can play a channel too.
// A build contains only its own hosts; the others are skipped.
private val PLAYER_HOSTS = listOf(
    "Lcom/paramount/android/pplus/player/mobile/integration/ui/VideoPlayerActivity;",
    "Lcom/cbs/app/screens/main/MainActivity;",
    "Lcom/paramount/android/pplus/player/tv/impl/integration/ui/VideoPlayerActivity;",
    "Lcom/paramount/android/pplus/livetv/tv/channel/LiveTvFullScreenActivity;",
    "Lcom/cbs/app/tv/ui/activity/HomeActivity;",
)

@Suppress("unused")
val maskLiveAdsPatch = bytecodePatch(
    name = "Mask live ad breaks",
    description = "Covers live ad breaks with a \"We'll be right back!\" screen and mutes them.",
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
        //    is in another app), forget on destroy. The TV hosts inherit
        //    onResume and onPause, so where an activity has no onResume of
        //    its own it registers from onCreate instead; from then on the
        //    helper's lifecycle tracker follows its resumes and pauses.
        fun hook(method: com.android.tools.smali.dexlib2.iface.Method?, helper: String): Boolean {
            val target = method as? app.morphe.patcher.util.proxy.mutableTypes.MutableMethod ?: return false
            target.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $LIVE_MASK->$helper(Landroid/app/Activity;)V",
            )
            return true
        }
        var registered = 0
        PLAYER_HOSTS.forEach { host ->
            if (classDefByOrNull(host) == null) return@forEach
            val methods = mutableClassDefBy(host).methods
            fun lifecycle(name: String) = methods.firstOrNull {
                it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            val onCreate = methods.firstOrNull {
                it.name == "onCreate" && it.returnType == "V" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
            }
            if (hook(lifecycle("onResume"), "registerActivity") || hook(onCreate, "registerActivity")) {
                registered++
            } else {
                error("Pluto live mask: $host has no onResume() or onCreate(Bundle)")
            }
            hook(lifecycle("onPause"), "onPlayerPause")
            hook(lifecycle("onDestroy"), "unregisterActivity")
        }
        if (registered == 0) error("Pluto live mask: no player activity found")

        // 3) The player to mute, through Avia's readable mute(boolean).
        AviaStartExoplayerFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $LIVE_MASK->setAviaPlayer(Ljava/lang/Object;)V",
        )
    }
}
