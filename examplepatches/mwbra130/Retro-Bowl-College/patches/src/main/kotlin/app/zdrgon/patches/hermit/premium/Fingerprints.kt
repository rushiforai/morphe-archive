package app.zdrgon.patches.hermit.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Hermit 31.8.0 (versionCode 310800), classes.dex — verified against the
// real dex on 2026-11-03.
//
// Every premium feature (Multiple Profiles, User Scripts, Tracking
// Protection, Content Blocker, Backup and Sync, Custom User Agent, Print,
// and the all-features "Premium" bundle, SKU
// com.chimbori.hermitcrab.premium) is a dr3 item whose state field is the
// enum Lhv3; (UNKNOWN, ERROR, NOT_PURCHASED, PURCHASED, ELIGIBLE, TRIAL).
// Three sources set the states: Play Billing purchases, the legacy Hermit
// Premium Unlocker app (signature-checked), and a singleton source.
//
// Lhv3;->a()Z is the single entitlement predicate every reader funnels
// through — 16 caller files including WebActivity, BrowserFragment,
// LiteAppBehaviorSettingsFragment and the mr3 feature registry. Its body
// is exactly "return this == PURCHASED || this == ELIGIBLE", and no
// feature code compares the enum values directly. Pinning it unlocks
// every feature at once.
//
// Morphe compares access flags by exact equality; the method is
// "public final" in this build — both flags are required.
internal object EntitlementFingerprint : Fingerprint(
    definingClass = "Lhv3;",
    name = "a",
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)
