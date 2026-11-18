# Afterglow build133 preview

[Release](https://github.com/afterglow-labs/ytafterglow-morphe-patches/releases/tag/v0.1.0-build.133) · [Add source](https://morphe.software/add-source?github=afterglow-labs/ytafterglow-morphe-patches&name=Afterglow)

This release brings Afterglow's downloader and Vault to Android, alongside Theme
Studio, Control Center, native tabs, Premium controls, AB Lab and AI Home Studio.
The bundle contains **127 selectable patches**, with **104 selected by default**.
Its 86 imported Morphe features include Return YouTube Dislike, DeArrow, Copy
text, post-image downloads, GmsCore support and stream compatibility. Afterglow
owns video/audio downloads and Vault; Morphe's overlapping Downloads interface
is replaced.

## Use the bundle

1. Refresh the **Afterglow** source in Morphe Manager, or add it with the link
   above. Confirm the source has **127 patches**.
2. Reset the saved patch selection to the **104 defaults**, then patch an
   unpatched **YouTube 21.43.523** APK. An older saved selection can omit new
   feature groups. Use the compatibility patches from this bundle; non-root
   installation also requires the separate compatible GmsCore companion app.
3. The native watch **Download** action and Afterglow's player button open the
   six-action sheet: **Video, Audio, Captions, Thumbnail, Details and Open In**.
4. Open **Afterglow settings → Control Center → Browse Media Library** for Vault,
   or **Themes → Theme Studio** for themes. Imported Morphe settings are under
   **Additional features**. Optional Description, profile-photo, comment and
   post actions are under **Tools**.

Existing preferences and Vault media survive an APK upgrade signed with the
same key. Selecting a patch makes its controls available; individual settings
keep their own defaults.

## Verification

The frozen bundle strictly applies and rebuilds all four tested selections with
Morphe Desktop 1.20.0 / patcher 2.1.0:

- The **104 default patches**.
- **All 127 patches**, including optional overlaps.
- Eight independent patches: Comments header, GmsCore support, Spoof video
  streams, Return YouTube Dislike, DeArrow, Downloads and Vault, Copy text and
  Download post images.
- Long-press tools, GmsCore support and Spoof video streams alone.

The loader verifies 127 unique exports, 104 defaults, an acyclic 434-object
dependency graph, six original option objects and the bundled upstream resource
hashes. The delivery manifest records **1,806 source/provenance inputs**.
Settings visibility, ownership, defaults and reset checks pass **540/540**.
Focused checks cover downloads, durable storage, native controls, themes,
destinations and exact native bindings; retained results are tied to input
hashes, with changed capture/avatar/Description paths checked again.

Build133 adds the final Lite Mode ownership guard: omitting that patch disables
the player sheet's Lite control and preserves its saved preference. All 74
actual-session checks pass, including both saved ON and OFF values with the
owner absent. This changes two production files from the runtime-tested132
snapshot; the retained runtime results identify their original tested build.

The final build133 default APK advances the native playback clock from 5 to 13
seconds, displays dislikes, toggles the installed Lite control ON/OFF and resolves
all six download actions. Its installed SHA matches the signed candidate, with
an empty crash buffer. The temporary clipboard probe is removed, and the original
emulator renderer and host clipboard settings are restored.

Morphe Manager **2.6.0** refreshes the existing public Afterglow source to **127
patches**, then applies the **104 defaults** to the verified stock APK and
rebuilds and signs successfully. The saved APK passes ZIP integrity and Android
v2 signature verification. The original Morphe source remains disabled, and
no temporary local source is used.

The Android 16 emulator checkpoints include adaptive video and audio downloads,
captions, thumbnails, Vault import/export and owned viewers. A four-hour 720p
download resumes across restart and upgrade, finishes in the background and
exports a **428,436,160-byte MP4** that passes full decode. Other verified flows
include native tabs and Lite Mode, theme colors on ordinary/live timelines,
Premium controls, AB Lab recovery, prompt-library persistence, full title/raw
description copying, avatar Save/Copy, rendered comment/post Save/Copy, carousel
image selection and Morphe's original post-image downloads.

See [port validation](afterglow-port-validation.md) and the delivery manifest for
the individually tested builds, exact results and evidence boundaries. The iOS
parity ledger now records **195 implemented / 4 not applicable / 0 pending** for
the Android feature scope; this does not claim every runtime configuration has
been exercised.

## Limits

Physical devices, account login, casting and every optional setting combination
remain unverified. Native AI feed execution and the paused Shorts subscription
carousel require server/account capabilities absent from the signed-out test
fixture. The local AI prompt library is verified.

Rendered post images include the currently mounted native content. A tall post's
full photo can be captured beyond the visible viewport, but footer controls that
YouTube has unmounted remain blank. The implementation does not reconstruct
unseen native content.

Description and image-copy checks use the emulator's host GLES renderer with
host clipboard synchronization disabled. Software-renderer qemu exits and the
host clipboard's replacement of image clips are recorded separately in the
[validation notes](afterglow-port-validation.md); they are not presented as
Android application crashes or physical-device results.

The release supplies the patch bundle, checksum and provenance/validation
manifest. Test YouTube APKs remain local. Imported attribution and licenses are
retained in the repository, bundle and **About → Credits**.

Bundle size: **24,751,851 bytes**. SHA-256:
`01605816b7243df9ad1f8c10d4eb5bf636df31ddf3d5e89d9a9cb9ef61df0c06`.
