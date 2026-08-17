# Plan: Ad-removal patches for 3B Meteo (`com.Meteosolutions.Meteo3b`)

Goal: build a Morphe patch bundle (`.mpp`) that removes ads from the **3B Meteo** Android app, test locally with Morphe-Desktop, and release it publicly so it can be installed via Morphe Manager. **Achieved — patch built, tested, published, and confirmed working on-device in Morphe.**

> Legal note: ad removal in this app bypasses the paid **premium** in-app purchase that removes ads. This is a personal-use, ReVanced-style patch. Proceeding at the user's discretion. See "Legal exposure (IT)" below.

- **Status: Phase 0–5 done. Patch verified on 💥 real device via Morphe Manager. Repo is public (`riky-dev/morphe-patches`); license attribution fixed on `dev`+`main`.**

## Target app facts (research)
- Package: `com.Meteosolutions.Meteo3b`
- Launcher name (from `app_name` string): `3BMeteo`
- Analyzed version: **4.9.15**, versionCode **323104240** (all 4 ABIs share the same code). Downloaded as XAPK from apkpure.net CDN -> split APK -> `ApkFileType.APKM`.
- Ads via paid premium subscription. Ad SDKs: Google Ads (GAM), Teads (`ViewIol*` wrapper), Outbrain, Prebid, Beintoo, iubenda/TCF2 consent.

## Decisions (confirmed with user)
1. APK source: **download the latest available working version** (ApkMirror/Aptoid), record exact version + version code.
2. Build environment: **set it up here** (install JDK 17+, Android SDK cmdline-tools, configure GitHub PAT in `~/.gradle/gradle.properties`).
3. End goal: **Both** — local dev patches flow + full public release via semantic-release.

---

## Phase 0 — Environment setup (prerequisite)
1. Install JDK 17+ (currently only Java 1.8 present). Set `JAVA_HOME`; use Temurin 17 packaged JDK.
2. Install Android SDK cmdline-tools; set `ANDROID_HOME`. Required by `extensions/extension` (compiles against `android.jar`) and the `app.morphe.patches` plugin.
3. Configure GitHub PAT with `read:packages` scope in `~/.gradle/gradle.properties`:
   ```
   gpr.user = <github username>
   gpr.key = ghp_xxxxxxxxxxxxxxxxxxxxxxxx
   ```
   (Alternative: `gh auth login` then `gh auth setup-git`.)
4. Verify baseline: `./gradlew buildAndroid` on the untouched template produces a valid `.mpp` (isolates env/config issues from patch logic).

## Phase 1 — Acquire + decompile (automated)
1. Script deterministic download of latest working 3B Meteo APK/APKM. Record exact version + version code per ABI.
2. Install **jadx** and decompile to Java; also `apktool d` to smali.
3. Output location: `analysis/` directory (gitignored) holding APK(s), jadx output, smali, and a manifest/metadata dump.

## Phase 2 — Static analysis to locate ad/premium logic (scripted)
Search jadx/smali output for candidate hooks:
- Ad SDK: `com.google.android.gms.ads.*`, and 3bmeteo wrappers (`AdManager`, `AdsHelper`, `AdsLoader`, `Banner`, `Interstitial`, `AdListener`).
- Premium/no-ads flag: `isPremium`, `removeAds`, `adFree`, `AD_FREE`, SharedPreferences keys, `onPurchasesUpdated`, billing classes.
- `loadAd()` / `onAdLoaded()` / banner/interstitial build sites suitable for a clean no-op or `return false`.
Produce a candidate-hook report (methods + fingerprint filters). **Deliverable**: list of verified hook methods.

## Phase 3 — Write the patches ~~DONE~~
Implemented (see `patches/src/main/kotlin/app/riky/patches/`):
- `Constants.kt`: `COMPATIBILITY_METEO3B` (name "3BMeteo", pkg `com.Meteosolutions.Meteo3b`, `ApkFileType.APKM`, appIconColor `0x30639B`, target 4.9.15).
- `Fingerprints.kt`: `evaluateProvider` (public), `evaluateFallback` (private) in `BannerManager`; `isPremium`, `isConsentlessPremium` in `data/models/User`.
- `HideAdsPatch.kt` (`default = true`): overrides `evaluateProvider` -> `"none"` (every banner/native/cover/interstitial type resolves to empty/invisible), `evaluateFallback` -> `"no_adv"` (so the two fallback handlers hide instead of null-deref), and forces both `User` premium methods to `true` (kills premium-gated ads, consent popup, and unlocks the ad-free/premium UI).
- No extension `.mpe` needed for these fixed-value overrides.
- Namespace renamed to a per-app scheme (`app.riky.patches.meteo3b`, group `app.riky`), future apps get their own package.
- `generatePatchesList` produces `patches-list.json` with the "Hide ads" entry (version 1.0.0).

