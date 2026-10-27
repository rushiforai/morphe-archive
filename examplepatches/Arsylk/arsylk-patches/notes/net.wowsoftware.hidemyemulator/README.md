# Hide My Emulator — net.wowsoftware.hidemyemulator
- **Package:** `net.wowsoftware.hidemyemulator`
- **Versions:** `1.3` (`4`) · `1.5` (`6`)
- **Download:** GitHub releases (Xposed-Modules-Repo mirror): https://github.com/Xposed-Modules-Repo/net.wowsoftware.hidemyemulator/releases — the 1.3 licensing dependency is on Google Play: `com.wowsoftware.hmelicense` (https://play.google.com/store/apps/details?id=com.wowsoftware.hmelicense)
- **jadx mappings:** [`jadx-mappings.md`](jadx-mappings.md)

Emulator-hiding Xposed/LSPlant module with a Jetpack Compose UI.

## 1.3 — local licence handshake

Premium (device masking) is delegated to a **separate paid Play app**, `com.wowsoftware.hmelicense`. The gate (`o9.e`, log tag `HookLicenseGate`) checks that app is installed with the expected signing certificate, runs an EC (secp256r1) challenge/`client_pub` handshake against its ContentProvider `content://com.wowsoftware.hmelicense.license/v1/license`, receives a `SealedLicense{serverPublicKeyDer, iv, ciphertext}` (`aa.d`), verifies it (HmacSHA256 + EC, 5-minute timestamp freshness) and caches the expiry in prefs as `license_until` (epoch millis). The mask builder (`aa.f`) then applies the premium masks only while `license_until > now`. All licensing is pure Java/Kotlin; the native `libnative_entry.so` is the spoofing engine, not the licence.

### Patches (1.3)

| Patch | Target (fingerprint → method) | Change |
|---|---|---|
| `Unlock premium` | `LicenseGateFingerprint` → the mask builder's expiry check (`XSharedPreferences.getLong` + `SharedPreferences.getLong` + `System.currentTimeMillis` + `cmp-long` + `if-lez`; all non-obfuscable framework/Xposed anchors) | remove the `if-lez` that skips the premium mask block, so masks run unconditionally |

Why this target: it is the single DEX-level gate that enables masking, and it keys off framework/Xposed call shape (the app encrypts its string pool, so the `license_until` key is not usable as an anchor). Removing the `if-lez` is operand- and register-agnostic — it always falls through into the mask block regardless of which register holds the expiry — so no licence-app contact or server is needed. The handshake `o9.e` and the UI licence card are left untouched (cosmetic); the functional premium is the mask block.

Validated: built to `.mpp`, applied with morphe-desktop to `release-1.3.apk`, the patched DEX confirmed to run `cmp-long` straight into the mask block (no `if-lez`), **and confirmed on device** — the app shows "Premium" with the masking protections active, no `com.wowsoftware.hmelicense` installed.

## 1.5 — backend token licensing

Licensing moved to a **backend token flow** (`HmeBackendLicenseRepo`, `ob.i`): the app activates against its own API (`buildActivateRequestNative` → backend → `decryptActivateResponseNative`) and caches an opaque `license_token` plus `device_id`, a server-time anchor (`ob.l`: server_time_ms / elapsed_ms / boot_id) and a `cap_slot` (Base64) in prefs. Every premium gate re-validates the token through `DeviceInfoProvider.evalBlobNative(...)` **inside `libnative_entry.so`** (JNI-registered; the native compares the token against runtime-initialized key material and shares that check with `deriveCapBlobNative`). The premium device profile is a token-bound blob: `zb.d.map["premium"]` (encrypted, baked into the DEX) is decrypted by `deriveCapBlobNative` and parsed into `zb.a` (manufacturer/brand/model/device/product/board/hardware/buildId/incremental/buildType/buildTags/fingerprint/serial/baseband).

The hook entry (`ab.s.k`) builds `HookLicenseInputs` (`vb.b`: token, deviceUlid, anchors, userId, capSlot) from those prefs and **skips masking entirely when the token is empty**; the mask builder (`bc.q`) then registers the baseline `NativeHooker` plus — only while `evalBlobNative` passes — the premium hooks (`wb.c` mask_build, `wb.b` mask_cpu/sensors/battery/input, `wb.q` identity props, `wb.r` mask_telephony, …). Each premium hook repeats the `token.length() > 0 && evalBlobNative(...)` check itself.

### Patches (1.5)

Two patches, both named `Unlock premium` — the DEX half and the native half. Apply both.

**DEX half** (`bytecodePatch`, nine steps):

