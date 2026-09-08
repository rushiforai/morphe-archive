package com.morphe.friendsturner.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val MAIN_ACTIVITY = "Lcom/peter890331/friendsturner/MainActivity;"

/**
 * Fingerprints the interstitial-ad gate in MainActivity.
 *
 * Since the per-placement patches were archived, this is no longer used to remove a
 * branch. `Force sponsor state` uses it to locate the ad-free flag: the flag is read here
 * to decide whether to show the interstitial, so the static field this method reads is the
 * flag, without hard coding an obfuscated name.
 *
 * The method reads the ad-free ("sponsor") flag, and a single conditional diverts
 * non-sponsors to the ad code. Shape, in both 5.15 and 5.16:
 *
 *     sget-object      <ad-free flag>                 # a Compose MutableState
 *     invoke-virtual   ...->getValue()
 *     check-cast       Ljava/lang/Boolean;
 *     invoke-virtual   Ljava/lang/Boolean;->booleanValue()Z   <-- filter 1
 *     move-result
 *     if-eqz           :cond_0                                <-- filter 2, removed
 *     invoke-virtual   MainActivity-><capture>()V             <-- filter 3, ad-free path
 *     return-void
 *   :cond_0
 *     ... show interstitial ad ...
 *
 * NOTE: every identifier here is deliberately obfuscation-proof. Between 5.15 and 5.16
 * the app was rebuilt and every obfuscated name moved:
 *
 *   | thing              | 5.15              | 5.16              |
 *   |--------------------|-------------------|-------------------|
 *   | gate method        | F()V              | B()V              |
 *   | ad-free path       | E()V              | A()V              |
 *   | flag holder        | Lp8/b;->z         | Li9/b;->z         |
 *   | Compose state type | Lj0/m1;           | Lm0/j1;           |
 *
 * So the filters match only on things the obfuscator cannot rename: the framework call
 * Boolean.booleanValue(), the branch opcode, and a call to *some* no-argument void method
 * on MainActivity. The third filter deliberately omits `name`.
 *
 * Fingerprint's `name` parameter is the exact method name, not a label, and is omitted
 * for the same reason. This matches exactly one method in 5.15 and in 5.16.
 */
object MainActivityFAdGateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        // 1. Reading the ad-free / "sponsor" boolean.
        methodCall(smali = "Ljava/lang/Boolean;->booleanValue()Z"),
        // 2. The conditional that diverts non-sponsors to the ad code. This is removed.
        opcode(Opcode.IF_EQZ),
        // 3. The ad-free path: starts the screen-capture tool. Name intentionally omitted.
        methodCall(
            definingClass = MAIN_ACTIVITY,
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/**
 * Fingerprints the PairIP license check entry point.
 *
 * FriendsTurner is published with Google Play's automatic integrity protection, which
 * injects `com.pairip.licensecheck` into the app. On start it verifies the app was
 * installed by Play; a patched build is re-signed and sideloaded, so the check fails and
 * Play shows "Get this app from Play - To continue using FriendsTurner, get it on Google
 * Play", which blocks the app entirely.
 *
 * Two call sites reach it, and both funnel through this one static method:
 *
 *   Lcom/pairip/licensecheck/LicenseContentProvider;->onCreate()Z
 *   Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
 *
 * So voiding this single method disables the whole flow.
 *
 * These names are safe to match on. PairIP is injected by Play after the developer's own
 * build, so it is not run through the app's obfuscator: the class and method names are
 * identical in 5.15 and 5.16.
 */
object PairipLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
