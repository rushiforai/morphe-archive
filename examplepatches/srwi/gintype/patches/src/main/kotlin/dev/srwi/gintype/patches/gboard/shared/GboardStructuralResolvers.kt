package dev.srwi.gintype.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val GBOARD_SOFT_KEY_DEF_CLASS =
    "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;"
internal const val GBOARD_SOFT_KEY_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
internal const val GBOARD_SOFT_KEYBOARD_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"
internal const val GBOARD_BASIC_MOTION_EVENT_HANDLER_CLASS =
    "Lcom/google/android/libraries/inputmethod/motioneventhandler/BasicMotionEventHandler;"

/**
 * Resolves BasicMotionEventHandler's key-data dispatch method (`fireKeyData`) across Gboard versions
 * without hardcoding obfuscated method or TouchActionBundle class names.
 *
 * Signature shape: `(TouchActionBundle, Action, KeyData, SoftKeyDef, J, ...)V`.
 */
internal fun findBasicMotionEventHandlerFireKeyDataMethod(
    basicHandlerClass: MutableClass,
): MutableMethod {
    val candidates = basicHandlerClass.methods.filter { method ->
        (method.accessFlags and AccessFlags.STATIC.value) == 0 &&
            method.returnType == "V" &&
            method.parameterTypes.size >= 5 &&
            method.parameterTypes[3] == GBOARD_SOFT_KEY_DEF_CLASS &&
            method.parameterTypes[4] == "J"
    }
    return candidates.singleOrNull()
        ?: candidates.firstOrNull { it.name == "o" || it.name == "h" }
        ?: throw PatchException(
            "Could not uniquely resolve fireKeyData(..., SoftKeyDef, J, ...)V in ${basicHandlerClass.type} " +
                "(found ${candidates.size} candidates)",
        )
}

/**
 * Resolves SoftKeyboardView's target-height computation method across Gboard versions
 * (e.g. `z()I` in 18.5.4, `y()I` in 18.8.1) by matching the non-static `()I` method that invokes
 * `Math.ceil(D)D`.
 */
internal fun findSoftKeyboardViewTargetHeightMethod(
    softKeyboardViewClass: MutableClass,
): MutableMethod {
    val zeroArgIntMethods = softKeyboardViewClass.methods.filter { method ->
        (method.accessFlags and AccessFlags.STATIC.value) == 0 &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "I"
    }
    val byMathCeil = zeroArgIntMethods.filter { method ->
        method.implementation?.instructions?.any { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@any false
            ref.definingClass == "Ljava/lang/Math;" &&
                ref.name == "ceil" &&
                ref.parameterTypes == listOf("D") &&
                ref.returnType == "D"
        } == true
    }
    return byMathCeil.singleOrNull()
        ?: zeroArgIntMethods.firstOrNull { it.name == "z" }
        ?: throw PatchException(
            "Could not resolve targetHeight()I in ${softKeyboardViewClass.type}",
        )
}

/**
 * Resolves `SoftKeyView.setSoftKeyDef(SoftKeyDef, long) -> boolean` across Gboard versions.
 */
internal fun findSoftKeyViewSetDefMethod(
    softKeyViewClass: MutableClass,
): MutableMethod {
    val candidates = softKeyViewClass.methods.filter { method ->
        (method.accessFlags and AccessFlags.STATIC.value) == 0 &&
            method.returnType == "Z" &&
            method.parameterTypes == listOf(GBOARD_SOFT_KEY_DEF_CLASS, "J")
    }
    return candidates.singleOrNull()
        ?: candidates.firstOrNull { it.name == "s" }
        ?: throw PatchException(
            "Could not resolve setSoftKeyDef($GBOARD_SOFT_KEY_DEF_CLASS, J)Z in ${softKeyViewClass.type}",
        )
}

/**
 * Resolves `TouchActionBundle.showPopup(long) -> void` across Gboard versions
 * (e.g. `D(J)V` in 18.5.4, `F(J)V` in 18.8.1) via its Android Trace section name
 * `"TouchActionBundle.showPopup"`.
 */
internal fun findTouchActionBundleShowPopupMethod(
    touchActionBundleClass: MutableClass,
): MutableMethod {
    val longVoidMethods = touchActionBundleClass.methods.filter { method ->
        (method.accessFlags and AccessFlags.STATIC.value) == 0 &&
            method.returnType == "V" &&
            method.parameterTypes == listOf("J")
    }
    val byTraceLabel = longVoidMethods.filter { method ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.CONST_STRING &&
                ((insn as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "TouchActionBundle.showPopup"
        } == true
    }
    return byTraceLabel.singleOrNull()
        ?: longVoidMethods.firstOrNull { it.name == "D" }
        ?: throw PatchException(
            "Could not resolve showPopup(J)V in ${touchActionBundleClass.type}",
        )
}

/**
 * Resolves Gboard's `PopupManager` class (`Lqsl;` in 18.5.4, `Lahrc;` in 18.8.1) dynamically from
 * `TouchActionBundle`'s instance fields by finding the `AutoCloseable` collaborator that defines
 * `handleMove(float, float, boolean) -> boolean` and `hide(long) -> void`.
 */
internal fun findPopupManagerClass(
    context: BytecodePatchContext,
    touchActionBundleClass: MutableClass,
): MutableClass {
    val candidateTypes = touchActionBundleClass.fields
        .asSequence()
        .filter { (it.accessFlags and AccessFlags.STATIC.value) == 0 }
        .map { it.type }
        .filter { it.startsWith("L") && !it.startsWith("Ljava/") && !it.startsWith("Landroid/") }
        .distinct()
        .toList()

    val matchingClasses = candidateTypes.mapNotNull { descriptor ->
        val cls = context.mutableClassDefByOrNull(descriptor) ?: return@mapNotNull null
        val hasHandleMove = cls.methods.any { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.returnType == "Z" &&
                m.parameterTypes == listOf("F", "F", "Z")
        }
        val hasHide = cls.methods.any { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.returnType == "V" &&
                m.parameterTypes == listOf("J")
        }
        val hasClose = cls.methods.any { m ->
            (m.accessFlags and AccessFlags.STATIC.value) == 0 &&
                m.name == "close" &&
                m.returnType == "V" &&
                m.parameterTypes.isEmpty()
        }
        if (hasHandleMove && hasHide && hasClose) cls else null
    }

    return matchingClasses.singleOrNull()
        ?: throw PatchException(
            "Could not uniquely resolve PopupManager class from ${touchActionBundleClass.type} " +
                "(found ${matchingClasses.map { it.type }})",
        )
}
