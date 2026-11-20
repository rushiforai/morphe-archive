# Afterglow for Android

Afterglow patches for **YouTube 21.43.523**, distributed as a Morphe patch
source. Existing Morphe features are integrated alongside Afterglow's own
features. See [HANDOFF.md](HANDOFF.md) for current coverage and validation limits.

## Add the source

In Morphe Manager, open **Sources → Add source**, paste this repository URL,
then select **Add**:

```text
https://github.com/afterglow-labs/ytafterglow-morphe-patches
```

[Open the add-source link](https://morphe.software/add-source?github=afterglow-labs/ytafterglow-morphe-patches&name=Afterglow)

For clients that ask for a JSON source URL, use:

```text
https://raw.githubusercontent.com/afterglow-labs/ytafterglow-morphe-patches/main/patches-bundle.json
```

The manifest points to the current verified `.mpp` on
[GitHub Releases](https://github.com/afterglow-labs/ytafterglow-morphe-patches/releases).
It updates when another verified build is published. A local `.mpp` can also be
imported from that release in Manager or Desktop.

## Current preview

The [build135 preview](docs/release-build135.md) provides **128 selectable patches**, with **105 selected
by default**. It fixes tab dragging, missing labels and icon alignment with labels shown or hidden.
It retains the [Afterglow app icon](docs/app-icon.md) and includes **Afterglow's downloader, queue and Vault**, **Theme
Studio**, Control Center, AB Lab and AI Home Studio. Morphe supplies **Return
YouTube Dislike**, **DeArrow**, **Copy text**, **GmsCore support** and **Spoof
video streams**.
Use an unpatched **YouTube 21.43.523** APK and select the Afterglow source.
Refresh the source and reset saved selections to the **105 defaults** for the
tested configuration; a saved selection from an older release can omit new groups.
Use this bundle's compatibility patches only; selecting another source's copies
applies overlapping hooks. A compatible GmsCore companion app is still required
for the non-root setup.

The native Download action and Afterglow's player button open the six-action
download sheet. Use **Afterglow settings → Control Center → Browse Media
Library** for Vault, or **Themes → Theme Studio** for presets and custom themes.
See [downloads and Vault](docs/afterglow-downloads.md) for supported media and
queue behavior.

Open **Afterglow settings → Additional features** for the imported Morphe
settings. Dislikes and title/comment copying are enabled by default. DeArrow's
title scopes are available there and start off. Selecting a patch does not turn
on every setting. The separate Description, profile-photo, comment and post
actions are available under **Tools**.

The import adds 86 feature patches from the pinned Morphe **2.0.0** source.
Features already covered by Afterglow keep their existing owner; partial overlaps
are optional. Afterglow owns downloading and Vault; shared features retain
Morphe's implementations. Custom development focuses on the remaining Afterglow
features.
See the [complete feature mapping](docs/morphe-catalog.md) for all inclusions,
overlaps and the two excluded branding patches.

Validation includes 540 settings checks, strict patching and APK assembly,
and Android 16 emulator checks. A four-hour 720p download resumes across restart,
finishes in the background, exports from Vault and passes a complete decode.
See [the port validation](docs/afterglow-port-validation.md) for the individually
verified flows and limits. Physical-device testing and account login remain
unverified.

Upstream-derived code retains its attribution and license notices, also available
in **Afterglow settings → About → Credits**. See [NOTICE](NOTICE), [LICENSE](LICENSE)
and [the pinned imported sources](vendor/morphe/README.md).
