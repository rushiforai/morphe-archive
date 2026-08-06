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

The internal settings-hub resource patch injects one initialization provider and per-patch metadata registration. On 0.8.2-beta, Nuvio already compiles a hidden `EXPERIENCE` settings section. The patch changes its label to `Morphe`, maps that slot to a visible branch inside the exact settings filter, and converts its native mode card into inline patch compartments. Navigation remains in the current Settings window and inherits Nuvio's typography, focus treatment, spacing, colors, selector-card styling, and D-pad behavior.

Each choice writes private `morphe_patches` storage synchronously, closes the modal, and redraws the selector subtitle immediately. The legacy dev.7 Boolean migrates to `Remove SDH, keep lyrics`. Preferences never enter Nuvio profiles, account sync, telemetry, playback reports, or backend DTOs.

## SDH hook

The Media3 hook targets Nuvio's `TextOutput` wrapper structurally. It cleans the list extracted at the start of every `CueGroup` callback and, only when that list changes, rebuilds the incoming group with the original `presentationTimeUs` before either of Nuvio's forwarding branches can run. The legacy list callback is filtered at method entry. Each outgoing group rechecks the current cached preference. Text cues are copied only when changed; timing, positioning, surviving spans, non-text cues, and styling are retained. Empty cleaned cues are suppressed.

MPV/libass is explicitly deferred.
