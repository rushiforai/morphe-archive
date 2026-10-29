# SD Maid SE Patches Guide

Technical documentation and patch catalog for SD Maid SE (eu.darken.sdmse) on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | SD Maid SE |
| **Package Name** | `eu.darken.sdmse` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | APK (standalone FOSS release) |
| **Primary Architecture** | universal (`arm64-v8a` / `armeabi-v7a` / `x86` / `x86_64`) |
| **Download Target** | [GitHub Releases](https://github.com/d4rken-org/sdmaid-se/releases) (`eu.darken.sdmse` FOSS) |
| **Authoritative Source** | GitHub Releases |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Pro Entitlement Layer (`bytecodePatch`)

1. **Unlock Pro**:
   - **Objective**: Unlock Pro feature gates (scheduler, automated deletion, extra cleaner filters, swiper actions) locally without a GitHub Sponsors sponsorship token or external billing receipt.
   - **FOSS Architecture Context**: The standalone FOSS APK contains zero Google Play In-App Billing SDK dependencies or billing client classes (`UpgradeRepoGplay`, `BillingData`, and billing flow classes do not exist in this flavor). Instead, the FOSS build implements an in-house sponsor-based entitlement architecture backed by `UpgradeRepoFoss`, `FossUpgrade$Type` (`GITHUB_SPONSORS`), and `UpgradeRepoFoss$Info`. All unlock hooks target the FOSS upgrade engine and its coroutine/field consumers.
   - **Layer 1 (Info Constructor Hook)**: Targets `Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;-><init>(ZLjava/time/Instant;Leu/darken/sdmse/common/upgrade/core/FossUpgrade$Type;Ljava/lang/Throwable;)V`. Verifies the existing `isPro:Z` field write, then injects `const/4 v1, 0x1` and `iput-boolean v1, v0, ...->isPro:Z` immediately prior to `RETURN_VOID`, forcing `isPro = true` on every constructed info instance (`v0` holds `this`, `v1` is scratch).
   - **Layer 2 (Coroutine Short-Circuit)**: Injects `sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;` followed by `return-object v0` at entry (offset 0) of `Leu/darken/sdmse/common/upgrade/UpgradeRepoExtensionsKt;->isPro(Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;`, bypassing the coroutine state machine and flow collection.
   - **Layer 3 (Cached Field Read Replacement)**: Scans compiled bytecode across all DEX classes and replaces every `IGET_BOOLEAN` instruction reading `UpgradeRepoFoss$Info.isPro` with `const/4 vREG, 0x1`. This covers 42 call sites across ViewModels, Swipers, Shells, and UI cards.

### B. Non-Applicable Patch Families (Reconnaissance Evidence)

During target reconnaissance, other common patch families were systematically evaluated and classified as `NOT_APPLICABLE`:

1. **Telemetry & Analytics Neutralization (`NOT_APPLICABLE`)**:
   - Recon evidence: Static analysis of DEX classes (11,068 classes) and `AndroidManifest.xml` confirmed zero third-party telemetry, analytics, or attribution SDKs (no Firebase Analytics, Google AppMeasurement, Crashlytics, AppsFlyer, Adjust, Singular, Facebook SDK, or Mixpanel). Network string literals are limited to first-party documentation (`sdmse.darken.eu`), the GitHub API update checker (`api.github.com`), Crowdin, Discord, and a Play Store link.
2. **Compatibility & Device Bypasses (`NOT_APPLICABLE`)**:
   - Recon evidence: The application declares standard Android storage, accessibility, and Shizuku APIs without proprietary OEM hardware checks (no Knox, no Mifare antenna gates, no vendor lockouts).
3. **Anti-Tamper & Sideload Integrity (`NOT_APPLICABLE`)**:
   - Recon evidence: The FOSS release does not contain PairIP, Play Integrity API, or custom application signature checks.
4. **UX Decluttering & Ad Removal (`NOT_APPLICABLE`)**:
   - Recon evidence: SD Maid SE FOSS is completely ad-free by design, with no third-party ad networks, tracking banners, or cross-promotional interstitials.

---

## 4. Behavioral Hazards Warning

1. **Automated Cleaning & Root/Accessibility Operations**:
   Unlocking Pro features activates automated scheduling, background cleaning cycles, and advanced file exclusion overrides. When SD Maid SE is operated with elevated privileges (via Shizuku, root, or AccessibilityService automation), file deletion operations and cache purges execute automatically without individual confirmation prompts. Users should verify their AppCleaner and SystemCleaner filter rules and exclusions before enabling automated background deletion, as purged data cannot be restored.

---

## 5. Known Limitations

- **FOSS Standalone Target Scope**: This patch is designed specifically for the FOSS standalone APK (`eu.darken.sdmse`). Google Play Store variants containing `UpgradeRepoGplay` and Google Play Billing dependencies are not targeted by this patch.
- **System and Storage Permissions**: Core functionality requires standard Android runtime permissions (All Files Access / `MANAGE_EXTERNAL_STORAGE`, AccessibilityService for automated UI clicks, or Shizuku/root for system-level operations). The patch unlocks application-level Pro feature flags; it does not bypass Android OS-enforced permission models.

---

## 6. Canonical Universal Patches

Generic resource slimming and device optimization patches are provided by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, image compression, screenshot protections) that collection also provides `Clean App Packaging`, `Shrink PNG Images`, `Shrink WebP Images`, `Allow Screenshots (Universal)`, and `Strip Sensitive Permissions (Universal)`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including SD Maid SE.
