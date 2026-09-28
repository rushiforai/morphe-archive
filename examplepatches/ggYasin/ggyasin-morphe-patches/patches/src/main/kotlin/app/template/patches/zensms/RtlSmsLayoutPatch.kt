package app.template.patches.zensms

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ZEN_SMS_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMPOSER = "Landroidx/compose/runtime/Composer;"

@Suppress("unused")
val rtlZenSmsLayoutPatch = bytecodePatch(
    name = "RTL SMS lists",
    description =
        "Adds RTL conversation rows while keeping conversation titles left to right.",
    default = true,
) {
    compatibleWith(ZEN_SMS_COMPATIBILITY)
    dependsOn(sharedZenSmsExtensionPatch())

    execute {
        addSettingsSwitches()
        wrapConversationRows()
    }
}

context(_: BytecodePatchContext)
private fun addSettingsSwitches() {
    val method = RtlAppearanceSettingsFingerprint.method
    val textSizeItemIndex = method.instructions.indexOfLast { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lcom/zensms/app/ui/settings/p;" &&
            reference.name == "k"
    }
    check(textSizeItemIndex >= 0) { "Could not find the Text Size settings item" }

    // v5 is the active Composer at the final item in this exact 1.2.04 lambda.
    method.addInstruction(
        textSizeItemIndex + 1,
        "invoke-static {v5}, $RTL_EXTENSION_CLASS->renderSettings(Ljava/lang/Object;)V",
    )
}

context(_: BytecodePatchContext)
private fun wrapConversationRows() {
    val method = RtlConversationItemFingerprint.method
    val beginIndex = method.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lcom/zensms/app/ui/components/w;" &&
            reference.name == "a" &&
            reference.parameterTypes.singleOrNull().toString() == COMPOSER
    }
    check(beginIndex >= 0) { "Could not find the conversation-row content anchor" }

    val endIndex = method.instructions.indexOfLast { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_INTERFACE &&
            reference?.definingClass == COMPOSER &&
            reference.name == "endNode"
    }
    check(endIndex > beginIndex) { "Could not find the conversation-row closing anchor" }

    val titleTextIndices = method.instructions.withIndex().filter { (_, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Landroidx/compose/material3/TextKt;" &&
            reference.name == "Text-IbK3jfQ" &&
            reference.parameterTypes.firstOrNull().toString() ==
                "Landroidx/compose/ui/text/AnnotatedString;"
    }.map { it.index }
    check(titleTextIndices.size == 1) {
        "Expected exactly one annotated conversation-title Text call"
    }
    val titleTextIndex = titleTextIndices.single()
    check(titleTextIndex > beginIndex && titleTextIndex < endIndex) {
        "Conversation-title Text call is outside the row content"
    }

    // Add hooks from the end of the method backwards so earlier insertions cannot
    // shift the original anchor indices.
    method.addInstruction(
        endIndex + 1,
        "invoke-static {v12}, $RTL_EXTENSION_CLASS->endDirectionProvider(Ljava/lang/Object;)V",
    )
    method.addInstruction(
        titleTextIndex + 1,
        "invoke-static {v12}, $RTL_EXTENSION_CLASS->endDirectionProvider(Ljava/lang/Object;)V",
    )

    // The row stays RTL, but the title paragraph uses LTR fallback for neutral
    // phone-number characters and a physical Right alignment. Inject these in
    // reverse order at one index to produce begin -> align -> Text -> end.
    method.addInstruction(
        titleTextIndex,
        "check-cast v28, Landroidx/compose/ui/text/style/TextAlign;",
    )
    method.addInstruction(
        titleTextIndex,
        "move-result-object v28",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static {}, $RTL_EXTENSION_CLASS->conversationLabelTextAlign()Ljava/lang/Object;",
    )
    method.addInstruction(
        titleTextIndex,
        "move-result v41",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static/range {v41 .. v41}, " +
            "$RTL_EXTENSION_CLASS->conversationLabelDefaultMask(I)I",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static {v12}, $RTL_EXTENSION_CLASS->beginConversationLabel(Ljava/lang/Object;)V",
    )

    method.addInstruction(
        // The trace-disabled branch joins on the anchor itself. Insert after it
        // so both traced and normal composition paths open the provider.
        beginIndex + 1,
        "invoke-static {v12}, $RTL_EXTENSION_CLASS->beginConversationList(Ljava/lang/Object;)V",
    )
}
