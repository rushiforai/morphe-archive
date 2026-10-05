package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

@Suppress("unused")
val thirdPartyEmotesPatch = bytecodePatch(
    name = "BTTV and 7TV emotes",
    description = "Renders global and channel emotes in chat with provider previews on tap.",
    default = true,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)
    dependsOn(settingsPatch, reactNativeEmotesPatch, nativeEmotePreviewPatch)
    execute {
        val hooks = resolveEmoteHooks()
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
            it.name == "onCreate" && it.isInstance(emptyList(), "V")
        }.uniqueHook("emote application initialization")
        val bridge = emoteRowBridge(hooks)
        val binder = mutableClassDefBy(hooks.binder.definingClass).methods.single { it.reference == hooks.binder.reference }
        binder.addInstructions(hooks.setterIndex + 1, "invoke-static/range {p0 .. p1}, $bridge")
        val connection = mutableClassDefBy(hooks.connection.definingClass).methods.single { it.reference == hooks.connection.reference }
        val connected = emoteConnectionBridge(hooks.connection)
        connection.insertAtReturn(connection.code().lastIndex,
            "invoke-static/range {p1 .. p2}, $connected")
        val app = mutableClassDefBy(application.definingClass).methods.single { it.reference == application.reference }
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach { index ->
            app.insertAtReturn(index, "invoke-static/range {p0 .. p0}, $EMOTES->initialize(Landroid/app/Application;)V")
        }
    }
}
