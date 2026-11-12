# Plan — batch 2 (5 new apps) + repo improvements

Recon 2026-11-10. APKs live in `new_patches apk/`. Patches stay **modern v2**
(`bytecodePatch` / `resourcePatch` + `Fingerprint` + `Compatibility`), serial work, one
app at a time, every app ends with **ads + telemetry/tracking removed** (hard rule).

## Reference material to learn from

| Source | Path | Use |
|---|---|---|
| **Official Morphe patches** (YouTube · YT Music · Reddit) | `/tmp/opencode/morphe-official/patches/.../patches/{youtube,reddit,music}` (shallow sparse clone) | The idiom library: `SwitchPreference` toggles (782 uses), `ListPreference`, `NonInteractivePreference`, per-app `ad/ layout/ misc/ interaction/` package layout, `shared/` helpers |
| **hoo-dles community patches** | `sandbox/morphe-community/hoo-dles/.../patches/protonvpn` | Baseline to **beat** on ProtonVPN (4 narrow patches: isPlusMember force, customDns flag, LAN, split tunneling, server-change delay) |
| Our own | `patches/.../{pdb,mydialog,materialcapsule}` | PairIP patterns (lite vs full-VM), `killPairIpFull`, `pairIPManifestPatch`, resource-patch style |

## App inventory

| App | Package | Version | Signer SHA-256 | Type | Protection / SDKs found |
|---|---|---|---|---|---|
| **Shima+ Dynamic Island** | `com.piyush.island` | 0.5.1 (vc 9) | `eebb863d…751d1d` | native, tiny (5 MB), **no native libs** | **PairIP-lite** (`pairip/application/Application` + `licensecheck/LicenseClient` only), Play Billing present, no ad SDK, little/no Firebase |
| **Glassdoor** | `com.glassdoor.app` | 13.15.1 (vc 125125) | `417fbc25…5fa952` | native, multi-dex | **PairIP with `libpairipcore.so`** (variant TBD — could be full-VM like adidas), GMS Ads, **AppsFlyer** (759 refs), Amplitude, Crashlytics |
| **Jooble** | `jooble.org` | 1.47.0 (vc 247611) | `b04f1f3e…0d66fd5f` | **Flutter** (libflutter/libapp + plugins) | GMS Ads, **AppsFlyer** (547), Facebook SDK. Dart UI/logic is AOT in `libapp.so` → not dex-patchable |
| **ProtonVPN** | `ch.protonvpn.android` | 5.20.98.0 (vc 605209800) | `dcc9439e…5b853` | native + Rust (libandroidvpnrust), libpayment | **Client-side `FeatureFlag` system (130 refs)** + SecureCore/Tor/splitTunnel/Netshield/customDns flags, `VpnUser(userId=…, subscribed=…)`, `Plan(name=…)`; **Sentry** (564), no ads |
| **Microsoft Teams** | `com.microsoft.teams` | 1416 (vc 1.0.0.2026…) | (TBD) | native, 230 MB | Microsoft stack (MSAL/1DS); server-side everything |

## Scope per app (deep)

### 1. ProtonVPN — make it much better than the community patch  ⭐ priority
The community patch forces one boolean (`isPlusMember`) and flips 3 UI "restricted" flags
— it doesn't touch the app's real feature-availability layer, breaks plan-dependent UI and
says nothing about telemetry. Plan:

1. **Map the `FeatureFlag` architecture** (jadx): `FeatureFlag` enum → who resolves
   availability (`isFeatureAvailable`, `availableFeatures`, `UserSubscription`, `Plan`).
   Proton evaluates most feature gates **client-side** from the account's plan; forcing the
   resolution layer (not one boolean) unlocks every flag coherently.
2. **A single `Unlock Plus features` patch** replacing the 4 narrow ones: force the
   feature-availability resolver + subscription/plan state so Secure Core, Tor, P2P,
   Netshield variants, VPN Accelerator, custom DNS, split tunneling, LAN, and the
   server-change delay all unlock together, with correct UI state.
3. **`Remove server-change delay`** via real fingerprints (not method names).
4. **Telemetry off**: Sentry init no-op + its manifest components; add the standard
   Firebase/analytics opt-outs if present (none seen — Proton uses Sentry only).
5. **Push the free tier to its limit** (user decision): also target the free-account
   restrictions that are enforced client-side — device/connection limits, server-list
   caps, feature availability for a logged-in free user — so a free account gets the
   maximum the client can give. Anything the VPN backend enforces (Plus-only servers)
   stays out of reach; the description will say so honestly.
