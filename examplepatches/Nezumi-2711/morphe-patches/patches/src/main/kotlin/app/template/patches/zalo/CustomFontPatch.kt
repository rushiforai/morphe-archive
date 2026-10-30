package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object ZaloTypefaceFactoryFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "I"),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "get"),
        string("fonts/Roboto-Regular.ttf"),
        methodCall(definingClass = "Landroid/graphics/Typeface;", name = "createFromAsset"),
    ),
)

private object ZaloZinstantTextFontFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan;", name = "getFontKey"),
        methodCall(definingClass = "Ljava/util/concurrent/ConcurrentHashMap;", name = "get"),
        methodCall(definingClass = "Landroid/graphics/Typeface;", name = "create"),
    ),
)

private object ZaloZinstantText2FontFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Landroid/text/SpannableStringBuilder;", name = "replace"),
        methodCall(definingClass = "Lcom/zing/zalo/zinstant/utils/i;", name = "h"),
        methodCall(definingClass = "Lsy1/c;", name = "f"),
    ),
)

private object ZaloRichMessageItemFingerprint : Fingerprint(
    definingClass = "Lri/u4;",
    returnType = "Landroid/view/View;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("I", "Landroid/view/View;", "Landroid/view/ViewGroup;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/view/LayoutInflater;", name = "inflate"),
        methodCall(definingClass = "Landroid/view/View;", name = "findViewById"),
        methodCall(definingClass = "Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;", name = "setText"),
    ),
)

private object ZaloFontStartupFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/MainApplication;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("CURRENT_USER_UID_FLOW_RESTORE_APP"),
        methodCall(definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;", name = "set"),
    ),
)

private object ZaloMessageStyleFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lbv1/b;"),
    filters = listOf(
        methodCall(definingClass = "Lo62/b0;", name = "h"),
        methodCall(definingClass = "Lkn1/i;", name = "K0"),
    ),
)

private object ZaloChatPaintFingerprint : Fingerprint(
    returnType = "Landroid/text/TextPaint;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("Init default text paint ChatContent"),
        methodCall(definingClass = "Lcom/zing/zalo/ui/widget/d2;", name = "setTypeface"),
    ),
)

private object ZaloContactNameFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/zalocontact/ui/view/ContactTabContactRowModuleView;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = "Lcom/zing/zalo/control/ContactProfile;", name = "i0"),
        methodCall(definingClass = "Lkn1/i;", name = "E0"),
    ),
)

private object ZaloChatInfoCardFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/chatrow/emptyview/ChatEmptyView;",
    returnType = "Landroid/view/ViewGroup;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/zing/zalo/ui/chat/chatrow/emptyview/NormalUserEmptyView;", name = "setMTitle"),
        methodCall(definingClass = "Lcom/zing/zalo/ui/chat/chatrow/emptyview/NormalUserEmptyView;", name = "setMDescription"),
    ),
)

private object ZaloChatOptionsFingerprint : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/moduleview/chatinfo/BaseChatSettingItemModuleView;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(definingClass = "Lru1/l;", name = "<init>"),
        methodCall(definingClass = "Lcom/zing/zalo/uidrawing/ModulesView;", name = "J"),
    ),
)

private object ZaloChatQuickActionFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Lcom/zing/zalo/ui/moduleview/chatinfo/ChatInfoModuleViews\$SettingHorizontalModuleView;",
        "Landroid/content/Context;", "Z",
    ),
    filters = listOf(
        methodCall(definingClass = "Lru1/l;", name = "<init>"),
        methodCall(definingClass = "Lru1/l;", name = "M0"),
    ),
)

