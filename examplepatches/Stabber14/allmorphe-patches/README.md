# AllMorphe

An index of **every Morphe patch bundle** listed on [morphe-patches.software](https://morphe-patches.software/) (589 bundles, ~6,451 patches across ~1,114 apps), so you can install them all at once.

## Why not a single Morphe source?

Morphe treats one GitHub repository as **one patch source**, backed by a single compiled `.mpp` file with one signing key. Community bundles are published by many different authors with different signing keys, so they cannot be merged into one `.mpp` without recompiling and re-signing. AllMorphe therefore ships the **list of all bundle repositories** instead, which Morphe can add in one step (it accepts many URLs at once) and each bundle keeps auto-updating from its own repo.

## Install all patches at once

### Android (Morphe app)

Option A — add every community bundle at once:

1. Open Morphe → **Sources** → **+** (Add source).
2. Open [`sources.txt`](sources.txt) in this repo and paste its contents into the dialog (Morphe accepts many URLs at once).
3. Tap **Add**. All 589 bundles are added and stay auto-updated from their own repos.

Option B — add this repository as a single source (works, provides the official Morphe patches and never errors):

```
github.com/Stabber14/allmorphe-patches
```

Or use the deep links on morphe-patches.software per bundle.

### Desktop (Morphe Desktop CLI)

```bash
# requires morphe-desktop-*-all.jar on PATH as 'morphe' (or set MORPHE_JAR)
./install-all.sh your_app.apk patched.apk
```

`install-all.sh` is generated from the catalog and passes every bundle repo via `-p`.

## Files

- `sources.txt` — one bundle repo URL per line (paste into Morphe).
- `bundles.json` — full metadata for every bundle (name, author, patch count, target apps, …).
- `install-all.sh` — Morphe Desktop one-command installer.
- `allmorphe/fetch_patches.py` — regenerates the above from the catalog.
- `allmorphe/scripts/update.sh` — local runner.
- `allmorphe/.github/workflows/update.yml` — daily auto-refresh (3 AM UTC).

## Auto-update

The GitHub Actions workflow refreshes `sources.txt` / `bundles.json` daily from the morphe-patches.software catalog. Bundles themselves auto-update inside Morphe because each is its own GitHub source.

To refresh manually:

```bash
cd allmorphe && bash scripts/update.sh
```

## License

MIT License. Patch bundles belong to their respective authors.