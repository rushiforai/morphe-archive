# Remove SDH Annotations

Patch ID: `sdh-annotations`. Target: official NuvioTV `0.8.2-beta`, Media3/ExoPlayer only.

The patch adds `Settings → Morphe → Subtitles` with one native `Remove SDH annotations` selector. Opening it shows Nuvio's three-choice modal pattern with `Off`, `Remove SDH, keep lyrics`, and `Full cleanup`. It defaults to `Off` and stores the selected mode in private `morphe_patches` preferences under `subtitles.sdh_cleanup_mode`.

Both cleanup modes process every outgoing Media3 text-cue list, aggressively remove supported SDH blocks, suppress cues that become empty, and preserve timing, cue layout, surviving spans, and non-text cues. `Remove SDH, keep lyrics` preserves likely lyrics; `Full cleanup` removes all text enclosed by supported normal or mojibake music-note markers. The patch does not modify subtitle files, Nuvio account data, playback reports, or backend traffic. MPV/libass subtitles are not processed.

See [the exact SDH removal rules and known limitations](../../../docs/SDH_REMOVAL.md). Every supported complete bracketed or parenthetical block is removed regardless of content in either cleanup mode.

Run `./scripts/test.ps1 -Patch sdh-annotations -Device tv`. Evidence is written below `local/patches/sdh-annotations/<timestamp>/` and is never committed.
