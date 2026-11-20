package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// This bundle ships Tasker only (2026-11-18); the other compatibility entries were removed with
// their patches and are in git history.
object Constants {
    // Verified 2026-09-17 against net.dinglisch.android.taskerm 6.6.18 (versionCode 5443)
    // from APKPure. Paid app: the Play purchase is validated with Google Play LVL plus a
    // licence server (Patreon keys). The licensing code is R8-obfuscated (rf.a0, rf.w$a);
    // the 2026-09-17 fingerprints pinned those names.
    // 2026-10-13: fingerprints no longer pin obfuscated names. Anchors: the LVL response
    // mapper's <init>(I) with the "Licensed"/"Retrying"/"Unlicensed" labels (its no-arg
    // LicenseStatus getters return Licensed); the (Context, long)Z cached check by its
    // "Checking cached only" log prefix; in that class the public (Context)Z overload and the
    // private static (?, boolean, Context)Z result helper reading LicenseStatus.Retry/Licensed
    // (new hook: covers the Unlicensed fallback when Play cannot be reached); and the public
    // static (Context)Z facade that calls the overload. Smoke test and CLI disassembly pass on
    // 6.6.18 (5443) and 6.6.20 (5445). Emulator 2026-10-14 (6.6.20, Play Store image, no Google
    // account, so LVL answers with a server error): stock shows "Trial Over - Tasker can't be
    // used until you purchase it"; patched shows no licence dialog or notification and runs a
    // Flash task; no crashes. A real NOT_LICENSED response and the timeout path were not reachable.
    // Enable Full Version is a pre-rule licence bypass the owner kept (2026-10-19).
    // 2026-11-03: "GmsCore support" (opt-in, owner decision: login-only) uses the shared builder's
    // scoped mode against 6.6.20 (5445). Only the sign-in and token clients move to MicroG RE: the
    // BaseGmsClient subclasses for auth.account.authapi / auth.service / auth.api.signin.service /
    // signin.service START (found by those action strings; the package and dynamic-lookup getter
    // names are read from BaseGmsClient's connect step, anchored on its "too low to support dynamic
    // lookup" message), the classes holding the GetToken component or the GOOGLE_SIGN_IN action, the
    // kept com.google.android.gms.auth.api.signin classes and the "<<default account>>" methods.
    // isGooglePlayServicesAvailable, location, Home/Matter, Maps, Dynamite, FCM and the c2dm
    // manifest entries are untouched. Smoke test (bytecode + manifest) and a CLI run without -f;
    // 2026-11-03 emulator (patched build of the release batch, stock control): Google Drive backup sign-in showed MicroG RE's account picker and signed in.
    // 2026-11-04: updated to version 6.7.8 (versionCode 5454; APKMirror universal APK, arm64-v8a +
    // armeabi-v7a, same CN=Lee Wilmot signer; paid, so not on the spare Play account). The startup
    // result helper now takes (result, Context, boolean) instead of (result, boolean, Context), so
    // LicenseResultFingerprint accepts either order; the other anchors are unchanged (R8 renames
    // only: rf.w$a -> nt.x$a, rf.a0 -> nt.b0). TaskerSmokeTest passes, including every login-only
    // GmsCore assertion (the four sign-in actions routed, location/Home/telemetry/credentials
    // clients, FCM, Dynamite and the c2dm manifest entries untouched). Emulator not re-run.
    // 2026-11-18: restored after the 2026-11-14 drop (6.7.9 is paid on Play and no trusted mirror
    // carries it). The target stays 6.7.8 (5454), the last verified APK; nothing was re-checked.
    val COMPATIBILITY_TASKER = Compatibility(
        name = "Tasker",
        packageName = "net.dinglisch.android.taskerm",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4CAF50,
        signatures = setOf("973fe25b9be28fb7436d49582b04277767c852539be31783d134a55621b6636d"), // CN=Lee Wilmot
        targets = listOf(AppTarget(version = "6.7.8", versionCode = 5454))
    )
}