@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = "Custom font",
    description = "Choose a font in Nezumi's Settings for Zalo's text, chat messages, info card, options, and contacts.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.08.01"), AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(ZaloTypefaceFactoryFingerprint.matchAll(1..1).size == 1)
        check(ZaloZinstantTextFontFingerprint.matchAll(1..1).size == 1)
        if (packageMetadata.versionName == "26.10.02") {
            applyCurrentFontHooks()
            attachNezumiSettings()
            return@execute
        }
        check(ZaloZinstantText2FontFingerprint.matchAll(1..1).size == 1)
        check(ZaloRichMessageItemFingerprint.matchAll(1..1).size == 1)
        check(ZaloFontStartupFingerprint.matchAll(1..1).size == 1)
        check(ZaloMessageStyleFingerprint.matchAll(1..1).size == 1)
        check(ZaloChatPaintFingerprint.matchAll(1..1).size == 1)
        check(ZaloContactNameFingerprint.matchAll(1..1).size == 1)
        check(ZaloChatInfoCardFingerprint.matchAll(1..1).size == 1)
        check(ZaloChatOptionsFingerprint.matchAll(1..1).size == 1)
        check(ZaloChatQuickActionFingerprint.matchAll(1..1).size == 1)
        val method = ZaloTypefaceFactoryFingerprint.method
        check(method.implementation!!.registerCount >= 4)
        val original = method.implementation!!.instructions.first()
        method.addInstructionsWithLabels(0, """
            invoke-static {p0, p1}, Lapp/template/extension/extension/CustomFont;->getTypeface(Landroid/content/Context;I)Landroid/graphics/Typeface;
            move-result-object v0
            if-eqz v0, :nezumi_original_typeface
            return-object v0
        """.trimIndent(), ExternalLabel("nezumi_original_typeface", original))

        val zinstantTextFont = ZaloZinstantTextFontFingerprint.method
        check(zinstantTextFont.implementation!!.registerCount >= 7)
        val zinstantInstructions = zinstantTextFont.implementation!!.instructions
        val weightRead = zinstantInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.IGET &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan;->fontWeight:I"
        }
        check(weightRead.size == 1)
        val weightIndex = weightRead.single().index
        check(zinstantInstructions.elementAt(weightIndex + 1).opcode == Opcode.INVOKE_STATIC &&
            (zinstantInstructions.elementAt(weightIndex + 1) as? ReferenceInstruction)?.reference?.toString() ==
            "Lsy1/c;->b(II)Landroid/graphics/Typeface;")
        check(zinstantInstructions.elementAt(weightIndex + 2).opcode == Opcode.MOVE_RESULT_OBJECT &&
            (zinstantInstructions.elementAt(weightIndex + 2) as? OneRegisterInstruction)?.registerA == 0)
        zinstantTextFont.replaceInstruction(weightIndex, "iget v2, p0, Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan;->fontWeight:I")
        zinstantTextFont.replaceInstruction(weightIndex + 1, "invoke-static {v1, v2}, Lsy1/c;->b(II)Landroid/graphics/Typeface;")
        zinstantTextFont.addInstructions(weightIndex + 3, "const/4 v3, 0x0")
        val zinstantReturn = zinstantInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.RETURN_OBJECT &&
                (instruction as? OneRegisterInstruction)?.registerA == 0
        }
        check(zinstantReturn.size == 1)
        val zinstantReturnIndex = zinstantReturn.single().index
        zinstantTextFont.replaceInstruction(zinstantReturnIndex,
            "invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;")
        zinstantTextFont.addInstructions(zinstantReturnIndex + 1, """
            move-result-object v1
            invoke-static {v1, v3, v0}, Lapp/template/extension/extension/CustomFont;->forZinstantText(Landroid/content/Context;ZLandroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v0
            return-object v0
        """.trimIndent())

        val zinstantText2 = ZaloZinstantText2FontFingerprint.method
        check(zinstantText2.implementation!!.registerCount >= 5)
        val text2Instructions = zinstantText2.implementation!!.instructions
        val fontCalls = text2Instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lsy1/c;->f(ILjava/lang/String;Z)Landroid/graphics/Typeface;"
        }
        check(fontCalls.size == 1)
        val fontCall = fontCalls.single().index
        check(text2Instructions.elementAt(fontCall + 1).opcode == Opcode.MOVE_RESULT_OBJECT &&
            (text2Instructions.elementAt(fontCall + 1) as? OneRegisterInstruction)?.registerA == 0)
        check(text2Instructions.elementAt(fontCall + 2).opcode == Opcode.IPUT_OBJECT &&
            (text2Instructions.elementAt(fontCall + 2) as? ReferenceInstruction)?.reference?.toString() ==
            "Lt12/n;->i:Landroid/graphics/Typeface;")
        zinstantText2.addInstructions(fontCall + 2, """
            iget-object v3, p0, Lt12/n;->a:Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan2;
            iget-object v3, v3, Lcom/zing/zalo/zinstant/zom/text/ZOMTextSpan2;->fontUrl:Ljava/lang/String;
            sget-object v1, Lsy1/c;->d:Ljava/util/concurrent/ConcurrentHashMap;
            invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v1
            instance-of v3, v1, Landroid/graphics/Typeface;
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v1
            invoke-static {v1, v3, v0}, Lapp/template/extension/extension/CustomFont;->forZinstantText(Landroid/content/Context;ZLandroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v0
        """.trimIndent())

        val richMessageItem = ZaloRichMessageItemFingerprint.method
        check(richMessageItem.implementation!!.registerCount >= 11)
        val itemInstructions = richMessageItem.implementation!!.instructions
        val titleSetters = itemInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;->setText(Ljava/lang/CharSequence;)V"
        }
        check(titleSetters.size == 1)
        val titleSetter = titleSetters.single()
        check((titleSetter.value as? FiveRegisterInstruction)?.registerC == 10 &&
            (titleSetter.value as? FiveRegisterInstruction)?.registerD == 8)
        val nextItemInstruction = itemInstructions.elementAt(titleSetter.index + 1)
        richMessageItem.addInstructionsWithLabels(titleSetter.index + 1, """
            invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;
            move-result-object v2
            iget-object v4, p3, Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;->x:Lru1/l;
            iget-object v4, v4, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v2, v4}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v5
            if-eqz v5, :nezumi_no_rich_item_font
            invoke-virtual {p3, v5}, Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;->setTypeface(Landroid/graphics/Typeface;)V
            iget-object v6, p3, Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;->x:Lru1/l;
            iget-object v6, v6, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v2, v4, v5, v6}, Lapp/template/extension/extension/CustomFont;->diagnoseRichItem(Landroid/content/Context;Landroid/graphics/Typeface;Landroid/graphics/Typeface;Landroid/graphics/Typeface;)V
        """.trimIndent(), ExternalLabel("nezumi_no_rich_item_font", nextItemInstruction))

        val startup = ZaloFontStartupFingerprint.method
        check(startup.implementation!!.registerCount >= 19)
        val flagIndex = startup.implementation!!.instructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                (it as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/ui/widget/h2;->a:Ljava/util/concurrent/atomic/AtomicBoolean;"
        }
        check(flagIndex >= 0)
        val flagSetter = startup.implementation!!.instructions.elementAt(flagIndex + 1)
        check(flagSetter.opcode == Opcode.INVOKE_VIRTUAL &&
            (flagSetter as? ReferenceInstruction)?.reference?.toString() ==
            "Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V")
        startup.addInstructions(flagIndex + 2, """
            invoke-static {v1, v10}, Lapp/template/extension/extension/CustomFont;->enableSelectedFont(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicBoolean;)V
        """.trimIndent())

        val messageStyle = ZaloMessageStyleFingerprint.method
        check(messageStyle.implementation!!.registerCount >= 9)
        val instructions = messageStyle.implementation!!.instructions
        val typefaceCall = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lo62/b0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)Landroid/graphics/Typeface;" &&
                (instruction as? FiveRegisterInstruction)?.registerC == 1 &&
                instructions.indexOf(instruction).let { index ->
                    index + 2 < instructions.size &&
                        (instructions.elementAt(index + 2) as? ReferenceInstruction)?.reference?.toString() ==
                        "Lkn1/i;->K0(Landroid/graphics/Typeface;)V"
                }
        }
        check(typefaceCall >= 0)
        val result = instructions.elementAt(typefaceCall + 1)
        val setter = instructions.elementAt(typefaceCall + 2)
        check(result.opcode == Opcode.MOVE_RESULT_OBJECT &&
            (result as? OneRegisterInstruction)?.registerA == 1)
        check(setter.opcode == Opcode.INVOKE_VIRTUAL &&
            (setter as? ReferenceInstruction)?.reference?.toString() ==
            "Lkn1/i;->K0(Landroid/graphics/Typeface;)V" &&
            (setter as? FiveRegisterInstruction)?.registerC == 0 && setter.registerD == 1)
        messageStyle.addInstructionsWithLabels(typefaceCall + 2, """
            instance-of v3, v0, Lru1/l;
            if-eqz v3, :nezumi_original_message_font
            iget-object v3, v0, Lhn1/j;->c:Landroid/content/Context;
            invoke-static {v3, v1}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v1
        """.trimIndent(), ExternalLabel("nezumi_original_message_font", setter))

        val chatPaint = ZaloChatPaintFingerprint.method
        check(chatPaint.implementation!!.registerCount >= 7)
        val chatInstructions = chatPaint.implementation!!.instructions
        val paintReturn = chatInstructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        check(paintReturn > 0 && (chatInstructions.elementAt(paintReturn) as? OneRegisterInstruction)?.registerA == 0)
        check(chatInstructions.elementAt(paintReturn - 1).opcode == Opcode.IGET_OBJECT &&
            (chatInstructions.elementAt(paintReturn - 1) as? ReferenceInstruction)?.reference?.toString() ==
            "Lo00/q;->Z2:Lcom/zing/zalo/ui/widget/d2;")
        chatPaint.addInstructions(paintReturn, """
            invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
            move-result-object v1
            invoke-static {v1, v0}, Lapp/template/extension/extension/CustomFont;->forChatPaint(Landroid/content/Context;Landroid/text/TextPaint;)V
        """.trimIndent())

        val contactName = ZaloContactNameFingerprint.method
        check(contactName.implementation!!.registerCount >= 15)
        val contactInstructions = contactName.implementation!!.instructions
        val nameSetters = contactInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lkn1/i;->E0(Ljava/lang/CharSequence;)V" &&
                (instruction as? FiveRegisterInstruction)?.registerC == 13 &&
                (instruction as? FiveRegisterInstruction)?.registerD == 3
        }
        check(nameSetters.size == 1)
        val nameSetter = nameSetters.single().index
        contactName.addInstructionsWithLabels(nameSetter + 1, """
            iget-object v3, p4, Lhn1/j;->c:Landroid/content/Context;
            const/4 v4, 0x5
            invoke-static {v3, v4}, Lapp/template/extension/extension/CustomFont;->getTypeface(Landroid/content/Context;I)Landroid/graphics/Typeface;
            move-result-object v3
            if-eqz v3, :nezumi_original_contact_font
            invoke-virtual {p4, v3}, Lru1/l;->K0(Landroid/graphics/Typeface;)V
        """.trimIndent(), ExternalLabel("nezumi_original_contact_font", contactInstructions.elementAt(nameSetter + 1)))

        val infoCard = ZaloChatInfoCardFingerprint.method
        check(infoCard.implementation!!.registerCount >= 11)
        val cardInstructions = infoCard.implementation!!.instructions
        val descriptionSetters = cardInstructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/ui/chat/chatrow/emptyview/NormalUserEmptyView;->setMDescription(Lru1/l;)V"
        }
        check(descriptionSetters.size == 1)
        val descriptionSetter = descriptionSetters.single()
        check((descriptionSetter.value as? FiveRegisterInstruction)?.registerC == 0 &&
            (descriptionSetter.value as? FiveRegisterInstruction)?.registerD == 1)
        infoCard.addInstructions(descriptionSetter.index + 1, """
            invoke-virtual {v0}, Lcom/zing/zalo/ui/chat/chatrow/emptyview/NormalUserEmptyView;->getMTitle()Lru1/l;
            move-result-object v9
            iget-object v8, v9, Lhn1/j;->c:Landroid/content/Context;
            iget-object v2, v9, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v8, v2}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v2
            invoke-virtual {v9, v2}, Lru1/l;->K0(Landroid/graphics/Typeface;)V
            iget-object v8, v1, Lhn1/j;->c:Landroid/content/Context;
            iget-object v2, v1, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v8, v2}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v2
            invoke-virtual {v1, v2}, Lru1/l;->K0(Landroid/graphics/Typeface;)V
        """.trimIndent())

        val options = ZaloChatOptionsFingerprint.method
        check(options.implementation!!.registerCount >= 16)
        val optionInstructions = options.implementation!!.instructions
        val optionReturn = optionInstructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(optionReturn > 0 && (optionInstructions.elementAt(optionReturn - 1) as? ReferenceInstruction)
            ?.reference?.toString() == "Lxo1/l3;->i0(Landroid/view/View;I)V")
        options.addInstructions(optionReturn, listOf("H", "K", "L", "l0").joinToString("\n") { field -> """
            iget-object v0, p0, Lcom/zing/zalo/ui/moduleview/chatinfo/BaseChatSettingItemModuleView;->$field:Lru1/l;
            iget-object v1, v0, Lhn1/j;->c:Landroid/content/Context;
            iget-object v2, v0, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v1, v2}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v2
            invoke-virtual {v0, v2}, Lru1/l;->K0(Landroid/graphics/Typeface;)V
        """.trimIndent() })

        val quickAction = ZaloChatQuickActionFingerprint.method
        check(quickAction.implementation!!.registerCount >= 11)
        val quickInstructions = quickAction.implementation!!.instructions
        val quickReturn = quickInstructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(quickReturn > 0 && (quickInstructions.elementAt(quickReturn - 1) as? ReferenceInstruction)
            ?.reference?.toString() == "Lgg1/d;->b1:Z")
        quickAction.addInstructions(quickReturn, """
            iget-object v0, p0, Lgg1/d;->W0:Lru1/l;
            iget-object v1, v0, Lhn1/j;->c:Landroid/content/Context;
            iget-object v2, v0, Lkn1/i;->Y0:Landroid/graphics/Typeface;
            invoke-static {v1, v2}, Lapp/template/extension/extension/CustomFont;->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v2
            invoke-virtual {v0, v2}, Lru1/l;->K0(Landroid/graphics/Typeface;)V
        """.trimIndent())
        attachNezumiSettings()
    }
}

