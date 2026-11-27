## [1.2.9](https://github.com/Lumi-01/dcinside-personal-patches/compare/v1.2.8...v1.2.9) (2026-11-26)

### 🐛 Bug Fixes

* keep disabled post ad slots collapsed ([ba2a6ff](https://github.com/Lumi-01/dcinside-personal-patches/commit/ba2a6ff99d477d8995e2dd45d0d97f6ea5bf6bdb))

## [1.2.8](https://github.com/Lumi-01/dcinside-personal-patches/compare/v1.2.7...v1.2.8) (2026-11-25)

### 🐛 Bug Fixes

* support DC 5.3.27 options and collapse empty ad slots ([19f2299](https://github.com/Lumi-01/dcinside-personal-patches/commit/19f2299c672d58ea5d6aa6904f931d7dd97a4974))
* use range-safe invokes for 5.3.27 adapters ([e370f2d](https://github.com/Lumi-01/dcinside-personal-patches/commit/e370f2d89b74fccdb6b83fe2624d9f63db063f29))

## [1.2.7](https://github.com/Lumi-01/dcinside-personal-patches/compare/v1.2.6...v1.2.7) (2026-11-25)

### 🐛 Bug Fixes

* add generated patch list section to README ([b892282](https://github.com/Lumi-01/dcinside-personal-patches/commit/b89228254d7455ad2ff52a7132b0f82edc2f415c))
* make Gradle wrapper executable in release workflow ([a5ac623](https://github.com/Lumi-01/dcinside-personal-patches/commit/a5ac623a9099259622f587d6b8c4117a719a749f))
* support DC 5.3.27 update settings ([bec8c0c](https://github.com/Lumi-01/dcinside-personal-patches/commit/bec8c0c3adc286948f24e9153144b2982c303e75))

# 1.0.1 (2026-10-07)

### Changes

* **DC Inside:** Collapse ad gaps in gallery lists and post body/comments; add spacing above the recommendation controls.
* **DC Inside:** Zero six ad-only dimensions, adapted from the Ample 5.3.4 patch and verified against 5.3.6 resources.
* **DC Inside:** Add optional home-section and post-list page-label hiding choices.
* **DC Inside:** Suppress analytics startup and use activated settings on transient remote-config fetch failure.
* **DC Inside:** Make redundant remote-config refresh limiting opt-in and disabled by default to avoid delaying server settings.
* **DC Inside:** Preserve the Realm configuration register when disabling Crashlytics, fixing post opening.

Android 11 and 15 emulator checks covered home and a post; Android 11 also covered gallery list and comments. Login, posting, ad-request counts, and device battery impact are unverified with this bundle.

# 1.0.0 (2026-10-06)

### Features

* **DC Inside:** Disable selected ad loaders and ad spaces.
* **DC Inside:** Remove the in-app rating prompt.
* **DC Inside:** Add local signing compatibility for Morphe-patched APKs.

This release is experimental. The bundle has been applied to the original 5.3.6 APK with Morphe Desktop; full feature and battery testing on a device remains in progress.
