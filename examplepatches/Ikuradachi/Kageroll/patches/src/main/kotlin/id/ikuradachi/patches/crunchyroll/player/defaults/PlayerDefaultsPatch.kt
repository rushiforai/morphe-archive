package id.ikuradachi.patches.crunchyroll.player.defaults

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private data class DefaultEdit(
    val index: Int,
    val replacementLines: List<String>,
)

private fun escapeSmaliString(value: String): String =
    buildString(value.length) {
        for (ch in value) {
            when (ch) {
                '\\' -> append("\\\\")
                '"' -> append("\\\"")
                '\n' -> append("\\n")
                '\r' -> append("\\r")
                '\t' -> append("\\t")
                else -> append(ch)
            }
        }
    }

@Suppress("unused")
val playerDefaultsPatch = bytecodePatch(
    name = "Player preference defaults",
    description = "Overrides initial default values for audio language, subtitles, autoplay, cellular streaming, closed captions, audio description, and playback speed.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    val defaultAudioLanguage = stringOption(
        key = "defaultAudioLanguage",
        default = "ja-JP",
        values = mapOf(
            "Japanese (ja-JP)" to "ja-JP",
            "English (en-US)" to "en-US",
            "Spanish (es-419)" to "es-419",
            "Portuguese (pt-BR)" to "pt-BR",
            "French (fr-FR)" to "fr-FR",
            "German (de-DE)" to "de-DE",
        ),
        title = "Default audio language",
        description = "Initial player audio locale when no user preference has been saved yet.",
        validator = { !it.isNullOrBlank() },
    )
    val defaultSubtitleLanguage = stringOption(
        key = "defaultSubtitleLanguage",
        default = "en-US",
        values = mapOf(
            "English (en-US)" to "en-US",
            "Spanish (es-419)" to "es-419",
            "Portuguese (pt-BR)" to "pt-BR",
            "French (fr-FR)" to "fr-FR",
            "German (de-DE)" to "de-DE",
            "None (off)" to "",
        ),
        title = "Default subtitle language",
        description = "Initial player subtitle locale when no user preference has been saved yet.",
        validator = { it != null },
    )
    val defaultAutoplay = booleanOption(
        key = "defaultAutoplay",
        default = true,
        title = "Default autoplay",
        description = "Initial state for auto-playing the next episode.",
    )
    val defaultStreamOverCellular = booleanOption(
        key = "defaultStreamOverCellular",
        default = true,
        title = "Default stream over cellular",
        description = "Initial state for allowing video streaming over cellular data.",
    )
    val defaultClosedCaptions = booleanOption(
        key = "defaultClosedCaptions",
        default = false,
        title = "Default closed captions",
        description = "Initial state for showing closed captions when available.",
    )
    val defaultAudioDescription = booleanOption(
        key = "defaultAudioDescription",
        default = false,
        title = "Default audio description",
        description = "Initial state for audio description tracks.",
    )
    val defaultPlaybackSpeed = stringOption(
        key = "defaultPlaybackSpeed",
        default = "1.0",
        values = mapOf(
            "0.75x" to "0.75",
            "1.0x" to "1.0",
            "1.25x" to "1.25",
            "1.5x" to "1.5",
            "2.0x" to "2.0",
        ),
        title = "Default playback speed",
        description = "Initial playback speed multiplier when no user preference has been saved yet.",
        validator = { raw ->
            val parsed = raw?.toFloatOrNull()
            parsed != null && parsed > 0f && parsed <= 4.0f
        },
    )

    execute {
        val match = PlayerSettingsStorageConstructorFingerprint.matchAll(1..1).single()
        val method = match.method
        val impl = requireNotNull(method.implementation) {
            "Missing implementation for PlayerSettingsStorage.<init>"
        }
        check(impl.registerCount >= 7) {
            "Unexpected register count in PlayerSettingsStorage.<init>: ${impl.registerCount}"
        }
        val instructions = impl.instructions

        fun findPreferenceCallIndex(key: String): Int {
            val keyIdx = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_STRING &&
                    ((instr as ReferenceInstruction).reference as StringReference).string == key
            }
            check(keyIdx >= 0) {
                "Failed to locate preference key '$key' in PlayerSettingsStorage.<init>"
            }
            return (keyIdx + 1 until minOf(keyIdx + 5, instructions.size)).firstOrNull { idx ->
                instructions[idx].opcode == Opcode.INVOKE_STATIC
            } ?: error("Failed to locate preference helper invoke after '$key'")
        }

        val edits = mutableListOf<DefaultEdit>()

        fun addFreshRegisterDefaultEdit(key: String, loadInstruction: String) {
            val invokeIdx = findPreferenceCallIndex(key)
            val invokeInstr = instructions[invokeIdx] as FiveRegisterInstruction
            check(invokeInstr.registerCount == 3) {
                "Unexpected argument count for '$key' preference helper: ${invokeInstr.registerCount}"
            }
            val prefsReg = invokeInstr.registerC
            val keyReg = invokeInstr.registerD
            val scratchReg = 2 // v2 is unused across all preference registrations in n20.h.<init>
            check(prefsReg != scratchReg && keyReg != scratchReg && prefsReg in 0..15 && keyReg in 0..15) {
                "Register collision in PlayerSettingsStorage.<init> for '$key': prefs=v$prefsReg, key=v$keyReg"
            }
            val methodRef = (instructions[invokeIdx] as ReferenceInstruction).reference.toString()
            edits += DefaultEdit(
                index = invokeIdx,
                replacementLines = listOf(
                    loadInstruction,
                    "invoke-static {v$prefsReg, v$keyReg, v$scratchReg}, $methodRef",
                ),
            )
        }

        val audioLang = requireNotNull(defaultAudioLanguage.value?.takeIf { it.isNotBlank() }) {
            "Default audio language must not be blank"
        }
        if (audioLang != "en-US") {
            addFreshRegisterDefaultEdit(
                key = "player_audio_language",
                loadInstruction = "const-string v2, \"${escapeSmaliString(audioLang)}\"",
            )
        }

        val subLang = requireNotNull(defaultSubtitleLanguage.value) {
            "Default subtitle language must not be null"
        }
        if (subLang != "en-US") {
            addFreshRegisterDefaultEdit(
                key = "player_subtitles_language",
                loadInstruction = "const-string v2, \"${escapeSmaliString(subLang)}\"",
            )
        }

        val autoplay = defaultAutoplay.value == true
        if (!autoplay) {
            addFreshRegisterDefaultEdit(
                key = "player_autoplay_setting",
                loadInstruction = "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
            )
        }

        val cellular = defaultStreamOverCellular.value == true
        if (!cellular) {
            addFreshRegisterDefaultEdit(
                key = "stream_over_cellular",
                loadInstruction = "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
            )
        }

        val closedCaptions = defaultClosedCaptions.value == true
        if (!closedCaptions) {
            addFreshRegisterDefaultEdit(
                key = "show_closed_captions",
                loadInstruction = "sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
            )
        }

        val audioDesc = defaultAudioDescription.value == true
        if (audioDesc) {
            addFreshRegisterDefaultEdit(
                key = "audio_description",
                loadInstruction = "sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
            )
        }

        val speedFloat = requireNotNull(
            defaultPlaybackSpeed.value?.toFloatOrNull()?.takeIf { it > 0f && it <= 4.0f },
        ) {
            "Default playback speed must be between 0.1 and 4.0"
        }
        if (speedFloat != 1.0f) {
            val speedKeyIdx = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_STRING &&
                    ((instr as ReferenceInstruction).reference as StringReference).string ==
                    "player_playback_speed_setting"
            }
            check(speedKeyIdx > 0) {
                "Failed to locate 'player_playback_speed_setting' in PlayerSettingsStorage.<init>"
            }
            val floatConstIdx = (maxOf(0, speedKeyIdx - 6) until speedKeyIdx).lastOrNull { idx ->
                val instr = instructions[idx]
                instr.opcode == Opcode.CONST_HIGH16 &&
                    (instr as WideLiteralInstruction).wideLiteral.toInt() == 0x3F800000
            } ?: error("Failed to locate 1.0f constant before 'player_playback_speed_setting'")

            val speedReg = (instructions[floatConstIdx] as OneRegisterInstruction).registerA
            val rawBits = java.lang.Float.floatToIntBits(speedFloat)
            edits += DefaultEdit(
                index = floatConstIdx,
                replacementLines = listOf("const v$speedReg, 0x${Integer.toHexString(rawBits)}"),
            )
        }

        // Apply highest-to-lowest so earlier indices never shift.
        for (edit in edits.sortedByDescending { it.index }) {
            if (edit.replacementLines.size == 1) {
                method.replaceInstruction(edit.index, edit.replacementLines.single())
            } else {
                method.addInstructions(edit.index, edit.replacementLines.joinToString("\n"))
                method.removeInstruction(edit.index + edit.replacementLines.size)
            }
        }
    }
}
