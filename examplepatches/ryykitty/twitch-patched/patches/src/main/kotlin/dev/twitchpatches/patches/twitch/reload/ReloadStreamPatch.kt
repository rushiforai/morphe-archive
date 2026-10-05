package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

@Suppress("unused")
val reloadStreamPatch = bytecodePatch(
    name = "Reload stream",
    description = "Adds a reload button in live-player controls. Double-tap to reload.",
    default = true,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)
    dependsOn(settingsPatch, reactNativeReloadPatch, nativeReloadPatch)
    execute {
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
            it.name == "onCreate" && it.isInstance(emptyList(), "V")
        }.uniqueHook("reload preferences initialization")
        val method = mutableClassDefBy(application.definingClass).methods.single { it.reference == application.reference }
        method.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            method.insertAtReturn(it,
                "invoke-static/range {p0 .. p0}, Ldev/twitchpatches/extension/reload/ReloadRuntime;->initialize(Landroid/app/Application;)V")
        }
    }
}
