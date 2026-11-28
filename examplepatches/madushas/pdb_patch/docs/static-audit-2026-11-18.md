# Static re-verification audit — adidas Running, Nike Run Club, Fitbit

Date: 2026-11-18
Owner: OpenCode session (static-first campaign)
Status: IN PROGRESS

## Why this document exists

The shipped write-ups for these three apps are **hypotheses, not proof** (project rule #103).
adb/device access is deliberately withheld until the static pass identifies the real causes
(project rule #102). This file is the persistent checklist for that pass.

Rule #52 applies to all three apps: **ads removed AND telemetry/tracking removed** is a hard
requirement, not an optional extra. A patch that is manifest-only, default-off, or silently
no-ops does **not** count as done.

## Scope

| App | Package | Target build | Source artifact |
|---|---|---|---|
| adidas Running | `com.runtastic.android` | 14.4.0 (only supported) | `new_patches apk/com.runtastic.android_14.4.0-...apkm` |
| Nike Run Club | `com.nike.plusgps` | 4.80.0 and 4.80.1 | `new_patches apk/nike-run-club-4-80-0.apk`, `new_patches apk/com.nike.plusgps_4.80.1-...apk` |
| Google Fitbit | `com.fitbit.FitbitMobile` | 5.11.1 | `new_patches apk/com.fitbit.FitbitMobile_5.11.1...apkm` |

Out of scope: every other app in `new_patches apk/` (project rule #101).

Reference corpus (must be searched before any "impossible" claim — rule #81):
`~/dev/sandbox/morphe-community`, `~/dev/sandbox/morphe-official-ref`,
`~/.agents/skills/morphe-patching/references/`.

---

## A. Patch-layer verification (bundle → APK, no device)

- [ ] A1. `:patches:assemble` produces the MPP; MPP filename resolves from `gradle.properties` version.
- [ ] A2. `morphe list-patches` shows the adidas / nike / fitbit patch entries with the intended default flags.
- [ ] A3. Patch application against each real base APK completes without "fingerprint not found" errors.
      A clean apply proves the anchors exist; an error names the broken anchor.
- [ ] A4. Every asserted class/method fingerprint re-derived from the real dex (no trusting jadx deobf names — constraint #51).

## B. adidas Running 14.4.0

- [ ] B1. `Lgg/k;` (claimed RuntasticCommonTracker) — full method inventory; no load-bearing method is no-op'd.
- [ ] B2. `Lcom/adjust/sdk/Adjust;` anchors (`trackEvent`, `onResume`) exist with the asserted descriptors.
- [ ] B3. `Lcom/runtastic/android/RuntasticApplication;` — is `onCreate` a PairIP trampoline? Which holder does it read?
- [ ] B4. PairIP string recovery: are `idp.adidas.com` / `appws.runtastic.com` / OAuth endpoints dex literals, or only VM-held?
      If VM-held: are they present in the baked TSV (`resources/adidas40/…`)? This is the prime suspect for "Network unavailable".
- [ ] B5. `Lza/e;` authorization path + base-URL provider (`Lcom/runtastic/android/network/base/n$a;`) — how the authorize URL is assembled.
- [ ] B6. Login error mapping (`LLo/n;` / `rt_user_login_error_code`) — which exception yields "Network unavailable".
- [ ] B7. Telemetry inventory (third-party + first-party `com/runtastic/**`) vs. what the shipped patches actually neutralise.
- [ ] B8. Ads surface — gms ads / ad units / ad resources.
- [ ] B9. PairIP kill surface: what `killPairIpFull` leaves behind (classes, native VM lib, startup program in assets).

## C. Nike Run Club 4.80.0 / 4.80.1

- [ ] C1. `DefaultDesignManager.useDarkMode` + `MobileCore.registerExtensions` anchors exist (both builds).
- [ ] C2. Adobe neutralisation completeness — every re-registration/initialisation site.
- [ ] C3. Telemetry inventory (third-party + first-party `com/nike/**`, `com/nike/plusgps/**`) vs shipped patches.
- [ ] C4. Ads surface.
- [x] C5. **Login root cause**: the code that builds the `accounts.nike.com` authorize URL; every query parameter and its origin;
      remote-config keys involved. → **Answered 2026-11-19**: the authorize request is built from
      `com.nike.plusgps.componets.oidc.OIDCComponentModule`, whose `client_id` is the value
      decrypted from `R.string.oauth_oidc_app_id` by `com.nike.clientconfig.Obfuscator` →
      `libnike-obfuscator.so`. Remote config is *not* the cause.
- [x] C6. Signature dependence on the auth path (signing-cert hash in URL/header/body?) — a re-signed build must not change the request.
      → **Answered 2026-11-19**: the dependence is *not* in the URL/header/body — it is inside
      `libnike-obfuscator.so`, which refuses to decrypt unless the APK's signing certificate
      matches Nike's Play certificate (818-byte DER). A re-signed build therefore sends a
      garbage `client_id` and gets HTTP 500. Fixed by the new
      `Nike obfuscator access-gate bypass` patch (see `docs/nikerunclub.md`).
- [ ] C7. HTTP interceptor / header injection that touches login+config requests.
- [ ] C8. Protection surface (pairip / Play Integrity / safetynet).

## D. Google Fitbit 5.11.1

- [ ] D1. Full manifest component + permission inventory; flag telemetry/ads/referrer surfaces.
- [ ] D2. Dex inventory: telemetry, ads, integrity, credential-manager, classic sign-in, FCM.
- [ ] D3. First-party Fitbit analytics packages.
- [ ] D4. Ad vs subscription-upsell surface separation.
- [ ] D5. Sign-in API actually used + GoogleSignInOptions (requestIdToken? scopes? server client id?).
- [ ] D6. GmsCore/MicroG readiness: does the shipped patch write the digest MicroG expects, and does it cover every sign-in entry point?
- [ ] D7. Protection surface.

## E. Cross-cutting

- [ ] E1. Every "half-baked" defect promoted to a concrete fix plan (file + anchor + exact edit).
- [ ] E2. Each fix implemented as a thin, independently verifiable slice.
- [ ] E3. Local (no-device) verification after each slice: bundle builds, patches apply, dex anchors still match.
- [ ] E4. Device verification list prepared for when adb access is granted (short, targeted, per defect).

## Open questions for the user (do not guess)

- Adidas baseline: the unpatched original on the test phone diverts to the Play Pass paywall, so the
  unpatched login baseline is unknown (constraint #105). Device phase must establish it.
- Fitbit sign-in needs MicroG **and** a real account to verify (no Google services on a re-signed build).

## Evidence log

- Static material: adidas dex `/tmp/opencode/rtx/classes*.dex` (+ `rtorig/base.apk`),
  Nike dex `/tmp/opencode/nk2/classes*.dex`, Fitbit extracted to `/tmp/opencode/audit/fitbit/`.
- Shared-helper audit: in progress.
- Per-app dex audits: in progress.
