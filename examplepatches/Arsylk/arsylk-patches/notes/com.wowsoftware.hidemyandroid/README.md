# Hide My Android — com.wowsoftware.hidemyandroid

- **Package:** `com.wowsoftware.hidemyandroid`
- **Version:** `1.7.1` (`171`)
- **Download:** TODO — not on a public store; distributed by the vendor. Product page: https://www.producthunt.com/products/hide-my-android · backend `app.hidemyandroid.com`
- **jadx mappings:** [`jadx-mappings.md`](jadx-mappings.md)
- **ghidra mappings:** [`ghidra-mappings.md`](ghidra-mappings.md)

Profile-based device-spoofing Xposed/YukiHook module. The hook code runs **inside each scoped target
app** (and `system_server`): a framework hook manager (`r8.a`) instantiates per-feature YukiHook
registrars (`ta.*`) that read the active profile and either place Java hooks on framework getters or
push state into the native spoof engine `libnative_entry.so` (via
`NativeHooker.setNativeStateNative(...)`, which inline-hooks libc `__system_property_get` and file
syscalls). Spoof **values** come from the profile; see [`feature-map.md`](feature-map.md) for the
per-feature works/where breakdown and [`jadx-mappings.md`](jadx-mappings.md) for the class map.

Premium is enforced in **two tiers**, gated differently — the whole crack is forcing both:

**Tier-1** (basic spoofing + UI): build props/model, serial, boot_id, timezone, locale, GPS,
realistic sensors, installer, root/LSPosed hiding; plus the UI badge and the profile caps. Gated by
the Kotlin wrapper `DeviceInfoProvider.f(...)Z` (which calls `evalBlobNative`), the volatile flag
`LicenseStore.c` (jadx `f636c`), and the account `StateFlow` `Lpa/v0;->j`. Unlocked by **patch steps
1–3**.

**Tier-2** (advanced identifiers): `android_id`, **SIM identity** (`getSimOperator`/
`getNetworkOperator`/`getSimCountryIso`/`getSubscriberId`/`getSimSerialNumber`/`getImei`/
`SubscriptionInfo.*`/`SubscriptionManager.*` — full suite in `ta.o0`), GAID/OAID/MediaDRM/Bluetooth
MAC, the `AccountManager` suite (`ta.v0`), WiFi SSID/BSSID, hide-VPN/proxy/dev-opts/airplane, and
LAN-scan-block. Each registrar wraps its hook registration in
`if (jVar.str.length() > 0) { if (evalBlobNative(jVar.str, …) && …) { … } }`, where `jVar`
(the single `wa.j` identity) carries `jVar.str` (`Lwa/j;->a`) = the **cached signed-licence blob**.
With no licence `license_prefs.xml` is empty → `jVar.str` empty → the entire tier is skipped, *and the
Tier-1 `f()` patch does not help because these call `evalBlobNative` directly, not via `f()`*. Unlocked
by **patch steps 4 + 5** (force the direct `evalBlobNative` gate true **and** the blob field non-empty).
The spoof values still come from the profile config, so forcing the gate is sufficient.

Anti-tamper: the licence `.so` self-checks integrity (`bootstrapRuntime`: signing cert + `base.apk`
hash; `installWatchdog`: `/proc/self/maps` scan). Morphe only touches the DEX, so **step 6** no-ops the
two Kotlin methods that call into those natives, and the re-signed APK is not killed at startup.

> **Verified on device** (the Morphe `.mpp` build — module enabled + scoped to the
> `com.wowsoftware.devicefingerprint` probe): with steps 1–6 the SIM tab flips from the
> real SIM (Plus / 26001 / PL) to the profile's (Banglalink / 47003 / BD); the full Tier-2 getter set
> appears in the runtime LSPlant hook log (hook count 92 → 158); android_id/GAID/AppSetId/MediaDRM all
> match the profile; and build model shows "Infinix Note 40" on a real Redmi Note 13 Pro. (Correction
> to an earlier mid-session claim: `android_id` is **Tier-2**, not Tier-1 — before step 4 it was *not*
> spoofed; the probe value had merely matched the profile because HMA seeds per-app configs from real
> values.) App-process hooks apply without a reboot; `system_server`-mediated ones need `android` in
> the module scope + a reboot.

> **No native code is patched — the `.mpp` is the whole crack.** Verified on device: the DEX patch
> (steps 1–6) covers everything with no `.so` edit. Tier-1 spoofs run through **`libnative_entry.so`**
> (the spoof engine, left untouched); Tier-2 opens via DEX **steps 4 + 5**; anti-tamper is handled by
> DEX **step 6** (the integrity native never runs, so the re-signed cert mismatch is moot). If a
> *future* HMA version moves enforcement into native code, Morphe can byte-patch a `.so` in the same
> bundle via a `rawResourcePatch` — `get("lib/<abi>/libhidemyandroid.so", true)` returns the extracted
> file to edit, and Morphe repacks it (changed entries are detected by content hash).
>
> Operational note: re-signing changes the APK signature. Sign every rebuild with **one shared
> keystore** so `adb install -r` works — then LSPosed keeps the module enabled and the profile
> survives. A signer change forces `uninstall` + install, which **drops the module from LSPosed's
> enabled list** (re-enable + re-scope, then restart the target / reboot before hooks run).

