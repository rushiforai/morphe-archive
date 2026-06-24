/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/rar/misc/annoyances/purchasereminder/Fingerprints.kt
 */
package app.morphe.patches.rar.misc.annoyances.purchasereminder

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ShowReminderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    custom = { method, _ ->
        method.definingClass.endsWith("AdsNotify;") && method.name == "show"
    },
)

