/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-25
 */
package app.morphe.patches.music.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patches.shared.conversionContextFingerprintToString2
import app.morphe.patches.shared.spannableStringBuilderFingerprint
import app.morphe.patches.music.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.music.utils.playservice.is_9_39_or_greater
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val STORE = "Lcom/google/android/libraries/elements/interfaces/ThemeStore;"
private const val CLIENT_INFO = "Lcom/google/protos/youtube/api/innertube/InnertubeContext\$ClientInfo;"

private object MusicThemeStoreFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = STORE,
    filters = listOf(
        methodCall(returnType = CLIENT_INFO),
        opcode(Opcode.INT_TO_LONG),
        methodCall(definingClass = STORE, name = "create", returnType = STORE),
    ),
    custom = { method, _ -> method.parameterTypes.size == 2 },
)

internal fun BytecodePatchContext.installLightMusicElementsHook() {
    val match = MusicThemeStoreFingerprint.match()
    val method = match.method
    val widen = match.instructionMatches[1].index
    val theme = method.getInstruction<TwoRegisterInstruction>(widen).registerB

    // Default-keyed server components follow this theme. Explicit component/overlay theme keys
    // and the optional second argument to ThemeStore.create(JZ) retain their original meaning.
    method.addInstructions(
        widen,
        """
            invoke-static/range { v$theme .. v$theme }, $UTILS_PATH/MusicLightTheme;->selectElementsTheme(I)I
            move-result v$theme
        """,
    )

    runCatching { installLightElementsText() }.onFailure {
        printWarn("Music light theme: scoped Elements text coloring is unavailable (${it.message}).")
    }
}

private const val PATH_BUILDER = "Ljava/lang/StringBuilder;"
private const val TEXT = "Ljava/lang/CharSequence;"

private fun BytecodePatchContext.installLightElementsText() {
    val textBuilder = spannableStringBuilderFingerprint.method
    check(AccessFlags.STATIC.isSet(textBuilder.accessFlags))
    val contextType = textBuilder.parameterTypes.first().toString()
    val context = conversionContextFingerprintToString2.originalClassDef
    val pathField = context.fields.single {
        it.type == PATH_BUILDER && AccessFlags.PUBLIC.isSet(it.accessFlags)
    }
    check(context.type == contextType || context.superclass == contextType)
    val commentPresenter = if (is_9_39_or_greater) {
        installLightCommentComposer(contextType)
    } else {
        printWarn("Music light theme: inline Comments styling requires the newer engagement panel footer.")
        null
    }
    if (commentPresenter != null) installLightExpandedCommentComposer()

    // Run after the host spans so neither an explicit white style nor a plain-text return bypasses us.
    val sites = textBuilder.findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).map { index ->
        val text = textBuilder.getInstruction<OneRegisterInstruction>(index).registerA
        val path = textBuilder.findFreeRegister(index, text)
        val presenter = textBuilder.findFreeRegister(index, text, path)
        check(maxOf(text, path, presenter) < 16)
        Triple(index, path to presenter, text)
    }
    sites.forEach { (index, registers, text) ->
        val (path, presenter) = registers
        val view = "Landroid/view/View;"
        val callback = "$MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->styleElementsText($PATH_BUILDER$view$TEXT)$TEXT"
        val readPresenter = commentPresenter?.let {
            """
                invoke-virtual {v$path}, $it
                move-result-object v$presenter
            """.trimIndent()
        } ?: "const/4 v$presenter, 0x0"
        textBuilder.addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static {}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->isEnabled()Z
                move-result v$presenter
                if-eqz v$presenter, :light_text_done

                move-object/from16 v$path, p0
                instance-of v$presenter, v$path, ${context.type}
                if-eqz v$presenter, :light_text_done
                check-cast v$path, ${context.type}
                $readPresenter
                iget-object v$path, v$path, $pathField
                invoke-static {v$path, v$presenter, v$text}, $callback
                move-result-object v$text
                :light_text_done
                nop
            """,
        )
    }
}
