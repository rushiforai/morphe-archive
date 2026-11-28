# Patch catalogue auto-update

`docs/assets/site.js` fetches the root `patches-list.json` from the `main` branch on every page load, bypassing browser caching. It checks again every five minutes and when a hidden tab becomes visible. The local `docs/assets/patches-list.json`, when present, is fallback-only.

For any patch addition, deletion or metadata change, regenerate the **root** `patches-list.json` from the built `.mpp` using the command described in the repository Build workflow, then commit the patch source and manifest together. The Build workflow verifies that the manifest matches the bundle. The website derives its catalogue cards, counts, enabled/disabled states and compatibility counts from that manifest. New items are categorized from their descriptions; uncertain items are placed in **Other / new patches**.

Do not hand-edit website counts or rely on editing the copied `docs/assets/patches-list.json`; the root manifest is authoritative.
