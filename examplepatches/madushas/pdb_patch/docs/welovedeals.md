# We Love Deals patches

**App:** We Love Deals (`com.thina.welovedeals`) · **target 1.2.0**
(versionCode 87, minSdk 24, targetSdk 36) · split bundle `.apks`
(Play-signed, SHA-256 `eb7eaf29…36953a`).

Full static recon: `docs/phase2-analysis.md`; failures and fixes:
`docs/phase2-devlog.md`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Bypass PairIP license check** | ✅ | lite-variant PairIP launch gate **plus** this build's custom-trial re-arm. |

Again exactly one patch — and that is a finding, not an omission.

## Why the scope is exactly one patch

We Love Deals is a **Flutter** app: `split_config.arm64_v8a.apk` ships
`lib/arm64-v8a/libapp.so` (8.2 MB, AOT Dart) plus `libflutter.so`, `libdartjni.so` and
`libdatastore_shared_counter.so`. Only `com/thina/welovedeals/MainActivity.smali` is
app-owned; the 15 registered plugins are all UI/peripheral (`app_links`, `file_picker`,
`flutter_image_compress`, `flutter_inappwebview`, `flutter_plugin_android_lifecycle`,
`flutter_secure_storage`, `fluttertoast`, `geolocator`, `google_maps_flutter`, `jni`,
`jni_flutter`, `share_plus`, `shared_preferences`, `sqflite`, `url_launcher`) — **no**
in_app_purchase, **no** firebase, **no** analytics plugin.

Inventory (all zero): GMS Ads display, AppLovin, Unity, ironSource, Vungle, Pangle,
ByteDance, MoPub, InMobi, AppsFlyer, Adjust, Amplitude, Segment, Mixpanel, Sentry,
Singular, Blueshift, Firebase, OneSignal. `com/google/android/gms/*` is present only for
Maps (`GoogleApiActivity`, `com.google.android.geo.API_KEY`) — location, not ads.

So the dex ceiling is the PairIP licence check plus the manifest, exactly as with OferHub.

## The variant, and the one thing that differs from OferHub

Same lite class set (37 `com/pairip` classes, no `VMRunner`, no `StartupLauncher`, no
`libpairipcore.so` in any split) — but this build carries the **custom-trial extension**
that OferHub does not: `TrialClient.checkTrialStatus(Context)I`, `TrialStatus`,
`LicenseClient.stopTrial(Context)V`, `handleTrialEnd()`, `RepeatedCheckMetadata`,
`customTrialEndTriggered`.

`handleTrialEnd()` sets `customTrialEndTriggered = true` **and**
`licenseCheckState = CHECK_REQUIRED`, i.e. it re-arms a real network check — so bypassing
the launch gate alone would still leave the app forcing a full round trip later. It is
neutralised, along with `startErrorDialogActivity`, `handleError` and `scheduleAppShutdown`
for defence in depth: none is reachable once the gate never starts, but this app cannot be
device-verified in this campaign yet.

Verified instruction counts on the target APK:

| Method | before → after |
|---|---|
| `initializeLicenseCheck()` | 29 → 3 (forces `LOCAL_CHECK_OK`) |
| `processResponse(I, Bundle)` | 54 → 1 |
| `performLocalInstallerCheck()` | 53 → 2 (→ true) |
| `startPaywallActivity(PendingIntent)` | 11 → 1 |
| `handleTrialEnd()` | 26 → 1 |
| `startErrorDialogActivity()` | 9 → 1 |
| `handleError(LicenseCheckException)` | 5 → 1 |
| `scheduleAppShutdown()` | 7 → 1 |

**On `stopTrial`:** it is a *trial terminator*, not a satisfier. It funnels into
`handleTrialEnd()`, so it is left alone and becomes inert once `handleTrialEnd` is no-op'd.
Routing `checkLicense` through it would be exactly the wrong move (this was an early
planning mistake recorded in the devlog).

## Ads and telemetry: nothing to remove

Zero classes of every SDK searched (see the list above). No ad patch and no tracker patch
exist for this app, and the manifest gates are vestigial (`CHECK_LICENSE` plus
`AD_ID`/`ACCESS_ADSERVICES_*` permissions that nothing reads).

## Known gap

**Premium is out of reach** — all deals/coupons logic is AOT Dart in `libapp.so`, no
billing client or IAP plugin exists, and there is no dex-visible entitlement anywhere. No
premium patch is shipped, and the patch description says so.
---

