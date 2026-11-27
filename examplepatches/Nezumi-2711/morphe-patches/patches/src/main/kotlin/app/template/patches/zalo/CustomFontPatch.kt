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

@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = "Custom font",
    description = "Choose a font in Nezumi's Settings for Zalo's text, chat messages, info card, options, and contacts.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.CUSTOM_FONT)
        check(ZaloTypefaceFactoryFingerprint.matchAll(1..1).size == 1)
        check(ZaloZinstantTextFontFingerprint.matchAll(1..1).size == 1)
        applyCurrentFontHooks()
        attachNezumiSettings("attachCustomFont")
    }
}

private fun BytecodePatchContext.applyCurrentFontHooks() {
    val extension = CUSTOM_FONT
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
    val paintRegister = (paint.implementation!!.instructions.elementAt(paintReturn) as OneRegisterInstruction).registerA
    check(paintRegister < 16)
    val contextRegister = if (paintRegister == 0) 1 else 0
    paint.addInstructions(paintReturn, """
        invoke-static {}, Lcom/zing/zalo/MainApplication;->getAppContext()Landroid/content/Context;
        move-result-object v$contextRegister
        invoke-static {v$contextRegister, v$paintRegister}, $extension->forChatPaint(Landroid/content/Context;Landroid/text/TextPaint;)V
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

    registerHooks(PatchId.CUSTOM_FONT, factory, setter, *constructors.toTypedArray(), defaultFont, paint, startup)
}