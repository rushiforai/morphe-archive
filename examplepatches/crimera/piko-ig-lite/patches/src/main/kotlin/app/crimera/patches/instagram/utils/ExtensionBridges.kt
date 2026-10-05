/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.utils

import app.crimera.bytecode.Block
import app.crimera.bytecode.insertHook
import app.crimera.patches.common.requireExactlyOne
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Replaces the body of the static extension stub `classDescriptor->name(parameters)returnType` with
 * [body], emitted into a fresh frame of [registers] registers. The parameters occupy the top
 * registers of the frame, so with one object parameter and two registers, `v0` is scratch and `v1`
 * is the argument. Compiled stubs keep no locals of their own, so the frame is rebuilt instead of
 * patched in place.
 */
context(patchContext: BytecodePatchContext)
internal fun replaceBridgeBody(
    classDescriptor: String,
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    body: Block.() -> Unit,
) {
    val extensionClass = patchContext.mutableClassDefBy(classDescriptor)
    val stub =
        requireExactlyOne(
            "extension bridge $classDescriptor->$name",
            extensionClass.methods.filter { method ->
                method.name == name &&
                    method.returnType == returnType &&
                    method.parameterTypes.map { it.toString() } == parameters &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
            },
        )
    // Wide (`J`/`D`) parameters occupy two register words.
    val parameterWords = parameters.size + parameters.count { it == "J" || it == "D" }
    if (registers < parameterWords) {
        throw PatchException("Bridge $classDescriptor->$name needs at least $parameterWords registers, got $registers")
    }

    val bridge =
        ImmutableMethod(
            stub.definingClass,
            stub.name,
            stub.parameters,
            stub.returnType,
            stub.accessFlags,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable()
    extensionClass.methods.remove(stub)
    extensionClass.methods.add(bridge)
    bridge.insertHook(index = 0, relocateBranchTargets = false, block = body)
}
