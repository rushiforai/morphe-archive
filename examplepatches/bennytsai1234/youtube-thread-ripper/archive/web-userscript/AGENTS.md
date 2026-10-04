# BTR-based YouTube fork

Use Traditional Chinese. The user explicitly rejected a hand-built replacement and requires upstream BTR UI/interaction/download code as the base. Preserve that direction.

- `vendor/btr/`: 11 original LF-normalized files at the manifest's pinned commit. Do not edit them silently. Import a new explicit checkout only when intentionally updating upstream.
- `scripts/adapt-btr.cjs`: reviewable required site changes; CSS and downloader/notification source remain unchanged. Preserve upstream modal, slider, drag, storage and notification behavior.
- `src/site-adapter.js`: YouTube URL/query-range boundary. Never copy Bilibili signed URLs to Google hosts or invent cross-CDN signatures.
- `src/runtime.js`: connect native YouTube media requests/video/settings/stats to BTR modules.
- `src/core.js`: only YouTube-specific SABR wire handling; no replacement scheduler or custom UI.
- `scripts/build.cjs`: build the installable script; keep name/namespace for updates. Regenerate after source/adaptation changes.
- `docs/android-port.md`: researched future Android path, not a built APK.

Run `npm test`, `npm run build`, `npm run check`. Text uses LF; no npm dependencies. Browser fixtures are synthetic, not proof of YouTube playback benefit.

Default SABR mode is native passthrough, auto threads on, floating launcher off. Unknown protocol and unsupported paths stay native. Keep full takeover/live disabled until truly implemented; never ship working-looking fake controls. Distinguish inherited UI/core behavior from unverified playback improvement.
