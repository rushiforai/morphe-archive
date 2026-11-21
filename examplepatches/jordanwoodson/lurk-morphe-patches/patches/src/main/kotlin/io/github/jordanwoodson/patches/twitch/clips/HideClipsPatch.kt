package io.github.jordanwoodson.patches.twitch.clips

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch
import io.github.jordanwoodson.patches.twitch.tipping.INTERFACE_CLASS

@Suppress("unused")
val hideClipsPatch = bytecodePatch(
    name = "Hide Clips",
    description = "Hides the Clips discovery tab and clip shelves such as \"Clips for you\" on Home, and the Clips tab on native channel profiles. Keep Clips on channel pages, a second switch, leaves the channel tab. Shared clip links still open.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        twitchHermes.hideClipDiscoveryTabs()
        twitchHermes.hideClipShelves()
        hideNativeHomeClipsTab()
        val routes = ProfileTabRoutesFingerprint.twitchMatch("profile tab routes").method
        val constructor = mutableClassDefBy(routes.definingClass).methods.single { it.name == "<init>" }
        val instructions = constructor.implementation!!.instructions.toList()
        val call = instructions.indices.single { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.name == "getEntries" && reference.returnType == "Lkotlin/enums/EnumEntries;"
        }
        if (instructions[call + 1].opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Twitch: profile tabs have no result register")
        val register = (instructions[call + 1] as OneRegisterInstruction).registerA
        val bundle = constructor.parameterTypes.indexOfFirst { it.toString() == "Landroid/os/Bundle;" } + 1
        val locals = constructor.implementation!!.registerCount - constructor.parameterTypes.size - 1
        if (bundle < 1 || register > 15 || locals + bundle > 15) throw PatchException("Twitch: profile arguments cannot use the reviewed two-register call")
        constructor.addInstructions(call + 2, """
            invoke-static { v$register, p$bundle }, $INTERFACE_CLASS->clipTabs(Ljava/lang/Object;Landroid/os/Bundle;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, Lkotlin/enums/EnumEntries;
        """)
        twitchSettings.add(
            SwitchSetting("hide_clips", "Hide Clips", "Clips discovery and clip shelves on Home, and the native channel profile tab. Shared links still open.", Section.INTERFACE, restart = true),
            // Issue 93: clips stay reachable from a channel's own page.
            SwitchSetting("hide_clips_keep_channel", "Keep Clips on channel pages",
                "Channel pages keep their Clips tab; Home stays without clips. Applies to channel pages opened afterwards.",
                Section.INTERFACE, default = false, parent = "hide_clips"),
        )
    }
}
