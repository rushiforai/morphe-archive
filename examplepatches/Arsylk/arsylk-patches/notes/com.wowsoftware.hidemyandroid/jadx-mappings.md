# jadx / DEX mappings — com.wowsoftware.hidemyandroid 1.7.1

Obfuscated DEX symbols → meaning, recovered by analysis. Obfuscated names change between builds;
these are 1.7.1. The `com.wowsoftware.hidemyandroid.jni.DeviceInfoProvider` class and its native
method names are **not** obfuscated (hard-coded for `RegisterNatives`) and are the stable anchors.

## Entitlement core

| Obfuscated | Meaning |
|---|---|
| `bb.g` | `LicenseStore` — SharedPreferences `license_prefs` (plain); keys `license_blob`, `device_id`, `time_anchor`, `daily_create_count`, `schema_version` |
| `bb.g->c:Z` | **the premium flag** (jadx alias `f636c`); volatile boolean, read by every UI gate |
| `bb.n` | `TokenStore` — EncryptedSharedPreferences `auth_prefs`; `c():String` = get token (key `token`); `d(String)` = set |
| `bb.d` | `HeadlessApiStore` — EncryptedSharedPreferences `headless_api_prefs`; keys `feature_enabled`, `last_online_validate_at`, `api_key` |
| `xa.c` | `ValidatedLicense(isPremium: Z, blob: String)` |

## DeviceInfoProvider (NOT obfuscated — JNI bridge)

`Lcom/wowsoftware/hidemyandroid/jni/DeviceInfoProvider;` (singleton field `a`):

| Member | Role |
|---|---|
| `f(String,String,Lqa/n;JJ)Z` | **evalBlob wrapper** — calls `evalBlobNative`, returns premium verdict. ← patch target |
| `k(Context,String,J,String)Lxa/c;` | validate wrapper → `ValidatedLicense` (calls `validateLicenseNative` + `getLastValidatedBlobNative`) |
| `e(Context,String,J)Lqa/l;` | identify wrapper (calls `identifyDeviceNative`) |
| `evalBlobNative / validateLicenseNative / getLastValidatedBlobNative / registerDeviceNative / identifyDeviceNative / initializeDeviceNative / bootstrapRuntime / installWatchdog` | native methods (see [`ghidra-mappings.md`](ghidra-mappings.md)) |

## Flows that set / read the premium flag

| Obfuscated | Meaning |
|---|---|
| `pa.s0` | StartupRepository **validate** coroutine: `gVar.c = f(...)` (writes the flag) |
| `pa.q0` | StartupRepository **identify** coroutine: `gVar.c = f(...)` (writes the flag) |
| `pa.v` | Headless API gate: `c()` = premium via `f(...)`, `b()` = 24h freshness, `a(token)` = authorize |
| `pa.u` | Headless API dispatcher (`l(String,Bundle)`, method switch); also sets `gVar.c = true` after authorize |
| `pa.j0` | ProfileRepository: `c()` create / `g()` duplicate — free caps **5 profiles / 20 per day**, read `i.c` |
| `hb.c3` | UI premium holder: `f()` returns `j0Var.i.c` |
| `db.z` | UI create gate (reads the flag + the 5/20 caps) |
| `db.c` | logout: `e()` clears prefs and sets `gVar.c = false` |
| `com.wowsoftware.hidemyandroid.hook.entity.NativeHooker` | runs **inside spoofed target apps**; `k()` gates `hook_identifiers_fully` (serial spoof) on `f(...)` |

## Account state flow (drives the UI badge / profile counter)

Separate from the `bb.g->c` flag: a `StateFlow` that the account view-model fills and the
badge/counter observe.

| Obfuscated | Meaning |
|---|---|
| `pa.v0` | account view-model / repository holding the account state flows |
| `pa.v0->j:Lfd/h0;` | **the premium `StateFlow`** (exposed as `sVar`). Init loads `Boolean.FALSE` (→ `x.b()` → `iput j`); emitted `false` on the **guest path** (no `nVar.c()` token) and on a failed-validation path, `true` on the authenticated-success path. ← patch target (step 3) |
| `fd.h0->j(Object,Object)Z` | the StateFlow setter (`compareAndSet`-style) used to emit into `pa.v0->j` |

## Hook layer (runs inside each scoped target app)

The spoofing hooks are **not** in `pa.*`/`db.*` (those are the UI/app process). They live in `ta.*`,
driven by a framework hook manager, reading the active profile. See [`feature-map.md`](feature-map.md)
for which registrar implements which feature.