## 2026-11-22 — device-verified working; premium gate mapped (Dart AOT)

The patched build (PairIP bypass + re-signed) was installed on the campaign device and
**fully works**: the persisted session survived (flutter_secure_storage holds
`session_date` / `is_logged_in` / `user_data`, AES-wrapped by the Android keystore), the
home feed loads live deal content ("Total Saved … LKR"), and all four tabs navigate
(Home / Map / Vendors / Settings). The "cannot be device-verified yet" caveat above is
now resolved.

### Entitlement surface (from libapp.so AOT strings + on-device state)

* Endpoints: `/subscriptions/plans`, `/subscriptions/quote`, `/subscriptions/initiate-payment`,
  `/subscriptions/bank-transfer` — a real per-location paid subscription product.
* State model: status values `active` / `inactive` / `expired`; constant
  `LOCATION_SUBSCRIPTION_ACTIVE`; models `classes/paymentPlan.dart`,
  `classes/subscriptionQuote.dart`; logic in `functions/subscriptionFunctions.dart`.
* Gate shape: `highLevelComponents/noSubscription_slideupContent.dart` (the paywall
  slide-up) + `_kUnblockedUserActions@…` — the app gates **user actions** against a
  whitelist, so free users can browse but gated actions (e.g. redeem) raise the slide-up.
* Storage: the user model lives AES-encrypted in `flutter_secure_storage` (key wrapped by
  the Android keystore — not readable off-device), so there is no external state to edit.

### Why there is still no premium patch

