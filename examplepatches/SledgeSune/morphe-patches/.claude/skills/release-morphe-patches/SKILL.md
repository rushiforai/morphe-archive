---
name: release-morphe-patches
description: Publish a new release of this Morphe patch bundle (SledgeSune/morphe-patches) by hand from this PC — bump the version, build the .mpp, write the changelog / patches-bundle.json / patches-list.json / README table, tag, create the GitHub release and sync branches. Use when asked to publish, release or ship the patches, or to make new patches show up in Morphe Manager.
---

# Release by hand

Only when the owner asks. First check Actions: if `gh run list -R SledgeSune/morphe-patches --limit 3` shows
successful runs again, just merge `dev` into `main` (normal merge) and let `release.yml` release.

## Setup

Build env from CLAUDE.md, plus:

```bash
PY="$(ls "$LOCALAPPDATA"/Programs/Python/Python3*/python.exe | tail -1)"
export PYTHONUTF8=1 PYTHONIOENCODING=utf-8   # README script prints emoji
NOTES=<scratchpad>/release-notes.md          # never inside the repo
```

## Steps

1. **Version.** Previous: `git describe --tags --abbrev=0`; commits: `git log --format='%H %s' v<prev>..dev`.
   Any `feat:` → minor, only `fix:` → patch, only `chore:` → no release.
2. **Main to dev:** `git checkout main && git merge --ff-only dev`
3. **Bump and build:**
   ```bash
   sed -i 's/^version = .*/version = <new>/' gradle.properties
   ./gradlew clean buildAndroid generatePatchesList --console=plain -q && ls patches/build/libs/patches-<new>.mpp
   ```
4. **Release files** (one `"<full sha>|<plain text>"` per feat/fix; prefix the text with `fix:` for Bug Fixes):
   ```bash
   "$PY" -I .claude/skills/release-morphe-patches/scripts/release_files.py "$PWD" <new> <prev> "$NOTES" \
     '<sha>|**Waze:** Add "Trip history" patch'
   "$PY" -I .github/scripts/generate_patches_readme.py SledgeSune/morphe-patches main patches-list.json README.md
   ```
5. **Commit, tag, publish** (attribution line from the current system reminder):
   ```bash
   git add CHANGELOG.md README.md gradle.properties patches-bundle.json patches-list.json
   { printf 'chore: Release v<new> [skip ci]\n\n'; cat "$NOTES"; printf '\nCo-Authored-By: ...\n'; } | git commit -F -
   git tag -a v<new> -m "v<new>"
   git push origin main && git push origin v<new>
   gh release create v<new> -R SledgeSune/morphe-patches --title "v<new>" --notes-file "$NOTES" \
     --verify-tag patches/build/libs/patches-<new>.mpp
   git checkout dev && git merge --ff-only main && git push origin dev
   ```
   If a step fails after a push, don't rewrite pushed history; finish the rest.
6. **Check what Morphe Manager sees:**
   ```bash
   curl -s https://raw.githubusercontent.com/SledgeSune/morphe-patches/main/patches-bundle.json | grep -E '"(version|download_url)"'
   curl -sL -o /dev/null -w "%{http_code} %{size_download}\n" https://github.com/SledgeSune/morphe-patches/releases/download/v<new>/patches-<new>.mpp
   ```

Releases aren't signed (no `MORPHE_SIGNING_KEY`), so `signature_download_url` stays empty. Tell the owner which
patches are in the release and which are untested, then update HANDOFF.md (`chore:` commit on `dev`).
