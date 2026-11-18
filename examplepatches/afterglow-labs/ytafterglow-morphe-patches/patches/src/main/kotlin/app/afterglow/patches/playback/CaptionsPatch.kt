/* Native caption/muted-flag discovery adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Afterglow reads the server hint and native saved-choice boundaries directly.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CAPTIONS = "$EXTENSION_PACKAGE/playback/Captions;"
private const val NO_VOLUME_CAPTIONS_FLAG = 45692436L

private object SubtitleManagerClassFingerprint : Fingerprint(
    isStatic = true, returnType = "Z",
    parameters = listOf("L", "Landroid/view/accessibility/CaptioningManager;"),
    filters = listOf(
        fieldAccess("Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;"),
        methodCall("Landroid/view/accessibility/CaptioningManager;->isEnabled()Z")
    )
)

internal val captionsHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        // A manual caption selection writes the viewer's enabled/language choices
        // through YouTube's preference store, then sets its recent-choice bit.
        val selection = Fingerprint(classFingerprint = SubtitleManagerClassFingerprint,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("L", "L", "I"), returnType = "V", filters = listOf(
                methodCall(parameters = listOf("Ljava/lang/Boolean;"), returnType = "V"),
                fieldAccess(opcode = Opcode.IPUT_BOOLEAN, type = "Z")
            ))
        val chosen = (selection.method.implementation!!.instructions[selection.instructionMatches.last().index]
            as ReferenceInstruction).reference as FieldReference
        // Capture the same explicit selection that YouTube sends to its preference
        // writer. Its feature-gated store can lose this choice on a cold launch.
        val writeIndex = selection.instructionMatches.first().index
        val selectionInstructions = selection.method.implementation!!.instructions.toList()
        val write = selectionInstructions[writeIndex]
        val transaction = (write as ReferenceInstruction).reference as MethodReference
        val languageWrite = selectionInstructions[writeIndex + 1]
        val languageField = (languageWrite as ReferenceInstruction).reference as FieldReference
        require(languageWrite.opcode == Opcode.IPUT_OBJECT && languageField.type == "Ljava/lang/String;" &&
            languageField.definingClass == transaction.definingClass) { "Native caption language write changed" }
        val choiceRegister = (write as FiveRegisterInstruction).registerD
        val languageRegister = (languageWrite as OneRegisterInstruction).registerA
        require(choiceRegister < 16 && languageRegister < 16)
        selection.method.addInstructions(writeIndex + 1,
            "invoke-static { v$choiceRegister, v$languageRegister }, $CAPTIONS->onManualChoice(Ljava/lang/Boolean;Ljava/lang/String;)V")

        // Keep native track selection/fallbacks, replacing only the values read
        // at its remembered enabled/language boundaries. No delayed toggles.
        val initial = Fingerprint(classFingerprint = SubtitleManagerClassFingerprint,
            parameters = listOf("L", "L"), returnType = "V",
            filters = listOf(fieldAccess(chosen.smali),
                methodCall("Ljava/lang/Boolean;->booleanValue()Z", location = MatchAfterWithin(15))))
        val storedIndex = initial.instructionMatches.last().index + 1
        val storedRegister = (initial.method.implementation!!.instructions[storedIndex] as OneRegisterInstruction).registerA
        initial.method.addInstructions(storedIndex + 1, """
            invoke-static/range { v$storedRegister .. v$storedRegister }, $CAPTIONS->restoreEnabled(Z)Z
            move-result v$storedRegister
        """)
        val language = Fingerprint(classFingerprint = SubtitleManagerClassFingerprint,
            parameters = listOf(), returnType = "L", filters = listOf(
                fieldAccess(chosen.smali), checkCast("Ljava/lang/String;")))
        val languageIndex = language.instructionMatches.last().index
        val readLanguageRegister = (language.method.implementation!!.instructions[languageIndex] as OneRegisterInstruction).registerA
        language.method.addInstructions(languageIndex + 1, """
            invoke-static/range { v$readLanguageRegister .. v$readLanguageRegister }, $CAPTIONS->restoreLanguage(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$readLanguageRegister
        """)
        var readCount = 0
        for (method in selection.classDef.methods.toList()) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val reads = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.IGET_BOOLEAN &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference) == chosen
            }
            readCount += reads.size
            for ((index, instruction) in reads.asReversed()) {
                val register = (instruction as OneRegisterInstruction).registerA
                method.addInstructions(index + 1, """
                    invoke-static/range { v$register .. v$register }, $CAPTIONS->rememberChoice(Z)Z
                    move-result v$register
                """)
            }
        }
        require(readCount == 2) { "Native remembered-caption enable/language boundaries changed: $readCount" }

        // Also suppress the manager's device-enabled fallbacks (activation and
        // language), without touching Android's actual accessibility setting.
        var deviceReads = 0
        for (method in selection.classDef.methods.toList()) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val reads = instructions.withIndex().filter { (_, instruction) ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.smali ==
                    "Landroid/view/accessibility/CaptioningManager;->isEnabled()Z"
            }
            deviceReads += reads.size
            for ((index, _) in reads.asReversed()) {
                require(instructions[index + 1].opcode == Opcode.MOVE_RESULT)
                val register = (instructions[index + 1] as OneRegisterInstruction).registerA
                method.addInstructions(index + 2, """
                    invoke-static/range { v$register .. v$register }, $CAPTIONS->respectDeviceSetting(Z)Z
                    move-result v$register
                """)
            }
        }
        require(deviceReads == 2) { "Native caption device fallback boundaries changed: $deviceReads" }

        // The explicit enum names distinguish a server ON hint from the viewer's
        // own setting. Replace only ON/ON_RECOMMENDED with UNKNOWN (no preference).
        val state = Fingerprint(name = "<clinit>", strings = listOf("UNKNOWN", "OFF", "ON", "ON_RECOMMENDED"))
        val stateType = state.classDef.type
        val unknownWrite = Fingerprint(filters = listOf(string("UNKNOWN"),
            fieldAccess(opcode = Opcode.SPUT_OBJECT, type = stateType, location = MatchAfterWithin(5))
        )).match(state.method).instructionMatches.last().index
        val unknown = (state.method.implementation!!.instructions[unknownWrite] as ReferenceInstruction)
            .reference as FieldReference
        val hint = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf(), returnType = stateType, filters = listOf(
                fieldAccess(opcode = Opcode.SGET_OBJECT, type = "Ljava/util/Map;")
            )).method
        val returns = hint.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        require(returns.size == 1 && hint.implementation!!.registerCount >= 2)
        val (index, instruction) = returns.single()
        val result = (instruction as OneRegisterInstruction).registerA
        val scratch = if (result == 0) 1 else 0
        // Preserve incoming branches to this return, ensuring none bypass the gate.
        hint.replaceInstruction(index,
            "invoke-static/range { v$result .. v$result }, $CAPTIONS->ignoreServerState(Ljava/lang/Enum;)Z")
        hint.addInstructionsWithLabels(index + 1, """
            move-result v$scratch
            if-eqz v$scratch, :native_hint
            sget-object v$result, ${unknown.smali}
            :native_hint
            return-object v$result
        """)
        println("Afterglow captions: remembered ${chosen.smali} ($readCount reads), hint ${hint.smali}")

        val mutedFlagReads = Fingerprint(filters = listOf(literal(NO_VOLUME_CAPTIONS_FLAG))).matchAll().map { it.method }
        if (mutedFlagReads.isEmpty()) throw PatchException("No read of muted captions flag $NO_VOLUME_CAPTIONS_FLAG")
        mutedFlagReads.forEach { method ->
            method.literalIndices(NO_VOLUME_CAPTIONS_FLAG).asReversed().forEach { index ->
                method.overrideFlagAfterLiteral(index, "$CAPTIONS->allowMutedAutoCaptions(Z)Z")
            }
        }
    }
}
