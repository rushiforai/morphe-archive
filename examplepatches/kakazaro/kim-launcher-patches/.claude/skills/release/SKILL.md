---
name: release
description: Use when publishing a new version of the Kim Launcher patch bundle (.mpp) to GitHub so Morphe Desktop or Morphe Manager can install it as a remote patch source, or when a remote source shows no update, the wrong version, or fails to add.
---

# Release the patch bundle

## How Morphe remote sources work

A remote source is just the repository URL, e.g. `https://github.com/<owner>/kim-launcher-patches`.
Morphe reads `patches-bundle.json` from the repo's default branch, then downloads the `.mpp`
from that file's `download_url`. (Same scheme as fangkampanat/gmaps-patches and
bearinmindcat/morphe-patches.) So a release is complete only when **all three** agree:

| Place | Must say |
|---|---|
| `gradle.properties` | `version = X.Y.Z` |
| `patches-bundle.json` on the default branch | `"version": "X.Y.Z"`, `download_url` to the release asset |
| GitHub release `vX.Y.Z` | asset `patches-X.Y.Z.mpp` |

## Steps

1. **Pick the version.** `fix:` → patch, new patch → minor, breaking/removed patch → major.
2. **Check `patches/build.gradle.kts` `about {}`**: no `OWNER` placeholders left.
3. **Bump** `version` in `gradle.properties`.
4. **Edit `patches-bundle.json`:**
   ```json
   {
     "version": "X.Y.Z",
     "download_url": "https://github.com/<owner>/<repo>/releases/download/vX.Y.Z/patches-X.Y.Z.mpp",
     "created_at": "2026-11-17T09:30:00",
     "description": "<one line: patches and supported app version>",
     "signature_download_url": ""
   }
   ```
   `created_at` is UTC **without** `Z` or offset; Morphe Manager rejects either.
   Get it with `date -u +%Y-%m-%dT%H:%M:%S`.
5. **Build:** `set -a; source .env; set +a; ./gradlew build --no-daemon` (loads `GITHUB_ACTOR`/`GITHUB_TOKEN`
   from the git-ignored `.env`, see `.env.example` and `docs/build-setup.md`).
   Output: `patches/build/libs/patches-X.Y.Z.mpp`.
6. **Verify the bundle** before publishing:
   ```bash
   unzip -p patches/build/libs/patches-X.Y.Z.mpp META-INF/MANIFEST.MF | grep -i '^Version'
   ```
   It must print `X.Y.Z`. Optionally patch `refer-apk/` with Morphe Desktop/CLI using the
   local `.mpp` first.
7. **Update README** patch list / tested-versions table if patches changed.
8. **Ask the user before pushing or publishing.** Then commit, tag, push:
   ```bash
   git add gradle.properties patches-bundle.json README.md
   git commit -m "chore(release): vX.Y.Z"
   git tag vX.Y.Z && git push && git push origin vX.Y.Z
   ```
9. **Create the GitHub release yourself** (do not hand this step to the user). Attach only
   `patches-X.Y.Z.mpp`, not the `-sources`/`-javadoc` files; publish it, never as a draft:
   ```bash
   gh release create vX.Y.Z patches/build/libs/patches-X.Y.Z.mpp --title vX.Y.Z --notes "<changes>"
   ```
   If `gh` is missing or not logged in, tell the user to run `winget install GitHub.cli` and
   `! gh auth login`, then retry. Only fall back to the web UI (Releases → Draft a new release →
   tag `vX.Y.Z` → attach the `.mpp` → Publish) if they cannot install it.
10. **Confirm it resolves** exactly like Morphe will:
    ```bash
    curl -sL https://raw.githubusercontent.com/<owner>/<repo>/main/patches-bundle.json
    curl -sIL "<download_url>" | grep -E '^HTTP|content-length'
    ```
    Final status must be 200 with a non-zero length.

## Common mistakes

| Symptom | Cause |
|---|---|
| Manager won't add the source | `created_at` has `Z`/offset, or JSON is invalid |
| Source shows the old version | `patches-bundle.json` not pushed to the default branch |
| Download fails / 404 | asset name or tag differs from `download_url`, or release is a draft / repo is private |
| Patches missing in the app list | `.mpp` built from a different `version` than the JSON |
| Never commit | `refer-apk/`, `.work/`, `*.mpp` (they are git-ignored; attach the `.mpp` to the release only) |
