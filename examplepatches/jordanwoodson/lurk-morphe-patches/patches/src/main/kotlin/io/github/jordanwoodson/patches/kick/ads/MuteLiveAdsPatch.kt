package io.github.jordanwoodson.patches.kick.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.jordanwoodson.patches.kick.player.MEDIA3_LISTENER
import io.github.jordanwoodson.patches.kick.player.PLAYER_VIEW
import io.github.jordanwoodson.patches.kick.player.PlayerCloseFingerprint
import io.github.jordanwoodson.patches.kick.player.PlayerPrepareFingerprint
import io.github.jordanwoodson.patches.kick.player.PlayerSetMutedFingerprint
import io.github.jordanwoodson.patches.kick.player.PlayerViewSetPlayerFingerprint
import io.github.jordanwoodson.patches.kick.player.VIDEO_PLAYER
import io.github.jordanwoodson.patches.kick.player.playerListener
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.bridge
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "mute_live_ads"
private const val KICK_ADS = "Lio/github/jordanwoodson/extension/shared/kick/KickAds;"
private const val METADATA = "Landroidx/media3/common/Metadata;"

@Suppress("unused")
val muteLiveAdsPatch = bytecodePatch(
    name = "Mute stitched live ads",
    description = "Experimental: ads could not be observed signed out. While Kick's player reports an ad break " +
        "stitched into a live stream, mutes the player and covers the video with black and a small \"Ad break\", " +
        "then restores both when the break's time is up, it ends, or another stream loads. The ad still plays for " +
        "its full length and can't be skipped; this only silences and hides it. It acts on the ad signals Kick's " +
        "player can get: an SCTE-35 ad break in the stream itself, or an ad of a MediaTailor session, which Kick only " +
        "starts with Disable analytics off. None arrived in signed-out sessions, so this was checked only with " +
        "made-up ad signals fed to Kick's own player code. Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        hookPlayerListener()
        hookPlayer()
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Mute stitched live ads",
                "Experimental: ads could not be observed signed out. Mutes and blacks out an ad break Kick's player " +
                    "reports, until it ends. The ad still plays for its full length.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}

/**
 * Media3 hands timed metadata in the stream (ID3, EMSG and SCTE-35 splice commands) to the player's listeners through
 * onMetadata. Kick's listener keeps Player.Listener's empty one: the patch adds one that hands the player's view and the
 * metadata to KickAds. Media3 calls it on the main thread.
 */
private fun BytecodePatchContext.hookPlayerListener() {
    val (listenerType, player) = playerListener()
    val listener = mutableClassDefBy(listenerType)
    if (classDefBy(MEDIA3_LISTENER).methods.none {
            it.name == "onMetadata" && it.parameterTypes.map(Any::toString) == listOf(METADATA)
        }) {
        throw PatchException("Kick: Media3's Player.Listener has no onMetadata(Metadata)")
    }
    if (listener.methods.any { it.name == "onMetadata" }) {
        throw PatchException("Kick: the player's listener now handles onMetadata itself")
    }
    Locators.record("kick.mute_live_ads.player_listener", listenerType)
    // v0, then this (v1) and the metadata (v2).
    listener.methods.add(
        ImmutableMethod(
            listenerType, "onMetadata", listOf(ImmutableMethodParameter(METADATA, null, null)), "V",
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructions(0, """
                iget-object v0, p0, $player
                invoke-virtual { v0 }, $VIDEO_PLAYER->getCurrentVideoView()$PLAYER_VIEW
                move-result-object v0
                invoke-static { v0, p1 }, $KICK_ADS->onMetadata(Landroid/view/View;Ljava/lang/Object;)V
                return-void
            """)
        },
    )
}

/**
 * The player and its view: MediaTailor's ad events, the mute React Native asks for (kept on during a break and
 * restored after it), and a new stream, the view losing its player or the player's release, which end a break. KickAds
 * mutes through the player's own setMuted.
 */
private fun BytecodePatchContext.hookPlayer() {
    MediaTailorAdEventFingerprint.kickMatch("player view MediaTailor ad event").method.apply {
        if (!AccessFlags.STATIC.isSet(accessFlags)) throw PatchException("Kick: the MediaTailor ad event callback isn't static")
        Locators.record("kick.mute_live_ads.media_tailor_event", this)
        addInstructions(0, invokeStatic("$KICK_ADS->onMediaTailorEvent(Landroid/view/View;Ljava/lang/Object;)V",
            parameterRegister(0), parameterRegister(1)))
    }
    PlayerSetMutedFingerprint.kickMatch("player setMuted").method.apply {
        addInstructions(0, """
            ${invokeStatic("$KICK_ADS->muteRequest(Ljava/lang/Object;Z)Z", parameterRegister(0), parameterRegister(1))}
            move-result p1
        """)
    }
    for ((fingerprint, what) in listOf(PlayerPrepareFingerprint to "player prepare", PlayerCloseFingerprint to "player close")) {
        fingerprint.kickMatch(what).method.apply {
            addInstructions(0, invokeStatic("$KICK_ADS->onPlayerLoad(Ljava/lang/Object;)V", parameterRegister(0)))
        }
    }
    PlayerViewSetPlayerFingerprint.kickMatch("player view setVideoPlayer").method.apply {
        addInstructions(0, invokeStatic("$KICK_ADS->onLoad(Landroid/view/View;)V", parameterRegister(0)))
    }
    bridge(KICK_ADS, "playerView", """
        check-cast p0, $VIDEO_PLAYER
        invoke-virtual { p0 }, $VIDEO_PLAYER->getCurrentVideoView()$PLAYER_VIEW
        move-result-object p0
        return-object p0
    """)
    bridge(KICK_ADS, "setMuted", """
        check-cast p0, $PLAYER_VIEW
        invoke-virtual { p0 }, $PLAYER_VIEW->getVideoPlayer()$VIDEO_PLAYER
        move-result-object p0
        if-eqz p0, :none
        invoke-virtual { p0, p1 }, $VIDEO_PLAYER->setMuted(Z)V
        :none
        return-void
    """)
    bridge(KICK_ADS, "adEventName", """
        check-cast p0, $AD_EVENT
        invoke-virtual { p0 }, $AD_EVENT->getType()Ljava/lang/String;
        move-result-object p0
        return-object p0
    """)
    bridge(KICK_ADS, "adEventSeconds", """
        check-cast p0, $AD_EVENT
        invoke-virtual { p0 }, $AD_EVENT->getDuration()D
        move-result-wide v0
        invoke-static { v0, v1 }, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;
        move-result-object p0
        return-object p0
    """, locals = 2)
}
