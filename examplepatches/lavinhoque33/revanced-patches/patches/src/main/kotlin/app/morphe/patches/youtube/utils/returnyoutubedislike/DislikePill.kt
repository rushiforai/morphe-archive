/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-28
 *
 * Layout hook adapted from Morphe's LikeDislikeButtons:
 * Copyright 2026 Morphe, https://github.com/MorpheApp/morphe-patches/pull/3075
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.youtube.utils.returnyoutubedislike

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.youtube.utils.extension.Constants.EXTENSION_PATH
import app.morphe.util.findMethodOrThrow
import app.morphe.util.Utils.printWarn
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

private const val PILL_CLASS = "$EXTENSION_PATH/returnyoutubedislike/DislikePill;"
private const val YOGA_NATIVE = "Lcom/facebook/yoga/YogaNative;"

private object PillHostDescriptionFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/litho/ComponentHost;",
    name = "setContentDescription",
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;"),
)

private object PillWidthFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/yoga/YogaNodeJNIBase;",
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(methodCall(definingClass = YOGA_NATIVE, name = "jni_YGNodeStyleSetWidthJNI")),
)

internal fun BytecodePatchContext.hookDislikePill() {
    // Resolve everything before editing. Older apps keep the existing pill if either hook differs.
    val hooks = runCatching {
        val hostMethod = PillHostDescriptionFingerprint.method
        val widthMethod = PillWidthFingerprint.method
        val widthCall = PillWidthFingerprint.instructionMatches.last()
        val registers = widthCall.getInstruction<FiveRegisterInstruction>()
        findMethodOrThrow(YOGA_NATIVE) {
            name == "jni_YGNodeStyleSetWidthJNI" && parameterTypes == listOf("J", "F")
                    && returnType == "V" && AccessFlags.STATIC.isSet(accessFlags)
        }
        findMethodOrThrow(YOGA_NATIVE) {
            name == "jni_YGNodeStyleSetMarginJNI" && parameterTypes == listOf("J", "I", "F")
                    && returnType == "V" && AccessFlags.STATIC.isSet(accessFlags)
                    && AccessFlags.PUBLIC.isSet(accessFlags)
        }
        Triple(hostMethod, widthMethod, widthCall.index to registers)
    }.getOrNull()

    if (hooks == null) {
        printWarn("Return YouTube Dislike: Morphe-style dislike pill is unavailable on this version; " +
                "the existing pill layout will be used.")
        return
    }

    val (hostMethod, widthMethod, widthCall) = hooks
    val (index, registers) = widthCall
    val yogaClass = mutableClassDefBy { it.type == widthMethod.definingClass }

    // Keep the bridge in Yoga's package: its native width setter is package-private.
    // Both native methods were resolved above; no app-class stubs are needed.
    yogaClass.methods.add(
        ImmutableMethod(
            yogaClass.type,
            "revanced_setDislikePillWidth",
            listOf(ImmutableMethodParameter("J", null, null), ImmutableMethodParameter("F", null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1, p2}, $YOGA_NATIVE->jni_YGNodeStyleSetWidthJNI(JF)V
                    invoke-static {}, $PILL_CLASS->isEnabled()Z
                    move-result v0
                    if-eqz v0, :done
                    invoke-static {p2}, $PILL_CLASS->getMargin(F)F
                    move-result v0
                    invoke-static {v0}, $PILL_CLASS->getMarginEdge(F)I
                    move-result v1
                    if-ltz v1, :done
                    invoke-static {p0, p1, v1, v0}, $YOGA_NATIVE->jni_YGNodeStyleSetMarginJNI(JIF)V
                    :done
                    return-void
                """,
            )
        }
    )
    widthMethod.replaceInstruction(
        index,
        "invoke-static {v${registers.registerC}, v${registers.registerD}, v${registers.registerE}}, " +
                "${yogaClass.type}->revanced_setDislikePillWidth(JF)V",
    )
    hostMethod.addInstruction(0, "invoke-static {p0, p1}, $PILL_CLASS->" +
            "onContentDescription(Landroid/view/View;Ljava/lang/CharSequence;)V")
    findMethodOrThrow(PILL_CLASS) { name == "isAvailable" }.returnEarly(true)
}
