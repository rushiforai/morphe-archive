# Native downloads and unified playback — 0.8.0-beta.1

This is BDCrusher's modified Full Collection, not an official Morphe release. The approved update targets original arm64 YouTube Music 9.42.52/94252240 and 9.43.51/94351240. It keeps the existing repository, settings, credentials, lyric library, chosen-folder grants and downloaded files. Shaders and Download playlist remain optional. The add-on remains retired.

## Root cause and actual native bindings

The incoming November 2 log shows the native themed playlist header being cast to DownloadViewContext.Owner. In the original constructor the receiver parameter aliases v7; native instructions save the presenter in v0, then reuse v7 for its layout. The old return hook registered v7. One invalid registry key then caused later Home clicks to fail too. This is a receiver-identity bug, not source absence, insufficient memory or an external-downloader setting.

The new hooks clone constructor parameters before adding captures, including the authenticated playlist and native metadata clients. Header model binding uses a preserved receiver. Registry registration accepts Object, validates Owner, rejects invalid entries individually and isolates failing root/identity getters. Targets are captured before worker dispatch and retain recording-versus-playlist identity and popup lifetime. No unresolved playlist uses Now Playing as fallback. Default keeps native account/eligibility handling; In-app and External consume their configured commands first.

The final DEX audit follows receiver aliases through reachable branches and checks the actual argument at registration, binding and Library callbacks. The same audit reproduces the broken receiver in both previously published beta.5 inspection APKs. Compile-only media interfaces are compared with the original APK definitions; stubs are not injected.

## Downloads destination investigation

The native integration routes were inspected in the approved order, on the supplied original targets:

1. Native catalogue/provider: MusicOfflinePlaylistSyncPolicyEntityProvider and related offline-store entities operate on native account policy, sync entities and container records. No inspected public/typed contract safely registers arbitrary app-owned WebM/MP4 files in that catalogue.
2. Offline browse generation: MusicDownloadsResponseGenerationBlockImpl and the offline response store build native offline lists from those native entities/containers. Inventing database entries or eligibility flags would not establish a valid owned-media provider. These contracts were not used to imitate subscription authorization.
3. Downloads view binding: LibraryBrowseFragment has a DOWNLOADS destination enum, a separately owned LoadingFrameLayout and normal create/bind/resume/destroy callbacks. Its native toolbar/navigation and player live outside the replaced content frame. SearchResultFragment is a different surface and is not used as the Library host.

The approved fallback is therefore a virtualized Android ListView inside the existing native Library → Downloads content frame. It shows owned songs, original saved playlists, progress, artwork, sizes and management actions. It neither redirects to a settings activity nor creates another player. It restores native child visibility when released. The original database/provider is not modified. Exact native inspection text remains private under Verification/revision44; final compiled audits bind the selected contracts to both APK hashes.

## Media, progress and native playback

The quality sheet has Audio/Video controls, actual Opus choices and device-compatible adaptive video resolutions, aligned size estimates, Remember, Cancel and Download. A playlist asks once. Audio preferences survive; video resolution/remember preferences are separate. Initial video is 1080p or the best available lower resolution. Batch estimates use returned bitrates and known durations; unknown sizes/durations remain explicit. External mode still delegates quality decisions to the selected app's normal review flow.

The existing authenticated stream pipeline supplies accessible media. Saved Opus and adaptive video files are separate. Native Format width/height wire fields are checked against the target APK schema; decoder capability/profile checks filter video choices. There is no extra decoder or mandatory transcoder. A Video item without supported video saves and labels Audio only. Unsupported/unavailable native stream responses are not converted into authorization success.

One item scheduler permits two simultaneous recordings. Duplicate requests coalesce, including an Audio request upgraded to Video while active. A shared catalogue feeds notifications, native row subtitles and Downloads. Downloaded badges precede the artist; source runs are retained, repeated status binding is stable and cached badges clear when media is removed. Legacy suffix status is recognized during transition.

Range journals retain only validated variant identity, length and durable byte positions, never URLs/credentials. Media bytes are flushed before atomic journal publication. Interrupted ranges resume from safe checkpoints; mismatched variants restart their temporary ranges. Range responses and final files are validated before atomic promotion. Song metadata, covers, progress records, format metadata and playlist records use atomic writes. Failed refreshes retain the previous files. Catalogue indexing recognizes existing audio/artwork/playlist files in place, without moving or deleting them.

Every downloaded-item entry opens Music's native watch flow. The retired offline service is no longer registered and its custom mini-player is not created. Native controls, player expansion, artwork, marquee, seeking and queue behavior remain owned by Music. Original playlist identity, position and duplicate positions remain in native commands; enumeration does not change playback. Saved streams are preferred while online metadata and available video formats are retained. Offline uses saved native metadata and media. Missing/invalid local data retains native network handling online; an interrupted local read can continue from the matching authorized stream after validating its remaining byte range. Offline failures do not start another backend. Native authorization rejection is preserved.

SponsorBlock chapter sidecars retain category names/colors/timestamps and existing skip choices. Media is not cut, so lyric timing is unchanged. Lyrics prefetch and existing permanent storage remain independent of media deletion. YTDLnis files remain read-only and outside owned storage totals.

## Verification and limits

The retained fixtures execute production routing, range/journal transfer, item scheduling, media selection, native cache, catalogue, metadata writes and playlist code. Android views, actual codec execution, network/authenticated responses and app-launch boundaries are explicitly simulated. Native adapters and receiver arguments are checked separately in the compiled APKs. The compatibility record identifies the final bundle hash and completed matrix/audits; earlier candidate runs are intermediate only.

Real phone acceptance remains required for the native quality sheet appearance, Library rendering/insets, mini-player expansion, actual audio/video decoding/switching, native offline network-action states, queue shuffle/repeat and transitions. Existing Samsung navigation, Shaders/video behavior and recording-free lyrics smoothness are not established by desktop tests. No universal button, pixel-parity or zero-stutter claim is made. MuMu, signing, installation and real media downloading remain untouched.
