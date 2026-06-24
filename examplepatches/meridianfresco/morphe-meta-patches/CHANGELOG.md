# 1.0.0 (2026-04-11)


### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/meridianfresco/morphe-meta-patches/commit/3728b978519854968a56847075aa9d58565a85e3))
* google photos patch logic ([58f8bc8](https://github.com/meridianfresco/morphe-meta-patches/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* make Google Photos spoof build patch self-contained ([7b431dd](https://github.com/meridianfresco/morphe-meta-patches/commit/7b431dd5a707231b5289db60a6fdee5d24b27832))
* make gradlew executable ([3be2ec5](https://github.com/meridianfresco/morphe-meta-patches/commit/3be2ec51fff5990c174c166e7a02625971832063))
* Relax sponsored data fingerprint to match non-split APKs ([b585486](https://github.com/meridianfresco/morphe-meta-patches/commit/b585486635154de3267c3ca9cfdb83ef32b00ce7))
* release 1.0.1 ([b68b315](https://github.com/meridianfresco/morphe-meta-patches/commit/b68b31503e57a9253237a3bf2be8bacfd23f7c86))
* release 1.0.1 ([26175cf](https://github.com/meridianfresco/morphe-meta-patches/commit/26175cf2910917be08734a741087018e127a1648))
* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/meridianfresco/morphe-meta-patches/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))
* Remove dead resource mapping imports and fix GPR auth token ([d10cbc6](https://github.com/meridianfresco/morphe-meta-patches/commit/d10cbc647a4c0f3fb847ea03d72cccc9077ed546))
* Use CONTAINS match for GraphQLFBMultiAdsFeedUnit class lookup ([bc766b3](https://github.com/meridianfresco/morphe-meta-patches/commit/bc766b337843fc1e8eb4814e2c20042fd38e508e))


### Features

* release v1.1.0 ([901b2ec](https://github.com/meridianfresco/morphe-meta-patches/commit/901b2ec28fb8e5863d2085d471f0cf529de08422))

# [1.1.0](https://github.com/meridianfresco/morphe-meta-patches/compare/v1.0.4...v1.1.0) (2026-04-11)


### Features

* bump supported Facebook split version to v556 and dynamically construct mirror query ([39a97f3](https://github.com/meridianfresco/morphe-meta-patches/commit/39a97f3cf450b90592c82ee5b46fd75baf140a5e))

## [1.0.4](https://github.com/meridianfresco/morphe-meta-patches/compare/v1.0.3...v1.0.4) (2026-04-11)


### Bug Fixes

* explicitly reject non-split (Universal) APKs due to Redex obfuscation ([409371a](https://github.com/meridianfresco/morphe-meta-patches/commit/409371ae4e6f2764dca505ee540c6df5033fee26))

## [1.0.3](https://github.com/meridianfresco/morphe-meta-patches/compare/v1.0.2...v1.0.3) (2026-04-11)


### Bug Fixes

* Remove class constraint, use structural matching for sponsored data fingerprint ([f8c18f8](https://github.com/meridianfresco/morphe-meta-patches/commit/f8c18f877ca264c6d50978565d54cffc26810a59))
* Use expression-style in custom lambda (return prohibited in non-inline lambda) ([f6829b3](https://github.com/meridianfresco/morphe-meta-patches/commit/f6829b32bfff035eaa01e18b85d57d57a7383a71))





### Bug Fixes

* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/RookieEnough/De-ReVanced/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))





### Bug Fixes

* **Google Recorder — Remove device restrictions:** fingerprint and bytecode hook updated for current app builds — match `RecorderApplication.onCreate` without a fixed feature string, detect any `com.google.android.feature…PIXEL…` `const-string`, and apply the restriction bypass (fixes fingerprint mismatch on newer Recorder versions).

### Maintenance

* **Attribution:** add a standard `Forked from` source header across Kotlin sources that were still missing it.

## [1.0.2](https://github.com/meridianfresco/morphe-meta-patches/compare/v1.0.1...v1.0.2) (2026-04-11)


### Bug Fixes

* Use CONTAINS match for GraphQLFBMultiAdsFeedUnit class lookup ([bc766b3](https://github.com/meridianfresco/morphe-meta-patches/commit/bc766b337843fc1e8eb4814e2c20042fd38e508e))





### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/RookieEnough/De-ReVanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/RookieEnough/De-ReVanced/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))





### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/RookieEnough/De-ReVanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* **ci:** append `CHANGELOG.md` section to GitHub release notes when present

### Morphe Manager integration

* Bumped Morphe Gradle plugin to **1.2.0** and **morphe-patcher** to **1.3.3** (GitHub Packages: `gpr.user` / `gpr.key`).
* All patches declare **`compatibleWith(Compatibility(...))`** via `AppCompatibilities` so Manager shows human-readable app titles and icon tint colors.
* **`patches-list.json`** now includes a root **`appNames`** map (package → display name) and, for each patch, a **`compatibility`** array with `name`, `packageName`, `appIconColor`, optional `description`, and **`targets`** (version pins). This fixes the detail view where only package IDs appeared after tapping an app.
* **Bundle artwork:** place **`patch-bundle.png`** in the same directory as **`patch-bundles.json`** so Morphe Manager can show that image instead of the user avatar for the bundle (per upstream guidance).

### Compatibility tuning

* **Google News** (`com.google.android.apps.magazines`): pinned to version **5.108.0.644447823** for all News-related patches.
* **TikTok:** **Settings** and **Enable Open Debug** remain **43.6.2-only** (not supported on 43.8.3); descriptions state this explicitly. Other TikTok patches keep their existing 43.6.2 / 43.8.3 splits.

### New app targets (16)

Patches and extensions were added or expanded for:

1. Bandcamp  
2. Angulus  
3. GMX Mail  
4. Free Phone (GMX)  
5. Hex Editor  
6. Google Recorder  
7. irplus  
8. NU.nl  
9. Nothing X  
10. Peacock TV  
11. Viber  
12. TikTok  
13. Twitch  
14. Adobe Photoshop Mix  
15. Threads  
16. Facebook  

### Notes

* Regenerate **`patches-list.json`** with `./gradlew :patches:generatePatchesList` (or full `:patches:build`) after changes.

## [1.0.1](https://github.com/meridianfresco/morphe-meta-patches/compare/v1.0.0...v1.0.1) (2026-04-11)


### Bug Fixes

* Relax sponsored data fingerprint to match non-split APKs ([b585486](https://github.com/meridianfresco/morphe-meta-patches/commit/b585486635154de3267c3ca9cfdb83ef32b00ce7))





### Bug Fixes

* Fixed all issues related to Google Photos  ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))

### Features

* Added Messenger patches — disable typing indicator, hide inbox ads, hide inbox subtabs, hide Facebook button, remove Meta AI ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* Added Inshorts patches — hide ads ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* Added Amazon Shopping patches — always allow deep-linking ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))

# 1.0.0 (2026-04-11)


### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/meridianfresco/morphe-meta-patches/commit/3728b978519854968a56847075aa9d58565a85e3))
* google photos patch logic ([58f8bc8](https://github.com/meridianfresco/morphe-meta-patches/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* make Google Photos spoof build patch self-contained ([7b431dd](https://github.com/meridianfresco/morphe-meta-patches/commit/7b431dd5a707231b5289db60a6fdee5d24b27832))
* make gradlew executable ([3be2ec5](https://github.com/meridianfresco/morphe-meta-patches/commit/3be2ec51fff5990c174c166e7a02625971832063))
* release 1.0.1 ([b68b315](https://github.com/meridianfresco/morphe-meta-patches/commit/b68b31503e57a9253237a3bf2be8bacfd23f7c86))
* release 1.0.1 ([26175cf](https://github.com/meridianfresco/morphe-meta-patches/commit/26175cf2910917be08734a741087018e127a1648))
* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/meridianfresco/morphe-meta-patches/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))
* Remove dead resource mapping imports and fix GPR auth token ([d10cbc6](https://github.com/meridianfresco/morphe-meta-patches/commit/d10cbc647a4c0f3fb847ea03d72cccc9077ed546))


### Features

* release v1.1.0 ([901b2ec](https://github.com/meridianfresco/morphe-meta-patches/commit/901b2ec28fb8e5863d2085d471f0cf529de08422))

## [1.0.3](https://github.com/RookieEnough/De-ReVanced/compare/v1.0.2...v1.0.3) (2026-04-02)


### Bug Fixes

* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/RookieEnough/De-ReVanced/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))





### Bug Fixes

* **Google Recorder — Remove device restrictions:** fingerprint and bytecode hook updated for current app builds — match `RecorderApplication.onCreate` without a fixed feature string, detect any `com.google.android.feature…PIXEL…` `const-string`, and apply the restriction bypass (fixes fingerprint mismatch on newer Recorder versions).

### Maintenance

* **Attribution:** add a standard `Forked from` source header across Kotlin sources that were still missing it.

## [1.0.2](https://github.com/RookieEnough/De-ReVanced/compare/v1.0.1...v1.0.2) (2026-04-02)


### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/RookieEnough/De-ReVanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* release v1.0.3 with Google Recorder fix ([c03c701](https://github.com/RookieEnough/De-ReVanced/commit/c03c701a6ba658afb4f4f2093faca9e6bc91e49c))





### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/RookieEnough/De-ReVanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* **ci:** append `CHANGELOG.md` section to GitHub release notes when present

### Morphe Manager integration

* Bumped Morphe Gradle plugin to **1.2.0** and **morphe-patcher** to **1.3.3** (GitHub Packages: `gpr.user` / `gpr.key`).
* All patches declare **`compatibleWith(Compatibility(...))`** via `AppCompatibilities` so Manager shows human-readable app titles and icon tint colors.
* **`patches-list.json`** now includes a root **`appNames`** map (package → display name) and, for each patch, a **`compatibility`** array with `name`, `packageName`, `appIconColor`, optional `description`, and **`targets`** (version pins). This fixes the detail view where only package IDs appeared after tapping an app.
* **Bundle artwork:** place **`patch-bundle.png`** in the same directory as **`patch-bundles.json`** so Morphe Manager can show that image instead of the user avatar for the bundle (per upstream guidance).

### Compatibility tuning

* **Google News** (`com.google.android.apps.magazines`): pinned to version **5.108.0.644447823** for all News-related patches.
* **TikTok:** **Settings** and **Enable Open Debug** remain **43.6.2-only** (not supported on 43.8.3); descriptions state this explicitly. Other TikTok patches keep their existing 43.6.2 / 43.8.3 splits.

### New app targets (16)

Patches and extensions were added or expanded for:

1. Bandcamp  
2. Angulus  
3. GMX Mail  
4. Free Phone (GMX)  
5. Hex Editor  
6. Google Recorder  
7. irplus  
8. NU.nl  
9. Nothing X  
10. Peacock TV  
11. Viber  
12. TikTok  
13. Twitch  
14. Adobe Photoshop Mix  
15. Threads  
16. Facebook  

### Notes

* Regenerate **`patches-list.json`** with `./gradlew :patches:generatePatchesList` (or full `:patches:build`) after changes.

## [1.0.3](https://github.com/RookieEnough/De-ReVanced/compare/v1.0.2...v1.0.3) (2026-04-01)

### Bug Fixes

* **Google Recorder — Remove device restrictions:** fingerprint and bytecode hook updated for current app builds — match `RecorderApplication.onCreate` without a fixed feature string, detect any `com.google.android.feature…PIXEL…` `const-string`, and apply the restriction bypass (fixes fingerprint mismatch on newer Recorder versions).

### Maintenance

* **Attribution:** add a standard `Forked from` source header across Kotlin sources that were still missing it.

## [1.0.2](https://github.com/RookieEnough/De-ReVanced/compare/v1.0.1...v1.0.2) (2026-04-01)

### Bug Fixes

* **ci:** restore semantic-release rules so feat, fix, and release commits trigger versions ([3728b97](https://github.com/RookieEnough/De-ReVanced/commit/3728b978519854968a56847075aa9d58565a85e3))
* **ci:** append `CHANGELOG.md` section to GitHub release notes when present

### Morphe Manager integration

* Bumped Morphe Gradle plugin to **1.2.0** and **morphe-patcher** to **1.3.3** (GitHub Packages: `gpr.user` / `gpr.key`).
* All patches declare **`compatibleWith(Compatibility(...))`** via `AppCompatibilities` so Manager shows human-readable app titles and icon tint colors.
* **`patches-list.json`** now includes a root **`appNames`** map (package → display name) and, for each patch, a **`compatibility`** array with `name`, `packageName`, `appIconColor`, optional `description`, and **`targets`** (version pins). This fixes the detail view where only package IDs appeared after tapping an app.
* **Bundle artwork:** place **`patch-bundle.png`** in the same directory as **`patch-bundles.json`** so Morphe Manager can show that image instead of the user avatar for the bundle (per upstream guidance).

### Compatibility tuning

* **Google News** (`com.google.android.apps.magazines`): pinned to version **5.108.0.644447823** for all News-related patches.
* **TikTok:** **Settings** and **Enable Open Debug** remain **43.6.2-only** (not supported on 43.8.3); descriptions state this explicitly. Other TikTok patches keep their existing 43.6.2 / 43.8.3 splits.

### New app targets (16)

Patches and extensions were added or expanded for:

1. Bandcamp  
2. Angulus  
3. GMX Mail  
4. Free Phone (GMX)  
5. Hex Editor  
6. Google Recorder  
7. irplus  
8. NU.nl  
9. Nothing X  
10. Peacock TV  
11. Viber  
12. TikTok  
13. Twitch  
14. Adobe Photoshop Mix  
15. Threads  
16. Facebook  

### Notes

* Regenerate **`patches-list.json`** with `./gradlew :patches:generatePatchesList` (or full `:patches:build`) after changes.

---

## [1.0.1](https://github.com/RookieEnough/De-ReVanced/compare/v1.0.0...v1.0.1) (2026-03-06)

### Bug Fixes

* Fixed all issues related to Google Photos  ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))

### Features

* Added Messenger patches — disable typing indicator, hide inbox ads, hide inbox subtabs, hide Facebook button, remove Meta AI ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* Added Inshorts patches — hide ads ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
* Added Amazon Shopping patches — always allow deep-linking ([58f8bc8](https://github.com/RookieEnough/De-ReVanced/commit/58f8bc80dfd601cfe5a5dfee81e64d78bab0f496))
