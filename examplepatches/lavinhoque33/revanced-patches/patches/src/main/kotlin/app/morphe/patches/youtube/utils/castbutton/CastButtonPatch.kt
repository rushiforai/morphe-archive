@file:Suppress("CONTEXT_RECEIVERS_DEPRECATED")

package app.morphe.patches.youtube.utils.castbutton

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstructionOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.misc.bridge.addBridge
import app.morphe.patches.youtube.utils.extension.Constants.PATCH_STATUS_CLASS_DESCRIPTOR
import app.morphe.patches.youtube.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.youtube.utils.playservice.is_21_04_or_greater
import app.morphe.patches.youtube.utils.playservice.is_21_13_or_greater
import app.morphe.patches.youtube.utils.playservice.is_21_30_or_greater
import app.morphe.patches.youtube.utils.playservice.is_21_39_or_greater
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.numberOfParameterRegisters
import app.morphe.util.updatePatchStatus
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val EXTENSION_CLASS_DESCRIPTOR = "$UTILS_PATH/CastButtonPatch;"
private const val MEDIA_ROUTE_BUTTON = "Landroidx/mediarouter/app/MediaRouteButton;"
private const val MDX_MEDIA_ROUTE_BUTTON =
    "Lcom/google/android/libraries/youtube/mdx/mediaroute/MdxMediaRouteButton;"
private const val TOOLBAR_CAST_VIEW = "$UTILS_PATH/CastButtonPatch\$ToolbarCastView;"
private const val TOOLBAR_CAST_CONTROLLER = "$UTILS_PATH/CastButtonPatch\$ToolbarCastController;"

private const val MENU_INITIALIZER = "$EXTENSION_CLASS_DESCRIPTOR->hideToolbarCastButton(Landroid/view/MenuItem;)V"
private const val RESTORED_MENU_INITIALIZER =
    "$EXTENSION_CLASS_DESCRIPTOR->initializeToolbarCastButton(Landroid/view/MenuItem;)V"

private const val EXPERIMENT_OVERRIDE = "$EXTENSION_CLASS_DESCRIPTOR->useStockToolbarCastExperiment(Z)Z"
private const val CLICK_OVERRIDE = "$EXTENSION_CLASS_DESCRIPTOR->useCastCompanionOnClick(Landroid/view/View;Z)Z"
private const val TOOLBAR_CAST_OMISSION_FLAG = 45761303L

private object MediaRouteVisibilityFingerprint : Fingerprint(
    definingClass = MEDIA_ROUTE_BUTTON,
    name = "setVisibility",
    returnType = "V",
    parameters = listOf("I"),
)

