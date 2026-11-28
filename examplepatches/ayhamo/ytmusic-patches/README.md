# YT Music patches

A patch bundle for YouTube Music, applied next to the official Morphe bundle in Morphe Manager.
It is not a fork of Morphe: it adds its own patches and calls into Morphe's where needed.

Targets YouTube Music 9.30.53 with Morphe 2.4.0.

## Install
1. Add the source to Morphe Manager: [add-source link](https://morphe.software/add-source?github=ayhamo/ytmusic-patches), or add `https://github.com/ayhamo/ytmusic-patches` by hand.
2. Turn on Expert mode in Manager, so it patches with this bundle and Morphe's together.
3. In Morphe's bundle, turn off **Apple Music animated artwork**. This bundle has its own animated covers, and the two overlays would draw on top of each other.

Settings are in Morphe settings > Fork settings.

## Patches
- **BitChord player and automix**: the now-playing screen laid out like BitChord's, using YT Music's own views. It has:
  - fullscreen cover art that fades into an artwork mesh
  - animated covers (Apple Music motion art) and canvas (a song's Spotify canvas or a loop of its music video), with a choice per song
  - artist colours, and artist page images and videos
  - BitChord's lyric line: filled word by word when the lyrics have word timings, with its own lines while lyrics load and through intros and instrumentals
  - a Best part button that jumps to the most replayed part, or to one you set
  - ★ and … buttons, a volume row, and YT's own chips row underneath
  - audio stats and an equalizer (off by default)

  Also in this patch:
  - automix: beat-matched transitions between songs, using BitChord's analysis engine on top of Morphe's crossfade
  - a transition editor for each pair of songs (waveforms, placement, curves), and mix files: export and import a mix as `.json`, or import mixes exported from Spotify
  - addons: plays songs from BitChord-compatible lossless addons, lined up with YouTube's audio, including HLS and DASH streams and Dolby Atmos where the phone can decode it. Morphe's **Disable DRC audio** is turned on once on first launch so the levels match.
- **Automix libraries**: BitChord's native analyser, its loop-mix renderer, ONNX Runtime (arm64), and automix's beat and vocal models.
- **Offline lyrics and art**: each download asks whether to take the lossless file from your addons or YouTube's, and saves lyrics, animated art and canvas with the song for offline play. Settings has rows to export or clear them. Needs Morphe's Downloads patch.
- **Hello** (off by default): a toast that shows the bundle is applied.

## Layout
- `bundle/`: the patch bundle (Morphe patches template), `patches/` and `extensions/`.
- `spec/`: the automix and addon rulebook shared with the other BitChord ports; `scripts/check-spec.ps1` checks it matches.
- `scripts/`: helpers for local builds and the emulator. `docker/`: the build toolbox image.
- `watcher/`: the daily check of the Apple Music token scrape (GitHub Action).
- `tests/`: Python tests (`python -m unittest discover -s tests`).
- Java tests are in the extension: from `bundle/`, run `./gradlew :extensions:extension:testDebugUnitTest`.
- `PLAN.md`, `docs/`: plan and notes. `docs/phone-vs-spec.md` lists where this app differs from the spec.

Releases are made by hand with the **Release** workflow. It updates `patches-bundle.json`, which Manager reads.
