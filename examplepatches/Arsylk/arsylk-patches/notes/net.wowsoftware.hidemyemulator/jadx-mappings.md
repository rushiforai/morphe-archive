# jadx / DEX mappings — net.wowsoftware.hidemyemulator 1.3

R8-obfuscated Kotlin (Jetpack Compose). Names are 1.3-specific and change per build; strings are
decrypted at runtime (jadx shows `String decrypt:` annotations), so neither names nor strings are
reliable fingerprint anchors — fingerprint by framework/Xposed call shape.
## Licensing (pure Java/Kotlin — no native verification)

| Obfuscated | Meaning |
|---|---|
| `aa.f` | **mask builder + licence gate** — method `j(Object)`. Reads `license_until` (via `XSharedPreferences.getLong` then `SharedPreferences.getLong`) and applies the premium masks only while `license_until > System.currentTimeMillis()`. ← patch target |
| `o9.e` | licence handshake — log tag `HookLicenseGate`. Checks `com.wowsoftware.hmelicense` installed + signing cert; EC (secp256r1) challenge (`challenge`, `client_pub`) to `content://com.wowsoftware.hmelicense.license/v1/license`; receives a `SealedLicense`; verifies; writes prefs `license_until` |
| `o9.f` | licence-state holder used by `o9.e` (outcome types incl. granted / "Authentication failed") |
| `aa.d` | `SealedLicense(serverPublicKeyDer, iv, ciphertext)` — the signed/encrypted licence blob |
| `r9.a` | SharedPreferences accessor holding `license_until` (epoch millis); keys also `license_expiry_epoch_day`, `license_email` |

External dependency: `com.wowsoftware.hmelicense` (paid app on Google Play) — the licence authority;
also reachable via `market://details?id=com.wowsoftware.hmelicense`.

## Gate shape (patch anchor)

```
XSharedPreferences.getLong(key, 0)   ; false-branch read
SharedPreferences.getLong(key, 0)    ; license_until
System.currentTimeMillis()           ; now
cmp-long vDest, license_until, now
if-lez  vDest, :skip_masks           ; expired -> skip premium block   <-- removed by the patch
```

## Spoofing engine (not licence)

| Symbol | Meaning |
|---|---|
| `net.wowsoftware.hidemyemulator.hook.entity.NativeHooker` | applies masks via `setNativeStateNative(...)` into `libnative_entry.so` |
| `net.wowsoftware.hidemyemulator.hook.entity.RuntimeWatchdog` | runtime integrity watchdog |
| `lib/<abi>/libnative_entry.so` | native hook/mask engine (arm64-v8a, x86_64) |

No native licence code → no `ghidra-mappings.md` for this app (omitted per the notes format).

# jadx / DEX mappings — net.wowsoftware.hidemyemulator 1.5

R8 full-mode obfuscation (class merging: `d9/a`, `bc/m`, `bc/q`, `wb/*` are merged lambda/util
classes). Strings still decrypted at runtime (`Lrc/a;->a(J)`), so anchors are framework/Xposed/JNI
call shape plus per-version pins. Licensing is **backend-token** and the token check is **native**
(`libnative_entry.so`, JNI-registered `evalBlobNative` / `deriveCapBlobNative` / `capKeypairNative`
/ `evalBlobNative` share one core check that compares the token against runtime-initialized key
material; `primeNative` registers the table). No `ghidra-mappings.md` — the licence natives were not
reversed, only classified.

## Licensing (1.5)

