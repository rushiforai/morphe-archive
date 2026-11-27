# Development helpers

The font UI is compiled into the extension. There is no separate JavaScript
bundle step: `extensions/font/build.gradle.kts` generates `FontUiData.java` from
`extensions/font/src/main/font-ui/{section.html,section.css,controller.js}` on
every build.

## Build / patch / install shortcuts

Double-clickable wrappers live next to this file:

| File | Action |
|---|---|
| `build.cmd` | build the patch bundle |
| `patch.cmd` | apply the newest bundle to the stock APK |
| `install.cmd` | `adb install -r` the patched APK |
| `build_patch_install.cmd` | all three in order |

They call `build-and-install.ps1`, which discovers the newest jar, bundle, and
APK and restores `morphe-data/morphe.keystore` from the backup if needed. The
manual commands in the root `README.md` and `AGENTS.md` §7 remain the
authoritative step-by-step reference.

## Live WebView inspection

Both helpers evaluate an expression in the reader through the Chrome DevTools
Protocol. WebView debugging must be enabled (the optional patch) and Libby must
be running with a book open.

`dev/js/cdp-eval.mjs` sets up the adb port forward itself:

```powershell
node dev/js/cdp-eval.mjs "document.title"
```

`dev/js/cdp-eval.js` is the same evaluator for an already-forwarded socket:

```powershell
adb forward tcp:9222 localabstract:webview_devtools_remote_<pid>
node dev/js/cdp-eval.js "document.title"
```

Useful selectors while the sheet is open:

- `#morphe-font-overlay` — the sheet (fixed to `visualViewport`)
- `#morphe-font-settings` — the Custom Font section inside it
- `#morphe-font-nav-item` — the reader nav button that opens it
