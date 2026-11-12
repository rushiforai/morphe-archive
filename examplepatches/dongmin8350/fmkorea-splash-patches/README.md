# FMKorea Patches

Morphe patch source for the FMKorea Android app (`com.fmkorea.m.fmk`).

The **Remove FMKorea splash logo** patch replaces FMKorea's startup `splash.png` resources with a transparent PNG, while leaving the normal launcher icon unchanged.

The patch is intentionally future-friendly: it scans every `res/drawable*` directory for `splash.png` at patch time and also declares a future-version app target. If FMKorea changes the splash resource name or implementation, the patch fails instead of silently modifying an unrelated file.

## Add to Morphe

On Android, open **Morphe → Sources → + → Remote** and enter:

```text
github.com/dongmin8350/fmkorea-splash-patches
```

Then select this source for FMKorea and enable **Remove FMKorea splash logo** and **Remove FMKorea ads and spaces** before patching.

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

The generated `.mpp` bundle is written under `patches/build/libs/`. GitHub Actions also publishes the stable bundle to `release asset `patches-1.1.0.mpp`` and updates `patches-bundle.json` for Morphe remote-source installs.

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).

## v1.1.0 — ad-space cleanup

Enable **Collapse FMKorea ad spaces** to add a domain-scoped cleanup to the app's
existing `assets/custom.js` WebView injection hook. The patch preserves the existing
FMApp bridge, and fails if that hook is missing or unrecognized.

It collapses the specific `div` placeholder documented by the gallery filter:
inline `display:block!important`, `visibility:hidden`, and positive `height`.
Explicit classes ending in `_ad` are hidden too. A throttled MutationObserver
handles placeholders inserted or resized after page load. It does not guess that
ordinary empty elements, article bodies, comment forms, or media are ads.

The injection path was verified by decompiling the user-supplied FMKorea v17.4 APK.
DOM regression tests cover dynamic insertion, style overwrites, observer settling,
content preservation, duplicate injection, and external-domain exclusion. Actual
Android display testing is still required. A structurally different blank area
will require a new rule rather than broad empty-element removal.

To update: refresh this source in Morphe, select the new patch, patch an original
FMKorea APK, and install using the same signing key as the existing patched app.
Keep Morphe's **Override certificate pinning** selected if you use AdGuard HTTPS
filtering. This patch does not replace that patch or AdGuard's network filters.
Repatching an APK replaces this patch's previous script block, avoiding duplicate
observers. The app may need its page reloaded after installing the patched update.

Run DOM tests with `NODE_PATH=<jsdom install>/node_modules node tests/ad-spaces.test.cjs`.


## v1.3.1 — splash resource discovery fix

The splash-logo patch now uses Morphe Patcher 2.x's APK-aware resource listing instead of
walking the partially decoded `res/` working directory. FMKorea v17.4 currently contains
`res/drawable-night-xxhdpi-v8/splash.png` and `res/drawable-xxhdpi-v4/splash.png`; both are
replaced with the transparent 1×1 PNG.
