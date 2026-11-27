# Publishing Morphe bundles

Use `python scripts/bundle-metadata.py --release v<VERSION>` after the release asset is public. This writes metadata only after checking its strict ISO local date-time, the public download, asset digest, and the MPP's internal version. Do not convert GitHub dates through PowerShell DateTime casts/ConvertFrom-Json string casts: they can produce culture-specific dates that Morphe rejects. Keep timestamps without `Z` or offset.

Push source metadata to both `main` and `dev`; Morphe's prerelease source switch selects `dev`, regardless of the GitHub release's prerelease flag. Currently both branches intentionally carry the same experimental bundle. Use ordinary fast-forward pushes, never overwrite unrelated branch work.

After pushing, run `python scripts/bundle-metadata.py --remote`. This must pass on the canonical raw URLs for BOTH branches, not just GitHub's contents API or a cache-busted URL. If a CDN still serves old metadata, wait and repeat; do not call the source update verified before it passes. Do not rebuild or replace an existing release asset merely to repair source metadata. Record any app-runtime verification separately: source/download validation does not establish app behavior.
