# ChMate UA Spoof v0.1.0

First release. Add-on Morphe patch for **ChMate 0.8.10.226 dev only**, to be applied together with the official **Haiagaru 1.46.0** bundle. 0.8.10.191 dev: planned. 0.8.10.242 dev: unsupported.

## Features
- ON/OFF (default **OFF**); OFF behaves exactly like Haiagaru alone.
- Free UA text entry (printable ASCII, 1–1024 chars), unlimited edits, "restore to original" (OFF + clear + restore `http.agent`).
- Presets: Dalvik Android 14/15/16, browser (device WebView default UA), legacy `Dalvik/2.1.0 (Linux; U; Android 4.0.3; HT-01 Build/XYZ0.123456.789)`.
- ON: `System.setProperty("http.agent", UA)` at startup; full User-Agent replacement for native okhttp (`o.zzdA`) and `java.net` requests (GET/HEAD, POST posting/auth, images); native WebView `setUserAgentString` (Cloudflare challenge dialog, in-app browser) aligned. Cookies untouched.
- Haiagaru bbs.eddibb.cc ReadingAuth paired UA is never replaced for authenticated reads.
- Hooks are inserted in `finalize`, i.e. always after Haiagaru's hooks, regardless of patch order.
- Settings: separate launcher entry **"UA Spoof"**; own preferences file `chmate_ua_spoof`.

## Verification
- Verified: Morphe Desktop 1.19.1 applied Haiagaru 1.46.0 + this MPP to stock 226 (SHA-256 `7290a076…4dd9c4`) with no errors; static hook order/count check of the patched APK; 33 JVM tests incl. local UA echo GET/POST; Android 16 emulator: launch + settings OK, native dat GET / SETTING.TXT GET / bbs.cgi POST to a local echo server carried exactly the chosen UA when ON and were identical to Haiagaru alone when OFF.
- Not verified: physical devices, Morphe Manager (Android), real Cloudflare / eddibb ReadingAuth flows, in-app browser and image requests at runtime.

## Warnings
- Do not change the UA during a Cloudflare challenge.
- Keep the UA fixed while growing donguri.
- Changing the UA cannot lift IP bans.

Unofficial; not affiliated with ChMate or Haiagaru.
