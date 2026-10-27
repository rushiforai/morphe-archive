package app.template.patches.zensms

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ZEN_SMS_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

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
        check(packageMetadata.versionName in setOf("1.2.04", "1.2.16")) { "Unsupported ZenSMS RTL ABI" }
        adaptSettingsCallbackAbi()
        addSettingsSwitches()
        wrapConversationRows()
    }
}

context(context: BytecodePatchContext)
private fun adaptSettingsCallbackAbi() {
    val latest = context.packageMetadata.versionName == "1.2.16"
    val function1 = if (latest) "Lz/bn;" else "Lz/gk;"
    val function2 = if (latest) "Lz/fn;" else "Lz/kk;"
    val settings = if (latest) "Lcom/zensms/app/ui/settings/q;" else "Lcom/zensms/app/ui/settings/p;"
    check(context.classDefBy(function1).methods.any {
        it.name == "invoke" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/Object;") &&
            it.returnType == "Ljava/lang/Object;"
    }) { "Unsupported Function1 callback interface" }
    check(context.classDefBy(settings).methods.any {
        it.name == "o" && it.parameterTypes.map { p -> p.toString() } == listOf(
            "Landroidx/compose/ui/graphics/vector/ImageVector;", "Ljava/lang/String;", "Ljava/lang/String;",
            "Z", function1, function2, COMPOSER, "I", "I",
        ) && it.returnType == "V"
    }) { "Unsupported SettingsSwitch signature" }
    val callback = context.mutableClassDefBy("Lapp/patchlab/extension/rtl/RtlSmsLayout\$ToggleCallback;")
    check(callback.superclass == "Lkotlin/jvm/internal/Lambda;" && callback.interfaces == listOf("Lz/gk;"))
    if (!latest) return
    // Keep the MPE ABI canonical for 141; relink the merged callback for 153.
    // Never ship app callback stubs or implement both incompatible app ABIs.
    callback.interfaces.clear()
    callback.interfaces.add(function1)
    val replacements = mapOf("com.zensms.app.ui.settings.p" to "com.zensms.app.ui.settings.q", "z.gk" to "z.bn", "z.kk" to "z.fn")
    val reflection = context.mutableClassDefBy(RTL_EXTENSION_CLASS).methods.single { it.name == "ensureSettingsReflection" }
    val found = mutableSetOf<String>()
    reflection.instructions.forEachIndexed { index, instruction ->
        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        val replacement = replacements[value] ?: return@forEachIndexed
        reflection.replaceInstruction(index, "const-string v${(instruction as OneRegisterInstruction).registerA}, \"$replacement\"")
        found += value!!
    }
    check(found == replacements.keys) { "Extension reflective ABI anchors missing" }
}

context(context: BytecodePatchContext)
private fun addSettingsSwitches() {
    val method = RtlAppearanceSettingsFingerprint.method
    val owner = if (context.packageMetadata.versionName == "1.2.16") "Lcom/zensms/app/ui/settings/q;" else "Lcom/zensms/app/ui/settings/p;"
    val textSizeItemIndex = method.instructions.indexOfLast { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == owner &&
            reference.name == "k"
    }
    check(textSizeItemIndex >= 0) { "Could not find the Text Size settings item" }

    // Resolve the Composer argument from the audited Text Size call prototype.
    val item = method.instructions.elementAt(textSizeItemIndex) as RegisterRangeInstruction
    val reference = (item as ReferenceInstruction).reference as MethodReference
    check(reference.parameterTypes.map { it.toString() }.takeLast(3) == listOf(COMPOSER, "I", "I"))
    val composer = item.startRegister + reference.parameterTypes.size - 3
    method.addInstruction(
        textSizeItemIndex + 1,
        "invoke-static {v$composer}, $RTL_EXTENSION_CLASS->renderSettings(Ljava/lang/Object;)V",
    )
}

