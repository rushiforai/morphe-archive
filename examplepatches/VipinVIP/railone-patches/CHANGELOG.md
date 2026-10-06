# Changelog

## 1.0.0 (2026-10-04)

First release: four patches for RailOne (org.cris.aikyam), all enabled by default.

### Patches

- Disable native security SDK. Stops the app loading libnative-lib.so, the native
  anti-tamper SDK that force-stops the app and wipes its own data on a re-signed build.
- Bypass USB-debugging detection. Forces the adb_enabled, adb_wifi_enabled and
  development_settings_enabled checks to return false.
- Bypass signature verification. Forces the app's own signing-certificate check to return
  true, so a re-signed build is accepted.
- Bypass rjsniffer ADB check. Neutralises the rjsniffer library's own adb_enabled check,
  which runs in its isolated Sniffer process.

### Notes

- Verified on RailOne 2.1.66 (versionCode 237) and 2.1.62, arm64.
- Fingerprints match on string constants and framework API calls, never on obfuscated class
  or method names, so they survive the per-release re-obfuscation.
- Morphe's own Clone app patch can be enabled alongside these, so the stock app stays
  installed, signed in and updatable by Play while the patched build lives beside it.