| # | Target (fingerprint → method) | Change |
|---|---|---|
| 1 | `LicenseStateReducerFingerprint15` → the claims→model reducer `Ld9/a;->H` (`JSONObject.optBoolean` + `Instant.ofEpochSecond` + `LocalDate.toEpochDay`) | force-return the app's own `Premium` model `Lob/r;` (null args = no expiry) |
| 2 | `HookLicenseInputsFingerprint15` → `Lvb/b;-><init>` | force the token parameter to a non-empty constant, so every `token.length() > 0` gate passes |
| 3 | every DEX `DeviceInfoProvider.evalBlobNative(...)` call site (class scan; `invoke` + `move-result`) | rewrite each `move-result` to `const true`, so all premium hooks register |
| 4 | `WatchdogInstallerFingerprint15` → `RuntimeWatchdog.a()` (anchored on the native `installWatchdogNative` call) | `return-void`, so the native `/proc/self/maps` anti-hook scan cannot trip on a patched build |
| 5 | `TokenStoreSignInStateFingerprint15` → `Lac/c;<init>` (encrypted-prefs read + `Boolean.valueOf` + flow init) | force the signed-in StateFlow seed to `true`, skipping the account sign-in screen |
| 6 | `ModuleActiveStateFingerprint15` → `ModuleStatus.isModuleActive()` (hardcoded `false` stub in 1.5) | report `true`, so Premium maps to EDITABLE instead of HIDDEN and the "Module Inactive" banner disappears |
| 7 | `TokenRefreshFailureFingerprint15` → `ApiClient.tokenAuthenticator$lambda$0` | rewrite the refresh-failure push of `false` into the signed-in StateFlow to `true`, so the forced sign-in survives the backend 401s |
| 8 | `UserStoreStateFingerprint15` → `Lac/d;<init>` | NOP the stored-id guard so a user is always materialised, and overwrite the name/email constructor arguments with non-blank constants (the auth-gated screens require them) |
| 9 | `LicenseStateInitFingerprint15` → `Lob/i;<init>` and `LicenseFailureEmissionFingerprint15` → `Lob/d;invokeSuspend` | seed the licence StateFlow with `Premium` and rewrite the load-failure `Unlicensed` emission to `Premium`, so the protection categories are reachable with no backend licence |

**Native half** (`rawResourcePatch` on `lib/<abi>/libnative_entry.so`): the last gate is native — `deriveCapBlobNative` calls the token check (`0x39810`/`0x37c38`) plus a second gate (`0x3b800`/`0x39a7c`) and branches to "return null" on failure. The patch NOPs the first call and rewrites the second to report success, so the branch falls through. Offsets (1.5 pins, original bytes verified before writing):

| ABI | gate 1 | gate 2 |
|---|---|---|
| `arm64-v8a` | `bl 0x37c38` @ `0x3d614` → `nop` | `bl 0x39a7c` @ `0x3d620` → `mov w0, #1` |
| `x86_64` | `call 0x39810` @ `0x3f8c6` → `nop`×5 | `call 0x3b800` @ `0x3f8d8` → `mov al, 1` + `nop`×3 |

Why this is sufficient: the premium identity blob (`zb.d.map["premium"]`, 565 bytes, identical in 1.4/1.5) is decrypted with a key that lives **inside the library** — the token is only ever a gate. Confirmed by running the library in a desktop JNI harness under Frida: with the two gate calls NOPed at runtime, `deriveCapBlobNative` returns the plaintext for a completely arbitrary forged token, and the decryption's key argument is never even read (the register is not saved in the decryptor at `0x3cc10`).

### The decrypted premium identity (Frida, 1.5 vc 6)

```json
{
  "keyId": "premium",
  "version": 1,
  "identity": {
    "manufacturer": "Google",
    "brand": "google",
    "model": "Pixel 8",
    "device": "shiba",
    "product": "shiba",
    "board": "shiba",
    "hardware": "shiba",
    "buildId": "BP2A.250705.008",
    "incremental": "13456789",
    "buildType": "user",
    "buildTags": "release-keys",
    "fingerprint": "google/shiba/shiba:16/BP2A.250705.008/13456789:user/release-keys",
    "serial": "2A231FDH30089K",
    "baseband": "g5300q-231205-231207-B-11228733"
  }
}
```

A fixed Pixel 8 (shiba) persona — the same values for every user, since the blob is a global constant.

### Licence crypto (for reference)

- Token format: `payload.signature` — 64-byte Ed25519 signature over the payload, verified against the embedded public key `05bf9d8abc53ec1b35f7859fa9324d4974b3f0954e18be57da5a4c683bac87aa` (base64 `Bb+dirxT7Bs194WfqTJNSXSz8JVOGL5X2lpMaDush6o=` at `.rodata:0xd979`; global constant, identical in both ABIs).
- Three further 32-byte constants (`.rodata:0xc729`, `0xd43d`, `0xd739`) are selected by a boolean argument in `buildActivateRequestNative` / `verifyLicenseTokenNative`; the app pins both flags to `false`.
- The signing key is server-side, so a token cannot be forged — but it does not need to be: the gate is the only thing standing between the patched build and the plaintext.

Validated: built to `.mpp`, applied with morphe-desktop to `release-1.5.apk` (versionCode 6), installed on a rooted Pixel 8 (shiba). DEX half: forced `Lob/r;` return, forced token, 15/15 `evalBlobNative` gates forced true, watchdog no-op, forced sign-in seed, module-active `true`, refresh-failure survival, materialised user, Premium licence flow — all confirmed in the patched DEX. Native half: patched `.so` bytes confirmed in the repacked APK, and the patched library run in the JNI/Frida harness (gates intact, no runtime patching) decrypts the identity JSON above with a forged token. On device: first-run onboarding completes straight into the app, the License section reads **Active / No expiry / Manage devices**, the Protection tab reads **12/12 on**, and the per-category screens open with their switches (no sign-in wall, no "Module Inactive" banner).