| Obfuscated | Meaning |
|---|---|
| `ob.i` | **`HmeBackendLicenseRepo`** — backend licence repository (ApiService + tokenStore/userStore/licenseStore/checkoutSignal). Holds the licence `StateFlow` (`g1Var3`, initial value `ob.s` "Unknown") |
| `ob.u` | sealed licence-state interface: `ob.r` = **Premium(email, expiry epoch-day)**, `ob.t` = "Unlicensed" (singleton), `ob.s` = "Unknown" (singleton) |
| `d9/a.H(String,String,ZoneId)` | **claims→model reducer** — parses the verified claims JSON (`is_premium`, `end_date` epoch-second → epoch-day) and returns `ob.r` or `ob.t`. ← patch target 1 |
| `bc/m` (pswitch case on `ob.i`) | licence-repo lambda: reads the encrypted blob from prefs, `DeviceInfoProvider.f` (→ `verifyLicenseTokenNative`), freshness-checks against the server-time anchor, calls `d9/a.H` |
| `vb.b` | **`HookLicenseInputs(token, deviceUlid, anchorServerTimeMs, anchorElapsedMs, anchorBootId, userId, capSlot)`** — built by the hook entry from prefs (`license_token`, `device_id`, time anchor, `cap_slot`). ← patch target 2 |
| `ab.s.k(Object)` | **hook entry** — builds `vb.b`, logs "license gate closed (no stored token); masking skipped" and returns when the token is empty, else registers the mask builder via `b9/b.a(...).b(new bc/q(...))` |
| `bc/q` (default case) | **mask builder** — `/proc/self/maps` HMA check, `Build.SUPPORTED_ABIS`/`os.arch`, loads the premium profile via `zb/c.a`, builds the baseline `vb.c` config, then registers `NativeHooker` + `wb.f` always and the premium `wb.*` hooks only while `evalBlobNative` passes. ← patch target 3 (its `evalBlobNative` gate) |
| `zb.c.a(vb.b)` | premium-profile loader — `zb/d.map["premium"]` ciphertext → `DeviceInfoProvider.deriveCapBlobNative(...)` → `zb/b.a` JSON parse → `zb.a`; cached in a static volatile |
| `zb.d.map` | the encrypted premium identity blob (key `"premium"`), baked into the DEX |
| `zb.a` | decrypted premium identity: manufacturer, brand, model, device, product, board, hardware, buildId, incremental, buildType, buildTags, fingerprint, serial, baseband |
| `yb/e.a(zb.a)` | identity → property map (`ro.build.*`, `ro.product.*`, `ro.serialno`, `gsm.version.baseband`, …); always adds `ro.board.platform=zuma`, `ro.hardware.egl/vulkan=mali` (baseline tier) |
| `net.wowsoftware.hidemyemulator.hook.entity.RuntimeWatchdog` | `a()` starts a daemon thread running `installWatchdogNative(false)` — native `/proc/self/maps` anti-hook scan (encrypted patterns). ← patch target 4 |
| `q9/a` | prefs accessor (`b()` SharedPreferences, `c()` XSharedPreferences, `a()` path) |
| `sb/a.q(prefs, key)` | encrypted-string prefs read used by the hook entry |

## Premium hooks (registered only while `evalBlobNative` passes)

| Obfuscated | Meaning |
|---|---|
| `wb.c` | mask_build — overrides `Build.*`/`Settings.Global` from the decrypted `zb.a` profile (identity tier; needs the native token) |
| `wb.b` (cases 0/1/3/5/…) | mask_cpu (SUPPORTED_ABIS → arm64-v8a), battery (`PowerProfile`), input devices, sensors |
| `wb.q` | identity property map → native hook |
| `wb.r` | mask_telephony |
| `wb.e`, `wb.k`, `wb.m` | further per-feature gates, same `token.length() > 0 && evalBlobNative(...)` shape |

## Gate shape (patch anchor, 1.5)

```
; per hook site (15 in the DEX):
invoke-virtual/range {...}, Lnet/wowsoftware/hidemyemulator/jni/DeviceInfoProvider;->evalBlobNative(...)Z
move-result vX          ; <-- rewritten to const/4 vX, 0x1 by the patch
if-eqz vX, :skip

; hook entry (ab.s.k):
new-instance v10, Lvb/b;
invoke-direct/range {v10 .. v20}, Lvb/b;-><init>(...)V
iget-object v0, v10, Lvb/b;->a:Ljava/lang/String;   ; token
invoke-virtual {v0}, Ljava/lang/String;->length()I
if-lez v3, :continue    ; empty token -> "license gate closed"; masking skipped
```

## Spoofing engine (not licence)

