## [1.1.3](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.1.3) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner:** Revert the any-version target added in v1.1.1 and v1.1.2. It was based on a wrong diagnosis; the installed app option was simply under a different menu. Targets are back to `5.16` and `5.15`, restoring the version Morphe recommends

## [1.1.2](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.1.2) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner:** Actually offer the installed app on any version. The null target added in v1.1.1 was listed alongside real ones and dropped by `targets.mapNotNull { it.version }`, so it had no effect. Every target must be null for the manager to treat the patches as version independent

## [1.1.1](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.1.1) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner:** Offer the installed app on any version. Morphe hides that option unless the installed version matches a declared target exactly, so on other builds only the file picker appeared. Neither patch depends on a version; 5.15 and 5.16 remain the verified ones

## [1.1.0](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.1.0) (2026-09-07)

### 🔧 Improvements

* **FriendsTurner:** Trim the bundle to `Force sponsor state` and `Disable license check`, both enabled by default
* **FriendsTurner:** Archive `Remove ads`, `Hide banner ad` and `Hide banner ad (ad-free layout)`. Each disabled a single placement; setting the flag they all depend on covers the same ground. Source kept in `archive/patches/`

## [1.0.8](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.8) (2026-09-07)

### ✨ New Features

* **FriendsTurner:** Add `Force sponsor state`. Sets the ad-free flag itself rather than disabling placements one at a time, so it also covers any placement a future version adds behind the same flag. Off by default; it makes the button read "Continue Sponsoring"

## [1.0.7](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.7) (2026-09-07)

### ✨ New Features

* **FriendsTurner:** Add `Hide banner ad (ad-free layout)`, which forces the app's own sponsor branch instead of replacing the ad view. Selectable alongside `Hide banner ad`; enable one or the other

### 🔧 Improvements

* **FriendsTurner - Hide banner ad:** Correct the earlier claim that the banner was ungated. It is gated by the sponsor check; the flag is loaded once into a register and reused, so a field-read scan misses the second use

## [1.0.6](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.6) (2026-09-07)

### ✨ New Features

* **FriendsTurner:** Add `Hide banner ad` patch. The bottom banner is a separate placement from the interstitial and is not gated by the ad-free flag, so it survived `Remove ads`

## [1.0.5](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.5) (2026-09-07)

### ✨ New Features

* **FriendsTurner:** Add `Disable license check` patch. The app ships with Google Play's automatic integrity protection, so a re-signed build was immediately replaced by the "Get this app from Play" screen

## [1.0.4](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.4) (2026-09-07)

### 🚀 Updated App Support

* **FriendsTurner:** Add support for `5.16`. The 5.16 build renamed every obfuscated identifier the old fingerprint relied on

### 🔧 Improvements

* **FriendsTurner - Remove ads:** Match the ad gate structurally, using only `Boolean.booleanValue()`, the branch opcode, and a no-argument void call on MainActivity, so app rebuilds no longer break it

## [1.0.3](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.3) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner - Remove ads:** Declare the correct application id. The package is `com.peter890331.friendsturner.app`; only the class package omits the `.app` suffix, so patching failed with "Wrong package selected"
* **FriendsTurner - Remove ads:** Require an XAPK bundle. The base APK declares required abi and density splits, so a base-only APK cannot install

## [1.0.2](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.2) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner - Remove ads:** Ship `classes.dex` in the bundle. v1.0.1 contained only JVM class files, so Morphe loaded the source but listed 0 patches

## [1.0.1](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.1) (2026-09-07)

### 🐛 Bug Fixes

* **FriendsTurner - Remove ads:** Correct the fingerprint so the patch actually matches. `Fingerprint`'s `name` is the exact method name, not a label, so v1.0.0 always failed with "Failed to match the fingerprint"

## [1.0.0](https://github.com/miketweaver/friendsturner-patches/releases/tag/v1.0.0) (2026-09-07)

### ✨ New Features

* **FriendsTurner:** Add `Remove ads` patch for 5.15, removing the interstitial ad shown before the screen-capture tool
