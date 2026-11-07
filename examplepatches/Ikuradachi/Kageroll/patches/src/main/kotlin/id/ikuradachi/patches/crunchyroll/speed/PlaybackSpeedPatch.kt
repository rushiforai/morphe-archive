package id.ikuradachi.patches.crunchyroll.speed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback speed",
    description = "Unhides the player's speed menu and fills it out to 0.5x-2.0x.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    extendWith("extensions/extension.mpe")

    execute {
        // ── 1. Unhide the menu ──
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
                invoke-static {p0}, Lid/ikuradachi/kageroll/extension/crunchyroll/SpeedHelper;->replaceSpeedList(Ljava/lang/Object;)V
            """,
        )
    }
}
