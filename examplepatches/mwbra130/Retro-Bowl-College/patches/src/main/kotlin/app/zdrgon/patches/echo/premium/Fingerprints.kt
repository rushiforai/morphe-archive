package app.zdrgon.patches.echo.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Echo Equalizer 9.7 (versionCode 91), classes.dex — verified against the
// real dex on 2026-11-02.
//
// Billing is RevenueCat; receipts are validated on RevenueCat's backend, so
// a forged Play purchase cannot work. The local chain is: jp5
// (SubscriptionManager) holds the CustomerInfo; x15.default(CustomerInfo)
// maps it to the subscription state Lpp5; — EntitlementInfos.get("echoeq
// Pro"), isActive -> Lkp5; (Pro) else Lop5;/Lnp5; (free).
//
// Lx15;->catch(Lpp5;)Z is the single gate every feature check funnels
// through (15 caller files: feature/UI classes, QuickTileService,
// ShortcutActionActivity, jp5 itself). It returns true only when the state
// is Lkp5; AND the entitlement's verification result is not FAILED — and
// only when the anti-tamper flag Ljp5;->implements:Z is set. That flag is
// recomputed at SubscriptionManager init from of2.break(context), the app's
// own integrity check (installer package name + signing-certificate
// comparison): on a re-signed build it is false, and catch() then returns
// false for everyone, paying users included. Pinning catch() at entry
// bypasses the state check, the verification check and the tamper flag in
// one edit.
//
// Morphe compares access flags by exact equality; the method is
// "public static final" in this build — all three flags are required.
internal object IsProFingerprint : Fingerprint(
    definingClass = "Lx15;",
    name = "catch",
    returnType = "Z",
    parameters = listOf("Lpp5;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
)
