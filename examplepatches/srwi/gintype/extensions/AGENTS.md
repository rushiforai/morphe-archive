# `extensions/` — Gboard Runtime Extension Guide

This directory holds the Android runtime library (`extensions/extension`) compiled into `extensions/gintype.rve` and merged into patched Gboard APKs by `GboardPatchesExtensionCarrierPatch`.

---

## 1. Module Structure

```text
extensions/extension/src/main/
├── AndroidManifest.xml                              # Extension package metadata
├── settings-text/gboard_settings_text.xml           # Authoritative settings strings & i18n
├── res/                                             # Drawables & night/light color palettes
└── java/dev/srwi/gintype/extension/
    ├── GboardPatchExtension.java                    # Carrier extension placeholder entry point
    ├── flagsettings/                                # Boolean flag/settings persistence helpers
    ├── thicctopbar/                                # Thicc Top Bar suggestion bar & reflector
    ├── multiglide/                                 # Kinetica-ported MultiGlide gesture decoder & hooks
    └── settings/                                    # GinType settings UI & diagnostics
```

---

## 2. Feature Subsystems

### MultiGlide (`multiglide/`)
- **Behavioral Specification**: See [`docs/multiglide-integration.md`](../docs/multiglide-integration.md) (`MG-01`–`MG-21`) for the authoritative Gboard integration rules and test traceability matrix. Any code change that alters a defined `MG-*` rule requires **explicit user confirmation** and synchronized updates to the spec and tests.
- **Runtime Hooks (`GboardMultiGlideRuntime.java`)**:
  - Coordinates with bytecode hooks in `MotionEventHandlerManager`, `AbstractGestureMotionEventHandler`, and `BasicMotionEventHandler` to intercept two-finger touchdown (`ACTION_POINTER_DOWN`) before Gboard's chording lock cancels gesture tracking.
  - Extracts exact subpixel key centers, bounds, and `SoftKeyView` labels from Gboard's native geometry field (`Ltjz;` via reflection) with zero static grid guesswork.
  - Draws dual gesture trails using Material You secondary/tertiary accent colors (`multiGlideTrailColor`), distinct from Gboard's primary trail color.
- **Decoder (`KineticaDtwDecoder.java`, `DtwMatcher.java`, `MergeAlternatives.java`, `ThumbBeam.java`, `KineticaConstants.java`)**:
  - Continuous DTW path matching & beam search ported from the Kinetica algorithm.
  - Resolves timing ambiguities for near-simultaneous two-finger swipes/taps (`MergeAlternatives`) and combines DTW scores with language probabilities.
- **Dictionaries (`GboardMultiGlideDictionaryManager.java`, `GboardLmReader.java`, `MultiGlideTrie.java`, `MultiGlideBigramTable.java`, `MultiGlideAccentFolder.java`)**:
  - Reads Gboard's native binary dictionaries directly on-device and folds accented characters transparently.
- **Settings & Diagnostics (`GboardMultiGlideSettings.java`, `GboardMultiGlideTraceLogger.java`)**:
  - Slider controls for beam/timing/autospace tuning, defaults reset, and selectable logcat export window (`1..60` minutes).

### Thicc Top Bar (`thicctopbar/`)
- **Runtime (`GboardThiccTopBarRuntime.java`, `ThiccTopBarGboardReflector.java`)**:
  - Replaces/augments the top candidate strip with `ThiccTopBarView`, `VerticalWordWheelView`, `JumpToEndArrowView`, and `ThiccTopBarSentenceBuffer` for alternative browsing and sentence history navigation.
  - Mirrors Gboard's normal trail/primary Material accent color via `ThiccTopBarGboardReflector` (`recordStockTrailAccent` / `resolveNormalAccentColor`) rather than borrowing the MultiGlide trail color.

### Settings UI (`settings/`)
- Built around `GboardPatchesSettingsActivity`, `GboardPatchesSettingsProvider` (`${applicationId}.gintype`), `GboardPatchesFeatureAvailability` (checks `dev.srwi.gintype.feature.*` marker assets), and `GboardPatchesIcons`.
- Do NOT change public method signatures declared in `patches/.../runtimeabi/RuntimeAbi.kt` without updating both modules in lockstep.

---

## 3. Settings Text & Testing Rules

- `:extensions:extension:generateSettingsText` generates Java constants and Android string resources from `src/main/settings-text/gboard_settings_text.xml`.
- **Unit testing on headless / ARM64 Termux hosts**:
  ```bash
  ./gradlew :extensions:extension:testDebugUnitTest \
    --tests "dev.srwi.gintype.extension.thicctopbar.*" \
    --tests "dev.srwi.gintype.extension.multiglide.*"
  ```
  Robolectric tests in `settings.*` require Robolectric Android runtime JARs (unavailable offline or on ARM64 Termux hosts). Any edits touching `multiglide/` or `thicctopbar/` logic must keep the filtered unit suites passing alongside `:patches:test`.
