# Development helpers

The font UI is compiled into the extension. There is no separate JavaScript
bundle step: `extensions/font/build.gradle.kts` generates `FontUiData.java` from
`extensions/font/src/main/font-ui/{section.html,section.css,controller.js}` on
every build.

## Live WebView inspection

Both helpers evaluate an expression in the reader through the Chrome DevTools
Protocol. WebView debugging must be enabled (the optional patch) and Libby must
be running with a book open.

`dev/cdp-eval.mjs` sets up the adb port forward itself:

```powershell
node dev/cdp-eval.mjs "document.title"
```

`dev/cdp-eval.js` is the same evaluator for an already-forwarded socket:

```powershell
adb forward tcp:9222 localabstract:webview_devtools_remote_<pid>
node dev/cdp-eval.js "document.title"
```

Useful selectors while the sheet is open:

- `#morphe-font-overlay` — the sheet (fixed to `visualViewport`)
- `#morphe-font-settings` — the Custom Font section inside it
- `#morphe-font-nav-item` — the reader nav button that opens it
