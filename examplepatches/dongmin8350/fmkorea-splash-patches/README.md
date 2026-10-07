# FMKorea Splash Patches

Morphe patch source for the FMKorea Android app (`com.fmkorea.m.fmk`).

The **Remove FMKorea splash logo** patch replaces FMKorea's startup `splash.png` resources with a transparent PNG, while leaving the normal launcher icon unchanged.

The patch is intentionally future-friendly: it scans every `res/drawable*` directory for `splash.png` at patch time and also declares a future-version app target. If FMKorea changes the splash resource name or implementation, the patch fails instead of silently modifying an unrelated file.

## Add to Morphe

On Android, open **Morphe → Sources → + → Remote** and enter:

```text
github.com/dongmin8350/fmkorea-splash-patches
```

Then select this source for FMKorea and enable **Remove FMKorea splash logo** before patching.

Direct add-source link:

```text
https://morphe.software/add-source?github=dongmin8350/fmkorea-splash-patches
```

## Updating FMKorea

You normally do not need to rebuild this patch when FMKorea updates. Give Morphe the new original FMKorea APK and apply **Remove FMKorea splash logo** again.

The patch was confirmed against the v17.4 resource layout and also has a future-version target. It dynamically finds `res/drawable*/splash.png`, so changes to density/night folder names are handled automatically.

## Build

```bash
./gradlew buildAndroid
```

The generated `.mpp` bundle is written under `patches/build/libs/`. GitHub Actions also publishes the stable bundle to `bundles/patches-1.0.0.mpp` and updates `patches-bundle.json` for Morphe remote-source installs.

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
