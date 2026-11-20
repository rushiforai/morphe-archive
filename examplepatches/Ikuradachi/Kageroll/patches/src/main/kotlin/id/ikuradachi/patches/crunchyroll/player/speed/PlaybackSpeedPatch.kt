package id.ikuradachi.patches.crunchyroll.player.speed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback speed",
    description = "Unhides the player's speed menu and expands playback speed options up to 4.0x.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    extendWith("extensions/extension.mpe")

    val maxPlaybackSpeed = stringOption(
        key = "maxPlaybackSpeed",
        default = "4.0",
        values = mapOf(
            "2.0x" to "2.0",
            "2.5x" to "2.5",
            "3.0x" to "3.0",
            "3.5x" to "3.5",
            "4.0x (default)" to "4.0",
        ),
        title = "Maximum playback speed",
        description = "Highest playback speed multiplier shown in the player speed menu.",
        validator = { raw ->
            val parsed = raw?.toFloatOrNull()
            parsed != null && parsed >= 2.0f && parsed <= 4.0f
        },
    )

    execute {
        val maxSpeed = requireNotNull(
            maxPlaybackSpeed.value?.toFloatOrNull()?.takeIf { it in 2.0f..4.0f },
        ) {
            "Maximum playback speed must be between 2.0 and 4.0"
        }
        val maxSpeedBits = java.lang.Float.floatToIntBits(maxSpeed)
        val maxSpeedMethod = SpeedHelperMaxSpeedFingerprint.matchAll(1..1).single().method
        maxSpeedMethod.addInstructions(
            0,
            """
                const v0, 0x${Integer.toHexString(maxSpeedBits)}
                return v0
            """.trimIndent(),
        )

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
