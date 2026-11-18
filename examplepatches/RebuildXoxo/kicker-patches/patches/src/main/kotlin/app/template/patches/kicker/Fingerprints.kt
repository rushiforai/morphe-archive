package app.template.patches.kicker

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * kicker 7.15.1 keeps banner, interstitial, and splash decisions behind
 * KAbsAdManager.A(). R8 shortened the method name, so this fingerprint is
 * pinned to that version in the compatibility declaration.
 */
object AdsEligibleFingerprint : Fingerprint(
    definingClass = "Lcom/tickaroo/kicker/ads/KAbsAdManager;",
    name = "A",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)
