/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.patches.youtube.general.toolbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.misc.bridge.addBridge
import app.morphe.patches.youtube.utils.auth.AccountIdentityToStringFingerprint
import app.morphe.patches.youtube.utils.auth.IS_INCOGNITO_STRING
import app.morphe.patches.youtube.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.youtube.utils.navigation.BrowseFragmentOnCreateViewFingerprint
import app.morphe.util.cloneMutable
import app.morphe.util.findFieldFromToString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "$GENERAL_PATH/NavigationButtonsPatch;"
private const val ADAPTER = "${GENERAL_PATH}/NavigationButtonsPatch\$HomeToolbar;"
private const val MESSAGE = "Lcom/google/protobuf/MessageLite;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/List;"
private const val COLLECTION = "Ljava/util/Collection;"

private const val RESTORE_NOTIFICATIONS =
    "$EXTENSION->restoreHomeToolbarNotifications($ADAPTER$COLLECTION${STRING}Z$MESSAGE)$LIST"

private fun Method.calls(opcode: Opcode) = implementation?.instructions?.mapNotNull { instruction ->
    if (instruction.opcode == opcode) instruction.getReference<MethodReference>() else null
}.orEmpty().distinct()

private fun Method.hasParameters(vararg types: String) = parameterTypes.map { it.toString() } == types.toList()

private fun MutableClass.fieldOfType(type: String) = instanceFields.singleOrNull { it.type == type }

private fun MutableClass.constructorFrom(type: String) = methods.singleOrNull {
    it.name == "<init>" && it.hasParameters(type)
}

private fun MutableClass.builds(type: String) = methods.singleOrNull {
    it.returnType == type && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
}

private data class AccountState(val field: FieldReference, val signedIn: MethodReference)

context(context: BytecodePatchContext)
private fun findAccountState(browse: MutableClass): AccountState? {
    val identity = AccountIdentityToStringFingerprint.matchOrNull()?.originalMethod ?: return null
    val incognito = runCatching { identity.findFieldFromToString(IS_INCOGNITO_STRING) }.getOrNull() ?: return null
    val accountManagers = Fingerprint(returnType = "Z", strings = listOf("user_signed_out"))
        .matchAllOrNull().orEmpty().map { it.classDef }.distinctBy { it.type }

    for (manager in accountManagers) {
        val signedIn = manager.methods.singleOrNull { method ->
            method.returnType == "Z" && method.parameterTypes.isEmpty()
                    && method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_BOOLEAN && it.getReference<FieldReference>() == incognito
                    } == true
        } ?: continue

        val pendingInterfaces = ArrayDeque(manager.interfaces)
        val seen = mutableSetOf<String>()
        while (pendingInterfaces.isNotEmpty()) {
            val type = pendingInterfaces.removeFirst()
            if (!seen.add(type)) continue

            val accountInterface = context.mutableClassDefBy(type)
            pendingInterfaces.addAll(accountInterface.interfaces)
            val field = browse.fieldOfType(type) ?: continue
            val call = accountInterface.methods.singleOrNull {
                it.name == signedIn.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
            } ?: continue
            return AccountState(field, call)
        }
    }

    return null
}

