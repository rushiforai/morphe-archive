# XXLC Grok Patches

Patches by XXLC for Grok Android, compatible with Morphe Manager.

## Supported app

Supports only `ai.x.grok` **1.2.59-release.00**, versionCode **11259200**,
APKMirror **`.apkm`** input.

## Install with Morphe Manager

In Morphe Manager, add `https://github.com/XXLC/grok-morphe-patches` as a patch
source for stable releases, or use [Add to Morphe Manager](https://morphe.software/add-source?github=XXLC/grok-morphe-patches).
For prereleases, add `https://github.com/XXLC/grok-morphe-patches/tree/dev` instead.
Select the supported app file and apply the patches.

## Patches

| Patch | Behavior | Selected by default |
| --- | --- | --- |
| Bypass license check | Skip the Pairip license check. | Enabled |
| Download all (post) | Add a separate menu item, with an image-collection icon instead of the save icon, to download all media in the current Imagine post. | Enabled |
| Download all (library) | Add a separate button, with an image-collection icon instead of the save icon, to download all media in the selected Imagine posts. | Enabled |
| Download best video quality | Select the best video URL already supplied by the server, preserving caption/music overlays and falling back to the original URL when needed. Images are unchanged. Not tested on a device. | Enabled |
| Download file names | Use `Grok_yyyyMMdd_HHmmss_SSS_sequence` names for downloaded images/videos, preserving extensions and existing deduplication. Not tested on a device. | Enabled |
| Download folders | Save every download, from inside a post and from the library, to `Download/Grok/Pictures` (images), `Download/Grok/Videos` (videos) or `Download/Grok` (other files), using the MediaStore Downloads collection (or the public Download directory before Android 10). Without this patch, library downloads land in the root `Download` folder. Includes the media viewer, GrokBot image saves and DownloadManager saves. Not tested on a device. | Enabled |
| Copy prompt | Add a post menu item with the app's copy icon that copies the current media prompt; it is shown only for finished, non-moderated media (not while generation is loading, failed or moderated, so Retry stays visible) and hidden when the prompt is empty. No seed field was found in the 1.2.59 model. Not tested on a device. | Enabled |
| Ignore Team/Org Imagine lock | Make the app treat Imagine as allowed when a Team/Org setting disables it. App UI only: the server may still refuse Imagine requests, and the setting overridden was chosen by an organization admin. Use only on accounts you control. Not tested on a device. | Disabled |
| Show Imagine tab | Always show the Imagine tab on the home screen, even when the remote home-layout flag hides it for new accounts or accounts that have not used Imagine recently. Team/Org admin locks are not overridden. Not tested on a device. | Enabled |
| Keep screen on | Prevent automatic screen timeout while Grok's main Activity is resumed, including chat. Uses more battery. Not tested on a device. | Disabled |
| Disable telemetry | Stop internal analytics events, Mixpanel tracking and Hightouch payload submission; force Crashlytics collection off. Not tested on a device. | Enabled |
| Hide upgrade prompts | Hide the Imagine limit banner and Settings upsell card, preserving usage data and subscription management. Not tested on a device. | Disabled |
| Skip delete confirmation | Immediately confirm deletion of a single Imagine image/video and of several library items selected together, without showing the confirmation dialog. Deleting an entire Imagine conversation still asks. Deletion is permanent on the server, with no Undo. Not tested on a device. | Disabled |

Patch names and descriptions are written in English; Morphe Manager can translate them into its app language. The original Download actions remain available. Download all and Copy prompt use
shared internal infrastructure. Selecting a patch applies it:
all `enabled` options default to true, including patches not selected by default.
Set `enabled` to false to skip a patch's edits while keeping it selected. Shared
dependencies may still run. These are patch-time choices; there is no additional
settings screen in the app. Library Download all shows the number of requests
prepared for download, not completed downloads.

## Verification

- The maintainer installed the `v1.2.0` bundle on Grok 1.2.59-release.00 and
  reported it working. Which individual patches were exercised was not recorded,
  so per-patch device coverage is unknown. Names, registers and
  branch targets were re-derived from the decoded 1.2.59 smali. The
  `v1.2.0-dev.2` bundle builds in CI and Morphe Desktop CLI v1.20.0
  (`--validate`, full bytecode mode) applied all 13 patches to the 1.2.59 APK.
  The patched APK decodes, and a smali comparison with the original shows only
  the 30 intended methods changed, with unchanged register counts. Android's
  bytecode verifier behavior was not inspected separately.
- The previous stable release `v1.1.0` supports Grok 1.2.57-release.01.

## Known limitations

- Per-patch device coverage of the new patches and the 1.2.59 changes is unknown; only the overall bundle was reported working.
- Library Download all passes its mode to the selection handler through one process-wide flag (`DownloadAllState.all`). Two library download actions that overlap in time can read each other's mode; carrying the mode per operation would mean threading state through obfuscated callbacks.
- Selecting Copy prompt or Download all (post) runs the unnamed
  `PostActionFlagsPatch.kt` dependency. It changes equality comparisons for the
  app's Download actions to include the two injected action flags, even when
  a selected public patch's `enabled` option is false.
- The download queue toast may not appear on some Android versions. Notify uses
  the library handler's Context first; if it is null, it tries two reflective
  application lookups that Android may restrict. Notification failures are
  silently ignored and do not stop download processing.
- X sign-in was reported working by the maintainer on a device with the
  1.1.0-dev.1 build (re-signed APK). Sign-in depends on server-side checks by
  X/xAI and the sign-in method, so it is not guaranteed on other devices or
  versions. These patches do not spoof application signatures or attestation and
  do not include an X sign-in bypass.
- Disable telemetry targets the identified event paths and the app's Crashlytics
  collection setter. It is not a network firewall: SDK initialization, previously
  queued events and other tracking paths have not been ruled out. Crashlytics may
  initialize before the app calls its setter.
- Hide upgrade prompts changes Compose rendering and does not unlock paid
  features or alter server limits. Other upgrade surfaces remain available.
- Skip delete confirmation schedules the existing confirm and dismiss callbacks
  as a Compose side effect after the dialog group is composed. The first
  1.1.0-dev.1 build invoked them during composition and did not work on a device;
  this version has not been tested yet. It covers single-item deletion and
  library bulk deletion only. Leave it disabled unless permanent deletion
  without confirmation is intended.
- Download folders changes where files are saved, not their names. Nested
  `Download/Grok/...` folders rely on MediaStore Downloads accepting the relative
  path (Android 10+) and on `mkdirs` (before Android 10); both are untested.
- Best video quality selects only among server-provided URLs; it cannot create
  a higher-quality source. Images expose a single URL, so this patch offers no
  higher-quality image variant and performs no image processing.
- Copy prompt reads the current media prompt; copying seeds is unavailable in
  this model. Select all has not been implemented for the Imagine action bar.
- Filename sequence numbers are unique within a running process. Existing image
  deduplication remains, but uniqueness across app restarts is not guaranteed for
  the video saver on Android versions before 10.

## Disclaimer

- Not affiliated with, endorsed by, or sponsored by xAI or the Morphe project.
  "Grok" is a trademark of its owner.
- Provided "as is", without warranty of any kind. Use at your own risk.
- This repository contains only patch source code. It does not contain or distribute
  APKs or any xAI or Google assets.
- The Pairip license check bypass is intended only for personal compatibility with a
  lawfully obtained copy of the app. Modifying the app may violate its terms of
  service; you are responsible for how you use these patches.

## Development

See [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for maintenance and release instructions.

## License

Licensed under [GPLv3](LICENSE), subject to the retained [NOTICE](NOTICE).
