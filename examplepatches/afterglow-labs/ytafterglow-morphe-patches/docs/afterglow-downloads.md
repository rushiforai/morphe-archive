# Afterglow downloads and Vault

Published [build133](release-build133.md) includes the Android download feature with Afterglow's own sheets, durable queue, saved
files and Vault. The original Morphe Downloads patch is excluded from the public
selection. Return YouTube Dislike and the other integrated Morphe features keep
their existing implementations. Original post-image/GIF downloading also remains
Morphe-owned; it is separate from Afterglow's video/audio/caption/thumbnail queue.
The public source feed and release download are verified.

## Flow

The native Download action and the Afterglow player button open the six-action
sheet: Video, Audio, Captions, Thumbnail, Details and Open In. Video choices pair
a compatible audio track; the audio preference controls standard/high bitrate
and automatic versus explicit language selection. The sheet uses the download
font size and face preferences. Details and Open In keep the original watch URL.

Downloads run through a user-started foreground service. The queue supports
pause, resume, cancellation, retry, duplicate handling and explicit replacement.
Completed media becomes a Vault item before share or media-library export starts.
An export failure retains that item. Video/audio assembly uses Android's media
APIs, with format choices limited to supported codec/container combinations.
See the [MediaMuxer codec matrix](https://developer.android.com/reference/android/media/MediaMuxer#addTrack(android.media.MediaFormat)).

Vault provides search, combined filters, sorting, grouping, favorites,
collections, metadata refresh, file import, rename, share, export, deletion and
missing-file repair. The owned viewer opens video, audio, images and captions;
Open In and Share can also hand a read-only content URI to another app.

## Resolver and persistence

The primary resolver ports the current iOS Afterglow policy: an isolated,
cookie-preserving watch bootstrap supplies the current visitor context and
player signature timestamp for a fresh VISIONOS player request. If that path
does not provide usable streams, the installed Morphe stream compatibility
transport supplies resolved player data. This reuses signature/client fixes,
not Morphe's download interface or native offline library. A bounded byte probe
checks a media URL before its formats are offered.

Signed media/caption URLs, headers, account cookies and tokens stay in memory.
The durable queue stores a video ID and explicit format/audio/caption identity.
A resumed request obtains fresh URLs and only reuses partial bytes for the same
stream identity. Media transfers use bounded 4 MiB requests to avoid the server's
open-ended response throttle. HTTP ranges and expected sizes are checked; an
ignored Range response starts over, and an exact completed-range response can
reuse a finished part. Queue/index writes use bounded, checked recovery files. Downloads are kept
under the app's private files directory; exporting uses MediaStore or a granted
document URI and does not require broad storage access.

The service observes Android's
[foreground-service timeout](https://developer.android.com/develop/background-work/services/fgs/timeout)
and pauses work before stopping. Opening the queue can resume recovered queued
jobs; explicitly paused jobs remain paused. The provider exposes indexed files
only and rejects arbitrary paths and write access.

## Validation checkpoint

Build133 has 1,806 hashed production/provenance inputs. Its 127 public patches and
104 defaults combine 41 Afterglow/compatibility patches with 86 original Morphe
features. Strict patching and APK assembly pass for default104, independent8,
all127 and the independent three-patch Long-press tools/compatibility selection.
The full bundle has 434 acyclic dependency objects, six forwarded original
options and 540 passing settings checks. The functional Android ledger is
195 done / 4 n/a / 0 TODO; these counts do not mean every runtime variant is tested.

Only the Premium controls runtime and sheet changed from build132: Lite Mode is
disabled when its optional patch is absent, preserving saved ON/OFF values. The
other 1,804 inputs, including the download/Vault implementation, are unchanged.
The 74 actual Premium-session checks, 51 watch DEX checks and fresh 540-setting
run pass. The exact build133 APK also resolves all six download actions in the
final smoke. The public release and source feed are verified. The media
results below retain their earlier tested scope.

Retained focused evidence matches the frozen download inputs: 119
queue/index/transfer/query checks, 26 production-manager
cleanup checks, 2,027 protocol and format checks, 30 UI-policy checks, and 21
production-view checks for stable progress controls. Cleanup retains the
library's import and deletion rollback files; only queue-owned temporary parts
are removed. Explicit audio MIME types survive import when an extension is
ambiguous between audio and video.

On the Android 16 emulator, the owned resolver, picker and queue downloaded and
exported an H.264/AAC video, AAC audio, English WebVTT captions and a thumbnail.
The short video and audio pass full decode checks; the owned Vault player renders
the downloaded video. A four-hour 720p video retained its paused partial bytes
across app restart and APK upgrade, resumed at approximately 2.8 MB/s, completed
in the background and exported a 428,436,160-byte MP4. Its full H.264/AAC decode
passes, with a duration of approximately 16,012 seconds. Progress buttons remained
responsive. Favorites, collections, combined filters, caption viewing, generic-MIME
WebVTT import and scan/repair also pass emulator checks. These are emulator
results; physical-device behavior, account-specific availability and the full
format/language/network-failure matrix remain unverified. The exact reviewed
flows and evidence paths are recorded in [port validation](afterglow-port-validation.md).
The release manifest and public feed establish when this snapshot is published.
