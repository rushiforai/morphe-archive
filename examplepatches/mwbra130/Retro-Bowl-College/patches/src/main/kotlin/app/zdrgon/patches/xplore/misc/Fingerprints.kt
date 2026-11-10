package app.zdrgon.patches.xplore.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Donation state readers + PairIP check — X-plore 4.52.02 ───────────
//
// All donation state lives in the static hub class Li60. Its owned-items
// list, Li60.h (Ljava/util/List;), is rebuilt by Li60.j(List) from four
// store backends (Google Play Lub7, which verifies purchase signatures
// locally against a bundled RSA key; Amazon Lsb7; the "X-plore unlocker"
// Lec7; the "X-plore shop" Lbc7). Each owned item is an Lc9d subclass
// whose value is f()I = e() + 1 (branch-free). The Lmb7 catalog, in the
// gift screen's on-screen order:
//
//   1 beer f=1 · 2 beers f=2 · 3 beers f=3 · Cake and coffee f=4 ·
//   Dinner f=5        (alt items: Donut/Chocolate/Fruit f=1/2/3)
//
// Exactly two readers turn that list into answers (both verified at
// branch level against the 4.52.02 dexes on 2026-11-03):
//
//   Li60.c()Z = !h.isEmpty() — "has any donation". Its callers include
//     ad init (Lqa.a): ANY donation turns ads off.
//
//   Li60.k(Lby5;)Z — the per-feature LOCK predicate. Returns TRUE =
//     LOCKED (polarity branch-verified, Tagger discipline): a live
//     trial-timestamp window for the feature (EnumMap Li60.j) unlocks
//     inside the window; otherwise it sums f() over h and returns
//     FALSE (unlocked) when the sum is >= 3, TRUE below that. Lby5 is
//     the PaidFunction enum (WiFi, Video, Music, FileSync, Vault, FTP,
//     ID3, Sftp, Git, PDF, Voluntary); ~20 call sites (WifiShareServer
//     .onCreate, VideoPlayer, the cloud/SMB UI, ...).
//
// A genuine Dinner (f=5 >= 3, list non-empty) therefore runs in exactly
// the state c() = true, k(anything) = false. Both readers are pure
// in-memory reads — no I/O, no backend at read time — and both are the
// pin surface (the persisted AES-encrypted license file and the store
// refresh only ever rebuild h; the answers are computed here).
//
// PairIP is present (com.pairip.application.Application,
// libpairipcore.so, VMRunner) but there is NO licensecheck package, no
// LicenseClient/LicenseActivity/LVL — the DiskWala online-license
// branch does not exist in this app. The only startup enforcement is
// dex-level: Application.attachBaseContext -> VMRunner.setContext ->
// SignatureCheck.verifyIntegrity, which SHA-256s the signing cert and
// throws SignatureTamperedException on mismatch. Unconditionally live
// on the re-sign path.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// all three methods are declared "public static" in 4.52.02.

/** "Has any donation" reader. Pinning it to 1 turns ads off app-wide. */
object HasDonationFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Li60;",
    name = "c"
)

/**
 * Per-feature lock predicate — TRUE means LOCKED. Pinning it to 0 is
 * the state every feature sees for a donor at the 3-beers tier and
 * above (including Dinner).
 */
object FeatureLockFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lby5;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Li60;",
    name = "k"
)

/** PairIP's startup signature check. Stubbed by the companion patch. */
object PairipVerifyIntegrityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity"
)
