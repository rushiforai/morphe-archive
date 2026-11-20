package io.github.jordanwoodson.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import io.github.jordanwoodson.patches.twitch.shared.requireNotBranchTarget
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val DROPS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchDrops;"
private const val CAMPAIGN = "Ltv/twitch/android/shared/drops/pub/models/UserDropCampaignModel;"

@Suppress("unused")
val keepDropsBannerPatch = bytecodePatch(
    name = "Keep Drops banner",
    description = "Keeps Twitch's \"Twitch Drops\" banner above chat in the native player for as long as you watch a " +
        "channel with Drops, the way the React Native player keeps its Drops card, instead of removing it after a " +
        "minute. Expand it for the campaign and its end date, then View Details for each Drop and how to earn it, " +
        "or Dismiss to remove it. Twitch shows Drops only to a signed-in account. Starts on; turn it off in Lurk " +
        "settings > Chat.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        keepDropsBanner()
        twitchSettings.add(SwitchSetting("drops_banner_keep", "Keep Drops banner",
            "Keep the Drops banner above native chat while the channel has Drops, instead of removing it after a " +
                "minute.", Section.CHAT))
    }
}

/**
 * The native theatre shows a channel's Drops as a community highlight above chat (issue 68). Its state lambda gives
 * the banner a one-minute countdown, and when that runs out the drops presenter dismisses the banner for the rest of
 * the visit. Each countdown the lambda makes goes through [DROPS]`.bannerCountdown`, which returns null while the
 * switch is on: the banner then has no countdown (the view takes null for highlights without one) and stays until
 * the viewer dismisses it.
 */
private fun BytecodePatchContext.keepDropsBanner() {
    val countdown = BannerCountdownFingerprint.twitchMatch("community highlight countdown").classDef.type
    val state = Fingerprint(
        name = "invoke", returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/lang/Object;"),
        filters = listOf(
            methodCall(definingClass = CAMPAIGN, name = "getImageUrl"),
            newInstance(countdown),
        ),
    ).twitchMatch("drops banner state")
    state.method.apply {
        val code = implementation!!.instructions.toList()
        val made = code.indices.filter { i ->
            val reference = (code[i] as? ReferenceInstruction)?.reference as? MethodReference
            code[i].opcode in listOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
                reference?.definingClass == countdown && reference.name == "<init>"
        }
        if (made.size != 2) {
            throw PatchException("Twitch: the drops banner makes ${made.size} countdowns, not one per layout (2)")
        }
        // From the last, so the earlier indices stay valid.
        made.reversed().forEach { index ->
            val instance = when (val init = code[index]) {
                is FiveRegisterInstruction -> init.registerC
                is RegisterRangeInstruction -> init.startRegister
                else -> throw PatchException("Twitch: unexpected drops banner countdown")
            }
            requireNotBranchTarget(index + 1, "drops banner countdown")
            addInstructions(index + 1, """
                ${invokeStatic("$DROPS->bannerCountdown(Ljava/lang/Object;)Ljava/lang/Object;", instance)}
                move-result-object v$instance
                check-cast v$instance, $countdown
            """)
        }
    }
}
