# nicoid Re v1.10.7-dev.14 — single-tap area editor UI polish

Development-only successor of the user-verified v1.10.7-dev.13
(`59d155c1a8cd7ac4c757238a100d0bdb8e0e27d8`).

## UI-only improvements

- Preset order: Entire video / Custom (first row); Top-bottom / Center / Side
  edges (second row), preserving the existing stored mode IDs.
- Add comfortable gaps between preset chips, controls and the area selector.
- Use mildly rounded rectangles (12 dp) for selected chips and rounded
  selection highlights; avoid fully capsule-shaped preset backgrounds.
- Show both the main area editor (28 dp corner radius) and the area-choice
  dialog (24 dp) with the shared Nicoid dialog theme.
- Render +/- controls as genuinely circular 38x38 dp buttons, keeping
  1-percent-per-press adjustment unchanged.
- Remove the redundant divider between the two quick-adjustment rows.
- Keep the live region preview and its existing drag, resize, custom
  region editing, and normal/fullscreen/popup touch-routing semantics.

## Verification and release policy

The existing area gesture model tests run unchanged alongside a new layout
regression. Android device review remains necessary for visual fit and
touch-target comfort, especially in narrow popup/portrait layouts.

No main merge, official release, tag or issue close is authorized.