## Patches

| # | Patch | Target (fingerprint → method) | Change |
|---|---|---|---|
| 1 | `Unlock premium` | `EvalBlobWrapperFingerprint` → `DeviceInfoProvider->f(String,String,Lqa/n;JJ)Z` (defining class + `returnType Z` + `methodCall("evalBlobNative")`; non-obfuscated JNI anchors) | prepend `const/4 v0,0x1` / `return v0` — wrapper reports premium unconditionally (headless + `NativeHooker` paths) |
| 2 | `Unlock premium` | every `iget-boolean Lbb/g;->c:Z` (the `LicenseStore` flag; **ref pinned to 1.7.1**) across all classes | each read rewritten to `const/4 v,0x1` — lifts profile caps regardless of login |
| 3 | `Unlock premium` | every `sget-object Ljava/lang/Boolean;->FALSE` within ±6 instrs of a `Lpa/v0;->j:Lfd/h0;` access (**class/field pinned to 1.7.1**) | rewritten to `->TRUE` — the account `StateFlow` emits premium, so the badge + counter render premium with no account |
| 4 | `Unlock premium` | every `invoke …DeviceInfoProvider->evalBlobNative(…)Z` followed by `move-result vX`, across all classes (20 sites in `ta/*` registrars) | rewrite the `move-result` to `const/4 vX,0x1` — the **direct** native licence-blob gate is treated as true, so the Tier-2 registrars stop bailing on it |
| 5 | `Unlock premium` | `Lwa/j;-><init>` — the single identity ctor; the `iput-object` into field `a` (`jVar.str` = cached licence blob; **ref pinned to 1.7.1**) | insert `const-string vX,"1"` before the store — forces the blob field non-empty so `if (jVar.str.length() > 0)` passes. **Together, 4 + 5 unlock Tier-2 (SIM, IMEI, GAID, OAID, MediaDRM, BT MAC, virtual accounts).** Spoof values still come from the profile config. |
| 6 | `Unlock premium` | `BootstrapRuntimeCallerFingerprint` + `InstallWatchdogCallerFingerprint` → the Kotlin callers of the native `bootstrapRuntime` / `installWatchdog` (`methodCall` on the non-obfuscable native names) | prepend `return-void` — neutralises the native anti-tamper the re-signed APK would trip |

Anchor rationale: steps 1 & 4 key on JNI names hard-coded for `RegisterNatives` (R8 cannot rename
them) and so survive updates; steps 2 & 3 have no non-obfuscated anchor (encrypted string pool;
values spread across coroutine state machines) and are **pinned to the 1.7.1 obfuscated names
`Lbb/g;->c` and `Lpa/v0;->j`** — re-derive these per version (see `jadx-mappings.md`).

The Morphe `.mpp` (steps 1–6) is the **complete, self-contained crack** — `morphe-desktop patch -p
patches-1.0.0.mpp <apk>` produces the working, signed APK, no external toolkit.

## 1.7.5 (versionCode 175)

Same architecture as 1.7.2 (backend-issued Ed25519-signed token; `evalBlobNative` is the single
native verdict). Re-derived pins:

| Pin | 1.7.2 | 1.7.5 |
|---|---|---|
| LicenseStore premium flag | `Lcb/h;->c:Z` | `Leb/h;->c:Z` (still written straight from the eval wrapper `DeviceInfoProvider.f(...)Z` in the validate coroutine `Lsa/h1;`) |
| Tier-2 identity (cached signed-licence blob) | `Lxa/k;->a` | `Lza/s;->a` (identity object moved to package `za`) |
| Account-gated premium state | `Lqa/v0;`, `Lqa/z0;` | `Lsa/l1;` (StartupRepository — the premium `MutableStateFlow` `j`, created `Boolean.FALSE`, no-token and refresh-failure paths emit FALSE), `Lgb/c;` (account VM — logout emits FALSE into it) |

The non-obfuscated `DeviceInfoProvider` JNI anchors (`evalBlobNative`, `bootstrapRuntime`,
`installWatchdog`) survive unchanged, so steps 1, 4 and 6 need no re-derivation.

**Step 7 change for 1.7.5:** the blanket `Boolean.FALSE` → `TRUE` rewrite is now emission-aware.
`Lsa/l1;` also *compares* against FALSE for readiness checks (`x.equals(Boolean.FALSE)`), and
flipping that operand makes the app report "App is not ready". The rewrite now only touches loads
whose first consumer is a premium-StateFlow write (`Lid/g0;->j` setValue / `Lid/w;->b` factory),
walking forward until the register is consumed or redefined — a load consumed by anything else
first (the equality check) is left alone even if the same register is later reused for an emission
on another control-flow path.

Validated: built to `.mpp`, applied with morphe-desktop to `hidemyandroid-1.7.5.apk`; all steps
confirmed in the patched DEX (forced eval verdict, 0 remaining flag reads, forced blob field,
selective FALSE→TRUE with the comparison preserved, both anti-tamper callers no-op'd). On device
(rooted Pixel 8, module enabled): the home screen reads **Premium Account** (the original build
reads Free Account). Note the app gates a "System Framework" status on the module being injected
into system_server; on the test device no module at all is injected there (framework limitation),
so that status stays Inactive — the premium unlock itself is unaffected.
