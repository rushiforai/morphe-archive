package dev.srwi.gintype.patches.gboard.features.customholdpopups

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.srwi.gintype.patches.gboard.shared.GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS
import dev.srwi.gintype.patches.gboard.shared.GBOARD_SOFT_KEY_DEF_CLASS
import dev.srwi.gintype.patches.gboard.shared.GBOARD_SOFT_KEY_VIEW_CLASS
import dev.srwi.gintype.patches.gboard.shared.findBasicMotionEventHandlerFireKeyDataMethod
import dev.srwi.gintype.patches.gboard.shared.findPopupManagerClass
import dev.srwi.gintype.patches.gboard.shared.findSoftKeyViewSetDefMethod
import dev.srwi.gintype.patches.gboard.shared.findTouchActionBundleShowPopupMethod
import dev.srwi.gintype.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.srwi.gintype.patches.gboard.shared.isMethodReference
import dev.srwi.gintype.patches.gboard.shared.mutableClass
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val ORIG_FIRE_KEY_DATA_HELPER_NAME = "gboardPatchesOriginalFireKeyData"

internal val gboardCustomHoldPopupsBytecodePatch = bytecodePatch(
    description = "Hooks SoftKeyView.setSoftKeyDef, hold popup selection/dismissal, and key commit dispatch for customizable hold popups.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        // 1. SoftKeyView.setSoftKeyDef(SoftKeyDef, J)Z — transform SoftKeyDef before binding to SoftKeyView
        val softKeyViewClass = mutableClass(GBOARD_SOFT_KEY_VIEW_CLASS)
        val setSoftKeyDefMethod = findSoftKeyViewSetDefMethod(softKeyViewClass)
        val transformAbi = RuntimeAbiCatalog.abi(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_TRANSFORM_SOFT_KEY_DEF,
        )
        val existingTransformHooks = setSoftKeyDefMethod.implementation?.instructions
            ?.count { it.isMethodReference(transformAbi.reference) } ?: 0
        if (existingTransformHooks == 0) {
            val transformInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_TRANSFORM_SOFT_KEY_DEF,
                "p0, p1",
            )
            setSoftKeyDefMethod.addInstructions(
                0,
                """
                    $transformInvoke
                    move-result-object p1
                    check-cast p1, $GBOARD_SOFT_KEY_DEF_CLASS
                """.trimIndent(),
            )
        }

        // Resolve BasicMotionEventHandler.fireKeyData(...)V dynamically first so TouchActionBundle
        // and PopupManager class descriptors are discovered without hardcoding obfuscated names.
        val basicHandlerClass = mutableClass(GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS)
        val fireKeyDataMethod = findBasicMotionEventHandlerFireKeyDataMethod(basicHandlerClass)
        val touchActionBundleDescriptor = fireKeyDataMethod.parameterTypes[0].toString()

        // 2. TouchActionBundle.showPopup(J)V — notify runtime when a hold popup opens
        val touchActionBundleClass = mutableClass(touchActionBundleDescriptor)
        val showPopupMethod = findTouchActionBundleShowPopupMethod(touchActionBundleClass)
        val popupShownAbi = RuntimeAbiCatalog.abi(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SHOWN,
        )
        val existingPopupShownHooks = showPopupMethod.implementation?.instructions
            ?.count { it.isMethodReference(popupShownAbi.reference) } ?: 0
        if (existingPopupShownHooks == 0) {
            val popupShownInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SHOWN,
                "p0 .. p0",
            )
            val instructions = showPopupMethod.implementation?.instructions?.toList()
                ?: throw PatchException("No implementation in $touchActionBundleDescriptor->${showPopupMethod.name}(J)V")
            val returnIndices = instructions.mapIndexedNotNull { idx, insn ->
                if (insn.opcode == Opcode.RETURN_VOID) idx else null
            }.sortedDescending()
            if (returnIndices.isEmpty()) {
                throw PatchException("No return-void instruction in $touchActionBundleDescriptor->${showPopupMethod.name}(J)V")
            }
            for (returnIdx in returnIndices) {
                showPopupMethod.addInstructions(returnIdx, popupShownInvoke)
            }
        }

        // 3. PopupManager.handleMove(F, F, Z)Z — notify runtime when highlighted popup symbol updates during slide
        val popupManagerClass = findPopupManagerClass(this, touchActionBundleClass)
        val popupManagerDescriptor = popupManagerClass.type
        val handleMoveMethod = popupManagerClass.methods.singleOrNull {
            (it.accessFlags and AccessFlags.STATIC.value) == 0 &&
                it.returnType == "Z" &&
                it.parameterTypes == listOf("F", "F", "Z")
        } ?: throw PatchException(
            "Could not uniquely find (F, F, Z)Z in $popupManagerDescriptor",
        )
        val selectionUpdatedAbi = RuntimeAbiCatalog.abi(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SELECTION_UPDATED,
        )
        val existingSelectionHooks = handleMoveMethod.implementation?.instructions
            ?.count { it.isMethodReference(selectionUpdatedAbi.reference) } ?: 0
        if (existingSelectionHooks == 0) {
            val selectionUpdatedInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SELECTION_UPDATED,
                "p0, p3",
            )
            val instructions = handleMoveMethod.implementation?.instructions?.toList()
                ?: throw PatchException("No implementation in $popupManagerDescriptor->${handleMoveMethod.name}(F, F, Z)Z")
            val selectedKeyFieldPutIndices = instructions.mapIndexedNotNull { idx, insn ->
                if (insn.opcode != Opcode.IPUT_OBJECT) return@mapIndexedNotNull null
                val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapIndexedNotNull null
                if (ref.definingClass == popupManagerDescriptor) idx else null
            }.sortedDescending()
            if (selectedKeyFieldPutIndices.isEmpty()) {
                throw PatchException("No iput-object on $popupManagerDescriptor in $popupManagerDescriptor->${handleMoveMethod.name}(F, F, Z)Z")
            }
            for (putIdx in selectedKeyFieldPutIndices) {
                handleMoveMethod.addInstructions(putIdx + 1, selectionUpdatedInvoke)
            }
        }

        // 4. PopupManager.hide(J)V & PopupManager.close()V — cancel 2s hold timer when popup hides or closes
        val hideAbi = RuntimeAbiCatalog.abi(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_HIDDEN,
        )
        val hideInvoke = RuntimeCallEmitter.invoke(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_HIDDEN,
            "p0",
        )
        val hideMethod = popupManagerClass.methods.singleOrNull {
            (it.accessFlags and AccessFlags.STATIC.value) == 0 &&
                it.returnType == "V" &&
                it.parameterTypes == listOf("J")
        } ?: throw PatchException("Could not uniquely find (J)V in $popupManagerDescriptor")
        val closeMethod = popupManagerClass.methods.firstOrNull {
            (it.accessFlags and AccessFlags.STATIC.value) == 0 &&
                it.name == "close" &&
                it.returnType == "V" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException("Could not find close()V in $popupManagerDescriptor")
        for (method in listOf(hideMethod, closeMethod)) {
            val existingHideHooks = method.implementation?.instructions
                ?.count { it.isMethodReference(hideAbi.reference) } ?: 0
            if (existingHideHooks == 0) {
                method.addInstructions(0, hideInvoke)
            }
        }

        // 5. BasicMotionEventHandler.fireKeyData(...)V — intercept pencil (✎), 2s hold-to-edit suppression, and multi-char snippet commits
        val interceptAbi = RuntimeAbiCatalog.abi(
            RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_SHOULD_INTERCEPT_KEY_DATA_DISPATCH,
        )
        val existingInterceptHooks = fireKeyDataMethod.implementation?.instructions
            ?.count { it.isMethodReference(interceptAbi.reference) } ?: 0
        val existingHelper = basicHandlerClass.methods.any { it.name == ORIG_FIRE_KEY_DATA_HELPER_NAME }
        if (existingInterceptHooks == 0 && !existingHelper) {
            val fireKeyDataName = fireKeyDataMethod.name
            val paramTypes = fireKeyDataMethod.parameterTypes.map { it.toString() }
            val paramWords = 1 + paramTypes.sumOf { p ->
                if (p == "J" || p == "D") 2 else 1
            }
            val origImpl = fireKeyDataMethod.implementation
                ?: throw PatchException("No instructions in $GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS->$fireKeyDataName(...)V")
            val interceptInvoke = RuntimeCallEmitter.invoke(
                RuntimeCallId.CUSTOM_HOLD_POPUPS_RUNTIME_SHOULD_INTERCEPT_KEY_DATA_DISPATCH,
                "p0 .. p4",
            )
            val paramDescriptor = paramTypes.joinToString("")
            val lastParamReg = paramWords - 1
            val origAccessFlags = fireKeyDataMethod.accessFlags
            val origAnnotations = fireKeyDataMethod.annotations

            // Wrap fireKeyData(...)V into a dedicated helper so we always have a clean local register v0
            // without clobbering any parameter register (even when fireKeyData(...)V has 0 local registers).
            basicHandlerClass.methods.add(
                MutableMethod(
                    ImmutableMethod(
                        GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS,
                        ORIG_FIRE_KEY_DATA_HELPER_NAME,
                        paramTypes.map { ImmutableMethodParameter(it, null, null) },
                        "V",
                        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                        origAnnotations,
                        null,
                        ImmutableMethodImplementation.of(origImpl),
                    ),
                ),
            )
            basicHandlerClass.methods.remove(fireKeyDataMethod)

            val wrapperMethod = ImmutableMethod(
                GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS,
                fireKeyDataName,
                paramTypes.map { ImmutableMethodParameter(it, null, null) },
                "V",
                origAccessFlags,
                origAnnotations,
                null,
                MutableMethodImplementation(paramWords + 1),
            ).toMutable()
            wrapperMethod.addInstructionsWithLabels(
                0,
                """
                    $interceptInvoke
                    move-result v0
                    if-eqz v0, :custom_hold_popups_allow_dispatch
                    return-void
                    :custom_hold_popups_allow_dispatch
                    invoke-direct/range {p0 .. p$lastParamReg}, $GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS->$ORIG_FIRE_KEY_DATA_HELPER_NAME($paramDescriptor)V
                    return-void
                """.trimIndent(),
            )
            basicHandlerClass.methods.add(wrapperMethod)
        }
    }
}
