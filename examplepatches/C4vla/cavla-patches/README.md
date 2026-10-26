# cavla-patches

[Morphe](https://morphe.software) patches for Android apps, built as an `.mpp` bundle for
Morphe Manager.

## Add to Morphe Manager

Add this repository as a custom patch source in Morphe Manager, then select an app and the
patches you want. Each GitHub Release publishes the compiled `patches-<version>.mpp`
(and `patches-list.json`).

## Patches

### Universal (`all`)
- **Change package name** — appends `.cavla` to the package so a patched build installs
  **side-by-side** with the original (no uninstall; your original login/data stays).
  Options: `packageName`, `updatePermissions`, `updateProviders`. For apps with content
  providers, enable `updateProviders` so side-by-side install doesn't fail on duplicate
  authorities.
- **Enable debugging** — sets `android:debuggable="true"` on the patched build.

### Wolt (`com.wolt.android`)
- **Export cart** — _in progress_ — adds an "Export cart" action that saves the current
  cart to a CSV file.

## Build

Requires JDK 21, Android SDK (`ANDROID_HOME`), and a GitHub token with `read:packages`
(Morphe's patcher/plugin live on a private GitHub Maven registry).

```bash
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token-with-read:packages> ./scripts/build.sh
# output: patches/build/libs/patches-<version>.mpp
```

On Termux/aarch64 the helper passes `-Pandroid.aapt2FromMavenOverride` to the Termux aapt2
(the SDK's bundled aapt2 can't parse recent platforms). See `docs/patcher-notes.md`.

## Credits

Patch idioms and the Change-package-name/Enable-debug patches are adapted from
[MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) and
[hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches).

## License

GPL-3.0 — see [LICENSE](LICENSE).