| Obfuscated | Meaning |
|---|---|
| `r8.a` | **FrameworkHookManager** — `i()` reads `hookFlags`/config and instantiates the `ta.*` registrars; builds the single `wa.j` identity (`new j(str3,str4,…)` @ `r8/a.java:577`) passed to all of them |
| `wa.j` | **the identity** passed to every registrar. Fields: `->a` (`jVar.str`, jadx `str`) = **cached signed-licence blob**; `->b` (`str2`) = device-id; `->c` (`nVar`) ; `->d`/`->e` (longs). The Tier-2 gate is `if (jVar.str.length() > 0) { if (evalBlobNative(jVar.str,…) && …) }`. ← **patch step 5 forces `->a` non-empty** |
| `ta.q` | identifier registrar — **partly** block (gated `f5558l`=`hook_identifiers_partly`): `android_id`/`bootCount` via `Settings.{Secure,System,Global}.getString/getInt`. **fully** block (gated `jVar.str.length()>0 && evalBlobNative && f5559m`): GAID (`AdvertisingIdClient`), OAID, MediaDRM (`MediaDrm.getPropertyByteArray`), IMEI/IMEI2 (`TelephonyManager.getImei`), AppSetId, Bluetooth MAC (`BluetoothAdapter.getAddress`) |
| `ta.o0` | **SIM registrar** — full `TelephonyManager`/`SubscriptionManager`/`SubscriptionInfo` getter suite; gated `jVar.str.length()>0 && evalBlobNative && e2.b() && e2.d()`. Instantiated @ `r8/a.smali:5285` when `e2.b()&&e2.d()` |
| `ta.v0` | `AccountManager` suite (`hook_virtual_accounts`) |
| `ta.y` | GPS/location (`Location.*`, `LocationManager.*`, GNSS) — `hook_geo_gps` |
| `ta.z0` | WiFi — `getScanResults` (nearby, Tier-1-ish) + `WifiInfo.getSSID/getBSSID` (Tier-2) |
| `ta.e` | Bluetooth scan; `ta.j` LAN-scan + airplane Settings; `ta.l` proxy `System.getProperty` + LSPosed hide; `ta.o` VPN (`ConnectivityManager`); `ta.i` dev-opts Settings; `ta.b` installer; `ta.b0` package-info/install-time; `ta.h0`/`ta.i0` sensor synthesis; `ta.q0` uptime `SystemClock` |
| `wa.d0` | value helpers (locale tag builder `i()`; sensor synthesis `d()`/`f()`) |
| `wa.w` | **hardcoded** root/Magisk package blocklist for `hook_hide_root` — note: **ignores** the profile `hiddenPackages` list |
| `oa.y1` | **ProfileData** (Gson): `I()`→`simConfig` (`oa.e2`), `b()`→geoConfig, `E()`→hookFlags map, etc. |
| `oa.e2` / `oa.d2` | `SimConfig` (`b()`=enabled, `d()`=any card has data) / `SimCard` (per-slot operator/MCC/MNC/IMSI/ICCID/phone; `m()`=any field non-blank) |
| `com.wowsoftware.hidemyandroid.hook.entity.NativeHooker` | marshals profile state into `setNativeStateNative(...)` → `libnative_entry.so` (property/file inline hooks: build props, serial, boot_id, install-time, timezone, locale). `k()` builds the property/path maps |
| `com.wowsoftware.hidemyandroid.jni.DeviceInfoProvider->evalBlobNative(String,String,JJString,JJ)Z` | the **direct** native blob check the Tier-2 registrars call (not via `f()`). ← **patch step 4 forces every call result → true** |

Note: strings are XOR-decrypted at runtime via `a0.n.l(...)`, so plaintext keys/messages are **not**
present as `const-string` in the DEX — string fingerprints do not work on this app. Obfuscated `ta.*`
names are **1.7.1-specific**; re-derive per version by the framework method a registrar hooks.

## 1.7.5 re-derived pins

| 1.7.2 | 1.7.5 | Meaning |
|---|---|---|
| `Lcb/h;->c:Z` | `Leb/h;->c:Z` | LicenseStore premium flag (same field name; class moved to package `eb`); written from the eval wrapper in `Lsa/h1;` |
| `Lxa/k;->a` | `Lza/s;->a` | Tier-2 identity — cached signed-licence blob on the identity object `Lza/s;` (constructed in its `<init>(String,String,ta/p,J,J)V`) |
| `Lqa/v0;`, `Lqa/z0;` | `Lsa/l1;`, `Lgb/c;` | account-gated premium state — `Lsa/l1;` (StartupRepository) holds the premium `MutableStateFlow` `j:Lid/g0;` (created FALSE; no-user and refresh-failure paths emit FALSE) and `Lgb/c;` (account VM) logout emits FALSE into it |
| — | `Lsa/h1;` | validate coroutine — calls the eval wrapper `DeviceInfoProvider.f(...)Z` and writes the flag |
| — | `Lid/g0;->j` / `Lid/w;->b` | premium-StateFlow setValue / factory — the only FALSE consumers the token-check rewrite may flip |
| — | `Lvc/k;->a(Object,Object)Z` | equality helper — `Lsa/l1;` compares readiness state against FALSE here; must NOT be rewritten |
