package app.southstar21.patches.instagram.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Lifecycle methods of InstagramMainActivity are mostly obfuscated wrappers,
 * but onWindowFocusChanged is a real override. It runs once the main layout has been
 * inflated and again after the activity is recreated, so patches that need the main
 * activity's views can hook it.
 */
internal object MainActivityWindowFocusFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/mainactivity/InstagramMainActivity;",
    name = "onWindowFocusChanged",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)
