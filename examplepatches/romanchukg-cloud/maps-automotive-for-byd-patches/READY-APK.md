# Ready APK — Maps Automotive for BYD, preview 1 / build 26

**Older ready APK:** this page and its Telegram links describe **preview 1 / build 26**. The latest ready APK is **[Morphe preview 2 / build 34](READY-APK-preview.2.md)** in [Telegram](https://t.me/byd_apps_updates/29); the current patch release is **Morphe preview 3**, available as a [self-build](README.md). The APK below does not include preview 2's interface size, 3D switch, Search alignment or rounded corners. Moving from this project-signed APK to a personal signing key requires a one-time Automotive reinstall and loses its local data/settings; subsequent self-build updates must reuse that personal key.

**TEST · Android 11+ · ARM64 · confirmed battery electric vehicles using CCS2.**

This guide describes the project-signed APK supplied with the [ready-APK announcement in BYD Apps](https://t.me/byd_apps_updates/23). Download the [APK document attached to that announcement](https://t.me/byd_apps_updates/24). It is the Automotive edition of Google Maps for Android head units, independent of phone Maps. **Phone Maps can stay installed.**

The ready APK was created with our Morphe preview 1 patches and `known_bev=true`. This fixes its BEV identity at patch time; the supplied APK is **not a PHEV or universal-connector build**. For self-build with a different patch option, use the [Morphe guide](README.md). GitHub contains our own patches/code and documentation only; the ready Maps APK and signing keys are not GitHub assets.

## Identify the exact file

| Item | Value |
| --- | --- |
| Filename | `Maps-Automotive-for-BYD-Morphe-preview.1-build26-BEV-CCS2.apk` |
| Size | `94358433` bytes |
| Base Maps Automotive | `26.09.280001.E` |
| Output package | `com.google.android.apps.maps.automotive` |
| Output version code | `1068820722` |
| Diagnostic version | `patch-lab.26` |
| Patch option | `known_bev=true` |

APK SHA-256:

```text
f69c6bb632d36278c4b23c67e2bbc488cf8e5c3041c0166c3f8b07185903ca1d
```

Signing-certificate SHA-256:

```text
a8401545b03562933c095667ae0eb54bab189d8571010e4eb3384753ad6508d5
```

This is the existing project signing identity used by our earlier Automotive builds, not a new or Morphe-generated personal key. A matching package and signing certificate permit an update without uninstalling. If your installed Automotive uses another personal or laboratory key, Android will reject that update. Save the settings you need, then reinstall **only Automotive** if you choose to migrate; uninstalling removes its local data/settings. Do not remove phone Maps or microG to solve a signing mismatch. The private project key is not distributed.

## Install and sign in

1. Save the APK document from the ready-APK Telegram announcement. Compare its filename, size and SHA-256 with the values above. Install it by opening the saved file in the head unit's normal Android file manager.
2. Open the official [MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases) and install the matching **ARM64 APK**. This preview requires at least 7.2.1, which is the tested version; newer releases are not automatically verified. Its package is `app.revanced.android.gms`. Ordinary microG under `com.google.android.gms` does not replace this dependency. **Keep older microG if other apps use it; do not delete its accounts.**
3. Add your Google account in MicroG-RE. This is a separate sign-in; an account in older microG does not transfer automatically. Never share your password, tokens or account screenshot in a support report.
4. Open Maps Automotive, allow **Contacts** and **Location**, and finish sign-in if requested. Check that the map and your account work before enabling vehicle integration.

If MicroG-RE fails before the email form, read the [Tang-specific sign-in workaround](README.md#sign-in-troubleshooting-on-the-tested-tang). It is not a requirement established for all cars.

## Optional live battery/range and automatic reader

The two vehicle-data switches start **OFF on a new installation**. Updating an existing installation can retain its choices. Ordinary Maps use does not need the reader.

1. Enable network ADB in the head unit's settings. The reader connects to the head unit itself at `127.0.0.1:5555`; ADB must remain available after a head-unit restart.
2. Allow Maps Automotive automatic startup and background operation in BYD settings. On the tested Tang, **Disable background Apps → Maps Automotive must be OFF**, because this menu lists blocked apps. This is separate from the two switches inside Maps, which must be ON. Labels and switch directions can differ on other firmware; recheck the BYD permission after updates.
3. Open **Maps Automotive → Instrument cluster → BYD vehicle data** and enable **Use BYD vehicle data**.
4. Open **Automatic reader → Enable automatic reader**. Approve the standard ADB authorization prompt on the head unit and select **Always allow**. Use **Authorize or retry** if needed.
5. Check for **Automatic reader connected** and fresh charge/range values matching the physical instrument cluster. Unsupported or unknown readings must not be guessed or confirmed as valid.

After initial authorization, the reader is designed to run without a connected computer. It reads about once a minute; values expire after 90 seconds and are then withdrawn from EV predictions. It only reads vehicle data and does not operate the charge port or change vehicle settings.

## Optional experimental EV routes

This ready APK has the confirmed-BEV/CCS2 patch option already enabled, but it **does not enable the reader, enter a battery capacity or turn on the EV profile for you**.

Once the reader's values are fresh and correct, open **BYD vehicle data → EV routing profile**. Enter your own battery capacity in **kWh**, then choose **Save and enable EV routes**. The test vehicle was a Tang with an owner-entered 108 kWh capacity and CCS2 charging through an adapter; do not copy that capacity unless it is correct for your vehicle.

Maps can then use the accepted live charge/range to calculate native EV routes and charging stops. This is experimental support for BEVs using CCS2 stations, not verified PHEV or universal-connector support. Expired readings are withdrawn rather than reused for a battery prediction.

## What was checked, and what remains open

The ready APK's production signature, package/version and alignment were checked. Its 3,258 ZIP-entry payloads match the verified unsigned Desktop build. The patch/runtime retain Morphe revision 25's behavior apart from the version marker. **Build26 has not had a new car reboot or route test.**

On **Morphe revision 25**, one BYD Tang received fresh charge/range after a full head-unit reboot without a computer, once BYD startup/background permission was allowed. A stationary 907 km Paris route preview then planned two automatic charging stops and 30% at arrival. Navigation was not started; those results do not validate predictions in real driving, charging duration, charging power or an ETA including charging.

Other BYD firmware, physical cluster/HUD/audio, current-bundle PiP and long sleep behavior are not established by that test. Morphe cluster satellite imagery and the general native navigation-service startup timeout remain unresolved. Charge-port cover and lock-feedback diagnostics may show Unknown or Unverified; they are not confirmed physical indicators. See the [historical preview 1 release notes](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/tag/morphe-preview.1). Current patch features and limits are in the [preview 2 notes](RELEASE-NOTES.md).

There is **no in-app APK auto-update**. A future project-signed APK can update a matching project-signed installation; a Morphe self-build normally uses your own key and needs the separate one-time migration described above. For later personal builds, keep and reuse your own backed-up signing key. Updating Morphe's remote patch source alone does not update installed Maps.

## Screenshot used with the announcement

![Instrument cluster settings on a clean Android API32 emulator](https://raw.githubusercontent.com/romanchukg-cloud/maps-automotive-for-byd-patches/main/docs/instrument-cluster-demo.png)

This is the actual settings UI on a clean API32 emulator with fresh MicroG-RE and no Google account. It demonstrates the menu, not live map tiles, battery readings or physical cluster output.
