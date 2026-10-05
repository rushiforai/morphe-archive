package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.shared.*

internal fun requireReloadControllerForwarding(method: Method, field: FieldReference, target: String) {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
        method.parameterTypes.size != 1 || !method.parameterTypes[0].startsWith("L"))
        throw PatchException("Reload stream: wrapped attachment signature changed.")
    val registers = method.implementation?.registerCount
        ?: throw PatchException("Reload stream: wrapped attachment has no code.")
    val code = method.code()
    val load = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.IGET_OBJECT &&
        (instruction as? ReferenceInstruction)?.reference?.toString() == field.toString() }
        .uniqueHook("wrapped player controller load")
    val operands = load.value as TwoRegisterInstruction
    if (operands.registerB != registers - 2)
        throw PatchException("Reload stream: wrapped attachment does not load its own controller.")
    val call = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.INVOKE_VIRTUAL &&
        (instruction as? ReferenceInstruction)?.reference?.toString() == target }
        .uniqueHook("wrapped player controller attachment call")
    val invocation = call.value as? FiveRegisterInstruction
        ?: throw PatchException("Reload stream: wrapped attachment invocation width changed.")
    if (call.index <= load.index || invocation.registerCount != 2 || invocation.registerC != operands.registerA ||
        invocation.registerD != registers - 1 || code.take(call.index).any { instruction ->
            instruction is OffsetInstruction || !instruction.opcode.canContinue() ||
                (instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.let {
                    it.registerA == registers - 1 ||
                        (instruction.opcode.setsWideRegister() && it.registerA + 1 == registers - 1)
                } == true)
        } || code.subList(load.index + 1, call.index).any { instruction ->
            instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.let {
                it.registerA == operands.registerA ||
                    (instruction.opcode.setsWideRegister() && it.registerA + 1 == operands.registerA)
            } == true
        }) throw PatchException("Reload stream: wrapped controller forwarding changed.")
}

internal fun BytecodePatchContext.installNativeReloadControllerOwner(all: List<Method>, views: NativeReloadViewHooks) {
    val wrappers = all.filter { method -> method.isInstance(views.controllerBind.parameterTypes.map { it.toString() }, "V") &&
        method.references().any { it.toString() == views.controllerBind.reference } &&
        views.controller.type in classDefBy(method.definingClass).interfaces
    }
    val wrapper = wrappers.uniqueHook("wrapped native live controller attachment")
    val type = classDefBy(wrapper.definingClass)
    val field = type.fields.filter { candidate -> !AccessFlags.STATIC.isSet(candidate.accessFlags) &&
        candidate.type.startsWith("L") && !candidate.type.startsWith("Ljava") && !candidate.type.startsWith("Landroid") &&
        classDefBy(candidate.type).superclass == views.transport.definingClass &&
        wrapper.references().any { it.toString() == candidate.toString() }
    }.uniqueHook("wrapped native live controller field")
    requireReloadControllerForwarding(wrapper, field, views.controllerBind.reference)
    val liveType = classDefBy(field.type)
    val model = liveType.fields.filter { it.type == "Ltv/twitch/android/models/streams/StreamModel;" &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.uniqueHook("native loaded live stream model")
    if (!AccessFlags.PUBLIC.isSet(model.accessFlags))
        throw PatchException("Reload stream: loaded live stream model is inaccessible.")
    val assign = liveType.methods.filter { it.isInstance(listOf(model.type), "V") &&
        it.code().any { instruction -> instruction.opcode == Opcode.IPUT_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == model.toString() }
    }.uniqueHook("native live stream model assignment")
    val count = assign.implementation?.registerCount
        ?: throw PatchException("Reload stream: loaded live stream model assignment has no code.")
    val store = assign.code().withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.IPUT_OBJECT &&
        (instruction as? ReferenceInstruction)?.reference?.toString() == model.toString() }
        .uniqueHook("native live stream model store")
    val operands = store.value as TwoRegisterInstruction
    if (operands.registerA != count - 1 || operands.registerB != count - 2 || assign.code().take(store.index).any {
        it is OffsetInstruction || !it.opcode.canContinue() ||
            (it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.let { operand ->
                operand.registerA == count - 1 || (it.opcode.setsWideRegister() && operand.registerA + 1 == count - 1)
            } == true)
    }) throw PatchException("Reload stream: loaded live model data flow changed.")
    val base = mutableClassDefBy(views.transport.definingClass)
    val existing = base.methods.single { it.name == "reloadControlsOwner" && it.parameterTypes.isEmpty() }
    base.methods.remove(existing)
    base.methods.add(nativeReloadMethod(base.type, "reloadControlsOwner", emptyList(), "Ljava/lang/Object;", 3, """
        const/4 v0, 0x0
        instance-of v1, p0, ${liveType.type}
        if-eqz v1, :done
        move-object v1, p0
        check-cast v1, ${liveType.type}
        iget-object v1, v1, $model
        if-eqz v1, :done
        iget-object v0, p0, ${views.transport}
        :done
        return-object v0
    """))
    val target = mutableClassDefBy(type.type)
    target.interfaces.add(NATIVE_OWNER)
    target.methods.add(nativeReloadMethod(target.type, "reloadControlsOwner", emptyList(), "Ljava/lang/Object;", 2, """
        iget-object v0, p0, $field
        if-eqz v0, :done
        invoke-virtual {v0}, ${views.transport.definingClass}->reloadControlsOwner()Ljava/lang/Object;
        move-result-object v0
        :done
        return-object v0
    """))
}
