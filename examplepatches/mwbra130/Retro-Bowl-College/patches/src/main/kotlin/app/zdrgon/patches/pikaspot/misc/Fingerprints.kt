package app.zdrgon.patches.pikaspot.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Lifetime (SVIP) state — Pika Spot 1.4.5 (49) ─────────────────────
//
// Pika Spot (com.pika.dynamicisland, "Pika! Spot") sells VIP through
// Play Billing: the subscription product's base plans (Weekly $1.99,
// Monthly $4.99, Yearly $29.99) and the one-time Life Member product
// "com.pika.dynamicisland_svip" ($79.99), which the paywall labels
// SVIP. Purchases are verified by the dev's backend
// (cs.qlinksinc.com), which hands back a fresh User record; the
// client derives its runtime membership state from that record in
// the central holder qf/a:
//
//   User{uid, token, name, goldNum, status, userVT2}
//     -> qf/b.a(User, ...) persists uid/token/name to
//        SharedPreferences and derives, in qf/a:
//          * the STATUS Boolean state (qf/a field d) =
//            (User.status != 0) — getStatus()'s ONLY consumer in
//            the app (caller census), and
//          * qf/a.j(userVT2) decrypts the userVT2 token locally
//            (Base64 flag 2, key from XOR-chained byte arrays,
//            substring(10, 26)), splits the plaintext on "#":
//              part[0] = uid — on mismatch the LEVEL is set to 1;
//              part[1] = LEVEL int, written into the level state
//                        (qf/a.i(), a Ls0/c1 int state, set via
//                        c1.h(I), read via c1.g());
//              part[2] = validity ms -> qf/a.k(v) stores the
//                        "yyyy-MM-dd" string of now+v in the expiry
//                        String state (display only — see below).
//
// LEVEL SCALE, proven from the client (VIP screen gh/a, string
// resources resolved from the APK):
//   level == 2 -> "Level: VIP",  status line "Expire on: <date>"
//   level == 3 -> "Level: SVIP", status line "life member"
//   anything else (0/1) -> "Level: none", "Status: inactive"
// Level 1 is also the level state's factory default (qe/a case 6:
// new c1(1)) and the uid-mismatch fallback in j(). The paid
// predicate Lm6/h;->x(state) returns true iff level is 2 or 3
// (branch-traced in smali).
//
// READER MAP (census over the app dexes): every membership decision
// consults the level state through qf/a.i() —
//   * the derived "not VIP" Boolean qf/a.b() (a derived state over
//     !x(i())) feeds the ad stack (App startup gate, kh/f, rg/j,
//     rg/w, dh/h, wg/f, ue/a) — ads key off the level, nothing else;
//   * the animation detail gate (kh/h) and the apply click handler
//     (rg/t) decide locally: unlock || price == 0 || x(level);
//   * raw level reads (gh/a VIP screen; eh/g's level != 3 upsell)
//     render the tier from the same state;
//   * qh/l2's billing callback branches on x(level).
// The expiry String state has NO gate readers: it is formatted
// once by k() and read only by display code (gh/a, hh/c), and the
// SVIP rendering never reads it at all (level 3 shows the fixed
// "life member" string). There is no numeric expiry state anywhere
// — validity exists only as that display string.
//
// WRITERS: the level state has exactly two production points —
// its factory (qe/a case 6, constructed ONLY for qf/a's field b;
// construction-site census over all dexes) and the token ingest
// qf/a.j (sole caller qf/b.a, itself fed only by server User
// records). The shipped pins cover the ingest — the sole
// post-construction writer, re-run at every login / refresh —
// plus the status reader, so every reader (boolean predicate,
// derived ad state, raw tier reads) observes exactly the state a
// genuine Life Member account presents from the first sync of
// every launch onward:
//   ingest:  j() writes level 3 and feeds k() a 100-year validity
//            (3,155,760,000,000 ms — the genuine lifetime token's
//            duration is server-assigned and not client-observable;
//            the value is behaviorally exact because the expiry
//            state is a display string SVIP rendering never shows)
//   status:  User.getStatus() -> 1, so the derived status Boolean
//            is the active value after every ingest.
// The factory point is deliberately NOT pinned: qe/a.invoke's
// three c1 constructions take their constructor argument in
// pre-loaded registers (no adjacent literal exists to rewrite),
// and the factory value (1) is only the pre-first-sync transient
// — the same state a genuine Life Member shows between process
// start and its first sync completing (user info syncs at every
// launch).
// No purchase is created, no server response or token is
// fabricated, and nothing in billing or the network layer is
// touched — the pins sit on the local state-production points the
// app's own readers consult.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality.

/** The userVT2 token ingest: sole writer of the LEVEL state and (via k) the expiry String state. */
object VipTokenIngestFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lqf/a;",
    name = "j"
)

