# YT Music patches (work in progress)

A patch bundle for YouTube Music, applied next to the official Morphe bundle in Morphe Manager.
It is not a fork of Morphe: it adds its own patches and calls into Morphe's where needed.

**Not ready for use yet.** Targets YouTube Music 9.30.53 with Morphe 2.4.0.

Patches:
- **BitChord player and automix**: the now-playing screen laid out like BitChord's, using YT Music's own views. It has:
  - fullscreen cover art that fades into an artwork mesh;
  - animated covers (Apple Music motion art);
  - artist colours;
  - BitChord's lyric line: filled word by word when the lyrics have word timings, with loading, intro and instrumental lines;
  - ★ and … buttons;
  - a volume row;
  - YT's own chips row underneath.

  Also in this patch:
  - automix: beat-matched transitions between songs, using BitChord's analysis engine on top of Morphe's crossfade;
  - the song version of music videos;
  - audio stats;
  - an equalizer.

  Settings are in Morphe settings > BitChord fork.
- **Automix libraries**: BitChord's native analyser and ONNX Runtime (arm64), needed by automix.
- **Offline lyrics and art**: saves lyrics and animated covers along with songs downloaded by Morphe's Downloads patch (Morphe 2.3.0 or newer).
- **Hello** (off by default): a toast that shows the bundle is applied.

Add to Morphe Manager (once released): `https://github.com/ayhamo/ytmusic-patches`

## Layout
- `bundle/` – the patch bundle (Morphe patches template): `patches/` and `extensions/`.
- `scripts/` – local build, patch and emulator helpers; `docker/` – the build toolbox image.
- `watcher/` – the daily check of the Apple Music token scrape (GitHub Action).
- `tests/` – Python tests (`python -m unittest discover -s tests`); Java tests are in the extension.
- `PLAN.md`, `docs/` – plan and notes.

Releases are made by hand with the **Release** workflow; it updates `patches-bundle.json`, which Manager reads.
