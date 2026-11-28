/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.features

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.imo.patches.signin.imoSignaturePatch
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * IMO reads its features from one settings object, `IMOSettings`, whose generated implementation keeps readable method
 * names (`hideSendApk`, `enableMePagePremiumEntry`, ...). Each one asks the server for a value and falls back to a
 * default. Making a getter return a fixed answer is the cleanest hook the app offers: no obfuscated name is involved, and
 * the name is derived from the setting's key, so it survives app updates.
 */
private const val SWITCHES = "Lapp/loki/extension/LokiSwitches;"
private const val SETTINGS = "Lcom/imo/android/imoim/setting/IMOSettings\$\$Impl;"

/**
 * What the app actually calls. IMO usually hands out its settings through a runtime proxy that never runs the generated
 * getters above, so the answer has to be given here too; this class forwards every getter to that proxy.
 */
private const val SETTINGS_DELEGATE = "Lcom/imo/android/imoim/setting/IMOSettingsDelegate;"

private fun imoFlagPatch(
    name: String,
    description: String,
    menuKey: String,
    switchKey: String,
    default: Boolean,
    vararg answers: Pair<String, Boolean>,
): BytecodePatch {
    val getters = answers.flatMap { (method, answer) ->
        listOf(SETTINGS, SETTINGS_DELEGATE).map { owner ->
            Fingerprint(definingClass = owner, name = method, returnType = "Z", parameters = listOf()) to answer
        }
    }
    return bytecodePatch(name = name, description = description, default = default) {
        compatibleWith(COMPATIBILITY_IMO)
        dependsOn(imoSignaturePatch)
        dependsOn(menuFlagPatch(menuKey))
        dependsOn(imoMenuRowPatch)

        execute {
            getters.forEach { (getter, answer) ->
                val method = getter.method
                // The check needs one free register. These getters are `this`-only, so a free one is a local.
                val words = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
                    if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
                if (method.implementation!!.registerCount - words < 1) {
                    throw PatchException("IMO: ${method.name} has no free register for the switch check")
                }
                // Answer only while the user's switch is on; otherwise IMO's own code below runs as usual.
                method.addInstructionsWithLabels(
                    0,
                    """
                        const-string v0, "$switchKey"
                        invoke-static {v0}, $SWITCHES->${if (default) "imoOn" else "imoOff"}(Ljava/lang/String;)Z
                        move-result v0
                        if-eqz v0, :loki_original
                        const/4 v0, ${if (answer) "0x1" else "0x0"}
                        return v0
                        :loki_original
                        nop
                    """,
                )
            }
        }
    }
}

@Suppress("unused")
val storyDuringCallsPatch = imoFlagPatch(
    name = "Allow story recording during calls (IMO)",
    description = "Lets you record and post a story while a call is going on. IMO blocks it by default.",
    menuKey = "app.loki.menu.storycall",
    switchKey = "imo_story_call",
    default = true,
    "getDisableRecordStoryInCall" to false,
)

@Suppress("unused")
val allowSendingApkPatch = imoFlagPatch(
    name = "Allow sending apps (IMO)",
    description = "Shows the Apps option in the chat attachment menu so you can send an installed app as a file.",
    menuKey = "app.loki.menu.sendapk",
    switchKey = "imo_send_apk",
    default = true,
    "hideSendApk" to false,
)

@Suppress("unused")
val disappearingMessagesPatch = imoFlagPatch(
    name = "Disappearing messages (IMO)",
    description = "Turns on IMO's own disappearing-message option when you send in private and group chats. " +
        "IMO's servers decide whether the other person gets it.",
    menuKey = "app.loki.menu.burn",
    switchKey = "imo_burn",
    default = false,
    "enableBurnAfterReadForSend" to true,
    "enableGroupBurnAfterReadForSend" to true,
)

@Suppress("unused")
val hidePremiumEntryPatch = imoFlagPatch(
    name = "Hide Premium on Me page (IMO)",
    description = "Removes the paid Premium Member entry from the Me page.",
    menuKey = "app.loki.menu.hidepremium",
    switchKey = "imo_hide_premium",
    default = false,
    "enableMePagePremiumEntry" to false,
)
