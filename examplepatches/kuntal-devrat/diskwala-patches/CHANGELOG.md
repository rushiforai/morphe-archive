## [1.0.3](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.2...v1.0.3) (2026-09-02)

### 🐛 Bug Fixes

* **morphe:** preserve Hermes bundle replacements ([c8f0b9e](https://github.com/kuntal-devrat/diskwala-patches/commit/c8f0b9e586c403bf8401f8da91f5287a67195312))

## [1.0.2](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.1...v1.0.2) (2026-09-02)

### 🐛 Bug Fixes

* **morphe:** hide consumed link label ([bfd64c3](https://github.com/kuntal-devrat/diskwala-patches/commit/bfd64c3d631216cd6e28d6cc8756a2246f98f607))

## [1.0.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.0...v1.0.1) (2026-09-02)

### 🐛 Bug Fixes

* **morphe:** handle legacy text input event ([2f74d59](https://github.com/kuntal-devrat/diskwala-patches/commit/2f74d5928a5d71d28680160b0f6d64c79c1f1c82))

## 1.0.0 (2026-09-02)

### 🐛 Bug Fixes

* appIconColor must be 0xRRGGBB int ([1091999](https://github.com/kuntal-devrat/diskwala-patches/commit/1091999d9d509b176c9f79d56ebd326573e360aa))
* bump gradle wrapper to 9.3.1 for AGP version-check ([f987a33](https://github.com/kuntal-devrat/diskwala-patches/commit/f987a33db42166b6ab27f43ec91043bfcc66fba1))
* bypass PairIP license check redirecting to Play Store ([4186310](https://github.com/kuntal-devrat/diskwala-patches/commit/4186310c4e5633cec65dcecb9d83cb1393c34de2))
* **ci:** keep PAT out of committed gradle.properties (use user-level) ([66da573](https://github.com/kuntal-devrat/diskwala-patches/commit/66da5739f3846be99529743f6c28c42c5fa45e41))
* configure morphe patches build correctly with morphe-patches-library ([3816037](https://github.com/kuntal-devrat/diskwala-patches/commit/381603786721827368d5659cc3e82c29bab9880f))
* **diskwala:** complete end-to-end anti-tamper bypass, OpenSSL PLT resolution, JSI HostObject safety, and UI crash fixes ([c94e035](https://github.com/kuntal-devrat/diskwala-patches/commit/c94e035b960ac7e4abb420e8c2ef9f33b98e82ff))
* InMobi fingerprint too strict; make all fingerprint patches fault-tolerant ([f1955a8](https://github.com/kuntal-devrat/diskwala-patches/commit/f1955a8721770105046f169228eab9f972b1366c))
* make gradlew executable for CI ([8a08108](https://github.com/kuntal-devrat/diskwala-patches/commit/8a08108a5c02e0a2cebccb5f77a0956d52adf63d))
* merge Morphe stability fixes ([22e97cc](https://github.com/kuntal-devrat/diskwala-patches/commit/22e97cc230f6a986c10e5184b185508d799b003a))
* **morphe:** add SystemProps null-safety and FirebaseInitProvider stubs to prevent startup crash ([d1a6b4e](https://github.com/kuntal-devrat/diskwala-patches/commit/d1a6b4edf081875d368987b312f272e608d9e856))
* **morphe:** stabilize startup and grpc initialization ([ac487ef](https://github.com/kuntal-devrat/diskwala-patches/commit/ac487ef93d4873c1dfd2ec600a4babc901a527d2))
* **morphe:** sync complete master anti-tamper, PairIP licensing bypass, and UI stabilization suite ([2401187](https://github.com/kuntal-devrat/diskwala-patches/commit/24011870e5909011be525e2c04320a50215a0abb))
* **morphe:** sync SystemProps and Firebase startup fixes to main ([33a0a78](https://github.com/kuntal-devrat/diskwala-patches/commit/33a0a78e36d35b0a2ec55c8f5d0301dd5164f11b))
* **morphe:** update DisableForceUpdatePatch and Fingerprints to directly stub all PairIP LicenseClient, LicenseContentProvider, LicenseActivity, and Switch measurement methods ([a16adbf](https://github.com/kuntal-devrat/diskwala-patches/commit/a16adbf9b87d3af3b01f3da08f0b10eaa6e2f45e))
* remove VMRunner null-stubs - PairIP-transformed call sites crash on System.getProperty(null) ([0b02dfe](https://github.com/kuntal-devrat/diskwala-patches/commit/0b02dfedd6e81f5503ec1954a6a5fc479ab17d54))
* revert build config to template minimal to fix unresolved morphe reference ([94e9d50](https://github.com/kuntal-devrat/diskwala-patches/commit/94e9d5067db443704dfff86f0cf401710d1ea3b4))
* **upload:** patch ReactSwitchShadowNode measure and sanitize all XML drawables with [@null](https://github.com/null) placeholders ([115f4a2](https://github.com/kuntal-devrat/diskwala-patches/commit/115f4a21a8339c4fc13610dfc1894f4ece7b9cfe))
* UTF-8 encode README generator; add generated README ([53a49b2](https://github.com/kuntal-devrat/diskwala-patches/commit/53a49b2aa7256abba05ae49ec89dfde4a46268eb))

### ✨ New Features

* initial DiskWala patches - disable ads & forced update (24.5/334) ([f73ec20](https://github.com/kuntal-devrat/diskwala-patches/commit/f73ec20c767114ce12af8460df298fbe17c1f87c))
* mirror Morphe registry artifacts for auth-free CI builds ([6c677dd](https://github.com/kuntal-devrat/diskwala-patches/commit/6c677dddb6975f47605314b238c2045a4641d202))

## [1.0.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.0...v1.0.1) (2026-09-02)

### 🐛 Bug Fixes

* **morphe:** add SystemProps null-safety and FirebaseInitProvider stubs to prevent startup crash ([d1a6b4e](https://github.com/kuntal-devrat/diskwala-patches/commit/d1a6b4edf081875d368987b312f272e608d9e856))
* **morphe:** sync SystemProps and Firebase startup fixes to main ([33a0a78](https://github.com/kuntal-devrat/diskwala-patches/commit/33a0a78e36d35b0a2ec55c8f5d0301dd5164f11b))

## 1.0.0-dev.1 (2026-09-02)

### 🐛 Bug Fixes

* appIconColor must be 0xRRGGBB int ([1091999](https://github.com/kuntal-devrat/diskwala-patches/commit/1091999d9d509b176c9f79d56ebd326573e360aa))
* bump gradle wrapper to 9.3.1 for AGP version-check ([f987a33](https://github.com/kuntal-devrat/diskwala-patches/commit/f987a33db42166b6ab27f43ec91043bfcc66fba1))
* bypass PairIP license check redirecting to Play Store ([4186310](https://github.com/kuntal-devrat/diskwala-patches/commit/4186310c4e5633cec65dcecb9d83cb1393c34de2))
* **ci:** keep PAT out of committed gradle.properties (use user-level) ([66da573](https://github.com/kuntal-devrat/diskwala-patches/commit/66da5739f3846be99529743f6c28c42c5fa45e41))
* configure morphe patches build correctly with morphe-patches-library ([3816037](https://github.com/kuntal-devrat/diskwala-patches/commit/381603786721827368d5659cc3e82c29bab9880f))
* **diskwala:** complete end-to-end anti-tamper bypass, OpenSSL PLT resolution, JSI HostObject safety, and UI crash fixes ([c94e035](https://github.com/kuntal-devrat/diskwala-patches/commit/c94e035b960ac7e4abb420e8c2ef9f33b98e82ff))
* InMobi fingerprint too strict; make all fingerprint patches fault-tolerant ([f1955a8](https://github.com/kuntal-devrat/diskwala-patches/commit/f1955a8721770105046f169228eab9f972b1366c))
* make gradlew executable for CI ([8a08108](https://github.com/kuntal-devrat/diskwala-patches/commit/8a08108a5c02e0a2cebccb5f77a0956d52adf63d))
* **morphe:** sync complete master anti-tamper, PairIP licensing bypass, and UI stabilization suite ([2401187](https://github.com/kuntal-devrat/diskwala-patches/commit/24011870e5909011be525e2c04320a50215a0abb))
* **morphe:** update DisableForceUpdatePatch and Fingerprints to directly stub all PairIP LicenseClient, LicenseContentProvider, LicenseActivity, and Switch measurement methods ([a16adbf](https://github.com/kuntal-devrat/diskwala-patches/commit/a16adbf9b87d3af3b01f3da08f0b10eaa6e2f45e))
* remove VMRunner null-stubs - PairIP-transformed call sites crash on System.getProperty(null) ([0b02dfe](https://github.com/kuntal-devrat/diskwala-patches/commit/0b02dfedd6e81f5503ec1954a6a5fc479ab17d54))
* revert build config to template minimal to fix unresolved morphe reference ([94e9d50](https://github.com/kuntal-devrat/diskwala-patches/commit/94e9d5067db443704dfff86f0cf401710d1ea3b4))
* **upload:** patch ReactSwitchShadowNode measure and sanitize all XML drawables with [@null](https://github.com/null) placeholders ([115f4a2](https://github.com/kuntal-devrat/diskwala-patches/commit/115f4a21a8339c4fc13610dfc1894f4ece7b9cfe))
* UTF-8 encode README generator; add generated README ([53a49b2](https://github.com/kuntal-devrat/diskwala-patches/commit/53a49b2aa7256abba05ae49ec89dfde4a46268eb))

### ✨ New Features

* initial DiskWala patches - disable ads & forced update (24.5/334) ([f73ec20](https://github.com/kuntal-devrat/diskwala-patches/commit/f73ec20c767114ce12af8460df298fbe17c1f87c))
* mirror Morphe registry artifacts for auth-free CI builds ([6c677dd](https://github.com/kuntal-devrat/diskwala-patches/commit/6c677dddb6975f47605314b238c2045a4641d202))

## [1.0.5-dev.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.4...v1.0.5-dev.1) (2026-09-02)

### 🐛 Bug Fixes

* **morphe:** update DisableForceUpdatePatch and Fingerprints to directly stub all PairIP LicenseClient, LicenseContentProvider, LicenseActivity, and Switch measurement methods ([a16adbf](https://github.com/kuntal-devrat/diskwala-patches/commit/a16adbf9b87d3af3b01f3da08f0b10eaa6e2f45e))

## [1.0.4](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.3...v1.0.4) (2026-09-02)

### 🐛 Bug Fixes

* **diskwala:** complete end-to-end anti-tamper bypass, OpenSSL PLT resolution, JSI HostObject safety, and UI crash fixes ([c94e035](https://github.com/kuntal-devrat/diskwala-patches/commit/c94e035b960ac7e4abb420e8c2ef9f33b98e82ff))
* **upload:** patch ReactSwitchShadowNode measure and sanitize all XML drawables with [@null](https://github.com/null) placeholders ([115f4a2](https://github.com/kuntal-devrat/diskwala-patches/commit/115f4a21a8339c4fc13610dfc1894f4ece7b9cfe))

## [1.0.4-dev.2](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.4-dev.1...v1.0.4-dev.2) (2026-09-02)

### 🐛 Bug Fixes

* **upload:** patch ReactSwitchShadowNode measure and sanitize all XML drawables with [@null](https://github.com/null) placeholders ([115f4a2](https://github.com/kuntal-devrat/diskwala-patches/commit/115f4a21a8339c4fc13610dfc1894f4ece7b9cfe))

## [1.0.4-dev.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.3...v1.0.4-dev.1) (2026-09-02)

### 🐛 Bug Fixes

* **diskwala:** complete end-to-end anti-tamper bypass, OpenSSL PLT resolution, JSI HostObject safety, and UI crash fixes ([c94e035](https://github.com/kuntal-devrat/diskwala-patches/commit/c94e035b960ac7e4abb420e8c2ef9f33b98e82ff))

## [1.0.3](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.2...v1.0.3) (2026-08-29)

### 🐛 Bug Fixes

* bypass PairIP license check redirecting to Play Store ([4186310](https://github.com/kuntal-devrat/diskwala-patches/commit/4186310c4e5633cec65dcecb9d83cb1393c34de2))

## [1.0.3-dev.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.2...v1.0.3-dev.1) (2026-08-29)

### 🐛 Bug Fixes

* bypass PairIP license check redirecting to Play Store ([4186310](https://github.com/kuntal-devrat/diskwala-patches/commit/4186310c4e5633cec65dcecb9d83cb1393c34de2))

## [1.0.2](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.1...v1.0.2) (2026-08-29)

### 🐛 Bug Fixes

* remove VMRunner null-stubs - PairIP-transformed call sites crash on System.getProperty(null) ([0b02dfe](https://github.com/kuntal-devrat/diskwala-patches/commit/0b02dfedd6e81f5503ec1954a6a5fc479ab17d54))

## [1.0.2-dev.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.1...v1.0.2-dev.1) (2026-08-29)

### 🐛 Bug Fixes

* remove VMRunner null-stubs - PairIP-transformed call sites crash on System.getProperty(null) ([0b02dfe](https://github.com/kuntal-devrat/diskwala-patches/commit/0b02dfedd6e81f5503ec1954a6a5fc479ab17d54))

## [1.0.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.0...v1.0.1) (2026-08-29)

### 🐛 Bug Fixes

* InMobi fingerprint too strict; make all fingerprint patches fault-tolerant ([f1955a8](https://github.com/kuntal-devrat/diskwala-patches/commit/f1955a8721770105046f169228eab9f972b1366c))

## [1.0.1-dev.1](https://github.com/kuntal-devrat/diskwala-patches/compare/v1.0.0...v1.0.1-dev.1) (2026-08-29)

### 🐛 Bug Fixes

* InMobi fingerprint too strict; make all fingerprint patches fault-tolerant ([f1955a8](https://github.com/kuntal-devrat/diskwala-patches/commit/f1955a8721770105046f169228eab9f972b1366c))

## 1.0.0 (2026-08-29)

### 🐛 Bug Fixes

* appIconColor must be 0xRRGGBB int ([1091999](https://github.com/kuntal-devrat/diskwala-patches/commit/1091999d9d509b176c9f79d56ebd326573e360aa))
* bump gradle wrapper to 9.3.1 for AGP version-check ([f987a33](https://github.com/kuntal-devrat/diskwala-patches/commit/f987a33db42166b6ab27f43ec91043bfcc66fba1))
* **ci:** keep PAT out of committed gradle.properties (use user-level) ([66da573](https://github.com/kuntal-devrat/diskwala-patches/commit/66da5739f3846be99529743f6c28c42c5fa45e41))
* configure morphe patches build correctly with morphe-patches-library ([3816037](https://github.com/kuntal-devrat/diskwala-patches/commit/381603786721827368d5659cc3e82c29bab9880f))
* make gradlew executable for CI ([8a08108](https://github.com/kuntal-devrat/diskwala-patches/commit/8a08108a5c02e0a2cebccb5f77a0956d52adf63d))
* revert build config to template minimal to fix unresolved morphe reference ([94e9d50](https://github.com/kuntal-devrat/diskwala-patches/commit/94e9d5067db443704dfff86f0cf401710d1ea3b4))
* UTF-8 encode README generator; add generated README ([53a49b2](https://github.com/kuntal-devrat/diskwala-patches/commit/53a49b2aa7256abba05ae49ec89dfde4a46268eb))

### ✨ New Features

* initial DiskWala patches - disable ads & forced update (24.5/334) ([f73ec20](https://github.com/kuntal-devrat/diskwala-patches/commit/f73ec20c767114ce12af8460df298fbe17c1f87c))
* mirror Morphe registry artifacts for auth-free CI builds ([6c677dd](https://github.com/kuntal-devrat/diskwala-patches/commit/6c677dddb6975f47605314b238c2045a4641d202))

## 1.0.0-dev.1 (2026-08-29)

### 🐛 Bug Fixes

* appIconColor must be 0xRRGGBB int ([1091999](https://github.com/kuntal-devrat/diskwala-patches/commit/1091999d9d509b176c9f79d56ebd326573e360aa))
* bump gradle wrapper to 9.3.1 for AGP version-check ([f987a33](https://github.com/kuntal-devrat/diskwala-patches/commit/f987a33db42166b6ab27f43ec91043bfcc66fba1))
* **ci:** keep PAT out of committed gradle.properties (use user-level) ([66da573](https://github.com/kuntal-devrat/diskwala-patches/commit/66da5739f3846be99529743f6c28c42c5fa45e41))
* configure morphe patches build correctly with morphe-patches-library ([3816037](https://github.com/kuntal-devrat/diskwala-patches/commit/381603786721827368d5659cc3e82c29bab9880f))
* make gradlew executable for CI ([8a08108](https://github.com/kuntal-devrat/diskwala-patches/commit/8a08108a5c02e0a2cebccb5f77a0956d52adf63d))
* revert build config to template minimal to fix unresolved morphe reference ([94e9d50](https://github.com/kuntal-devrat/diskwala-patches/commit/94e9d5067db443704dfff86f0cf401710d1ea3b4))
* UTF-8 encode README generator; add generated README ([53a49b2](https://github.com/kuntal-devrat/diskwala-patches/commit/53a49b2aa7256abba05ae49ec89dfde4a46268eb))

### ✨ New Features

* initial DiskWala patches - disable ads & forced update (24.5/334) ([f73ec20](https://github.com/kuntal-devrat/diskwala-patches/commit/f73ec20c767114ce12af8460df298fbe17c1f87c))
* mirror Morphe registry artifacts for auth-free CI builds ([6c677dd](https://github.com/kuntal-devrat/diskwala-patches/commit/6c677dddb6975f47605314b238c2045a4641d202))
