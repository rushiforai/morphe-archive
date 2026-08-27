# Remove SDH Annotations

Patch ID: `sdh-annotations`. Target: official NuvioTV `0.8.7-beta`, Media3/ExoPlayer only.

The patch adds `Settings → Morphe → Subtitles` with one native `SDH subtitle processing` selector. Opening it shows Nuvio's native modal pattern with `Off`, `Normalize music symbols only`, `Remove SDH, keep lyrics`, and `Full cleanup`. A fresh installation defaults to `Normalize music symbols only`; an existing stored selection remains authoritative. The mode is stored in private `morphe_patches` preferences under `subtitles.sdh_cleanup_mode`. If Nuvio's separate `Strip SDH annotations` switch is enabled, its Media3 filter runs only while Morphe is `Off`; an active Morphe mode bypasses that native pass so cues are never filtered twice. MPV continues to use Nuvio's switch.

`Normalize music symbols only` replaces supported mojibake and evidence-inferred boundary tokens without removing text. Unknown matching boundary combinations are learned after three total occurrences or two consecutive occurrences, case-insensitively; a multiline wrapped block counts once. Both cleanup modes process every outgoing Media3 text-cue list, aggressively remove complete single-line or multiline SDH blocks, suppress cues that become empty, and preserve timing, cue layout, surviving spans, and non-text cues. `Remove SDH, keep lyrics` preserves likely lyrics and normalizes their inferred markers; `Full cleanup` removes all text enclosed by supported normal, mojibake, or inferred music-note markers. The patch does not modify subtitle files, Nuvio account data, playback reports, or backend traffic. MPV/libass subtitles are not processed.

See [the exact SDH removal rules and known limitations](../../../docs/SDH_REMOVAL.md). Every supported complete bracketed or parenthetical block is removed regardless of content in either cleanup mode.

Run `./scripts/test.ps1 -Patch sdh-annotations -Device tv`. Evidence is written below `local/patches/sdh-annotations/<timestamp>/` and is never committed.
