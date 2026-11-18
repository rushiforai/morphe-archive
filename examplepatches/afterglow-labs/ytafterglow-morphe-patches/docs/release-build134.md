# Afterglow build134 preview

[Release](https://github.com/afterglow-labs/ytafterglow-morphe-patches/releases/tag/v0.1.0-build.134) · [Add source](https://morphe.software/add-source?github=afterglow-labs/ytafterglow-morphe-patches&name=Afterglow)

Build134 adds the supplied **Afterglow app icon** to the existing downloader,
Vault, Theme Studio and integrated Morphe feature bundle. The original artwork
is preserved. Adaptive padding keeps the play symbol and wordmark visible under
launcher masks. The application and all four launcher aliases use the same icon.
The app name, package, notification icon and saved preferences are unchanged.

Refresh the **Afterglow** source in Morphe Manager. It now contains **128 patches**,
with **105 selected by default**. Reset saved selections to defaults or explicitly
select **Afterglow app icon**, then patch an unmodified **YouTube 21.43.523** APK.
The icon is applied while patching; an existing installation needs the new APK.
Unselect the icon patch to retain YouTube's icon. See [icon details](app-icon.md).

## Verification

- Strict Desktop 1.20 / patcher 2.1 application and APK assembly pass for all
  105 defaults, all 128 patches, the icon alone, and an eight-patch selection
  that omits it.
- Actual APK checks verify the application and all launcher aliases, preserved
  alias states and absence of the icon artwork when the patch is unselected.
- The bundle loader verifies 128 exports, 105 defaults, 436 acyclic dependency
  objects, six forwarded options and the original Morphe resource hashes.
- All 540 settings checks pass. The delivery records 1,810 frozen inputs.
- The signed default APK upgrades the Android 16 emulator without resetting
  preferences or Vault. Android loads its actual `AdaptiveIconDrawable`;
  circle, rounded-square and squircle previews retain the complete wordmark.
  Launch succeeds, playback advances from 7 to 19 seconds, and the crash
  buffer is empty. Five saved Vault items remain visible after the upgrade.

Morphe Manager **2.6.0** refreshes the existing public source to **128 patches**,
applies all **105 defaults**, rebuilds and signs. Its saved APK passes ZIP and
Android v2 signature verification, compiled launcher-icon checks and 51 actual
watch-action DEX checks. The signing certificate matches the Manager build133
APK previously delivered to Samsung. Original Morphe remains disabled and no
temporary local source is used. The Manager-signed APK itself was not installed;
the emulator runtime checks above use a separately signed build of the same
default patch selection.

The source feed and anonymous release downloads are verified. Source commit:
`b3841fb0dad062c2b96f4c42f94672cd81f27d9a`.
Bundle SHA-256:
`273a77ddc2ec0b76948ccf21c65b74db310c97d83f54cfe8bdb3f4bfb96a686c`.
The release includes the `.mpp`, checksum and provenance manifest.

The updated APK is ready locally. Samsung transfer is pending because the phone
is disconnected; build134 has not been installed on it.
Earlier functional tests remain scoped to the builds recorded in
[build133](release-build133.md) and [port validation](afterglow-port-validation.md).
Physical-device, account-login and every optional runtime combination remain
unverified.
