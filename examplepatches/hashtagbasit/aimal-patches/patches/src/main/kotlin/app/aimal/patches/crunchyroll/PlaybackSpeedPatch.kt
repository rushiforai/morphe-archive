package app.aimal.patches.crunchyroll

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * Gives Crunchyroll a working playback-speed menu.
 *
 * The app already has one, but it is unfinished in two separate ways and both
 * have to be undone for the feature to be worth anything:
 *
 *  1. `PlaybackSpeedConfigurationImpl.isEnabled()` returns false, so the menu
 *     never appears.
 *  2. The table behind it is `{1.0, 0.75, 0.5}` - nothing above normal speed.
 *
 * These used to be two patches, "Enable speed control" and "Add fast playback
 * speeds". Neither was any use on its own: the flag alone unhides a menu that
 * cannot speed anything up, and the wider table alone is written into a menu
 * that is never shown. There was no combination worth offering, so they are one
 * patch.
 *
 * The flag is forced in bytecode; the table is replaced at runtime by
 * [app.aimal.extension.crunchyroll.SpeedHelper], because the view model holds
 * it behind a LiveData whose field names R8 rewrites every release.
 */
@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback speed",
    description = "Unhides the player's speed menu and fills it out to 0.5x-2.0x.",
    default = true,
) {
    compatibleWith(CRUNCHYROLL)

    extendWith("extensions/extension.mpe")

    execute {
        // ── 1. Unhide the menu ──
        //
        // The config class is found by its toString, then its only public final
        // no-argument boolean method is the isEnabled getter.
        val configClassName = PlaybackSpeedConfigToStringFingerprint.classDef.type

        val isEnabledFingerprint = Fingerprint(
            returnType = "Z",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf(),
            custom = { _, classDef -> classDef.type == configClassName },
        )

        isEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // ── 2. Widen the speed table ──
        //
        // A miss here is not fatal: the menu still works, it just stops at 1.0x.
        // That is why this half returns early rather than throwing.

        // Find FILLED_NEW_ARRAY for [Ljava/lang/Float; containing 1.0f, 0.75f, 0.5f
        val method = PlayerSettingsViewModelConstructorFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        var filledArrayIndex = -1

        for (i in instructions.indices) {
            val inst = instructions[i]
            if (inst.opcode != Opcode.FILLED_NEW_ARRAY) continue

            // Must be a Float array
            val ref = (inst as ReferenceInstruction).reference.toString()
            if (ref != "[Ljava/lang/Float;") continue

            // Verify 0.5f (0x3F000000) appears nearby before this instruction
            val lookBehind = instructions.subList(maxOf(0, i - 12), i)
            val has05f = lookBehind.any { la ->
                la is WideLiteralInstruction && la.wideLiteral.toInt() == 0x3F000000
            }
            if (!has05f) continue

            filledArrayIndex = i
            break
        }

        if (filledArrayIndex == -1) return@execute

        // Find iput-object after filled-new-array (stores the LiveData field)
        var iputIndex = -1
        for (i in filledArrayIndex until minOf(filledArrayIndex + 12, instructions.size)) {
            if (instructions[i].opcode == Opcode.IPUT_OBJECT) {
                iputIndex = i
                break
            }
        }

        if (iputIndex == -1) return@execute

        // Inject after the iput-object: call SpeedHelper to replace the list
        // p0 = this (PlayerSettingsViewModelImpl)
        method.addInstructions(
            iputIndex + 1,
            """
                invoke-static {p0}, Lapp/aimal/extension/crunchyroll/SpeedHelper;->replaceSpeedList(Ljava/lang/Object;)V
            """,
        )
    }
}
