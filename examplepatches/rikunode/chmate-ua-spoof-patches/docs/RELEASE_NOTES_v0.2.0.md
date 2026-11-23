# ChMate UA Spoof v0.2.0

v0.2.0 adds one optional settings entry to Haiagaru 1.46.0's settings top. It does not change the v0.1.0 UA behavior.

## Changes
- Haiagaru 1.46.0 settings top: appends one **User-Agent 偽装** card after the existing categories. Existing category names, order, content, icons and behavior are unchanged.
- The card opens the same controls as v0.1.0 (ON/OFF, free UA text, presets, reset, warnings) in Haiagaru's existing card style.
- The standalone launcher entry **"UA Spoof"** remains. Stored preferences are unchanged (`chmate_ua_spoof`).
- If the Haiagaru 1.46.0 classes/signatures are not found, only the launcher entry is available; nothing is injected.

## Unchanged from v0.1.0
- Default OFF; OFF is identical to Haiagaru alone.
- Full UA replacement for native okhttp/java.net requests (GET/HEAD, POST posting/auth, images), native WebView UA, and startup `http.agent`.
- Haiagaru's saved bbs.eddibb.cc ReadingAuth paired UA still wins for authenticated reads.
- Hooks are inserted in `finalize`, i.e. always after Haiagaru's hooks.
- ChMate 0.8.10.226 dev only; official Haiagaru 1.46.0.

## Verification
- Combined APK (Haiagaru 1.46.0 + this MPP) applied with no errors.
- Static verification `ALL CHECKS PASSED`: `settingsGroups` changed only by the appended entry call before each return; `settingsCategory` only by a 4-instruction prefix; all v0.1.0 hook counts/order remain; `UaSpoofHaiagaruEntry` exists only in the combined APK.
- Android 16 emulator, local echo server only, no real forum posts:
  - OFF (initial and after reset): dat GET, SETTING.TXT GET and bbs.cgi POST UAs exactly matched the Haiagaru-only APK.
  - ON via the new card (legacy preset): dat GET and SETTING.TXT GET used the selected UA. ON POST was not re-sent; the POST hook is unchanged and statically verified.
  - Screenshots: settings top, detail, detail lower; visually compared with the reference and judged PASS.
- Not verified: physical devices, Morphe Manager (Android), v0.2.0 ON POST at runtime, real Cloudflare/eddibb ReadingAuth flows, in-app browser/image runtime behavior.

## Artifact
`patches-0.2.0.mpp` — SHA-256 `2ca02210f701a888f4c66444f95744825e7b80f8985d9504e3588bb13820ef04`

## Warnings
- Do not change the UA during a Cloudflare challenge.
- Keep the UA fixed while growing donguri.
- Changing the UA cannot lift IP bans.

Unofficial; not affiliated with ChMate or Haiagaru.