| Symbol | Meaning |
|---|---|
| `net.wowsoftware.hidemyemulator.hook.entity.NativeHooker` | applies masks via `setNativeStateNative(...)` into `libnative_entry.so` |
| `net.wowsoftware.hidemyemulator.hook.entity.RuntimeWatchdog` | runtime integrity watchdog (`/proc/self/maps` scan) |
| `lib/<abi>/libnative_entry.so` | native hook/mask engine + licence crypto (arm64-v8a, x86_64); JNI table registered by `primeNative` |

## Native licence internals (1.5, x86_64 offsets; arm64 in parentheses)

| Symbol | Meaning |
|---|---|
| `0x3a050` | populates the statics key vector: base64-decodes the hardcoded `Bb+dirx…` public key from `.rodata:0xd979` (global constant, no input dependence) |
| `0x36190` | token parse + verify: split at `.`, decode both halves, require a 64-byte signature, Ed25519-verify (`0x47637`/`0x476a8`, SHA-512 based) against the 32-byte key |
| `0x38950` | per-entry licence evaluation (anchor freshness windows 300 s / 172800 s) |
| `0x39810` (`0x37c38`) | the token check — echo comparisons against call-once statics plus the real verify |
| `0x3b800` (`0x39a7c`) | second gate inside `deriveCapBlobNative` |
| `0x3cc10` | the blob decryptor — **ignores its key argument entirely** (the register is never saved); the key is library-internal, so removing the gate is sufficient |
| `0x3f8c6`/`0x3f8d8` (`0x3d614`/`0x3d620`) | the two gate calls inside `deriveCapBlobNative` — patched by the native half of the unlock |
| `0x3d89f` | `buildActivateRequestNative` — selects between `.rodata:0xc729`/`0xd739` keys by its boolean argument |
| `0x3e960` | `verifyLicenseTokenNative` — selects between `.rodata:0xd43d`/`0xd979` keys by its boolean argument, then runs `0x36190` and returns the `{"is_premium":…,"end_date":…}` claims JSON |

Method: the x86_64 library was made desktop-loadable (strip the bionic `LIBC` symbol-version requirements, stub `liblog`/`libandroid`/`__sF`/`__errno`), driven from a JNI harness, and instrumented with Frida — hooks on `0x36190`/`0x3cc10` plus runtime NOPs of the two gate calls proved the token is only a gate.

## Account / auth layer (1.5)

| Obfuscated | Meaning |
|---|---|
| `kb.c` | `AuthRepository` — exposes the token StateFlow (`ac/c.g1Var2`) and the user StateFlow (`ac/d.n0Var`) |
| `ac.c` | `TokenStore` — encrypted prefs (`auth_prefs`, AES256-GCM via AndroidKeyStore); signed-in = `token != null`; `b(token)` stores a JWT and parses `exp` |
| `ac.d` | `UserStore` — `user_prefs`; rebuilds the cached `ac.b` user (id, name, email, locale, email_verified_at, created_at, updated_at) only when the stored id is non-zero |
| `bc/x` | auth+licence combining VM; state `bc/u` carries the licence, the token boolean and the user's name/email (blank → null) |
| `kc/r` / `kc/o` / `kc/q` | root UI VM and state — combines module-active, licence, features and token flows; the licence combiner maps Premium to EDITABLE only when the module reports active |
| `hc/q` | main-screen VM; `n0Var4` = features-map non-empty AND licence Premium AND module active — the gate in front of the protection categories |
| `ApiClient.tokenAuthenticator$lambda$0` | OkHttp authenticator: on 401 runs the refresh policy; on failure clears the token prefs and pushes `false` into the signed-in StateFlow |
| `ModuleStatus.isModuleActive()` | hardcoded `false` stub in 1.5 — the real Xposed activation check was removed, so the UI can never see the module as active without a patch |
| `ob.i` / `ob.d` / `ob.e` / `ob.h` | `HmeBackendLicenseRepo` and its coroutines — the licence StateFlow (`ob/i.h`) is seeded `Unknown` and the load-failure path pushes `Unlicensed`; the success path runs the claims reducer (`d9/a.H`) |
