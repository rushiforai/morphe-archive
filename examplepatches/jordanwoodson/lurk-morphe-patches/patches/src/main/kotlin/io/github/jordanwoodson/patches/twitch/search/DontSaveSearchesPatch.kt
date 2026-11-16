package io.github.jordanwoodson.patches.twitch.search

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.addInstructionsIfEnabled
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val KEY = "no_search_history"

@Suppress("unused")
val dontSaveSearchesPatch = bytecodePatch(
    name = "Don't save searches",
    description = "Stops Twitch from keeping your searches on the phone and hides the ones it kept, so they no " +
        "longer show under the search box. Suggestions still come from Twitch's server as you type. On by " +
        "default. Turn it off in Lurk settings > Privacy.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        // The saved list reads as empty. The list in memory is loaded from it once, when search is first
        // used, so the kept searches don't show; the file keeps them, and they are back after the switch is
        // turned off and Twitch restarted.
        RecentSearchesReadFingerprint.twitchMatch("recent searches read").method.addInstructionsIfEnabled(KEY, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
            return-object v0
        """)

        // Putting a search on top of the list (the one method of the list's class that takes the text and
        // inserts at an index) does nothing, so nothing new is kept in memory or written.
        val list = mutableClassDefBy(RecentSearchesWriteFingerprint.twitchMatch("recent searches write").classDef.type)
        val add = list.methods.singleOrNull { method ->
            method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
                method.implementation?.instructions.orEmpty().any { instruction ->
                    (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_INTERFACE) &&
                        ((instruction as ReferenceInstruction).reference as? MethodReference)?.let { reference ->
                            reference.name == "add" && reference.parameterTypes.map { it.toString() } ==
                                listOf("I", "Ljava/lang/Object;")
                        } == true
                }
        } ?: throw PatchException("Twitch: the recent searches list no longer has one method that adds a search")
        Locators.record("twitch.no_search_history.add", add)
        add.addInstructionsIfEnabled(KEY, "return-void")

        twitchSettings.add(SwitchSetting(KEY, "Don't save searches",
            "Searches aren't kept on the phone, and the ones Twitch kept don't show.",
            Section.PRIVACY, default = true, restart = true))
    }
}
