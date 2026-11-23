package app.bin0culars.patches.reddit.layout.collapseall

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun fillBridge(name: String, smali: String) {
    val method = Fingerprint(definingClass = EXTENSION_CLASS, name = name).method
    for (i in method.instructions.indices.reversed()) {
        method.removeInstruction(i)
    }
    method.addInstructions(0, smali.trimIndent())
}

internal fun fillPlaceholder(name: String, value: String) {
    fillBridge(
        name,
        """
            const-string v0, "$value"
            return-object v0
        """,
    )
}

private fun fillCommentIdsBridge(
    storeType: String,
    stateField: FieldReference,
    stateGetter: MethodReference,
    idListField: FieldReference,
) {
    val stateFieldStr = "${stateField.definingClass}->${stateField.name}:${stateField.type}"
    val stateGetterParams = stateGetter.parameterTypes.joinToString("")
    val stateGetterStr =
        "${stateGetter.definingClass}->${stateGetter.name}($stateGetterParams)${stateGetter.returnType}"
    val idListFieldStr = "${idListField.definingClass}->${idListField.name}:${idListField.type}"

    fillBridge(
        "commentIds",
        """
            check-cast p0, $storeType
            iget-object p0, p0, $stateFieldStr
            invoke-static { p0 }, $stateGetterStr
            move-result-object p0
            if-eqz p0, :none
            iget-object p0, p0, $idListFieldStr
            :none
            return-object p0
        """,
    )
}

private fun fillCommentByIdBridge(storeType: String, commentByIdName: String) {
    fillBridge(
        "commentById",
        """
            check-cast p0, $storeType
            check-cast p1, Ljava/lang/String;
            invoke-virtual { p0, p1 }, $storeType->$commentByIdName(Ljava/lang/String;)Lcom/reddit/domain/model/IComment;
            move-result-object p0
            return-object p0
        """,
    )
}

private fun fillNewCollapseOpBridge(collapseOpType: String) {
    fillBridge(
        "newCollapseOp",
        """
            new-instance p1, $collapseOpType
            invoke-direct { p1, p0 }, $collapseOpType-><init>(Ljava/lang/String;)V
            return-object p1
        """,
    )
}

private fun fillNewExpandOpBridge(expandOpType: String) {
    fillBridge(
        "newExpandOp",
        """
            new-instance p1, $expandOpType
            invoke-direct { p1, p0 }, $expandOpType-><init>(Ljava/lang/String;)V
            return-object p1
        """,
    )
}

private fun fillDispatchBridge(storeType: String, dispatchRef: MethodReference) {
    val dispatchParam0 = dispatchRef.parameterTypes[0].toString()
    val dispatchParam1 = dispatchRef.parameterTypes[1].toString()
    val dispatchMethodStr =
        "${dispatchRef.definingClass}->${dispatchRef.name}($dispatchParam0$dispatchParam1)${dispatchRef.returnType}"

    fillBridge(
        "dispatch",
        """
            check-cast p0, $storeType
            check-cast p1, $dispatchParam0
            check-cast p2, $dispatchParam1
            invoke-virtual { p0, p1, p2 }, $dispatchMethodStr
            move-result-object p0
            return-object p0
        """,
    )
}

private fun fillLaunchBridge(storeType: String, scopeField: FieldReference) {
    val launchMethod = LaunchFingerprint.method
    val scopeFieldStr = "${scopeField.definingClass}->${scopeField.name}:${scopeField.type}"
    val launchParamsStr = launchMethod.parameterTypes.joinToString("") { it.toString() }
    val launchRefStr = "${launchMethod.definingClass}->${launchMethod.name}($launchParamsStr)${launchMethod.returnType}"

    fillBridge(
        "launch",
        """
            check-cast p0, $storeType
            check-cast p1, Lkotlin/jvm/functions/Function2;
            iget-object p2, p0, $scopeFieldStr
            const/4 p3, 0x0
            const/4 p4, 0x3
            invoke-static { p2, p3, p3, p1, p4 }, $launchRefStr
            return-void
        """,
    )
}

internal fun fillStoreBridges(
    storeClassDef: MutableClass,
    dispatchRef: MethodReference,
    storeFields: StoreFields,
    collapseOpType: String,
    expandOpType: String,
) {
    val storeType = storeClassDef.type
    fillCommentIdsBridge(storeType, storeFields.stateField, storeFields.stateGetter, storeFields.idListField)
    fillCommentByIdBridge(storeType, storeFields.commentByIdMethod.name)
    fillNewCollapseOpBridge(collapseOpType)
    fillNewExpandOpBridge(expandOpType)
    fillDispatchBridge(storeType, dispatchRef)
    fillLaunchBridge(storeType, storeFields.scopeField)
}
