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

/**
 * InstagramMainActivity's constructor. onCreate and the other early lifecycle methods aren't
 * overridden under their real names, but the constructor always is. It runs before the
 * activity is created, early enough for patches to set themselves up before the first frame
 * (onWindowFocusChanged only comes once that frame is already on screen).
 */
internal object MainActivityConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/mainactivity/InstagramMainActivity;",
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(),
)
