package app.morphe.patches.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

private const val ETA_UI = "Lapp/morphe/extension/maps/patches/BydNativeGuidanceUi;"
private const val ETA_WIDTH = "$ETA_UI->etaWidth(Landroid/view/View;I)I"
private fun Instruction.etaCall() = getReference<MethodReference>()
private fun Instruction.etaField() = getReference<FieldReference>()
private fun Method.etaCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing native ETA implementation: $this")
private fun etaGuard(ok: Boolean, reason: String, subject: Any) {
    if (!ok) throw PatchException("Unrecognized native ETA measurement: $reason in $subject")
}
private fun String.etaName() = removePrefix("L").removeSuffix(";").replace('/', '.')
private fun List<Instruction>.etaTarget(index: Int): Int {
    val address = take(index).sumOf { it.codeUnits } + (get(index) as OffsetInstruction).codeOffset
    var cursor = 0
    return indices.singleOrNull { val hit = cursor == address; cursor += get(it).codeUnits; hit }
        ?: throw PatchException("Invalid native ETA branch target")
}
private fun Instruction.etaToken(): List<Any?> = listOf(
    opcode, codeUnits,
    when (this) {
        is FiveRegisterInstruction -> invokeRegisters()
        is RegisterRangeInstruction -> invokeRegisters()
        is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
        is TwoRegisterInstruction -> listOf(registerA, registerB)
        is OneRegisterInstruction -> listOf(registerA)
        else -> null
    },
    (this as? ReferenceInstruction)?.reference?.toString(),
    (this as? WideLiteralInstruction)?.wideLiteral,
)

/** Only an extension-marked ETA bypasses Maps' fixed maximum-font measurement. */
internal class NativeGuidanceEtaPlan internal constructor(
    val schema: String,
    private val measure: MutableMethod,
    private val superclass: String,
) {
    val methods = listOf(measure)

    fun inject() {
        val before = measure.etaCode()
        val registers = measure.implementation!!.registerCount
        val receiver = registers - 3
        val width = receiver + 1
        val height = receiver + 2
        val edges = before.indices.filter { before[it] is OffsetInstruction }
            .associateWith { before.etaTarget(it) }
        etaGuard(receiver in 1..13 &&
            before[0].etaCall()?.toString() == "Landroid/view/View\$MeasureSpec;->getMode(I)I" &&
            before[0].invokeRegisters() == listOf(width) && before[1].opcode == Opcode.MOVE_RESULT &&
            (before[1] as OneRegisterInstruction).registerA == 0 &&
            before.none { it.etaCall()?.definingClass == ETA_UI },
            "entry scratch v0 is overwritten before its first original read", measure)
        measure.addInstructionsWithLabels(0, """
            invoke-static { v$receiver, v$width }, $ETA_WIDTH
            move-result v0
            if-eqz v0, :native_eta_original
            move v$width, v0
            invoke-super { v$receiver, v$width, v$height }, $superclass->onMeasure(II)V
            return-void
        """.trimIndent(), ExternalLabel("native_eta_original", before.first()))
        val after = measure.etaCode()
        etaGuard(after.size == before.size + 6 && after.sumOf { it.codeUnits } ==
            before.sumOf { it.codeUnits } + 11 && measure.implementation!!.registerCount == registers &&
            after.take(6).map { it.opcode } == listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
                Opcode.IF_EQZ, Opcode.MOVE, Opcode.INVOKE_SUPER, Opcode.RETURN_VOID) &&
            after[0].etaCall()?.toString() == ETA_WIDTH &&
            after[0].invokeRegisters() == listOf(receiver, width) &&
            (after[1] as OneRegisterInstruction).registerA == 0 &&
            (after[2] as OneRegisterInstruction).registerA == 0 && after.etaTarget(2) == 6 &&
            (after[3] as TwoRegisterInstruction).let { it.registerA == width && it.registerB == 0 } &&
            after[4].etaCall()?.toString() == "$superclass->onMeasure(II)V" &&
            after[4].invokeRegisters() == listOf(receiver, width, height) &&
            after.drop(6).map { it.etaToken() } == before.map { it.etaToken() } &&
            edges.all { (index, target) -> after.etaTarget(index + 6) == target + 6 } &&
            after.count { it.etaCall()?.definingClass == ETA_UI } == 1,
            "owned ETA changes only its incoming width before super; every unowned operation and edge remains original", measure)
    }
}