/** The account record's status field reader; its sole consumer maps != 0 to the active-status Boolean. */
object UserStatusFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/pika/dynamicisland/http/bean/user/User;",
    name = "getStatus"
)

// ── PairIP license funnel — Pika Spot 1.4.5 ──────────────────────────
//
// PairIP is present ONLY as the licensecheck SDK (classes2.dex, all
// com.pairip.licensecheck.*). There is NO libpairipcore.so anywhere
// in the merged APK (native libs are ad SDKs, MMKV, Rive, Umeng),
// no encrypted VM payload, no DexProtector. Two triggers call
// LicenseClient.checkLicense(Context) at process start: the
// manifest LicenseContentProvider.onCreate and
// com.pairip.application.Application.attachBaseContext; checkLicense
// posts lambda$checkLicense$0, which runs initializeLicenseCheck.
// That binds Google Play's licensing service (checkLicenseV2); the
// verdict lands in processResponse(code, bundle):
//   LICENSED     -> licenseCheckState records FULL_CHECK_OK
//   NOT_LICENSED -> startPaywallActivity: LicenseActivity opens the
//                   Play Store block page and the app closes
//   errors       -> handleError -> startErrorDialogActivity —
//                   except when the recorded state is already
//                   FULL_CHECK_OK, the value the error gate reads
//                   first.
// The SDK's trial machinery (TrialClient, stopTrial,
// handleTrialEnd) has no callers outside LicenseClient in the
// app dexes and is driven only from inside the stubbed funnel, so
// it never starts. LicenseActivity's only two launchers in the
// app are the two methods below, so stubbing the four funnel
// methods is the complete enforcement surface (same shape as the
// on-device-confirmed aodNotify bypass; this SDK generation's
// terminal state constant is FULL_CHECK_OK rather than OK).
//
// NOTE: initializeLicenseCheck is "public"; the other three are
// "private" (reached via synthetic accessors).

/** Check entry point. Recording FULL_CHECK_OK and returning reproduces the genuine success steady state; nothing ever binds to Play. */
object InitializeLicenseCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck"
)

/** The verdict handler; NOT_LICENSED is the only route to the paywall. */
object ProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse"
)

/** Paywall launcher (LicenseActivity, PAYWALL type). */
object StartPaywallActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity"
)

/** Error-dialog launcher (LicenseActivity, ERROR_DIALOG type). */
object StartErrorDialogActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity"
)

// ── Server signature token — Pika Spot 1.4.5 ────────────────────────
//
// Every API request body (kf.d / bg.m) is built from a Param whose
// device bean is produced by xf/b.a(). One bean field, "advertise",
// is filled by SignatureUtils.getSignature(Context, androidId) — a
// NATIVE method in libnative-lib.so (split_0). Reversed from the
// arm64 library, the token is:
//
//   ts_us + "#" + Base64(AES-128-CBC/PKCS7(part1)) + "#" + SHA1(cert)
//     part1 = androidId + ":" + ts_us + ":" + randomInt32
//     key   = first 16 chars of (ts_us + androidId)
//     IV    = "A-16-Byte-String"
//     cert  = signing certificate DER, fetched by the native code
//             via JNI PackageManager signatures[0].toByteArray()
//
// The startup device login (POST /auth/android/device, fired by the
// loading viewmodel qh/t1.j with Param{device, type=1}) carries the
// bean, the backend validates the trailing SHA1 against the stock
// signing certificate (Play App Signing, SHA1
// 284efdadf1115656817a5b2cfdaddf696f203088, from the stock XAPK's
// v2 signing block), and a re-signed build — which necessarily
// hashes its own signer — is rejected. The client maps ANY login
// failure to the generic common_network_error dialog, so the
// loading screen stops at 30% with "Can not connect to server,
// please check network configuration" on phone and emulator alike,
// with no network error anywhere in logcat (no request succeeds,
// and the failure is a well-formed server rejection, not a
// transport error). There is no Play Integrity anywhere in the
// app; this token is the only build-identity check in the startup
// path (full census: kf.d header/body crypto derives only from
// packageName, stored user id, timestamps and hardcoded keys).
//
// SignatureUtils has exactly ONE caller in the app (xf/b.a), so
// swapping that single call for the extension reimplementation
// (app.template.extension.pikaspot.AdvertiseSpoof, same algorithm,
// stock SHA1 pinned) covers every request. The native method
// itself is left untouched — it simply becomes unreachable.

/** Builds the device bean (incl. the advertise token) attached to every API Param. */
object DeviceParamFingerprint : Fingerprint(
    returnType = "Lcom/pika/dynamicisland/utils/encryp/AndroidAdsParam;",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lxf/b;",
    name = "a"
)
