# Chrome userscripts v1.7.0

Rebuilds the Chrome Android userscript patch around Chrome's Material You theme and a Violentmonkey-derived metadata/installer compatibility core.

## Fixes

- Removes the WindowManager popup scanner that could corrupt Chrome context menus.
- Integrates only through Chrome's AppMenuHandler-backed Android Menu.
- Inherits Chrome's own theme and dynamic Material You colors.
- Intercepts Greasy Fork and Sleazy Fork `.user.js` / `.user.css` install links.
- Fixes Fork fallback URLs by preserving the script ID and slug.
- Adds stricter source validation, localized metadata, and Violentmonkey MIT attribution.

Validated before release with the expanded userscript tests, Android extension compilation, Morphe patch compilation, complete `.mpp` packaging, artifact upload, and artifact content inspection.
