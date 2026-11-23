package app.bin0culars.patches.reddit.layout.collapseall

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal data class StoreFields(
    val stateField: FieldReference,
    val stateGetter: MethodReference,
    val idListField: FieldReference,
    val scopeField: FieldReference,
    val commentByIdMethod: MutableMethod,
)

internal fun findDispatchRef(expandOpType: String): MethodReference {
    val clickHandlerMethod = CommentClickHandlerFingerprint.method
    val clickInstructions = clickHandlerMethod.instructions

    val expandNewIndex = clickInstructions.indexOfFirst { instr ->
        instr.opcode == Opcode.NEW_INSTANCE &&
            (instr as? ReferenceInstruction)?.reference?.toString() == expandOpType
    }
    if (expandNewIndex == -1) {
        throw PatchException("Could not find NEW_INSTANCE of $expandOpType in ${clickHandlerMethod.name}")
    }

    val invoke = clickInstructions.drop(expandNewIndex + 1).firstOrNull { instr ->
        (instr.opcode == Opcode.INVOKE_VIRTUAL || instr.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            ((instr as? ReferenceInstruction)?.reference as? MethodReference)?.returnType == "Ljava/lang/Object;"
    } ?: throw PatchException("Could not find dispatch INVOKE_VIRTUAL after NEW_INSTANCE of $expandOpType")

    return (invoke as ReferenceInstruction).reference as MethodReference
}

internal fun hookDispatchMethod(storeClassDef: MutableClass, dispatchRef: MethodReference) {
    val dispatchParams = dispatchRef.parameterTypes.map { it.toString() }
    val dispatchMethod = storeClassDef.methods.firstOrNull { method ->
        method.name == dispatchRef.name &&
            method.parameterTypes.map { it.toString() } == dispatchParams
    } ?: throw PatchException("Could not find dispatch method in ${storeClassDef.type}")

    val p0Reg = dispatchMethod.p0Register
    val setStoreSmali =
        if (p0Reg > 15) {
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->setCommentStore(Ljava/lang/Object;)V"
        } else {
            "invoke-static { p0 }, $EXTENSION_CLASS->setCommentStore(Ljava/lang/Object;)V"
        }
    dispatchMethod.addInstructions(0, setStoreSmali)
}

private fun isStoreStateMethod(method: MutableMethod): Boolean {
    val matchesSignature = method.returnType == "I" &&
        method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
    val hasListField = method.instructions.any { instr ->
        instr.opcode == Opcode.IGET_OBJECT &&
            ((instr as? ReferenceInstruction)?.reference as? FieldReference)?.type == "Ljava/util/List;"
    }
    return matchesSignature && hasListField
}

private fun findStateField(method: MutableMethod): FieldReference =
    method.instructions
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .firstOrNull()
        ?: throw PatchException("Could not find stateField in ${method.definingClass}")

private fun findStateGetter(method: MutableMethod): MethodReference =
    method.instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .firstOrNull()
        ?: throw PatchException("Could not find stateGetter in ${method.definingClass}")

private fun findIdListField(method: MutableMethod): FieldReference =
    method.instructions
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .firstOrNull { it.type == "Ljava/util/List;" }
        ?: throw PatchException("Could not find idListField in ${method.definingClass}")

private fun findScopeField(storeClassDef: MutableClass): FieldReference {
    val launchMethod = LaunchFingerprint.method
    val launchScopeType = launchMethod.parameterTypes.first().toString()
    return storeClassDef.fields.firstOrNull { it.type == launchScopeType }
        ?: throw PatchException("Could not find scope field of type $launchScopeType in ${storeClassDef.type}")
}

private fun findCommentByIdMethod(storeClassDef: MutableClass): MutableMethod =
    storeClassDef.methods.firstOrNull { method ->
        method.returnType == "Lcom/reddit/domain/model/IComment;" &&
            method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
    } ?: throw PatchException("Could not find commentById method in ${storeClassDef.type}")

internal fun findStoreFields(storeClassDef: MutableClass): StoreFields {
    val stateMethod = storeClassDef.methods.firstOrNull { isStoreStateMethod(it) }
        ?: throw PatchException("Could not find store state method in ${storeClassDef.type}")
    return StoreFields(
        stateField = findStateField(stateMethod),
        stateGetter = findStateGetter(stateMethod),
        idListField = findIdListField(stateMethod),
        scopeField = findScopeField(storeClassDef),
        commentByIdMethod = findCommentByIdMethod(storeClassDef),
    )
}
