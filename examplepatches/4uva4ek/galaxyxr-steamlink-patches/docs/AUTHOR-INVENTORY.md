# Author patch inventory — 2026-11-06

The original six-feature selection was incomplete. The correction audits all
locally available Git refs for commits authored by Alex Petrov / 4uva4ek and
compares the current working source with the published bundle.

| Existing author feature | Origin / disposition |
|---|---|
| Controller velocity frame | `ccb0c01`, made stable by `47f8dd4` / `c950e14`; retained |
| Controller pose extrapolation | `06a1408`; retained |
| Controller grip haptics | `d999383` plus follow-ups; retained |
| Controller HAL tracking | `1bb25da` plus follow-ups; retained |
| Controller pose time | `3c7e8b5` / `4353ee0`; retained |
| Controller throw angle | Existing local work; retained |
| Galaxy XR SteamVR driver (galaxyxr) | `739b04c`, `2720a5f`, `24e658a`; restored in 1.1.0 |
| OpenXR CPU and GPU BOOST | `02b931c`; restored in 1.1.0 |

The old optional angular adapter (`5572286`) was retired by the velocity-frame
change; do not reintroduce it alongside its replacement.
`HeadsetControlPatch` and `EquirectTriggerPatch` appear only in the untracked-file
stash snapshot `7514a8d` (paused work), not the active source. They are not
silently promoted to release features. Retired rendering/hitch experiments and
third-party patches remain excluded.

Vendor-driver migration preserves the author's field-level transformations and
options, replacing the upstream legacy identity dependency with direct edits to
the existing Galaxy/fallback entries. The existing source remains necessary for
launch support on legacy Quest-only APKs. Native beta 5002527 needs no such port.
