# Architecture

## Compartments

```text
patches/.../nuviotv/<category>/<patch-id>/        patcher/fingerprints
extensions/.../nuviotv/<category>/<patch-id>/     injected runtime
testing/patches/<patch-id>/                        manifest, tests, porting notes
local/patches/<patch-id>/<timestamp>/              APKs/logs/evidence; gitignored
```

The repository's concrete package root is `io.github.liongalahad.nuviotv`; the logical `nuviotv/<category>/<patch-id>` boundary is retained inside both code modules.

## Shared settings hub

The internal settings-hub resource patch injects one initialization provider and per-patch metadata registration. On 0.8.7-beta, Nuvio already compiles a hidden `EXPERIENCE` settings section. The patch changes its label to `Morphe`, maps that slot to a visible branch inside the exact settings filter, and converts its native mode card into inline patch compartments. Navigation remains in the current Settings window and inherits Nuvio's typography, focus treatment, spacing, colors, selector-card styling, and D-pad behavior. Selecting Morphe transfers Nuvio's native detail-pane focus requester to the first visible Morphe category.

Each choice writes private `morphe_patches` storage synchronously, closes the modal, and redraws the selector subtitle immediately. The SDH selector provides `Off`, symbol normalization without removal, annotation removal with lyric preservation, and full cleanup. The legacy dev.7 Boolean migrates to `Remove SDH, keep lyrics`. Preferences never enter Nuvio profiles, account sync, telemetry, playback reports, or backend DTOs.

### Settings skeleton invariants

The shared settings hub owns the complete Morphe pane skeleton. Individual patches only register category/feature metadata and provide their setting behavior; they must not patch the main Settings screen or create their own container geometry.

- Morphe uses the same structure as Layout Settings: one native weighted settings-group panel, one native `LazyColumn`, and one native collapsible-section item per category. The category list explicitly reuses Nuvio's medium vertical spacing token, while the native components own each header, description, Open/Closed state, focus treatment, inner padding, row spacing, expansion, and scrolling.
- Horizontal group geometry is invariant: opening or closing any category must not change the left edge, right edge, or horizontal padding of another category. Descriptions are never hidden, focus outlines are never clipped, and the hub must not introduce custom overlap, compact padding, fixed-height clipping, or a second expansion implementation.
- Switches and selector rows go through `MorpheSettingsRows`; category renderers declare rows but do not reimplement reflection, modifiers, spacing, or Compose entry/skip handling.
- The shared hub renders build metadata only: the native Morphe header subtitle includes the bundle version beside `Patch settings`, and a final About section contains one actionable repository row labelled with the version and author. The displayed version is generated from the Gradle project version and removes only the separator in development suffixes (for example, `1.0.0-dev.20` becomes `1.0.0-dev20`).
- A feature added to an existing category registers feature metadata and joins that category renderer. A new category must be added once to the shared hub/runtime, not injected independently.
- Layout tests must cover all collapsed/expanded combinations. Emulator acceptance must capture each combination and confirm equal category bounds, intact focus rings, no clipping, and stable D-pad order.

## SDH hook

The Media3 hook targets Nuvio's `TextOutput` wrapper structurally. It cleans the list extracted at the start of every `CueGroup` callback and, only when that list changes, rebuilds the incoming group with the original `presentationTimeUs` before either of Nuvio's forwarding branches can run. The legacy list callback is filtered at method entry. Each outgoing group rechecks the current cached preference. Text cues are copied only when changed; timing, positioning, surviving spans, non-text cues, and styling are retained. Empty cleaned cues are suppressed.

MPV/libass is explicitly deferred.
