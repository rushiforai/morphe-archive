# Release & Tag Template

Use this template when tagging a new release and publishing release notes on GitHub.

---

## Git Tag Command

```bash
VERSION="0.0.X-alpha"
git tag -a "${VERSION}" -m "Release ${VERSION}"
git push origin "${VERSION}"
```

---

## Release Notes

The release notes template lives in
[.github/release_template.md](release_template.md). GitHub fills it in automatically
when the release is published, and the install links in it already point at the
Morphe Manager and Obtainium entries.

---

## Release Creation CLI Command

The release asset names have to match what the README and the release workflow
expect, so the bundle is copied to a versioned name first.

```bash
VERSION="0.0.X-alpha"
cp patches/GboardClipboardHistory.mpp "output/patches-${VERSION}.mpp"

gh release create "${VERSION}" \
  "output/patches-${VERSION}.mpp" \
  output/Gboard-Clipboard-History.apk \
  output/PixelBoard-Clipboard-History.apk \
  --title "${VERSION}" \
  --notes-file .github/release_template.md \
  --prerelease
```

---

## Pre-Release Verification Checklist

- [ ] `./scripts/build-mpp.sh --rebuild-extension` builds `patches/GboardClipboardHistory.mpp` without errors.
- [ ] `./scripts/build-gboard-clipboard.sh` builds functional `output/Gboard-Clipboard-History.apk`.
- [ ] `./scripts/build-gboard-clipboard-pixelboard.sh` builds functional `output/PixelBoard-Clipboard-History.apk`.
- [ ] Tested on target device:
  - [ ] App installs and enables as primary IME.
  - [ ] Setting entry is strictly inside `Gboard Settings -> Clipboard`.
  - [ ] Copying in third-party apps (e.g. Google Keep) captures clips in foreground.
  - [ ] History activity opens with Material 3 Monet dynamic theming.
- [ ] Exactly three release assets prepared:
  - `patches-<version>.mpp`
  - `Gboard-Clipboard-History.apk`
  - `PixelBoard-Clipboard-History.apk`
- [ ] `patches-bundle.json` updated with new version number and download URL.
- [ ] `README.md` download links and badges point to the new release tag.