context(context: BytecodePatchContext)
private fun wrapConversationRows() {
    val method = RtlConversationItemFingerprint.method
    val latest = context.packageMetadata.versionName == "1.2.16"
    val anchorClass = if (latest) "Lcom/zensms/app/ui/components/y;" else "Lcom/zensms/app/ui/components/w;"
    val beginIndex = method.instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == anchorClass &&
            reference.name == "a" &&
            reference.parameterTypes.singleOrNull().toString() == COMPOSER
    }
    check(beginIndex >= 0) { "Could not find the conversation-row content anchor" }
    val composer = (method.instructions.elementAt(beginIndex) as FiveRegisterInstruction).registerC
    check(composer == if (latest) 11 else 12) { "Unexpected conversation Composer register" }

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
    check(titleTextIndices.size == if (latest) 2 else 1) {
        "Unexpected annotated Text call count"
    }
    // 153 adds a second AnnotatedString for the highlighted message preview.
    // Only the first, TitleMedium-styled call is the conversation title.
    val titleTextIndex = titleTextIndices.first()
    val titlePrelude = method.instructions.take(titleTextIndex).takeLast(50)
    check(titlePrelude.any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getTitleMedium"
    }) { "Conversation title style anchor missing" }
    check((method.instructions.elementAt(titleTextIndex) as RegisterRangeInstruction).startRegister == 16)
    check(titleTextIndex > beginIndex && titleTextIndex < endIndex) {
        "Conversation-title Text call is outside the row content"
    }

    // In both 1.2.04 (registers 61) and 1.2.16 (registers 88), Text-IbK3jfQ is
    // invoked via invoke-static/range with StartRegister = 16 and 26 arguments:
    // arg 12 is TextAlign -> register 16 + 12 = v28
    // arg 25 is default-mask int -> register 16 + 25 = v41
    val textCall = method.instructions.elementAt(titleTextIndex) as RegisterRangeInstruction
    val alignReg = textCall.startRegister + 12
    val maskReg = textCall.startRegister + 25
    check(alignReg == 28 && maskReg == 41) { "Unexpected Text argument registers" }

    // Add hooks from the end of the method backwards so earlier insertions cannot
    // shift the original anchor indices.
    method.addInstruction(
        endIndex + 1,
        "invoke-static {v$composer}, $RTL_EXTENSION_CLASS->endDirectionProvider(Ljava/lang/Object;)V",
    )
    method.addInstruction(
        titleTextIndex + 1,
        "invoke-static {v$composer}, $RTL_EXTENSION_CLASS->endDirectionProvider(Ljava/lang/Object;)V",
    )

    // The row stays RTL, but the title paragraph uses LTR fallback for neutral
    // phone-number characters and a physical Right alignment. Inject these in
    // reverse order at one index to produce begin -> align -> Text -> end.
    method.addInstruction(
        titleTextIndex,
        "check-cast v$alignReg, Landroidx/compose/ui/text/style/TextAlign;",
    )
    method.addInstruction(
        titleTextIndex,
        "move-result-object v$alignReg",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static {}, $RTL_EXTENSION_CLASS->conversationLabelTextAlign()Ljava/lang/Object;",
    )
    method.addInstruction(
        titleTextIndex,
        "move-result v$maskReg",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static/range {v$maskReg .. v$maskReg}, " +
            "$RTL_EXTENSION_CLASS->conversationLabelDefaultMask(I)I",
    )
    method.addInstruction(
        titleTextIndex,
        "invoke-static {v$composer}, $RTL_EXTENSION_CLASS->beginConversationLabel(Ljava/lang/Object;)V",
    )

    method.addInstruction(
        // The trace-disabled branch joins on the anchor itself. Insert after it
        // so both traced and normal composition paths open the provider.
        beginIndex + 1,
        "invoke-static {v$composer}, $RTL_EXTENSION_CLASS->beginConversationList(Ljava/lang/Object;)V",
    )
}
