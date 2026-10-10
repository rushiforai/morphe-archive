package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.*

internal fun turboStartupDispatch(method: Method, model: String): Int {
    if (method.name != "invokeSuspend" || !method.isInstance(listOf("Ljava/lang/Object;"), "Ljava/lang/Object;") ||
        !method.hasStrings("turboAppStartUpsellHelper"))
        throw PatchException("Turbo startup offer coroutine contract changed")
    val code = method.code()
    val singleton = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.SGET_OBJECT &&
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type == model
    }.uniqueHook("Turbo startup offer singleton")
    val modelRegister = (singleton.value as OneRegisterInstruction).registerA
    val fragment = code.getOrNull(singleton.index + 1) as? TwoRegisterInstruction
    val call = code.getOrNull(singleton.index + 2)
    val registers = call as? FiveRegisterInstruction
    val reference = (call as? ReferenceInstruction)?.reference as? MethodReference
    if (fragment == null || code[singleton.index + 1].opcode != Opcode.IGET_OBJECT ||
        fragment.registerA == modelRegister || registers == null || registers.registerCount != 3 ||
        registers.registerE != modelRegister || registers.registerD != fragment.registerA ||
        registers.registerC != fragment.registerB || call.opcode != Opcode.INVOKE_VIRTUAL ||
        reference == null || reference.returnType != "V" || reference.parameterTypes.size != 2 ||
        reference.parameterTypes.any { !it.toString().startsWith("L") } ||
        code.getOrNull(singleton.index + 3)?.opcode != Opcode.RETURN_OBJECT)
        throw PatchException("Turbo startup offer no longer has an isolated navigation dispatch")
    return singleton.index + 2
}

internal fun BytecodePatchContext.hideTurboStartupOffer() {
    val models = mutableListOf<String>()
    val coroutines = mutableListOf<Method>()
    classDefForEach { type ->
        if (type.methods.any { it.name == "toString" && it.hasStrings("TurboAppStartUpsell") }) models.add(type.type)
        coroutines.addAll(type.methods.filter { it.name == "invokeSuspend" && it.hasStrings("turboAppStartUpsellHelper") })
    }
    val model = models.uniqueHook("Turbo startup offer model")
    val coroutine = coroutines.uniqueHook("Turbo startup offer coroutine")
    val index = turboStartupDispatch(coroutine, model)
    val call = coroutine.code()[index]
    val original = (call as ReferenceInstruction).reference as MethodReference
    val registers = call as FiveRegisterInstruction
    val owner = mutableClassDefBy(original.definingClass)
    val name = "twitchPatchesTurboStartupOffer"
    if (owner.methods.any { it.name == name }) throw PatchException("Turbo startup offer bridge already exists")
    val bridge = ImmutableMethod(owner.type, name,
        (listOf(owner.type) + original.parameterTypes.map { it.toString() }).map { ImmutableMethodParameter(it, null, null) },
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(4)).toMutable()
    bridge.addInstructionsWithLabels(0, """
        invoke-static {}, Ldev/twitchpatches/extension/promotions/PromotionSettings;->blocked()Z
        move-result v0
        if-nez v0, :done
        invoke-virtual {p0, p1, p2}, $original
        :done
        return-void
    """)
    owner.methods.add(bridge)
    mutableClassDefBy(coroutine.definingClass).methods.filter { it.reference == coroutine.reference }
        .uniqueHook("resolved Turbo startup offer coroutine").replaceInstruction(index,
            "invoke-static {v${registers.registerC}, v${registers.registerD}, v${registers.registerE}}, ${bridge.reference}")
}
