# RailOne Patches

Morphe patch bundle for **RailOne** / Aikyam (`org.cris.aikyam`) - the Indian Railways
passenger app by CRIS.

> Independent project. Not affiliated with, endorsed by, or authored by the Morphe project.
> Built with [morphe-patcher](https://github.com/MorpheApp/morphe-patcher); "Morphe" is
> referenced only to describe compatibility, as required by the Morphe NOTICE.

## What the patches do

| Patch | Effect |
|---|---|
| **Disable native security SDK** | Stops the app loading `libnative-lib.so`, the native anti-tamper SDK that force-stops the app and wipes its own data when it thinks the build is tampered with. Root-cause fix; without it the other three don't help. |
| **Bypass USB-debugging detection** | Forces `adb_enabled`, `adb_wifi_enabled` and `development_settings_enabled` to `false`. |
| **Bypass signature verification** | Forces the app's own signing-certificate check (SHA-256 of the APK signature) to `true`, so a re-signed build is accepted. |
| **Bypass rjsniffer ADB check** | Neutralises the rjsniffer library's own `adb_enabled` check, which runs in the isolated `:com.emrys.rjsniffer.rjsniffer.Sniffer` process. |

All four are enabled by default. They matter if you run RailOne on a device where USB debugging
or developer options are switched on - the stock app treats that as tampering.

## Supported versions

| Version | Status |
|---|---|
| 2.1.66 (versionCode 237) | verified |
| 2.1.62 | verified |
| any later version | experimental |

The fingerprints match on string constants and framework API calls (e.g. `"native-lib"` +
`System.loadLibrary`, `"adb_enabled"` + `Settings$Global.getInt`), never on obfuscated class or
method names - so they survive the per-release re-obfuscation that renames everything.

## Using it

Add this repository as a patch source in Morphe:

- deeplink: <https://morphe.software/add-source?github=VipinVIP/railone-patches>
- or manually: `https://github.com/VipinVIP/railone-patches`

You supply the app yourself - export the APK/splits from your own installed copy, or get them
from a source you trust. The bundle pins the genuine Play signing certificate (SHA-256
`8a5f21a0...f0d16`), so Morphe rejects a wrong or modified original.

**Install notes**

- Patched builds are signed with *your* keystore in Morphe Manager. A patched build cannot
  upgrade over the Play-signed app, so the first patch requires the original to be uninstalled
  (app data is lost, and you sign in again) - unless you use Morphe's root mount option.
- After that, repatches keep your data **as long as Manager keeps signing with the same
  keystore**. Import your keystore into Manager once and the install stays upgrade-compatible.
- To keep the stock app instead, enable Morphe's own **Clone app** patch alongside these, with a
  unique package name and the `updatePermissions` and `updateProviders` options. The patched
  build is then a separate app and the original stays installed and signed in.

## Verification

Version 1.0.0 was checked end to end on a Motorola Edge 50 Neo: Morphe applied all four patches
to the real 2.1.66 split bundle, the merged APK installed as an in-place upgrade, and the app
stayed alive with USB debugging enabled - no anti-tamper wipe, no native-library failure.

## Building from source

See [CONTRIBUTING.md](CONTRIBUTING.md) for prerequisites, the build command, how to test a bundle
with the Morphe CLI, and the release checklist.

## Licence and credits

GPL-3.0 - see [LICENSE](LICENSE) and [NOTICE](NOTICE). The patch API is the work of the Morphe
project (itself a fork of ReVanced Patcher). This repository is an independent derivative and
claims no authorship of, or association with, either project.