/** Derive the measured TextView and its actual width callback from the proven mobile summary. */
internal fun BytecodePatchContext.resolveNativeGuidanceEta(summaryType: String): NativeGuidanceEtaPlan {
    fun unique(methods: List<Method>, purpose: String): Method = methods.singleOrNull()
        ?: throw PatchException("Expected unique native ETA $purpose, found ${methods.size}: $methods")
    val summary = classDefBy(summaryType)
    val spec = "Landroid/view/View\$MeasureSpec;"
    val constrainedTextTypes = mutableSetOf<String>()
    classDefForEach { cls ->
        if (cls.superclass == "Landroid/support/v7/widget/AppCompatTextView;" &&
            cls.methods.any { it.name == "onMeasure" && it.parameterTypes == listOf("I", "I") &&
                it.returnType == "V" && it.implementation?.instructions?.any { instruction ->
                    instruction.etaCall()?.toString() ==
                        "Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F"
                } == true }) constrainedTextTypes.add(cls.type)
    }
    val factories = summary.methods.filter { method -> method.implementation != null &&
        AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PRIVATE.isSet(method.accessFlags) &&
        method.parameterTypes.size == 1 && method.parameterTypes.single().startsWith("[L") &&
        method.etaCode().any { instruction -> instruction.opcode == Opcode.CONST_CLASS &&
            instruction.getReference<TypeReference>()?.type in constrainedTextTypes }
    }
    val factory = unique(factories, "summary constrained TextView factory")
    val fc = factory.etaCode()
    val constant = fc.indices.singleOrNull { fc[it].opcode == Opcode.CONST_CLASS &&
        fc[it].getReference<TypeReference>()?.type in constrainedTextTypes }
        ?: throw PatchException("Missing unique native ETA class constant")
    val type = fc[constant].getReference<TypeReference>()?.type
        ?: throw PatchException("Missing native ETA class constant")
    val view = classDefBy(type)
    val builder = fc.getOrNull(constant - 1)?.getReference<TypeReference>()?.type
    val builderRegister = (fc.getOrNull(constant - 1) as? OneRegisterInstruction)?.registerA
    val classRegister = (fc[constant] as OneRegisterInstruction).registerA
    etaGuard(constant > 0 && fc[constant - 1].opcode == Opcode.NEW_INSTANCE &&
        fc[constant + 1].opcode == Opcode.INVOKE_DIRECT && fc[constant + 1].etaCall()?.let {
            it.definingClass == builder && it.name == "<init>" &&
                it.parameterTypes == listOf("Ljava/lang/Class;", factory.parameterTypes.single().toString())
        } == true && fc[constant + 1].invokeRegisters()?.take(2) == listOf(builderRegister, classRegister) &&
        fc.last().opcode == Opcode.RETURN_OBJECT && (fc.last() as OneRegisterInstruction).registerA == builderRegister &&
        fc.none { it is OffsetInstruction } &&
        AccessFlags.PUBLIC.isSet(view.accessFlags) && AccessFlags.FINAL.isSet(view.accessFlags) &&
        view.superclass == "Landroid/support/v7/widget/AppCompatTextView;",
        "labelled summary constructs the unique native constrained TextView", factory)
    val measure = unique(view.methods.filter { it.name == "onMeasure" &&
        it.parameterTypes == listOf("I", "I") && it.returnType == "V" && it.implementation != null }, "onMeasure")
    val code = measure.etaCode()
    val body = measure.implementation!!
    val receiver = body.registerCount - 3
    val width = receiver + 1
    val height = receiver + 2
    etaGuard(receiver in 1..13 && AccessFlags.PROTECTED.isSet(measure.accessFlags) && !AccessFlags.STATIC.isSet(measure.accessFlags) &&
        body.tryBlocks.isEmpty() && code.none { it is PayloadInstruction },
        "instance measurement with encodable arguments and no exception/payload edges", measure)
    fun reg(index: Int) = (code[index] as OneRegisterInstruction).registerA
    fun pair(index: Int) = code[index] as TwoRegisterInstruction
    fun args(index: Int) = code[index].invokeRegisters()
    val callbackAt = code.indices.singleOrNull { at -> code[at].opcode == Opcode.IGET_OBJECT &&
        code[at].etaField()?.definingClass == type && code.getOrNull(at + 1)?.opcode == Opcode.INVOKE_INTERFACE &&
        code[at + 1].etaCall()?.let { it.parameterTypes.isEmpty() && it.returnType == "I" } == true }
        ?: throw PatchException("Missing unique native ETA width-budget callback")
    val widthField = code[callbackAt].etaField()!!
    val widthMethod = code[callbackAt + 1].etaCall()!!
    val callback = classDefBy(widthField.type)
    val callbackMethods = callback.methods.toList()
    val field = view.fields.singleOrNull { it.name == widthField.name && it.type == widthField.type }
    etaGuard(widthField.definingClass == type && field != null && !AccessFlags.STATIC.isSet(field.accessFlags) &&
        pair(callbackAt).registerB == receiver && args(callbackAt + 1) == listOf(pair(callbackAt).registerA) &&
        widthMethod.definingClass == widthField.type && widthMethod.parameterTypes.isEmpty() && widthMethod.returnType == "I" &&
        AccessFlags.PUBLIC.isSet(callback.accessFlags) && AccessFlags.INTERFACE.isSet(callback.accessFlags) &&
        callback.interfaces.isEmpty() && callbackMethods.size == 1 && callbackMethods.single().let {
            it.toString() == widthMethod.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                AccessFlags.ABSTRACT.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation == null },
        "unique native instance width budget callback through its public interface", measure)
    // R8 may inline named setters. The reflection ABI needs the actual instance
    // field/interface read by onMeasure, not a setter that no longer exists.
    val callbackWrites = mutableListOf<Instruction>()
    classDefForEach { cls -> cls.methods.forEach { method -> method.implementation?.instructions?.forEach { ins ->
        if (ins.opcode == Opcode.IPUT_OBJECT && ins.etaField()?.toString() == widthField.toString()) callbackWrites.add(ins)
    } } }
    etaGuard(callbackWrites.isNotEmpty(), "the actual width field has original producers", widthField)
    val min = "Ljava/lang/Math;->min(II)I"
    etaGuard(code[0].etaCall()?.toString() == "$spec->getMode(I)I" && args(0) == listOf(width) && reg(1) == 0 &&
        code[2].etaCall()?.toString() == "$spec->getSize(I)I" && args(2) == listOf(width) && reg(3) == 1 &&
        code[4].etaCall()?.toString() == "$spec->getMode(I)I" && args(4) == listOf(height) && reg(5) == 2 &&
        code[6].etaCall()?.toString() == "$spec->getSize(I)I" && args(6) == listOf(height) && reg(7) == 3 &&
        reg(8) == 4 && (code[8] as WideLiteralInstruction).wideLiteral == 1073741824L &&
        code[9].opcode == Opcode.IF_NE && pair(9).let { it.registerA == 0 && it.registerB == 4 } &&
        code[10].opcode == Opcode.IF_EQ && pair(10).let { it.registerA == 2 && it.registerB == 4 } &&
        code[11].opcode == Opcode.MOVE && pair(11).let { it.registerA == 0 && it.registerB == 4 },
        "original incoming MeasureSpec mode/size and dead entry v0", measure)
    val sizeStart = code.etaTarget(9)
    val fixedSuper = code.etaTarget(10)
    etaGuard(code[sizeStart].opcode == Opcode.IGET && code[sizeStart].etaField()?.let {
        it.definingClass == type && it.type == "F" } == true &&
        code[fixedSuper].etaCall()?.toString() == "${view.superclass}->onMeasure(II)V" &&
        // R8 may end the exact-size super call with a goto to the shared return-void (26.42).
        args(fixedSuper) == listOf(receiver, width, height) && code.exitAt(fixedSuper + 1)?.opcode == Opcode.RETURN_VOID &&
        code.indices.single { code[it].etaCall()?.toString() ==
            "Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F" } > sizeStart &&
        code.subList(sizeStart, callbackAt).filter { it.opcode == Opcode.IGET && it.etaField()?.definingClass == type }
            .all { it.etaField()?.toString() == code[sizeStart].etaField()?.toString() },
        "both exact incoming dimensions return through original super; dynamic text sizing reads original max-font field", measure)
    val c = callbackAt
    etaGuard(code.subList(c, code.size).map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE,
        Opcode.MOVE_RESULT, Opcode.CONST_HIGH16, Opcode.IF_NE, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQ,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
        Opcode.INVOKE_SUPER, Opcode.RETURN_VOID) &&
        reg(c + 2) == 7 && reg(c + 3) == 8 && (code[c + 3] as WideLiteralInstruction).wideLiteral == -2147483648L &&
        pair(c + 4).let { it.registerA == 0 && it.registerB == 8 } && code.etaTarget(c + 4) == c + 7 &&
        code[c + 5].etaCall()?.toString() == min && args(c + 5) == listOf(7, 1) && reg(c + 6) == 7 &&
        code[c + 7].etaCall()?.toString() == min && args(c + 7) == listOf(5, 3) && reg(c + 8) == 1 &&
        code[c + 9].etaCall()?.toString() == min && args(c + 9) == listOf(6, 7) && reg(c + 10) == 3 &&
        pair(c + 11).let { it.registerA == 0 && it.registerB == 4 } && code.etaTarget(c + 11) == c + 14 &&
        code[c + 12].etaCall()?.toString() == "$spec->makeMeasureSpec(II)I" && args(c + 12) == listOf(3, 4) && reg(c + 13) == width &&
        pair(c + 14).let { it.registerA == 2 && it.registerB == 4 } && code.etaTarget(c + 14) == c + 17 &&
        code[c + 15].etaCall()?.toString() == "$spec->makeMeasureSpec(II)I" && args(c + 15) == listOf(1, 4) && reg(c + 16) == height &&
        code[c + 17].etaCall()?.toString() == "${view.superclass}->onMeasure(II)V" && args(c + 17) == listOf(receiver, width, height),
        "actual callback clamp preserves original width/height modes and original final super operands", measure)
    code.indices.filter { code[it] is OffsetInstruction }.forEach { code.etaTarget(it) }
    val mutable = mutableClassDefBy(type).methods.single { it.toString() == measure.toString() }
    return NativeGuidanceEtaPlan(listOf(type.etaName(), widthField.name, widthMethod.name).joinToString(","),
        mutable, view.superclass!!)
}
