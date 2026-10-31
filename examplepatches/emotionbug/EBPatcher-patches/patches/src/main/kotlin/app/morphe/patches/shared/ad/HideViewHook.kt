/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.shared.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// EBPatcher: extracted unchanged from Morphe v1.48.0 for Music-only dependency closure.

/**
 * Inject a call to a method that hides a view.
 *
 * @param moveIndex The index of MOVE_RESULT_OBJECT.
 * @param classDescriptor The descriptor of the class that contains the method.
 * @param targetMethod The name of the method to call.
 */
internal fun MutableMethod.injectHideViewCall(
    moveIndex: Int,
    classDescriptor: String,
    targetMethod: String,
) = injectHideViewCall(
    moveIndex + 1,
    getInstruction<OneRegisterInstruction>(moveIndex).registerA,
    classDescriptor,
    targetMethod
)

/**
 * Inject a call to a method that hides a view.
 *
 * @param insertIndex The index to insert the call at.
 * @param viewRegister The register of the view to hide.
 * @param classDescriptor The descriptor of the class that contains the method.
 * @param targetMethod The name of the method to call.
 */
internal fun MutableMethod.injectHideViewCall(
    insertIndex: Int,
    viewRegister: Int,
    classDescriptor: String,
    targetMethod: String,
) = addInstruction(
    insertIndex,
    "invoke-static { v$viewRegister }, $classDescriptor->$targetMethod(Landroid/view/View;)V",
)
