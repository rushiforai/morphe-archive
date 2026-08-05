# Test plan

1. Run extension unit tests and build the bundle.
2. Apply only `Remove SDH Annotations` independently to the hash-pinned x86_64 and universal APKs.
3. Confirm every structural fingerprint matches exactly once.
4. Inspect the patched manifest for the initialization provider and metadata, and DEX for the injected runtime, native Compose action, and transformer.
5. On `Television_4K`, install the universal-derived output and execute every acceptance item in `patch.json`, including an in-pane visual comparison with Layout/Playback, D-pad navigation, and Media3 playback using an emulator-compatible H.264 source.
6. On `Pixel_10`, validate public-source import, prerelease selection, and exclusive patch selection.
7. Before stable release, repeat installation, persistence, playback, and SDH behavior on a real Android TV and commit a report under `validation/`.

MPV/libass is outside this patch's compatibility claim.
