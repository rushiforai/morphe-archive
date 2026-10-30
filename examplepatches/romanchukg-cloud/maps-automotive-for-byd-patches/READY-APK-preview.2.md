# Ready APK — Morphe preview 2 / build 34

**TEST · Android 11+ · ARM64 · confirmed BEVs using CCS2 stations.**

**Published:** [download the APK attachment in BYD Apps](https://t.me/byd_apps_updates/29). It accompanies the [preview 2 / build 34 announcement](https://t.me/byd_apps_updates/28). The owner approved both together through the shared news bot. The APK is hosted in Telegram; it is not a GitHub asset.

This APK uses the public [Morphe preview 2 patches](README.md) with `known_bev=true`. It is the Automotive edition of Maps, independent of phone Maps. **Phone Maps can stay installed.** It is not a PHEV or universal-connector build.

## Exact file

| Item | Value |
| --- | --- |
| Filename | `Maps-Automotive-for-BYD-Morphe-preview.2-build34-BEV-CCS2.apk` |
| Size | `94407585` bytes |
| Base Maps Automotive | `26.09.280001.E` |
| Package / shared UID | `com.google.android.apps.maps.automotive` |
| Version code | `1068820722` |
| Diagnostic version | `patch-lab.34` |
| Patch option | `known_bev=true` |

APK SHA-256:

```text
b0972bcfe167d691651250d5625098a4e6f5cc7b682a02ea48a0c9072058ff71
```

Signing-certificate SHA-256:

```text
a8401545b03562933c095667ae0eb54bab189d8571010e4eb3384753ad6508d5
```

This is the existing project signing key. A matching project-signed Automotive installation, including the earlier preview 1 ready APK, can be updated without uninstalling. Save a backup of settings you need before updating. A personal or laboratory signing key is different: Android will reject that update. Moving from such an installation to this project-signed APK requires a one-time Automotive reinstall and loses its local data/settings. Do not remove phone Maps or microG to resolve a signature mismatch.

## Install and sign in

Save the [Telegram APK attachment](https://t.me/byd_apps_updates/29) and compare its exact filename, size and SHA-256 above. Open the file in the head unit's Android file manager to install or update.

Install the matching ARM64 APK from the official [MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases). Version **7.2.1** is tested; newer releases are not automatically verified. Its package is `app.revanced.android.gms`; older microG under `com.google.android.gms` does not replace it. Keep older microG if other apps need it.

Add your account in MicroG-RE; this is a separate Google sign-in. Open Automotive, grant **Contacts** and **Location**, and finish sign-in if asked. Check the map and account before enabling vehicle features. Do not share account screenshots, passwords or tokens. See the [Tang-specific sign-in workaround](README.md#sign-in-troubleshooting-on-the-tested-tang) if the email form does not open.

## What's included

- **Interface size:** 100%, 90% or 80% under **Instrument cluster → Interface size**. New installations default to 90%; an existing explicit choice is preserved. Selection applies automatically when navigation is known inactive; active or unknown navigation defers it.
- **Native 3D switch:** **Raised Buildings / 3D Buildings** in Maps settings controls building extrusion. Native rendering and layer rules still apply.
- **Search alignment:** collapsed Search aligns with the top toolbar buttons.
- **Rounded app corners:** optional black 28dp corners on eligible central-screen Maps windows, **OFF by default**. The cluster/HUD and BYD system bars are outside its scope.

## Optional battery/range and EV routes

Both vehicle-data opt-ins start **OFF on a new installation**; an update can retain existing choices. Basic Maps use does not need ADB.

Enable network ADB, then **Instrument cluster → BYD vehicle data → Use BYD vehicle data** and **Automatic reader → Enable automatic reader**. Approve the head unit's standard ADB prompt with **Always allow**. The reader connects locally to `127.0.0.1:5555`; ADB must remain enabled after reboot. Allow Maps startup/background operation in BYD settings. On the tested Tang, **Disable background Apps → Maps Automotive must be OFF**, because that menu lists blocked apps; the two switches inside Maps stay ON.

Check fresh readings against the physical instrument cluster. Sampling is about once a minute; readings expire after 90 seconds. For experimental EV routes, enter your own battery capacity in **BYD vehicle data → EV routing profile** and choose **Save and enable EV routes**. The BEV/CCS2 patch option is already enabled in this APK, but does not enable the reader, profile or battery capacity for you. Unsupported or unverified readings must not be accepted as valid.

## Verification limits

This ready APK has **no new car or emulator installation test**. Earlier private revision 34 was installed on one Tang; the owner accepted its main-screen appearance and stopped further tests. A full revision 34 account, route, reboot or UI regression suite was not completed. Night mode, RTL, other windows and rounded corners together with scale changes remain unverified.

Visible 3D geometry was checked on earlier revisions 30/31; automatic sizing and Search alignment on 32/33; reader reboot and a stationary Paris route with two charging stops on 25. Those results are not new tests of this ready APK. Road predictions, charging power/duration, charging-inclusive ETA, physical cluster/HUD/audio and current-bundle PiP require further validation. Morphe cluster satellite imagery and the general native navigation-service/foreground-service startup timeout remain unresolved.

There is **no in-app APK OTA**. A future project-signed APK can update the matching installation; a personal self-build must keep its own backed-up signing key. Updating Morphe's source alone does not update installed Maps.

[Full setup](README.md) · [Preview 2 release notes](RELEASE-NOTES.md) · [Earlier account-free laboratory illustration](docs/morphe-preview.2.png) — an illustrative revision 29 settings image, not a new car test.