The gate is compiled Dart in `libapp.so` (8.2 MB AOT snapshot, no symbols). A patch must
locate the machine code behind `subscriptionFunctions.dart` (e.g. the "is this action
unblocked / is the location subscription active" decision) and flip it — the same
class of work as the Nike native gate, but against Dart AOT object-pool references.
Next session's plan: find `_kUnblockedUserActions` and the `LOCATION_SUBSCRIPTION_ACTIVE`
constant in the snapshot's object pool, trace the `ldr [x27, #imm]` references to them
in the instructions section, and identify the branch to neutralise; `app.dill`-style
tooling (darter, blutter) can shorten the hunt.

---

## 2026-11-22 — PREMIUM UNLOCK SHIPPED: `has_active_subscription` forced true (Dart AOT byte patch)

The "known gap" above is closed. Method: full Dart AOT snapshot analysis with
**blutter** (Dart 3.12.2 detected from libflutter.so; blutter checked out the SDK at
that tag, built the VM libs, and dumped symbolised per-library disassembly + the whole
object pool in ~3 minutes on this machine).

### The entitlement model (from the symbolised dump)

* `User.has_active_subscription` — a boolean field (`field_27`) on the user model,
  parsed from the server JSON by `User._asBool` in **exactly two places**:
  * `User.updateFromJson` @ `0x4e1888` (`bl User::_asBool` → `stur w0, [x1, #0x27]`)
  * `User.fromJson` @ `0x5d5374` (same call, value carried to the factory-allocated User)
* Every premium gate branches on this field. The redeem screen's gate is literally a
  compressed-pointer bit test: `tbnz w1, #4` = "is the field `false`?" (`true` is
  materialised `add xN, NULL, #0x20`, `false` is `NULL+0x30`, NULL lives in x22).
* `SubscriptionQuote`/`PaymentPlan` are pricing models (payment flow), not the gate.
* `_kUnblockedUserActions` turned out to be Flutter's *semantics* library — a decoy.

### The patch (`welovedeals/premium/UnlockPremiumPatch.kt`)

Replace each `bl User::_asBool` with `add x0, x22, #0x20` (the canonical Dart `true`,
`0x910082c0`) — 4 bytes per site, anchored by 16-byte patterns that are **unique in the
whole 8.2 MB snapshot** (exhaustive-scan verified; the patch scans and fails loudly if
the count ever differs from 1):

| site | pattern (on-disk bytes) | patch |
|---|---|---|
| updateFromJson `0x4e1884` | `64f342f9 09000094 a1835ff8 207002b8` | bl → `c0820091` |
| fromJson `0x5d5370` | `64cf40f9 4e31fc97 a1835ff8 62775df9` | bl → `c0820091` |

Verified: `morphe patch` reports `patched 2/2 entitlement parse sites`; the produced
`split_config.arm64_v8a.apk/libapp.so` contains both patched sequences and zero
original ones; the app **boots and renders** on the emulator (x86_64 running the arm64
snapshot) — the Dart VM accepts the patched code.

### Still open

Behavioural confirmation with a real logged-in session (the campaign device with the
persisted login dropped off adb mid-session; reconnect and walk into a gated action —
the paywall slide-up should no longer appear). Server-side checks (vendor redemption
codes, payment endpoints) remain server-gated by design.

### Redeem-gate anatomy (second blutter pass)

The redeem screen's gate is a two-part state machine in
`_RedeemScreennState::build`'s redeem closure (`0x58ee24`):

1. pre-check: `tbnz w1, #4` on a captured-provider bool (`false` → paywall slide-up);
2. a switch on a redemption-state int (`0` = fetch via `setState`, `1` =
   `_confirmRedemption`, `2` = `_finalizeRedemption`, default = slide-up) — matching
   `DealRedemption.state` / `RedemptionStatus` ("reserved_at", branch codes).

The five `SubscriptionFunctions` booleans (field_23/2b/33/3b/43, all init `false`) are
loading/validation flags — field_2b specifically is the *referral validation in
progress* flag (`validateReferralCode` sets it true then false with "Please sign in to
use a referral code."), **not** the subscription gate. The pre-check bool's exact class
needs the closure-context chain resolved with live state (the context is captured in
`build` at `0x58e508`, but the slot is reused; static tracing alone is ambiguous).

Device test protocol when the Lenovo rejoins adb: open any deal → Redeem → if the
slide-up still appears, the pre-check bool is per-location/per-coupon state rather
than `User.has_active_subscription`; then hook the closure (blutter_frida.js) or
re-trace with the live object graph. `User.has_active_subscription` remains the
primary entitlement (patched at both parse sites; every session refresh re-applies it).

---

## 2026-11-24 — Phase 1 of the deep investigation: EXPERIMENTAL Frida probe patch (dcf3602, 7e1326d)

Plan (user's): probe deep with an experimental developer patch first, then distil a simple
user-facing candidate.

**Built:** `WLD Frida probe resources` + `WLD Frida probe load` (both `default = false`,
never shipped): ship Frida gadget 17.27.5 (android-arm64) + `listen` config
(127.0.0.1:27042) into the APK as **new entries** — `ResourcePatchContext.get(path,
writable)` does create missing entries (proven empirically) — and load it at the earliest
app-side runtime from `LicenseClient.checkLicense`'s index 0 (the first statement of
pairip's `Application.attachBaseContext`; `.locals 2` gives a dead scratch slot).
**Do not re-try `attachBaseContext`** — it has `.locals 0`, so `v0` binds to `this` and
the app crashes (caught statically before shipping).

**Verified:** patched dex carries the load at index 0, both frida entries in the APK,
APK still signs and installs.

**The redeem gate, fully decoded** (blutter disassembly of the closure at `0x58ee24`):

```
static0 = THR.field_table_values[0xf00]     // late-final isolate static
if static0 != null and static0->field_27 != false   -> normal redeem flow
A  = state.field_17 ([x1+0x17]);  B = A.field_b;  C = B.field_1b
if C.field_2b == false                              -> PAYWALL slideup (0x58ef3c)
normal: A.field_b -> B; B.field_f -> stateObj; stateObj.field_13 = redemption state
        (0 = fetch, 1 = _confirmRedemption, 2 = _finalizeRedemption)
```

field_27 of `static0` is, on the evidence, `User.has_active_subscription` — the flag the
shipped patch already forces true at both parse sites — which is why the live probe
identifies the class ids of `static0`, `A`, `B`, `C` first (then phase 3 patches any
second site precisely).

**Probing (when a device is back):**
```
adb forward tcp:27042 tcp:27042
frida -H 127.0.0.1 Gadget -l tools/welovedeals/wld-probe.js     # host CLI (frida 17.27.5, matches gadget)
# optional: python3 tools/welovedeals/gen_cid_map.py <blutter-out> /tmp/cid.json  -> paste into CIDMAP
```
Persistent artifacts this time: blutter output and the extracted libs live under
`/home/madusha/dev/work/phase2/welovedeals/` (the /tmp wipes lost two earlier runs).

---

## 2026-11-25 — PREMIUM UNLOCK COMPLETE: redeem gate NOP'd, device-verified A/B (82deed6)

The earlier "entitlement flag forced, gap open" state is closed. The redeem
paywall gate decoded completely:

```
closure 0x58ee24 (redeem button's onPressed):
  static0 = THR.field_table_values+0x1e00                     // the User singleton
            (proven: getRedemptionHeaders reads static0.field_2b as "Bearer <auth token>"
             = User.auth_token; so static0.field_27 = User.has_active_subscription)
  if static0.field_27 == false  AND  A.field_b.field_1b.field_2b == false:
      0x58eea0: tbnz w1, #4, #0x58ef3c          -> NoSubscriptionSlideupContent paywall
  normal flow switches on the redemption state (0 fetch / 1 confirm / 2 finalize)
```

The second input (`CouponFunctions.field_2b`, the "coupons fetched" data-ready
flag set in `fetchCoupons` @0x555538, reset in `_storeCouponPage` @0x555a60) is a
loading guard, not entitlement — so on a device with no logged-in session the gate
rests on it, which is why the flag-only patch still showed the dialog in the
emulator A/B.

**Device A/B (emulator, rooted, 1.2.0, anonymous session):**

| build | tap "Redeem Coupon" |
|---|---|
| vanilla + pairip bypass only | "Subscription Required!" dialog |
| + entitlement flag forced (v1) | **still the dialog** (no session → no User static) |
| + gate branch NOP'd (v2) | proceeds to "Enter the branch redemption code provided at the vendor to redeem this deal" |

**Final patch = 3 sites** in `UnlockPremiumPatch` (all anchors unique in the 8.2 MB
snapshot; `check(found == 1)` fails loudly on drift):

1. `User.updateFromJson` @0x4e1884: `bl _asBool` → `add x0,x22,#0x20` (Dart true)
2. `User.fromJson` @0x5d5370: same
3. redeem gate @0x58ee98: `tbnz w1,#4,#0x58ef3c` → `nop`

Vendor redemption codes and payment endpoints remain server-validated (by design).
The experimental Frida probe patch (dcf3602) stays available but OFF by default; its
gadget works (device-verified listening on 127.0.0.1:27042 on the Lenovo).

## 2026-11-28 — Phone verification (Lenovo Z2473, real arm64)

The 3-site patch was rebuilt against the reconstructed .apks bundle (the /tmp copy
was wiped; re-zipped from work/phase2/welovedeals/apks_extracted) and A/B'd on the
phone: flag-only build → "Subscription Required!" dialog; 3-site build → straight
to the branch-code redemption modal ("Enter the branch redemption code provided at
the vendor to redeem this deal"). Matches the emulator result exactly.

Frida probe lesson (device-proven): Interceptor.attach at a Dart AOT function's
checked entry never fires when the closure is invoked via Dart's unchecked entry —
the hook is attached at a byte-verified prologue and still stays silent. Dart AOT
probing must target the unchecked entry or use Stalker/replace. Recorded in the
probe script's header and memory.

## 2026-11-28 — Release tidy: probe tooling removed from the bundle

With the device A/B complete (emulator + real phone), the experimental tooling left
the shipped patch set:

- removed `WLD Frida probe resources/load` (the embedded Frida gadget + listen
  config + dex loader) — the bundle drops from 16 MB back to 1.4 MB;
- removed `We Love Deals debuggable (diagnostic)` — a pre-Dart-work debugging aid
  that forced `android:debuggable` for `run-as` reads of shared_preferences;
- `Unlock premium` itself unchanged in behavior: 3 sites (two `bl _asBool` →
  `add x0,x22,#0x20` entitlement parses, one `tbnz` paywall branch → `nop`), each
  anchored by a pattern unique in the 8.2 MB snapshot with loud failure on drift;
  its KDoc now records the device A/B evidence.

Release sanity: fresh `morphe patch` apply of the tidied bundle → all three default
patches applied, byte check confirms `c0 82 00 91` at `0x4e1884`/`0x5d5370` and
`d5 03 20 1f` at `0x58eea0` in the output `libapp.so`.

Kept (outside the bundle, for future Flutter targets): `tools/welovedeals/wld-probe.js`
and `gen_cid_map.py` — the Frida probe script documents the Dart unchecked-entry
hook limitation and the class-id workflow; it is an instrument, not a patch.
