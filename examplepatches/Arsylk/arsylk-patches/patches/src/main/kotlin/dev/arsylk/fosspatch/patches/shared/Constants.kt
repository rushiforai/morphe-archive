package dev.arsylk.fosspatch.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Hide My Android — device-information spoofing app (Xposed/YukiHook module) whose premium
     * tier gates functionality behind a server-issued, Ed25519-signed licence blob.
     *
     * Each app version has its own `Compatibility` so the per-target bytecodePatches in
     * `patches/hidemyandroid/UnlockPremiumPatch.kt` are only offered against the obfuscation
     * mapping they were re-derived for. Do not collapse these into a single `Compatibility` with
     * multiple `AppTarget`s — the patcher would offer every per-version patch against every
     * listed version and silently no-op the ones with the wrong pins, which is the worst failure
     * mode (user thinks premium is unlocked, but tier-1 flag / tier-2 blob still gated).
     */
    val COMPATIBILITY_HIDEMYANDROID_171 = Compatibility(
        name = "Hide My Android",
        packageName = "com.wowsoftware.hidemyandroid",
        apkFileType = ApkFileType.APK,
        // App icon is predominantly green.
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget(
                version = "1.7.1",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 171,
                    SupportedAbi.ARMEABI_V7A to 171,
                ),
            ),
        ),
    )

    /**
     * 1.7.2 re-derived pins. The non-obfuscated `DeviceInfoProvider` anchors survive (the JNI
     * method names are hard-coded for `RegisterNatives` and cannot be renamed by R8). The three
     * obfuscated pins moved:
     *   - LicenseStore premium flag: `Lbb/g;->c:Z`  ->  `Lcb/h;->c:Z`  (same field name; class
     *     reshuffled). Verified by the validate coroutine in `Lqa/v0;` which calls
     *     `DeviceInfoProvider.f(...)Z` and iput-boolean into `Lcb/h;->c:Z` (jadx recovers
     *     `Lcb/h;` = `LicenseStore`, field `c` = the volatile premium boolean).
     *   - Tier-2 identity (cached signed-licence blob): `Lwa/j;->a:Ljava/lang/String;`
     *     ->  `Lxa/k;->a:Ljava/lang/String;`  (same field name; tier-2 registrars moved from
     *     package `ta` to package `ua` plus `ra`).
     *   - Premium `StateFlow` (UI badge / profile counter): `Lpa/v0;->j:Lfd/h0;`
     *     ->  `Lw/e0;->w:Lfd/e;`  (abstract base, two concrete subclasses `Lw/i0;` / `Lw/b1;`).
     *     **The Boolean.FALSE-adjacency rewrite heuristic does not fire on 1.7.2** — the
     *     emissions are spread across a coroutine state machine with no fingerprintable anchor
     *     in the new obfuscation. The UI badge "Premium" label may therefore not flip on 1.7.2,
     *     but the functional tier-2 hooks (SIM, IMEI, GAID, OAID, MediaDRM, BT MAC, virtual
     *     accounts) and the LicenseStore flag still unlock.
     */
    val COMPATIBILITY_HIDEMYANDROID_172 = Compatibility(
        name = "Hide My Android",
        packageName = "com.wowsoftware.hidemyandroid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget(
                version = "1.7.2",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 172,
                    SupportedAbi.ARMEABI_V7A to 172,
                ),
            ),
        ),
    )

    /**
     * 1.7.5 re-derived pins. The non-obfuscated `DeviceInfoProvider` JNI anchors survive. The
     * three obfuscated pins moved again:
     *   - LicenseStore premium flag: `Lcb/h;->c:Z`  ->  `Leb/h;->c:Z`  (same field name; class
     *     reshuffled from package `cb` to `eb`). Still written straight from the eval wrapper
     *     `DeviceInfoProvider.f(...)Z` in the validate coroutine `Lsa/h1;`.
     *   - Tier-2 identity (cached signed-licence blob): `Lxa/k;->a:Ljava/lang/String;`
     *     ->  `Lza/s;->a:Ljava/lang/String;`  (same field name; identity object moved from
     *     package `xa` to `za`, and is constructed in `Lza/s;-><init>`).
     *   - Account-gated premium state: the premium `MutableStateFlow` lives in the
     *     `StartupRepository` (`Lsa/l1;->j:Lid/g0;`, created `Boolean.FALSE`, no-token and
     *     token-refresh-failure paths emit FALSE; the account VM `Lgb/c;` logout also emits
     *     FALSE into it) — the 1.7.2 `Lqa/v0;` / `Lqa/z0;` pair moved to `Lsa/l1;` / `Lgb/c;`.
     */
    val COMPATIBILITY_HIDEMYANDROID_175 = Compatibility(
        name = "Hide My Android",
        packageName = "com.wowsoftware.hidemyandroid",
        apkFileType = ApkFileType.APK,
        // App icon is predominantly green.
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget(
                version = "1.7.5",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 175,
                    SupportedAbi.ARMEABI_V7A to 175,
                ),
            ),
        ),
    )

    /**
     * Hide My Emulator — emulator-hiding Xposed/LSPlant module. Premium (device masking) is licensed
     * through a separate paid Google Play app, `com.wowsoftware.hmelicense`, and cached locally as an
     * expiry timestamp; masking runs only while that timestamp is in the future.
     *
     * Confirmed working on 1.3 (versionCode 4). The patch keys off the framework/Xposed call shape of
     * the expiry check, not obfuscated names, so it should survive updates that only reshuffle
     * obfuscation — re-derive per version by re-running the `LicenseGateFingerprint` / `LicenseStateReducerFingerprint`
     * filters and adding a new `AppTarget` here plus a per-target `bytecodePatch`.
     */
    val COMPATIBILITY_HIDEMYEMULATOR = Compatibility(
        name = "Hide My Emulator",
        packageName = "net.wowsoftware.hidemyemulator",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget(
                version = "1.3",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 4,
                    SupportedAbi.X86_64 to 4,
                ),
            ),
        ),
    )

    /**
     * Hide My Emulator 1.5 — licensing moved from the local `com.wowsoftware.hmelicense`
     * ContentProvider handshake to a backend token flow (`HmeBackendLicenseRepo`): the app caches an
     * opaque `license_token` (plus `device_id`, a server-time anchor and `cap_slot`) in prefs, and
     * every premium gate re-validates it through `DeviceInfoProvider.evalBlobNative(...)` inside
     * `libnative_entry.so`. The premium device profile is a token-bound blob that only
     * `deriveCapBlobNative` can decrypt.
     *
     * The Java-side gates are still DEX-visible, so the per-target `bytecodePatch` in
     * `patches/hidemyemulator/UnlockPremiumPatch.kt` can force them, and the companion
     * `rawResourcePatch` removes the native gate in `deriveCapBlobNative` (the blob's key is
     * library-internal, so the identity tier decrypts once the gate is rewritten). Both patches
     * together give the full offline unlock. See the patch kdocs.
     */
    val COMPATIBILITY_HIDEMYEMULATOR_15 = Compatibility(
        name = "Hide My Emulator",
        packageName = "net.wowsoftware.hidemyemulator",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x3DDC84,
        targets = listOf(
            AppTarget(
                version = "1.5",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 6,
                    SupportedAbi.X86_64 to 6,
                ),
            ),
        ),
    )
}
