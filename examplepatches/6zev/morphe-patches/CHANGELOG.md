## [1.7.12](https://github.com/6zev/morphe-patches/compare/v1.7.11...v1.7.12) (2026-11-27)

### 🐛 Bug Fixes

* **patches:** stop emitting a monitor the heartbeat method never took ([e76e665](https://github.com/6zev/morphe-patches/commit/e76e665f9b6569b335866efb309ec8544b74e0bf))

## [1.7.11](https://github.com/6zev/morphe-patches/compare/v1.7.10...v1.7.11) (2026-11-27)

### 🐛 Bug Fixes

* **patches:** answer the DataStore counter from memory so the mapping never aborts ([c3aaf59](https://github.com/6zev/morphe-patches/commit/c3aaf5947edc9bf9714a619d83f08665d9b022c8))

## [1.7.10](https://github.com/6zev/morphe-patches/compare/v1.7.9...v1.7.10) (2026-11-27)

### 🐛 Bug Fixes

* **patches:** open the Firebase preference store under the store's own name ([65fb85d](https://github.com/6zev/morphe-patches/commit/65fb85d19d081056b395350550d7e46d050b641c))

## [1.7.9](https://github.com/6zev/morphe-patches/compare/v1.7.8...v1.7.9) (2026-11-27)

### 🐛 Bug Fixes

* **patches:** keep startup off the DataStore shared counter and the heartbeat store ([b5c6843](https://github.com/6zev/morphe-patches/commit/b5c6843c3ab014940de760748627b250a6d65c32))

## [1.7.8](https://github.com/6zev/morphe-patches/compare/v1.7.7...v1.7.8) (2026-11-27)

### 🐛 Bug Fixes

* **patches:** find the licence checker by shape and keep patched classes in their own dex ([b5beb3c](https://github.com/6zev/morphe-patches/commit/b5beb3c660fbec615c1027fbcee89103ba9a74bb))

## [1.7.7](https://github.com/6zev/morphe-patches/compare/v1.7.6...v1.7.7) (2026-11-26)

### 🐛 Bug Fixes

* **patches:** drop the native licence disarm, keep the Java grant only ([ead2419](https://github.com/6zev/morphe-patches/commit/ead2419948d5072f34f79db486f01896786c780e))

## [1.7.6](https://github.com/6zev/morphe-patches/compare/v1.7.5...v1.7.6) (2026-11-26)

### 🐛 Bug Fixes

* **patches:** land the engine disarm on the branch, not the word after it ([e04781f](https://github.com/6zev/morphe-patches/commit/e04781f1851da2209c3e8879591ec842b35b2693))

## [1.7.5](https://github.com/6zev/morphe-patches/compare/v1.7.4...v1.7.5) (2026-11-26)

### 🐛 Bug Fixes

* **patches:** disarm every licence refusal in the engine, not just the routine's ([6186676](https://github.com/6zev/morphe-patches/commit/6186676e008220c98061c944dd861a090154230c))

## [1.7.4](https://github.com/6zev/morphe-patches/compare/v1.7.3...v1.7.4) (2026-11-26)

### 🐛 Bug Fixes

* **patches:** disarm only the engine refusals, never its callers ([71a7df5](https://github.com/6zev/morphe-patches/commit/71a7df5b8e9fad327e977c9bb8de13e33840f3fd))

## [1.7.3](https://github.com/6zev/morphe-patches/compare/v1.7.2...v1.7.3) (2026-11-26)

### 🐛 Bug Fixes

* **patches:** anchor the arm32 shell-command guard on its decision seats ([bffd0e0](https://github.com/6zev/morphe-patches/commit/bffd0e0a02d8ab629a605266757c5226e1931eb3))

## [1.7.2](https://github.com/6zev/morphe-patches/compare/v1.7.1...v1.7.2) (2026-11-26)

### 🐛 Bug Fixes

* **build:** do not query runPatch properties during configuration ([c659ea6](https://github.com/6zev/morphe-patches/commit/c659ea69e086adf02b599d1f22e7f11bfade53cd))

## [1.7.1](https://github.com/6zev/morphe-patches/compare/v1.7.0...v1.7.1) (2026-11-16)

### 🐛 Bug Fixes

* never call the engine's verification routine, leave it intact ([6dcc8c2](https://github.com/6zev/morphe-patches/commit/6dcc8c27f2ec9ebfaf114116226f7fa8cbc1d28f))

## [1.7.1](https://github.com/6zev/morphe-patches/compare/v1.7.0...v1.7.1) (2026-11-16)

### 🐛 Bug Fixes

* **keep the engine's verification routine intact and stop calling it.** Both earlier attempts edited the routine itself, and both failed on the device: overwriting its prologue with `mov w0, wzr; ret` left the engine half-initialised, so `nativeActions` - the JNI entry point behind every key-code injection - silently did nothing and a remote's dialpad stayed dead; running it in full made the app ANR during startup (`failed to complete startup`, 98% CPU). The routine has exactly four callers in the ARM64 build (and four in the ARM32 one), so those `bl` sites are now no-ops and the routine is never entered. The prologue and body are untouched, which is also what a build without the protection does - 3.6.0 ships the same `nativeActions` key-code path and its dialpad works.
* **drop the dialpad patch that went through `InputManager`**: it made every dialpad key raise `SecurityException: Injecting to another application requires INJECT_EVENTS permission`, since `INJECT_EVENTS` is a signature permission the app cannot hold. It also replaced the fallback unconditionally, so it broke key injection even with "ADB speed up" off.

## [1.7.0](https://github.com/6zev/morphe-patches/compare/v1.6.10...v1.7.0) (2026-11-16)

### ✨ New Features

* inject dialpad key codes without the native engine ([31a5e44](https://github.com/6zev/morphe-patches/commit/31a5e44582b956e3b2a806603a25f34511b45ea4))

## [1.6.10](https://github.com/6zev/morphe-patches/compare/v1.6.9...v1.6.10) (2026-11-16)

### 🐛 Bug Fixes

* disarm libd traps without removing the verification routine ([2e79d09](https://github.com/6zev/morphe-patches/commit/2e79d09d6dfbc9004ce3f9975f1407ab54358c6e))

## [1.6.11](https://github.com/6zev/morphe-patches/compare/v1.6.10...v1.6.11) (2026-11-16)

### 🐛 Bug Fixes

* **dialpad without the engine**: the key code was the one input still injected through the native engine (`nativeActions`), which silently does nothing on a re-signed APK - that is why a remote's numpad was dead while pointer input, which uses the app's own `InputManager` path, kept working. The fallback now builds a `KeyEvent` DOWN/UP pair and injects it with `K1/o.R(int, int)`, the same call the app already uses for its own server endpoints.
* revert the native engine change that removed the verification routine: running it in full made the app ANR (`failed to complete startup`, 98% CPU). The traps are disarmed and the routine is skipped again, which is known to start.

## [1.6.9](https://github.com/6zev/morphe-patches/compare/v1.6.8...v1.6.9) (2026-11-10)

### 🐛 Bug Fixes

* keep ADB input working without the speed-up server ([0f08d21](https://github.com/6zev/morphe-patches/commit/0f08d21746f02a18d183b3a7de9aac1455ecad2b))

## [1.6.8](https://github.com/6zev/morphe-patches/compare/v1.6.7...v1.6.8) (2026-11-08)

### 🐛 Bug Fixes

* replace Looper.prepare() with invoke-static myLooper to satisfy verifier type requirements ([3d6c794](https://github.com/6zev/morphe-patches/commit/3d6c7946dade822065ff26dcbf89b2160bc9a97a))
* drop the Looper patch: `Server.main` must keep `Looper.prepare()`. The device log line `MainLooper already prepared` comes from `P3/C2` *inside* the server coroutine, so the prepare had already succeeded; replacing it removed the Looper that `Looper.loop()` needs and made the server exit 255 on every start
* add **Input without the ADB server**: gate every `localhost:15000` injection site on the app's own port probe (`h3.e.n()`), so numpad keys, pointer and gamepad input fall back to local injection while the speed-up server is down
* **ADB server log** now appends `tvqa-server-exit=<status>`, telling `255` (System.exit), `137` (SIGKILL), `132` (SIGILL) and `139` (SIGSEGV) apart

## [1.6.7](https://github.com/6zev/morphe-patches/compare/v1.6.6...v1.6.7) (2026-11-08)

### 🐛 Bug Fixes

* ensure Looper prepare nop is properly compiled ([4e3ef72](https://github.com/6zev/morphe-patches/commit/4e3ef72e2ea15006044796ac4640107e9e978dc5))

## [1.6.6](https://github.com/6zev/morphe-patches/compare/v1.6.5...v1.6.6) (2026-11-08)

### 🐛 Bug Fixes

* turn Looper.prepare into nop in Server.main to eliminate VerifyError ([fe6b950](https://github.com/6zev/morphe-patches/commit/fe6b95018c1e9aac81fcec0216961aa25785835c))

## [1.6.5](https://github.com/6zev/morphe-patches/compare/v1.6.4...v1.6.5) (2026-11-08)

### 🐛 Bug Fixes

* use safe register for Looper guard to avoid VerifyError ([f5ef3ec](https://github.com/6zev/morphe-patches/commit/f5ef3ec68938f2875d25c84792a72bbfb0489a56))

## [1.6.4](https://github.com/6zev/morphe-patches/compare/v1.6.3...v1.6.4) (2026-11-07)

### 🐛 Bug Fixes

* patch ARM64 server self-stop calls ([843251e](https://github.com/6zev/morphe-patches/commit/843251e372546d202226cb1c361ab600791651d9))

## [1.6.3](https://github.com/6zev/morphe-patches/compare/v1.6.2...v1.6.3) (2026-11-07)

### 🐛 Bug Fixes

* reuse prepared Looper in ADB server ([c81126a](https://github.com/6zev/morphe-patches/commit/c81126a9f4d85e619405178f34bcd1e77d786eba))

## [1.6.2](https://github.com/6zev/morphe-patches/compare/v1.6.1...v1.6.2) (2026-11-07)

### 🐛 Bug Fixes

* match case-insensitive DEX logger opcodes ([71a63c5](https://github.com/6zev/morphe-patches/commit/71a63c5358793546684601b9191fc3de51f2fa21))

## [1.6.1](https://github.com/6zev/morphe-patches/compare/v1.6.0...v1.6.1) (2026-11-07)

### 🐛 Bug Fixes

* make ADB logger detection resilient ([ba7799a](https://github.com/6zev/morphe-patches/commit/ba7799a8221d0647715bd657c819ce74756b2cd7))

## [1.6.0](https://github.com/6zev/morphe-patches/compare/v1.5.1...v1.6.0) (2026-11-03)

### ✨ New Features

* make the ADB server's own log readable ([33c92a1](https://github.com/6zev/morphe-patches/commit/33c92a16843741694388cfc9cf527470bb667bf0))

## [1.5.1](https://github.com/6zev/morphe-patches/compare/v1.5.0...v1.5.1) (2026-11-02)

### 🐛 Bug Fixes

* no-op the liba.so call that force-stops the app ([cfeb192](https://github.com/6zev/morphe-patches/commit/cfeb192d8ef6e27cab3d9963b852cde6c01f327e))

## [1.5.0](https://github.com/6zev/morphe-patches/compare/v1.4.2...v1.5.0) (2026-11-02)

### ✨ New Features

* drop self-stop commands in the ADB shell helper ([4f1a97b](https://github.com/6zev/morphe-patches/commit/4f1a97b3d3fe2e1b27348f692b0b1464a87f2a43))

## [1.4.2](https://github.com/6zev/morphe-patches/compare/v1.4.1...v1.4.2) (2026-11-02)

### 🐛 Bug Fixes

* the self-stop guard tested the branch the wrong way round ([107fea2](https://github.com/6zev/morphe-patches/commit/107fea26477184f3d809a630e30cd8cd990e32dd))

## [1.4.1](https://github.com/6zev/morphe-patches/compare/v1.4.0...v1.4.1) (2026-11-02)

### 🐛 Bug Fixes

* make the app's own stop command a no-op ([26056ba](https://github.com/6zev/morphe-patches/commit/26056bae4198a4e362314f56d8445001fa5b4d45))

## [1.4.0](https://github.com/6zev/morphe-patches/compare/v1.3.3...v1.4.0) (2026-11-02)

### ✨ New Features

* keep the app out of its own Stop recent apps list ([f483382](https://github.com/6zev/morphe-patches/commit/f483382fc68dd6bda2bee0ca1c23406a76087f1d))

## [1.3.3](https://github.com/6zev/morphe-patches/compare/v1.3.2...v1.3.3) (2026-11-02)

### 🐛 Bug Fixes

* disable the verification routine instead of disarming it ([d45a1d9](https://github.com/6zev/morphe-patches/commit/d45a1d903bde9d9f855ea50e9d3abb2133319b4e))

## [1.3.2](https://github.com/6zev/morphe-patches/compare/v1.3.1...v1.3.2) (2026-11-02)

### 🐛 Bug Fixes

* neutralise every trap, and the anti-tamper constructor on 32-bit ([4c9ce8c](https://github.com/6zev/morphe-patches/commit/4c9ce8c6d26da3aa52aedae3530cab4736df93e5))

## [1.3.1](https://github.com/6zev/morphe-patches/compare/v1.3.0...v1.3.1) (2026-11-02)

### 🐛 Bug Fixes

* read the build guard at the width of the instruction ([6f4483b](https://github.com/6zev/morphe-patches/commit/6f4483b3e9f48caa4d39e223b402fb1689f4b9cb))

## [1.3.0](https://github.com/6zev/morphe-patches/compare/v1.2.1...v1.3.0) (2026-11-02)

### ✨ New Features

* patch the 32-bit ARM engine library too ([f6941fd](https://github.com/6zev/morphe-patches/commit/f6941fdcadfbcdcef71bd60404aad67a70d0d70a))

## [1.2.1](https://github.com/6zev/morphe-patches/compare/v1.2.0...v1.2.1) (2026-11-02)

### 🐛 Bug Fixes

* nop the trap instructions instead of replacing the whole routine ([dd444b2](https://github.com/6zev/morphe-patches/commit/dd444b21b9c41bf7c4ce148c57de122f66b5d106)), closes [#0](https://github.com/6zev/morphe-patches/issues/0)

## [1.2.0](https://github.com/6zev/morphe-patches/compare/v1.1.0...v1.2.0) (2026-11-02)

### ✨ New Features

* patch the native engine library instead of dropping it ([3577807](https://github.com/6zev/morphe-patches/commit/35778076f22512249c76c0364432ac5b8ea643df)), closes [#0](https://github.com/6zev/morphe-patches/issues/0)

## [1.1.0](https://github.com/6zev/morphe-patches/compare/v1.0.2...v1.1.0) (2026-11-01)

### ✨ New Features

* merge the two patches into a single Unlock premium patch ([49a74ab](https://github.com/6zev/morphe-patches/commit/49a74ab4e55420b013ae874dd6b792f58ea61ee8))

## [1.0.2](https://github.com/6zev/morphe-patches/compare/v1.0.1...v1.0.2) (2026-11-01)

### 🐛 Bug Fixes

* stub the native engine methods so the app no longer dies with UnsatisfiedLinkError ([a87caf2](https://github.com/6zev/morphe-patches/commit/a87caf2e5d77b7ad6a898ab6d7a7ee31cccfa45c))

## [1.0.1](https://github.com/6zev/morphe-patches/compare/v1.0.0...v1.0.1) (2026-11-01)

### 🐛 Bug Fixes

* point metadata and links at the actual repository ([11c50a4](https://github.com/6zev/morphe-patches/commit/11c50a42c8f5e37aaaa1592b8a4124bc61ca3ef5))

## 1.0.0 (2026-11-01)

### ✨ New Features

* tvQuickActions Pro patches (unlock premium, skip native engine load) ([19dc4f3](https://github.com/6zev/morphe-patches/commit/19dc4f3bab618fbe18e22064022bb94471c11af9))

### 🐛 Bug Fixes

* app icon color must be 0xRRGGBB, not ARGB ([685e31c](https://github.com/6zev/morphe-patches/commit/685e31cc022df377ddc36c1f40c7131850240de6))
* use an Int app icon color literal ([e74b1d0](https://github.com/6zev/morphe-patches/commit/e74b1d0d3bfeaf60c443929bdfddff9df91929be))
