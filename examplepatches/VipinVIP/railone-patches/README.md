# RailOne Patches

Morphe patch bundle for **RailOne** / Aikyam (`org.cris.aikyam`), the Indian Railways passenger
app by CRIS.

## Usage

Add this repository as a patch source in Morphe:

[**+ Add RailOne Patches to Morphe**](https://morphe.software/add-source?github=VipinVIP/railone-patches)

Then patch the RailOne APK file:

1. Pick RailOne. If it's installed, Morphe can use that copy directly; if it isn't, point
   Morphe at the APK/APKS (the installer file) from a source you trust. Only the genuine
   Play-signed file is accepted, so a modified one is refused.
2. In Morphe tap **Select other apps → Open APK file** and pick that file.
3. Pick the patches (all seven are on by default) and tap **Patch**.
4. Install the patched app. It can't go on top of the Play version, so remove that first, or turn
   on Morphe's **Clone app** patch to keep the original and the patched app side by side.

## Patch Details

| Patch | Description |
|---|---|
| **Disable native security SDK** | Stops the app loading `libnative-lib.so`, the anti-tamper SDK that force-stops the app and wipes its data on a re-signed build. Root-cause fix. |
| **Bypass USB-debugging detection** | Forces `adb_enabled`, `adb_wifi_enabled` and `development_settings_enabled` to `false`. |
| **Bypass signature verification** | Accepts a re-signed build. |
| **Bypass rjsniffer ADB check** | Neutralises rjsniffer's own `adb_enabled` check, which runs in its isolated `Sniffer` process. |
| **Allow screenshots** | Removes the `FLAG_SECURE` block the in-app WebView and the bundled `no_screenshot` plugin apply. |
| **Hide screenshot detection** | Screenshot and screen-recording detection never becomes active. |
| **Monochrome icon support** | Adds the missing monochrome layer to the adaptive icon, so Material You launchers can tint it. |

All seven are enabled by default.

## Supported versions

| Version | Status |
|---|---|
| 2.1.71 | verified |
| 2.1.66 | verified |
| 2.1.62 | verified |
| later versions | experimental |

## Building

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

GPL-3.0 - see [LICENSE](LICENSE) and [NOTICE](NOTICE). Independent project: not affiliated with,
endorsed by, or authored by the Morphe project.
