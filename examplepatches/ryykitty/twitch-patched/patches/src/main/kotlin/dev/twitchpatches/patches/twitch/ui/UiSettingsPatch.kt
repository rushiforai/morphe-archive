package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

internal const val UI_SETTINGS = "Ldev/twitchpatches/extension/ui/UiSettings;"

@Suppress("unused")
val uiSettingsPatch = bytecodePatch(
    name = "UI settings",
    description = "Customizes player controls, channel actions, extensions, Hype Trains, leaderboards and fullscreen system bars.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, uiSettingsAssetsPatch)
    execute {
        val capability = mutableClassDefBy(UI_SETTINGS).methods.filter {
            it.name == "hasLeaderboardButton" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }.uniqueHook("UI header capability")
        injectUiHeaderCapability(capability, true)
        injectUiPlayerEntry()
        injectUiNavigation()
        injectUiPolicyBridge()
        injectUiViews()
        injectUiComposition()
        injectUiHypeTrainEvents()
        injectUiFullscreenInsets()
        injectUiFullscreenState()
        val app = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
            it.name == "onCreate" && it.isInstance(emptyList(), "V")
        }.uniqueHook("UI settings initialization")
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $UI_SETTINGS->initialize(Landroid/app/Application;)V")
        }
    }
}
