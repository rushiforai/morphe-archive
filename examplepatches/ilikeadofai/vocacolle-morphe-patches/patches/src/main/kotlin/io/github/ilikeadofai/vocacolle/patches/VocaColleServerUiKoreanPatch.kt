package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

private const val SERVER_UI_TRANSLATOR =
    "Lio/github/ilikeadofai/vocacolle/extension/UiLanguageTranslator;"
private const val NICO_PUSH_TOPIC = "Lzf/j;"

private object RankingDisplayLabelFingerprint : Fingerprint(
    definingClass = "Ljp/nicovideo/nicobox/ui/ranking/b;",
    name = "g",
    returnType = "Ljava/lang/String;",
    parameters = listOf("I", "Landroid/content/Context;"),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            implementation.registerCount == 5 &&
                implementation.instructions.count { it.opcode == Opcode.RETURN_OBJECT } == 6
        } == true
    }
)

private object NicoPushTitleFingerprint : Fingerprint(
    definingClass = NICO_PUSH_TOPIC,
    name = "c",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            implementation.registerCount == 2 &&
                implementation.instructions.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
                implementation.instructions.filterIsInstance<ReferenceInstruction>()
                    .mapNotNull { it.reference as? FieldReference }
                    .count {
                        it.definingClass == NICO_PUSH_TOPIC &&
                            it.name == "a" &&
                            it.type == "Ljava/lang/String;"
                    } == 1
        } == true
    }
)

private object NicoPushDescriptionFingerprint : Fingerprint(
    definingClass = NICO_PUSH_TOPIC,
    name = "a",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            implementation.registerCount == 2 &&
                implementation.instructions.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
                implementation.instructions.filterIsInstance<ReferenceInstruction>()
                    .mapNotNull { it.reference as? FieldReference }
                    .count {
                        it.definingClass == NICO_PUSH_TOPIC &&
                            it.name == "b" &&
                            it.type == "Ljava/lang/String;"
                    } == 1
        } == true
    }
)

@Suppress("unused")
val vocacolleServerUiKoreanPatch = bytecodePatch(
    name = null,
    description = "Localizes whitelisted server-provided labels only at native UI display boundaries.",
    default = true
) {
    compatibleWith(VOCACOLLE)
    extendWith("extensions/extension.mpe")

    execute {
        patchRankingDisplayReturns()
        patchPushDisplayGetter(
            NicoPushTitleFingerprint,
            "translatePushTitle"
        )
        patchPushDisplayGetter(
            NicoPushDescriptionFingerprint,
            "translatePushDescription"
        )
    }
}

context(_: BytecodePatchContext)
private fun patchRankingDisplayReturns() {
    val method = RankingDisplayLabelFingerprint.method
    val returns = method.implementation!!.instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .toList()

    check(returns.size == 6) {
        "Expected six ranking object returns, found ${returns.size}"
    }

    returns.asReversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        method.replaceInstruction(
            index,
            "invoke-static {v$register}, $SERVER_UI_TRANSLATOR->translateRanking(Ljava/lang/String;)Ljava/lang/String;"
        )
        method.addInstructions(
            index + 1,
            """
                move-result-object v$register
                return-object v$register
            """.trimIndent()
        )
    }
}

context(_: BytecodePatchContext)
private fun patchPushDisplayGetter(
    fingerprint: Fingerprint,
    translatorMethod: String
) {
    val method = fingerprint.method
    val implementation = method.implementation!!
    val returns = implementation.instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .toList()

    check(returns.size == 1) {
        "Expected one object return in ${method.definingClass}->${method.name}, found ${returns.size}"
    }

    val (index, instruction) = returns.single()
    val sourceRegister = (instruction as OneRegisterInstruction).registerA
    val parameterRegister = implementation.registerCount - 1
    check(sourceRegister != parameterRegister) {
        "Push display getter needs a local register distinct from p0"
    }

    method.replaceInstruction(
        index,
        "iget-object p0, p0, $NICO_PUSH_TOPIC->d:Ljava/lang/String;"
    )
    method.addInstructions(
        index + 1,
        """
            invoke-static {p0, v$sourceRegister}, $SERVER_UI_TRANSLATOR->$translatorMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$sourceRegister
            return-object v$sourceRegister
        """.trimIndent()
    )
}
