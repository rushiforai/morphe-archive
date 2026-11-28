# lyrics-blur-spotify

A [Morphe](https://morphe.software) patch for the **Spotify Android app** that blurs every lyrics line except the one being sung. The blur fades in and out smoothly (200 ms tween) and is driven by Spotify's own animated blur modifier, so the lyrics screen behaves exactly as before — the unsung lines simply become soft, unreadable shapes while the current line stays sharp.

> **Status: research complete, code reviewed — not yet verified on device.**
> The patch is pinned to Spotify **9.2.4.2644** (`.apkm`). Follow the test checklist in
> [`docs/research.md`](docs/research.md) before considering it working.

## How it works

Spotify 9.2.4.2644 renders lyrics with Jetpack Compose (obfuscated into `p.*`). One composable draws a single lyric line — `p.ksh0.a(...)` — and takes, among others, `Z active` and `Z synced` arguments. The patch injects four instructions right before that line's `Modifier.fillMaxWidth(1f)`-like call:

```
ksh0.a(...)  ── (bytecode patch) ──►  v0 = lxs1.k(v0, LyricsBlurPatch.shouldBlur(p1 /*active*/, p2 /*synced*/))
                                         │                         │
                                         │                         └─ extension: SDK≥31, ENABLED, REQUIRE_SYNCED, !active
                                         └─ Spotify: tween 200ms 0↔12px, graphicsLayer(RenderEffect.blur), skip if ≤0 or API<31
```

`p.lxs1.k` is Spotify's own "blur this Modifier when the flag is true" composable helper — an animated 12 px blur modifier that does nothing below Android 12. The patch never touches Compose types itself; it only decides *when* the blur modifier is attached.

- One patched method covers both Now Playing and fullscreen lyrics (`f0o#h` / `kk1#I` call `ksh0.a`).
- The extension (`extensions/spotify/.../lyricsblur/LyricsBlurPatch.java`) decides whether to blur: Android 12+, `requireSynced` option, `!active`. It catches every `Throwable` and degrades to "don't blur" — a cosmetic patch must never crash the app.
- The anchor call (`p.mtc1.f(v0, 1.0f)`) is verified to occur exactly once in the target method and to use registers `v0`/`v15`; otherwise the patch fails with a descriptive error instead of producing a broken APK.

## Repository layout

**Getting the patch into Morphe:** this repository works as a Morphe **Remote patch source** — add it by URL and Morphe keeps it updated automatically. Morphe → Sources → Add → **Remote** → paste `https://github.com/RoToR003/lyrics-blur-spotify` (or open https://morphe.software/add-source?github=RoToR003/lyrics-blur-spotify). How this works: `patches-bundle.json` at the repo root (kept up to date by CI on every publish) tells Morphe where the bundle is: the rolling prerelease **[bundle-latest](https://github.com/RoToR003/lyrics-blur-spotify/releases/tag/bundle-latest)** with the stable-named asset `patches.mpp` (≈2.5 MB). Direct download: [patches.mpp](https://github.com/RoToR003/lyrics-blur-spotify/releases/download/bundle-latest/patches.mpp). The same `.mpp` is also on every green `Build .mpp` run under **Actions → Artifacts** (`lyrics-blur-spotify-mpp`), or build locally with `scripts/build-mpp.sh`. Details in [`docs/verification.md`](docs/verification.md) M1–M2.

This repository is **not** a standalone build. It carries the patch's source files in the exact
layout expected by [southstar21's Patches](https://github.com/southstar21dev/southstar21-patches),
plus the research behind them. To use the patch, integrate it into that repo — see
[`docs/integration.md`](docs/integration.md), then verify it step by step with
[`docs/verification.md`](docs/verification.md) (via Morphe Manager: build → add source → patch → on-device tests; Morphe CLI as an optional pre-device gate).

```
extensions/spotify/src/main/java/app/southstar21/extension/spotify/lyricsblur/LyricsBlurPatch.java
patches/src/main/kotlin/app/southstar21/patches/spotify/layout/lyricsblur/LyricsBlurFingerprints.kt
patches/src/main/kotlin/app/southstar21/patches/spotify/layout/lyricsblur/LyricsBlurPatch.kt
docs/research.md       — research notes: mechanism, anchors, what was verified
                         against the upstream pins, what is still unverified (uk)
docs/integration.md    — step-by-step integration into southstar21-patches
docs/verification.md   — перевірка патчу через Morphe Manager (M1 build → M2 source →
                         M3 patch+install → M4 tests); Morphe CLI — опційний гейт (uk)
```

## Options

As shown in Morphe Manager, baked into the extension via patch options:

| Option | Default | Meaning |
|---|---|---|
| `requireSynced` (Only for synced lyrics) | `true` | Blur only while the lyrics follow the song. Off → blur also on unsynchronized lyrics pages. |
| `debugLogging` (Debug logging) | `false` | Log what the hook sees to logcat under the tag `LyricsBlur`. Enable for the first test, disable for release. |

## Requirements

- Android 12+ (API 31) for the blur itself; below that the patch is a no-op by design.
- Spotify **9.2.4.2644** APKM from APKMirror. The patch is tied to this build (`p.*` class names change between builds).
- [Morphe Manager](https://morphe.software) (or the southstar21 patches bundle built from source).

## Verification status

| What | How | Result |
|---|---|---|
| Kotlin API usage matches upstream pins | Read-only audit against `morphe-patcher` **v2.4.0** (tag `v2.4.0`, `0aed87c`) and **main** (v2.6.0) | ✅ all symbols exist with matching signatures |
| dexlib2 usage matches the pinned smali | Audit against tag `pin/4220ae75f7` (`4220ae7`, the jitpack pin in `libs.versions.toml`) | ✅ `Opcode.INVOKE_STATIC`, `FiveRegisterInstruction`, `ReferenceInstruction`, `DexFormatter`, `AccessFlags` all present |
| Extension compile environment | `morphe-patches-gradle-plugin` `ExtensionPlugin.kt` — `compileSdk = 36`, `minSdk = 23` | ✅ `VERSION_CODES.S`, `RenderEffect` available; upstream code uses the same APIs |
| Java syntax | `java-parser` 3.0.1 (chevrotain) | ✅ parses clean |
| Kotlin syntax | `kotlin-parser` 0.0.12 (WASM Kotlin parser) | ✅ full syntax tree, no error nodes |
| Fingerprint access-flag semantics | `matchMethodOrNull` — declared `accessFlags` compare **all bits** | ⚠️ `[PUBLIC, STATIC, FINAL]` must match the target exactly; an extra `SYNTHETIC` bit fails the match with a clear `PatchException` (not a broken APK) |
| Smali anchors (`p.ksh0.a`, `p.lxs1.k`, `p.mtc1.f`, register math) | Requires the Spotify APK + JADX | ❌ not verifiable in this environment — see `docs/research.md` §6 |
| On-device behavior (blur, tween, logcat) | Morphe Manager + physical device | ❌ pending |
| Full Kotlin compile | Needs JDK + gradle + jitpack/Google maven | ❌ not possible here; see `docs/research.md` §6 |

## Legality / ethics

Spotify's terms don't allow modified clients; use at your own risk. This patch is cosmetic: it does not
bypass payment, DRM, or ads, and it does not touch analytics or network traffic.

## License

Not decided yet. If the patch is integrated into
[southstar21-patches](https://github.com/southstar21dev/southstar21-patches) (GPL-3.0), it ships under GPL-3.0 with it.