4. ~~Extension (`.mpe`, Java)~~ — not required: simple fixed-value overrides. (The template `ExamplePatch.java` was removed.)
5. ~~Keep the `example` namespace~~ — renamed to `app.riky`.

## Phase 4 — Build & iterate ~~DONE~~
- `./gradlew buildAndroid` -> `patches/build/libs/patches-*.mpp`. **DONE** — the built `.mpp` was smoke-tested by applying it to the real base APK with the actual morphe-patcher 1.8.0: patch applied, dex compiled, and the patched methods verified via jadx (`evaluateProvider`/`evaluateFallback`/`isPremium`/`isConsentlessPremium` all return the forced values). Fingerprints match 4.9.15.
- Test with **Morphe-Desktop**: patch real APK, sideload, confirm ads gone + app stable. Iterate fingerprints on mismatch (patcher reports failing fingerprint name). **(NEXT STEP)**
  - Replaced by on-device testing below. On-device Morphe patching works and is the quickest iteration loop: import the `.mpp` (or the patch source once released), feed the XAPK/APKM, enable "Hide ads", patch, sign + install.
  - Since the patch source is now published, Morphe Manager can load it via the one-click URL below — no EPUB/Desktop tool needed.

## Phase 5 — Release (public) ~~DONE~~
- Update `patches/build.gradle.kts` `about { name, description, source, author, contact, website, license }`, `README.md`, `.github/ISSUE_TEMPLATE`. **DONE**
- Work on `dev` branch; merge to `main`; let `release.yml` (semantic-release) build tags + patches-list.json + CHANGELOG + README patch list automatically. **DONE** — `v1.0.0` stable released on `main` (`patches-1.0.0.mpp`, attest + signature). README add-source URL + patch list auto-regenerated to `riky-dev/morphe-patches`.
- Do NOT hand-commit generated files (`patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`).
- **Add-to-Morphe source URL:** `https://morphe.software/add-source?github=riky-dev/morphe-patches`
- Also pushed a `dev` branch (semantic-release prerelease channel) so users can opt into pre-releases via Morphe Manager.

---

## Automation levers (scripts written)
- `scripts/fetch_apk.sh` — deterministic APK/APKM download + metadata dump. **DONE**
- `scripts/analyze.sh` — recursive grep over jadx/smali for ad/premium hooks -> report. **DONE**
- `scripts/verify_patch.sh` — run `buildAndroid` and apply the built `.mpp` to a clean base APK with morphe-patcher 1.8.0; jadx-verifies the forced values. **DONE (replaceToggle the planned `build_verify.sh`).**

## Open items / needed from user
- **Resolved:** GitHub account + PAT (`riky-dev`, `read:packages`) — done, used by local builds and backmerge CI.
- **Resolved:** public repo — `riky-dev/morphe-patches` created, branches `dev` (prerelease) + `main` (stable), `v1.0.0` released.
- License attribution fix (`UserXYZ` -> `Riky Morphe Patches`) committed on `dev` and merged to `main`.
- Consider setting repo **private** or dropping the premium spoof to reduce legal exposure (see below) — user decision.

## Spoiler: approach likely to work
- Suppress an `AdListener`/`loadAd` entry point (return no-op) to prevent banner+interstitial rendering. **DONE — via `evaluateProvider` -> `"none"` + `evaluateFallback` -> `"no_adv"`.**
- Force premium branch (`isPremium()` -> `true` from extension) so in-app layout shows the ad-free/premium UI without billing. **DONE — `User.isPremium()`/`isConsentlessPremium()` forced via smali override.**

---

## Legal exposure (Italy) — assessed 2026-08
Based on the Italian legal landscape (informational, not legal advice):
- **Ad removal alone:** essentially legal (ad-blocking). Not the problem.
- **Premium/spoof risk:** faking `isPremium`/circumventing DRM-style IAP can implicate `art. 615-ter`/`640-ter c.p.` and `art. 171-ter L. 633/1941` (DRM circumvention).
- **Realistic exposure is LOW for a hobbyist:** companies pursue **civil** take-downs (DMCA/host complaint) rather than criminal charges; personal non-commercial hobby patches are effectively non-events in practice.
- **Red flags that raise real risk:** monetizing (ads/donations), scale (large download counts), or redistributing modified **APK blobs** (classic modded-apk-site model).
- **Source-based `.mpp` (our model) is materially safer** than binary mod APKs.
- Mitigations: keep repo **private**; no donation/page; consider dropping premium spoof and keeping pure ad-removal; local IP-lawyer consult (`171-ter`/ReVanced precedent) for certainty.