private fun BytecodePatchContext.applyCurrentFontHooks() {
    val extension = "Lapp/template/extension/extension/CustomFont;"
    val factory = ZaloTypefaceFactoryFingerprint.method
    val original = factory.implementation!!.instructions.first()
    factory.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $extension->getTypeface(Landroid/content/Context;I)Landroid/graphics/Typeface;
        move-result-object v0
        if-eqz v0, :nezumi_original_typeface
        return-object v0
    """.trimIndent(), ExternalLabel("nezumi_original_typeface", original))

    val view = mutableClassDefBy("Lcom/zing/zalo/ui/widget/textview/RobotoTextModulesView;")
    val getter = view.methods.single { it.name == "getTypeface" }
    val fields = getter.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }
    val fontField = fields.single { it.type == "Landroid/graphics/Typeface;" }
    val module = mutableClassDefBy(fields.single { it.type != "Landroid/graphics/Typeface;" }.type)
    val base = mutableClassDefBy(fontField.definingClass)
    val contextOwner = mutableClassDefBy(base.superclass!!)
    val contextField = contextOwner.fields.single { it.type == "Landroid/content/Context;" }
    val setter = base.methods.single {
        it.parameterTypes == listOf("Landroid/graphics/Typeface;") && it.returnType == "V"
    }
    check(setter.implementation!!.registerCount >= 4)
    setter.addInstructions(0, """
        iget-object v0, p0, ${contextField.definingClass}->${contextField.name}:Landroid/content/Context;
        invoke-static {v0, p1}, $extension->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
        move-result-object p1
    """.trimIndent())
    val constructors = module.methods.filter { it.name == "<init>" }
    check(constructors.size == 2)
    constructors.forEach { constructor ->
        val last = constructor.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(last >= 0 && constructor.implementation!!.registerCount - constructor.parameterTypes.size >= 3)
        constructor.addInstructions(last, """
            iget-object v0, p0, ${contextField.definingClass}->${contextField.name}:Landroid/content/Context;
            iget-object v1, p0, $fontField
            invoke-static {v0, v1}, $extension->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v1
            invoke-virtual {p0, v1}, ${base.type}->${setter.name}(Landroid/graphics/Typeface;)V
        """.trimIndent())
    }

    val zinstant = ZaloZinstantTextFontFingerprint.method
    val fallback = zinstant.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? MethodReference
    }.single { it.parameterTypes == listOf("I", "I") && it.returnType == "Landroid/graphics/Typeface;" }
    val defaultFont = mutableClassDefBy(fallback.definingClass).methods.single {
        it.name == fallback.name && it.parameterTypes == fallback.parameterTypes
    }
    check(defaultFont.implementation!!.registerCount >= 5)
    defaultFont.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .toList().asReversed().forEach { (index, instruction) ->
            val result = (instruction as OneRegisterInstruction).registerA
            defaultFont.replaceInstruction(index, "move-object v2, v$result")
            defaultFont.addInstructions(index + 1, """
                invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
                move-result-object v0
                invoke-static {v0, v2}, $extension->forMessageModule(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
                move-result-object v0
                return-object v0
            """.trimIndent())
        }

    val paintFingerprint = object : Fingerprint(
        returnType = "Landroid/text/TextPaint;", parameters = emptyList(),
        filters = listOf(string("Init default text paint ChatContent")),
    ) {}
    check(paintFingerprint.matchAll(1..1).size == 1)
    val paint = paintFingerprint.method
    val paintReturn = paint.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    check(paint.implementation!!.registerCount >= 7)
    check((paint.implementation!!.instructions.elementAt(paintReturn) as OneRegisterInstruction).registerA == 0)
    paint.addInstructions(paintReturn, """
        invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
        move-result-object v1
        invoke-static {v1, v0}, $extension->forChatPaint(Landroid/content/Context;Landroid/text/TextPaint;)V
    """.trimIndent())

    check(ZaloFontStartupFingerprint.matchAll(1..1).size == 1)
    val startup = ZaloFontStartupFingerprint.method
    val flagOwner = module.methods.single {
        it.parameterTypes == listOf("Landroid/graphics/Typeface;") && it.returnType == "V"
    }.implementation!!.instructions.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }.single { it.type == "Ljava/util/concurrent/atomic/AtomicBoolean;" }
    val flagIndex = startup.implementation!!.instructions.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == flagOwner.toString()
    }
    check(flagIndex >= 0)
    val flagRegister = (startup.implementation!!.instructions.elementAt(flagIndex) as OneRegisterInstruction).registerA
    check(startup.implementation!!.instructions.elementAt(flagIndex + 1).opcode == Opcode.INVOKE_VIRTUAL)
    startup.addInstructions(flagIndex + 2, """
        invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
        move-result-object v0
        invoke-static {v0, v$flagRegister}, $extension->enableSelectedFont(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    """.trimIndent())
}