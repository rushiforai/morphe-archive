/*
 * Copyright 2026 De-Vanced
 * Copyright 2026 Hushfacebook contributors
 * [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
 *
 * Startup anchors adapted from Hushfacebook (GPL-3.0).
 * [https://github.com/SysAdminDoc/HushFacebook](https://github.com/SysAdminDoc/HushFacebook)
 */

package app.morphe.patches.facebook.navigation.marketplace

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun Method.holdsString(string: String) =
    implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
    } == true

private fun Method.calls(
    definingClass: String,
    name: String,
    parameters: List<String>,
    returnType: String,
) = implementation?.instructions?.any { instruction ->
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ?: return@any false
    call.definingClass == definingClass && call.name == name &&
        call.returnType == returnType &&
        call.parameterTypes.map { it.toString() } == parameters
} == true

private fun Method.readsOwnLong() =
    implementation?.instructions?.any {
        it.opcode == Opcode.IGET_WIDE &&
            ((it as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == definingClass && field.type == "J"
            }
    } == true

object StartTabPickerFingerprint : Fingerprint(
    returnType = "J",
    strings = listOf(TARGET_TAB_ID),
    custom = { method, _ ->
        !method.definingClass.startsWith(EXTENSION_PACKAGE) &&
            method.parameterTypes.any { it.toString() == INTENT } &&
            method.calls(INTENT, "hasExtra", listOf("Ljava/lang/String;"), "Z") &&
            method.calls(INTENT, "getLongExtra", listOf("Ljava/lang/String;", "J"), "J")
    },
)

object SanitizedIntentHandOverFingerprint : Fingerprint(
    strings = listOf(SANITIZE_INTENT),
    custom = { method, _ ->
        !method.definingClass.startsWith(EXTENSION_PACKAGE) &&
            method.findSanitizedIntentHandOverIndex() != null
    },
)

object StartPositionGateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf(START_POSITION),
    custom = { method, _ ->
        !method.definingClass.startsWith(EXTENSION_PACKAGE) &&
            method.findStartPositionGateIndex() != null
    },
)

object KeepAskedStartTabFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf(TARGET_TAB_ID),
    custom = { method, _ ->
        !method.definingClass.startsWith(EXTENSION_PACKAGE) &&
            AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } ==
                listOf(MAIN_TAB_ACTIVITY, method.definingClass) &&
            method.calls(INTENT, "getLongExtra", listOf("Ljava/lang/String;", "J"), "J") &&
            method.readsOwnLong()
    },
)
