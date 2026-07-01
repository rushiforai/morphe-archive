/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/popups/Fingerprints.kt
 */
package app.morphe.patches.tumblr.annoyances.popups

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// This method is responsible for loading and displaying the visual Layout of the Gift Message Popup.
internal object ShowGiftMessagePopupFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.FINAL, AccessFlags.PUBLIC),
    returnType = "V",
    strings = listOf("activity", "anchorView", "textMessage"),
)