private object MediaRouteClickFingerprint : Fingerprint(
    definingClass = MDX_MEDIA_ROUTE_BUTTON,
    name = "performClick",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Adapted from MorpheApp/morphe-patches#5034. The experiment can change both the view type and binding.
 * Resolve the whole set before overriding either so the route controller never sees the wrong view type.
 */
private data class FlagResult(val method: MutableMethod, val index: Int) {
    fun installOverride(ownerRegister: Int? = null) {
        val result = method.getInstruction<OneRegisterInstruction>(index).registerA
        val call = if (ownerRegister == null) {
            "invoke-static/range {v$result .. v$result}, $EXPERIMENT_OVERRIDE"
        } else {
            "invoke-static {v$ownerRegister, v$result}, $CLICK_OVERRIDE"
        }

        method.addInstructions(index + 1, """
            $call
            move-result v$result
        """)
    }
}

private fun MutableMethod.flagResult(flag: Long, accessor: MethodReference?): FlagResult? {
    val flagIndex = indexOfFirstInstruction {
        if (accessor == null) (this as? WideLiteralInstruction)?.wideLiteral == flag
        else getReference<MethodReference>() == accessor
    }
    if (flagIndex < 0) return null

    val resultIndex = if (accessor == null) {
        indexOfFirstInstruction(flagIndex, Opcode.MOVE_RESULT)
    } else {
        flagIndex + 1
    }

    return if (resultIndex >= 0 && getInstruction(resultIndex).opcode == Opcode.MOVE_RESULT) {
        FlagResult(this, resultIndex)
    } else {
        null
    }
}

private fun MutableMethod.toolbarCastOmissionGate(
    controllerType: String,
    accessor: MethodReference?,
): FlagResult? {
    val omission = flagResult(TOOLBAR_CAST_OMISSION_FLAG, accessor) ?: return null
    val result = getInstruction<OneRegisterInstruction>(omission.index).registerA
    val branch = getInstructionOrNull(omission.index + 1) as? BuilderOffsetInstruction ?: return null
    if (branch.opcode != Opcode.IF_NEZ || (branch as OneRegisterInstruction).registerA != result) return null

    // Match only a branch that skips the append of the native Cast controller, not other flag reads.
    var appendIndex = omission.index + 2
    val source = getInstructionOrNull(appendIndex) ?: return null
    val controllerRegister = if (source.opcode == Opcode.IGET_OBJECT) {
        if (source.getReference<FieldReference>()?.type != controllerType) return null
        appendIndex++
        (source as TwoRegisterInstruction).registerA
    } else {
        if (!AccessFlags.STATIC.isSet(accessFlags)) return null
        val parameter = parameterTypes.indexOfFirst { it.toString() == controllerType }
        if (parameter < 0) return null
        val precedingRegisters = parameterTypes.subList(0, parameter).fold(0) { count, type ->
            count + if (type.toString() == "J" || type.toString() == "D") 2 else 1
        }
        implementation!!.registerCount - numberOfParameterRegisters + precedingRegisters
    }

    val append = getInstructionOrNull(appendIndex) as? FiveRegisterInstruction ?: return null
    val appendMethod = append.getReference<MethodReference>() ?: return null
    if (append.opcode != Opcode.INVOKE_VIRTUAL || append.registerCount != 2 ||
        append.registerD != controllerRegister || appendMethod.returnType != "V" ||
        appendMethod.parameterTypes.singleOrNull()?.toString() != "Ljava/lang/Object;" ||
        branch.target.location.index != appendIndex + 1
    ) return null

    return omission
}

context(_: BytecodePatchContext)
private fun restoreToolbarCastCollection(castClass: MutableClass) {
    val controllerType = castClass.interfaces.singleOrNull()
    val accessor = if (is_21_30_or_greater) null else {
        castFlagAccessor(TOOLBAR_CAST_OMISSION_FLAG).matchOrNull()?.originalMethod
    }
    if (controllerType == null || !is_21_30_or_greater && accessor == null) {
        printWarn("Could not resolve the native toolbar Cast collection gate.")
        return
    }

    val filter = if (accessor == null) literal(TOOLBAR_CAST_OMISSION_FLAG) else methodCall(accessor)
    val guards = Fingerprint(filters = listOf(filter)).matchAllOrNull().orEmpty()
        .mapNotNull { it.method.toolbarCastOmissionGate(controllerType, accessor) }
    if (guards.size != 4) {
        printWarn("Found ${guards.size} of 4 expected native toolbar Cast collection gates.")
    }

    // The other experiment branch can jump straight into the append. Only the omission flag skips it.
    guards.forEach { it.installOverride() }
}

context(_: BytecodePatchContext)
private fun restoreToolbarCast(
    initialize: MutableMethod,
    castClass: MutableClass,
    routeVisibility: MutableMethod,
    routeClass: MutableClass,
): Boolean {
    val entryPoint = ToolbarCastEntryPointFingerprint.matchOrNull()?.originalMethod ?: return false
    val viewMethod = MediaRouteClickFingerprint.matchOrNull()?.method ?: return false
    if (routeClass.methods.any { it.name == "setEnabled" }) return false

    val flagAccessor = if (is_21_30_or_greater) null else {
        castFlagAccessor(CAST_ENTRY_POINT_FLAG).matchOrNull()?.originalMethod ?: return false
    }
    val viewFlag = initialize.flagResult(CAST_ENTRY_POINT_FLAG, flagAccessor) ?: return false
    val connections = Fingerprint(filters = listOf(methodCall(entryPoint)))
        .matchAllOrNull().orEmpty()
        .mapNotNull { it.method.flagResult(CAST_ENTRY_POINT_FLAG, flagAccessor) }
    if (connections.isEmpty()) return false

    val awareness = listOf(CAST_AWARENESS_FLAG, CAST_AWARENESS_ALTERNATE_FLAG).map { flag ->
        val accessor = if (is_21_30_or_greater) null else {
            castFlagAccessor(flag).matchOrNull()?.originalMethod ?: return false
        }
        castClass.methods.mapNotNull { it.flagResult(flag, accessor) }.singleOrNull() ?: return false
    }
    val clickAccessor = if (is_21_30_or_greater) null else {
        castFlagAccessor(CAST_COMPANION_CLICK_FLAG).matchOrNull()?.originalMethod ?: return false
    }
    val clickFlag = viewMethod.flagResult(CAST_COMPANION_CLICK_FLAG, clickAccessor) ?: return false
    val clickFlags = if (is_21_39_or_greater) {
        val alternateFlag = viewMethod.flagResult(CAST_COMPANION_ALTERNATE_CLICK_FLAG, null) ?: return false
        listOf(alternateFlag, clickFlag)
    } else {
        listOf(clickFlag)
    }

    viewFlag.installOverride()
    connections.forEach { it.installOverride() }
    awareness.sortedByDescending { it.index }.forEach { it.installOverride() }
    val viewRegister = viewMethod.implementation!!.registerCount - 1
    clickFlags.forEach { it.installOverride(viewRegister) }

    installToolbarCastView(routeVisibility, routeClass)
    restoreToolbarCastCollection(castClass)
    return true
}

private fun MutableClass.addPrivateField(name: String, descriptor: String): String {
    instanceFields.add(ImmutableField(type, name, descriptor, AccessFlags.PRIVATE.value, null, null, null).toMutable())
    return "$type->$name:$descriptor"
}

private fun installToolbarCastView(visibility: MutableMethod, routeClass: MutableClass) {
    routeClass.apply {
        interfaces.add(TOOLBAR_CAST_VIEW)

        val marked = addPrivateField("patch_toolbarCast", "Z")
        addBridge("patch_markToolbarCast", emptyList(), "V", 2, """
            const/4 v0, 0x1
            iput-boolean v0, p0, $marked
            return-void
        """)
        addBridge("patch_isToolbarCast", emptyList(), "Z", 2, """
            iget-boolean v0, p0, $marked
            return v0
        """)

        // Keep the real route chooser accessible; only the marked toolbar view bypasses UI suppression.
        val enabledHook = "$EXTENSION_CLASS_DESCRIPTOR->toolbarCastViewEnabled(Landroid/view/View;Z)Z"
        addBridge("setEnabled", listOf("Z"), "V", 2, """
            invoke-static {p0, p1}, $enabledHook
            move-result p1
            invoke-super {p0, p1}, $superclass->setEnabled(Z)V
            return-void
        """, AccessFlags.PUBLIC.value)
    }

    val visibilityHook = "$EXTENSION_CLASS_DESCRIPTOR->toolbarCastViewVisibility(Landroid/view/View;I)I"
    visibility.addInstructions(0, """
        invoke-static/range {p0 .. p1}, $visibilityHook
        move-result p1
    """)
}

context(_: BytecodePatchContext)
private fun hookToolbarCompanion(castClass: MutableClass): Boolean {
    val selection = ToolbarCastSelectionFingerprint.matchOrNull() ?: return false
    val menuCreate = ToolbarMenuCreateFingerprint.matchOrNull()?.method ?: return false
    val companionId = ToolbarCompanionButtonIdFingerprint.matchOrNull()?.method ?: return false
    val method = selection.method
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false

    val companionProviderCall = selection.instructionMatches.last().index
    val invoke = method.getInstruction<FiveRegisterInstruction>(companionProviderCall)
    val provider = invoke.getReference<MethodReference>() ?: return false
    val castProviderRegister = method.implementation!!.registerCount - method.parameterTypes.size
    if (invoke.registerC != castProviderRegister + 1 || method.parameterTypes.first() != provider.definingClass) {
        return false
    }

    val moveResult = method.getInstruction<OneRegisterInstruction>(companionProviderCall + 1)
    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return false
    val companion = moveResult.registerA
    val cast = method.findFreeRegister(companionProviderCall, castProviderRegister, invoke.registerC, companion)

    // The chosen provider overwrites p0 with its result. Save the Cast provider before that happens.
    val keepCompanion = "$EXTENSION_CLASS_DESCRIPTOR->keepCompanionButton" +
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
    method.addInstructions(companionProviderCall + 2, """
        invoke-interface/range {v$cast .. v$cast}, $provider
        move-result-object v$cast
        invoke-static {v$cast, v$companion}, $keepCompanion
        move-result-object v$companion
    """)
    method.addInstructionsAtControlFlowLabel(companionProviderCall, "move-object/from16 v$cast, p0")

    castClass.apply {
        interfaces.add(TOOLBAR_CAST_CONTROLLER)

        // Attach the stock Companion controller to the Cast controller from the same activity.
        val companionField = addPrivateField("patch_companionButton", "Ljava/lang/Object;")
        addBridge("patch_getCompanionButton", emptyList(), "Ljava/lang/Object;", 2, """
            iget-object v0, p0, $companionField
            return-object v0
        """)
        addBridge("patch_setCompanionButton", listOf("Ljava/lang/Object;"), "V", 2, """
            iput-object p1, p0, $companionField
            return-void
        """)
    }

    val companionListHook = "$EXTENSION_CLASS_DESCRIPTOR->addToolbarCompanionButton(Landroid/util/SparseArray;)V"
    menuCreate.addInstruction(0, "invoke-static/range {p3 .. p3}, $companionListHook")

    val companionIdHook = "$EXTENSION_CLASS_DESCRIPTOR->toolbarCompanionButtonId()I"
    companionId.replaceInstruction(0, "invoke-static {}, $companionIdHook")
    companionId.addInstruction(1, "move-result v0")
    return true
}

context(_: BytecodePatchContext)
internal fun hookToolBarCastButton(): Boolean {
    val initialize = MenuItemInitializeFingerprint.matchOrNull()
    val modern = is_21_04_or_greater
    val visibility = if (modern) {
        ModernMenuItemVisibilityFingerprint.matchOrNull()
    } else {
        MenuItemVisibilityFingerprint.matchOrNull()
    }
    val route = MediaRouteVisibilityFingerprint.matchOrNull()
    if (initialize == null || visibility == null || route == null) {
        printWarn("Toolbar Cast and Companion hooks are not supported on this YouTube version.")
        return false
    }

    val restored = is_21_13_or_greater &&
        restoreToolbarCast(initialize.method, initialize.classDef, route.method, route.classDef)
    if (!restored) {
        printWarn("Restoring the toolbar Cast button is not supported on this YouTube version; keeping stock Cast.")
        val hide = "$EXTENSION_CLASS_DESCRIPTOR->hideCastButton(I)I"
        route.method.addInstructions(0, """
            invoke-static {p1}, $hide
            move-result p1
        """)
    }

    initialize.method.apply {
        val index = indexOfFirstInstructionOrThrow {
            getReference<MethodReference>()?.name == "setShowAsAction"
        }
        if (modern) {
            val menuItem = getInstruction<FiveRegisterInstruction>(index).registerC
            val callback = if (restored) RESTORED_MENU_INITIALIZER else MENU_INITIALIZER
            addInstruction(index, "invoke-static {v$menuItem}, $callback")
        } else {
            addInstruction(index + 1, "invoke-static {p1}, $MENU_INITIALIZER")
        }
    }

    visibility.method.apply {
        val index = if (modern) {
            indexOfFirstInstructionOrThrow { getReference<MethodReference>()?.name == "setVisible" }
        } else {
            0
        }
        val visibleRegister = if (modern) "v${getInstruction<FiveRegisterInstruction>(index).registerD}" else "p1"
        val visibilityHook = if (restored) {
            "invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->showToolbarCastButton()Z"
        } else {
            "invoke-static {$visibleRegister}, $EXTENSION_CLASS_DESCRIPTOR->hideToolbarCastButton(Z)Z"
        }
        addInstructions(index, """
            $visibilityHook
            move-result $visibleRegister
        """)
    }
    updatePatchStatus(PATCH_STATUS_CLASS_DESCRIPTOR, "ToolBarComponents")

    val companion = restored && is_21_39_or_greater && hookToolbarCompanion(initialize.classDef)
    if (!companion) {
        printWarn("A separate toolbar Companion button is not supported on this YouTube version.")
    }
    return companion
}