/** Decorate the resolved Home menu, never the shared guide or the per-tab source model. */
context(context: BytecodePatchContext)
internal fun hookHomeToolbarNotifications(topBar: MutableMethod, owner: MutableClass): Boolean {
    val subscriptions = Fingerprint(definingClass = owner.type, returnType = "Z", strings = listOf("FEsubscriptions"))
        .matchOrNull()?.originalMethod ?: return false
    val getPane = subscriptions.calls(Opcode.INVOKE_DIRECT).singleOrNull {
        it.definingClass == owner.type && it.parameterTypes.isEmpty()
    } ?: return false
    val getPaneKey = subscriptions.calls(Opcode.INVOKE_STATIC).singleOrNull {
        it.parameterTypes.singleOrNull() == getPane.returnType
    } ?: return false
    val getBrowseId = subscriptions.calls(Opcode.INVOKE_STATIC).singleOrNull {
        it.returnType == STRING && it.parameterTypes.size == 1
    } ?: return false
    val getEndpoint = subscriptions.calls(Opcode.INVOKE_VIRTUAL).singleOrNull {
        it.definingClass == getPaneKey.returnType && it.returnType == getBrowseId.parameterTypes.single()
                && it.parameterTypes.isEmpty()
    } ?: return false

    val browse = BrowseFragmentOnCreateViewFingerprint.matchOrNull()?.classDef ?: return false
    val account = findAccountState(browse) ?: return false

    val topBarConstructors = topBar.calls(Opcode.INVOKE_DIRECT).filter { call ->
        call.name == "<init>" && call.parameterTypes.size == 1
    }
    val toolbarModelSetter = Fingerprint(
        parameters = listOf("L"), returnType = "V", strings = listOf("Null actionBarModel"),
    )
        .matchAllOrNull().orEmpty().singleOrNull { match ->
            topBarConstructors.any { it.definingClass == match.originalMethod.definingClass }
        } ?: return false
    val toolbarModelBuilder = toolbarModelSetter.classDef
    val toolbarModelConstructor = topBarConstructors.singleOrNull { it.definingClass == toolbarModelBuilder.type }
        ?: return false
    val toolbarModelType = toolbarModelConstructor.parameterTypes.single().toString()
    val buildToolbarModel = toolbarModelBuilder.builds(toolbarModelType) ?: return false
    val actionBarModelType = toolbarModelSetter.originalMethod.parameterTypes.single().toString()
    val actionBarModel = context.mutableClassDefBy(actionBarModelType)
    val actionBarField = context.mutableClassDefBy(toolbarModelType).fieldOfType(actionBarModelType) ?: return false
    val getToolbarModel = owner.builds(toolbarModelType) ?: return false
    if (getPane !in getToolbarModel.calls(Opcode.INVOKE_DIRECT)) return false

    val menuSetter = Fingerprint(parameters = listOf("L"), returnType = "V", strings = listOf("Null menuItems"))
        .matchAllOrNull().orEmpty().singleOrNull { it.classDef.constructorFrom(actionBarModelType) != null }
        ?: return false
    val actionBarBuilder = menuSetter.classDef
    val actionBarConstructor = actionBarBuilder.constructorFrom(actionBarModelType) ?: return false
    val buildActionBar = actionBarBuilder.builds(actionBarModelType) ?: return false
    val menuType = menuSetter.originalMethod.parameterTypes.single().toString()
    val menuField = actionBarModel.fieldOfType(menuType) ?: return false
    val copyMenu = context.mutableClassDefBy(menuType).methods.singleOrNull {
        it.returnType == menuType && it.hasParameters(COLLECTION) && AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: return false

    val makeButton = topBar.calls(Opcode.INVOKE_VIRTUAL).singleOrNull {
        it.returnType.startsWith('L') && it.parameterTypes.size == 4 && it.parameterTypes[2] == LIST
    } ?: return false
    val factory = owner.fieldOfType(makeButton.definingClass) ?: return false
    val lifecycle = owner.fieldOfType(makeButton.parameterTypes[3].toString()) ?: return false
    val logContext = topBar.calls(Opcode.INVOKE_INTERFACE).singleOrNull {
        it.returnType == makeButton.parameterTypes[0] && it.parameterTypes.isEmpty()
    } ?: return false
    val logOwner = owner.fieldOfType(logContext.definingClass) ?: return false
    val rendererType = makeButton.parameterTypes[1].toString()
    val buttonType = makeButton.returnType
    val buttonClass = context.mutableClassDefBy(buttonType)
    val renderer = buttonClass.fieldOfType(rendererType) ?: return false
    val defaultRenderer = context.mutableClassDefBy(rendererType).staticFields.singleOrNull {
        it.type == rendererType
    } ?: return false

    buttonClass.addBridge("patch_getToolbarRenderer", emptyList(), MESSAGE, 2, """
        iget-object v0, p0, $renderer
        return-object v0
    """)
    browse.addBridge("patch_isHomeToolbarSignedIn", emptyList(), "Z", 2, """
        iget-object v0, p0, ${account.field}
        if-eqz v0, :signed_out
        invoke-interface { v0 }, ${account.signedIn}
        move-result v0
        return v0
        :signed_out
        const/4 v0, 0x0
        return v0
    """)

    owner.interfaces.add(ADAPTER)
    owner.addBridge("patch_getToolbarButtonRenderer", listOf(OBJECT), MESSAGE, 3, """
        instance-of v0, p1, $buttonType
        if-eqz v0, :not_button
        check-cast p1, $buttonType
        invoke-virtual { p1 }, $buttonType->patch_getToolbarRenderer()$MESSAGE
        move-result-object v0
        return-object v0
        :not_button
        const/4 v0, 0x0
        return-object v0
    """)
    owner.addBridge("patch_createToolbarNotificationsButton", listOf(MESSAGE), OBJECT, 6, """
        check-cast p1, $rendererType
        iget-object v0, p0, $factory
        iget-object v1, p0, $logOwner
        invoke-interface { v1 }, $logContext
        move-result-object v1
        const-string v2, "FEnotifications_inbox"
        invoke-static { v2 }, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
        move-result-object v2
        iget-object v3, p0, $lifecycle
        invoke-virtual { v0, v1, p1, v2, v3 }, $makeButton
        move-result-object v0
        return-object v0
    """)

    val stock = getToolbarModel.cloneMutable(
        name = "patch_getStockToolbarModel",
        accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
    )
    val wrapped = getToolbarModel.cloneMutable(clearImplementation = true, registerCount = 8)
    wrapped.addInstructionsWithLabels(0, """
        invoke-direct { p0 }, $stock
        move-result-object v0
        if-eqz v0, :unchanged
        invoke-direct { p0 }, $getPane
        move-result-object v1
        instance-of v2, v1, ${browse.type}
        if-eqz v2, :unchanged
        invoke-static { v1 }, $getPaneKey
        move-result-object v2
        invoke-virtual { v2 }, $getEndpoint
        move-result-object v2
        invoke-static { v2 }, $getBrowseId
        move-result-object v2
        const-string v3, "FEwhat_to_watch"
        invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v3
        if-eqz v3, :unchanged

        check-cast v1, ${browse.type}
        invoke-virtual { v1 }, ${browse.type}->patch_isHomeToolbarSignedIn()Z
        move-result v3
        if-eqz v3, :unchanged
        iget-object v4, v0, $actionBarField
        if-eqz v4, :unchanged
        iget-object v5, v4, $menuField
        if-eqz v5, :unchanged
        sget-object v6, $defaultRenderer
        invoke-static { p0, v5, v2, v3, v6 }, $RESTORE_NOTIFICATIONS
        move-result-object v5
        if-eqz v5, :unchanged

        invoke-static { v5 }, $copyMenu
        move-result-object v5
        new-instance v6, ${actionBarBuilder.type}
        invoke-direct { v6, v4 }, $actionBarConstructor
        invoke-virtual { v6, v5 }, ${menuSetter.originalMethod}
        invoke-virtual { v6 }, $buildActionBar
        move-result-object v4
        new-instance v6, ${toolbarModelBuilder.type}
        invoke-direct { v6, v0 }, $toolbarModelConstructor
        invoke-virtual { v6, v4 }, ${toolbarModelSetter.originalMethod}
        invoke-virtual { v6 }, $buildToolbarModel
        move-result-object v0
        :unchanged
        return-object v0
    """)
    owner.methods.remove(getToolbarModel)
    owner.methods.add(stock)
    owner.methods.add(wrapped)
    return true
}
