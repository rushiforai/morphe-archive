package io.github.jordanwoodson.patches.twitch.layout

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH

internal const val LAYOUT_CLASS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchLayout;"

// isTablet once (the form factor), is_tablet three times (cast dialogs), following_drawer_use_sidebar twice
// (the main screen's onCreate and onConfigurationChanged).
private val EXPECTED_READS = mapOf("isTablet" to 1, "is_tablet" to 3, "following_drawer_use_sidebar" to 2)

@Suppress("unused")
val tabletLayoutPatch = bytecodePatch(
    name = "Tablet layout",
    description = "Adds a switch that makes Twitch treat the phone as a tablet: Home and the player rotate, the " +
        "player shows chat beside the video in landscape, and a navigation rail on the left replaces the bottom " +
        "bar in landscape (and in portrait too with a second switch). Off until turned on in Lurk settings; " +
        "applies after a restart.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch)
    execute {
        val bools = TABLET_BOOLS.associateBy { resourceId(ResourceType.BOOL, it) }
        val reads = mutableMapOf<String, Int>()
        TabletBoolFingerprint.matchAll().forEach { match ->
            val method = match.method
            val code = method.implementation!!.instructions
            code.indices.reversed().forEach { index ->
                val instruction = code[index]
                val value = (instruction as? NarrowLiteralInstruction)?.wideLiteral
                val name = bools[value]
                if (instruction.opcode != Opcode.CONST || name == null) return@forEach
                // const vX, R.bool.<name>; invoke-virtual { resources, vX }, getBoolean; move-result vY
                val id = (instruction as OneRegisterInstruction).registerA
                val call = code.getOrNull(index + 1) as? FiveRegisterInstruction
                val reference = (call as? ReferenceInstruction)?.reference as? MethodReference
                val result = code.getOrNull(index + 2)
                if (call == null || reference?.definingClass != "Landroid/content/res/Resources;" ||
                    reference.name != "getBoolean" || call.registerCount != 2 || call.registerD != id ||
                    result?.opcode != Opcode.MOVE_RESULT) {
                    throw PatchException("Twitch: unexpected $name read in ${method.definingClass}->${method.name}")
                }
                val register = (result as OneRegisterInstruction).registerA
                val hook = if (name == "following_drawer_use_sidebar") "navigationRail" else "tablet"
                method.addInstructions(index + 3, """
                    invoke-static/range { v$register .. v$register }, $LAYOUT_CLASS->$hook(Z)Z
                    move-result v$register
                """)
                reads[name] = (reads[name] ?: 0) + 1
            }
        }
        if (reads != EXPECTED_READS) throw PatchException("Twitch: expected tablet switch reads $EXPECTED_READS, found $reads")

        twitchSettings.add(
            SwitchSetting("tablet_layout", "Tablet layout",
                "Twitch's tablet interface on this phone: Home and the player rotate, chat sits beside the video in " +
                    "landscape, and a navigation rail replaces the bottom bar in landscape.",
                Section.INTERFACE, default = false, restart = true),
            SwitchSetting("tablet_rail_portrait", "Navigation rail in portrait",
                "Keep the navigation rail when the phone is upright too. Signed in, Twitch opens its Following " +
                    "sidebar next to the rail, which covers most of the screen until it's closed.",
                Section.INTERFACE, default = false, parent = "tablet_layout", restart = true),
        )
    }
}
