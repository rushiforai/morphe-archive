/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photomath/misc/annoyances/Fingerprints.kt
 */
package app.morphe.patches.photomath.misc.annoyances

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.OpcodesFilter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object HideUpdatePopupFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.FINAL, AccessFlags.PUBLIC),
    returnType = "V",
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST_HIGH16,
        Opcode.INVOKE_VIRTUAL,
        Opcode.MOVE_RESULT_OBJECT,
        Opcode.CONST_WIDE_16,
        Opcode.INVOKE_VIRTUAL,
    ),
    custom = { method, _ ->
        // The popup is shown only in the main activity
        method.definingClass == "Lcom/microblink/photomath/main/activity/MainActivity;"
    },
)