6. **Toggles** (`SwitchPreference`) so users can pick which unlocks apply.

### 2. Shima+ Dynamic Island — small and clean  ⭐ easy win
PairIP-**lite** only (no VM, no native lib) → same shape as Material Capsule/Pdb:
1. `Bypass PairIP` — manifest swap to the real Application + kill `LicenseClient`
   (the licence-check-only variant), no `killPairIpFull` needed.
2. `Mock Pro` — IAP present; determine if the premium check is client-side (entitlement
   read) or Play-verified; force the client read if so (like Material Capsule's three-point
   patch), otherwise leave honest.
3. `Remove ads` — no ad SDK ships → defensive permission strip only.
4. `Disable trackers` — inventory first (looks minimal); strip what exists.

### 3. Glassdoor — PairIP + heavy attribution
1. **PairIP variant recon is the gate**: `libpairipcore.so` is present, and adidas proved a
   full-VM build is not fully recoverable here. Determine lite vs full-VM (check for
   `VMRunner`/`StartupLauncher` + how many methods are virtualized) **before** promising a
   bypass. If full-VM → best-effort only (same honest caveat as adidas) or skip.
2. `Remove ads` — GMS Ads (init provider + `MobileAds` + AD_ID/ADSERVICES perms).
3. `Disable trackers` — **AppsFlyer** (759) + **Amplitude** + Crashlytics: no-op the SDK
   entry points + disable their components/opt-out flags. FCM untouched.
4. Glassdoor+ premium is server-validated (subscription backend) → no premium patch.

### 4. Jooble — Flutter, so scope is deliberately narrow
Dart code is AOT in `libapp.so`; we can only touch the Android side.
1. `Remove ads` — GMS Ads (the Flutter ads plugin resolves through Java): no-op the ad
   plugin/MobileAds entry points + strip AD_ID/ADSERVICES + disable ad components.
2. `Disable trackers` — **AppsFlyer** + Facebook SDK entry points + opt-out meta-data.
Honest limitation: in-app ad **slots** may still reserve space (Dart decides layout).

### 5. Microsoft Teams — "unbloat" (user decision 2026-11-10)
Goal is **less overhead**, not premium: strip Microsoft telemetry (1DS/AppCenter/
Crashlytics), disable non-essential background receivers/services/providers, drop unused
permissions, and remove any ad/analytics SDKs. **Keep MSAL/auth and the core sync
services intact** so the app still works. This is a manifest/component-level de-bloat
pass; the 230 MB payload means each rebuild is slow, so it runs last.

## Repo-level improvements found ("what else can we do")

1. **We have no user-facing toggles at all** — the official bundle uses `SwitchPreference`
   782×, `ListPreference` 147×. Adding options lets users choose (e.g. ProtonVPN unlocks,
   Nike dark mode, per-app ad/tracker switches) instead of all-or-nothing. Adopt for the
   new apps, then optionally retrofit a few existing patches.
2. **README is out of date**: its patch table still lists only the Pdb patches — the six
   shipped apps (v0.5.9) are only in `patches-list.json`. Add an “Other apps” table + link
   each `docs/<app>.md`.
3. **Docs index**: no index page linking `docs/*.md`; `DEVLOG.md` should get the batch-2
   entries.
4. **A shared `trackers` helper**: three of the new apps use AppsFlyer/Amplitude/Facebook —
   a shared "no-op SDK entry points + disable components + set opt-outs" utility (like the
   existing shared PairIP/cert modules) would keep these patches small and consistent.
5. **Options ⇒ safer defaults**: with toggles we can ship premium/dark-mode patches
   default-off where they can affect app behaviour, and still default the ads/tracker
   removal on (hard rule).

## Order & process

```
ProtonVPN (deep, user priority) → Shima+ → Glassdoor → Jooble → [Teams: your call]
```

Per app: decode → inventory SDKs → write v2 patches under
`patches/.../<app>/{ads,trackers,premium,pairip,...}` + `<App>Fingerprints.kt` → add
`<APP>_COMPATIBILITY` (signer, per-ABI versionCode, minSdk) → build + patch-run →
verify (smali/manifest; device where an ABI-compatible emulator exists) → `docs/<app>.md`
→ next app. Release stays batched (target **v0.6.0**), clean-worktree publish like v0.5.9.
