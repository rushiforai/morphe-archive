package patches.mytelenor

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * My Telenor ships a client-side "device validation" gate: an anti-tamper / anti-root / anti-emulator
 * / anti-Frida / anti-Xposed / native-tamper battery (~16 checks in package `s50/`, `AbstractC19758d`)
 * driven by ViewModel `gq/e`. If ANY check trips, the single callback `Lgq/e$a$a;->a(String)V` (the
 * sole implementer of the check interface `Ls50/d$b;`) posts TRUE to the FAIL LiveData; its 4 UI
 * observers then show the base64-hidden "Device validation failed" toast (string resource
 * `promotion_validation_error`) and call finishAffinity(), killing the app after login. On a re-signed
 * / patched build the app passes at splash but MainActivity re-runs the engine post-login and trips.
 *
 * Fix (redirect FAIL -> PASS, name-agnostic): rewrite the FAIL callback so it invokes its sibling PASS
 * callback `b()V` on the same class and returns. This makes every failing check report as a success:
 * the PASS LiveData fires (LandingScreen splash navigation keeps working) and the FAIL LiveData never
 * posts, so no toast and no finishAffinity() — on every path, pre- and post-login, for all 16 checks
 * (root + emulator + Frida + Xposed + native tamper + signature) at one chokepoint.
 *
 * Chosen over a plain returnEarly() no-op: no-opping the FAIL callback also silences the PASS LiveData
 * on a would-be-fail, so a fresh-install trip at the splash (which observes PASS for navigation) could
 * strand the app on the splash. Redirecting to PASS keeps navigation alive in that case too, and the
 * redirect is just as robust against the toast/finishAffinity. Both are equivalent post-login (those
 * screens observe only FAIL), but the redirect has no downside, so it is preferred.
 *
 * Name-agnostic: the class `gq/e$a$a`, ViewModel `gq/e` and both callback method names are obfuscated,
 * so nothing is hardcoded. The FAIL callback is matched via the unique Kotlin null-check string
 * "failedCheck" + the MutableLiveData.postValue dispatch (see deviceValidationFailFingerprint). The
 * PASS sibling is resolved structurally from the matched method's own defining class: the interface
 * `Ls50/d$b;` declares exactly two methods — a(String)V (FAIL, matched) and b()V (PASS) — so on the
 * impl class the PASS callback is the only non-constructor, no-arg, void-returning method.
 *
 * Separate bytecode patch by design: independent of removeAds / blockTrackers, so users opt in.
 */
@Suppress("unused")
val bypassDeviceValidationPatch = bytecodePatch(
    name = "Bypass device validation",
    description = "Neutralizes the client-side device-validation gate (anti-root / anti-emulator / " +
        "anti-Frida / anti-Xposed / anti-tamper battery) that shows a \"Device validation failed\" " +
        "toast and kills the app via finishAffinity() on a rooted, emulated or re-signed build. " +
        "Redirects the single failure callback to the success path so all ~16 checks report as passed " +
        "and the app keeps running pre- and post-login.",
) {
    compatibleWith(COMPATIBILITY_MYTELENOR)

    execute {
        val failMethod = deviceValidationFailFingerprint.method
        val definingClass = failMethod.definingClass

        // Resolve the PASS sibling name-agnostically. The check interface Ls50/d$b; declares exactly
        // two methods: a(String)V (FAIL, the matched method) and b()V (PASS). On the concrete impl the
        // PASS callback is the only non-constructor, no-arg, void-returning method.
        val passMethod = mutableClassDefBy(definingClass).methods.first {
            it.name != "<init>" &&
                it.name != failMethod.name &&
                it.parameters.isEmpty() &&
                it.returnType == "V"
        }

        // Redirect FAIL -> PASS: report every failing device check as a success. `p0` is `this`; the
        // PASS LiveData fires (splash navigation still works) and the FAIL LiveData never posts, so no
        // "Device validation failed" toast and no finishAffinity(). The original body becomes dead code.
        failMethod.addInstructions(
            0,
            """
                invoke-virtual {p0}, $definingClass->${passMethod.name}()V
                return-void
            """.trimIndent(),
        )
    }
}
