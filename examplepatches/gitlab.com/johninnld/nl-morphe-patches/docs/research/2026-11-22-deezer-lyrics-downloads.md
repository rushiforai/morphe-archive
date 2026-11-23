# Deezer native lyrics and downloads

Current owner decision: keep Deezer's native download behavior. Retain album,
playlist and Favorite tracks downloads and remove the experimental direct-track
action introduced in the later review bundles. Its raw media resource could be
downloaded, but it was not a registered library item. Do not ship a new download
screen, create playlists, mark favorites or invent library entries.

The official offline guide, updated 16 October 2026, says tracks must be saved in
the library or a playlist before downloading. The original 9.0.27.3 track menu's
`DOWNLOAD_ENTRYPOINT` carries `AppConversionEntrypoint` offer data; it is not a
native standalone-track command. Downloaded music's item model and renderer
handle albums and playlists. The owner approved keeping this behavior after
the distinction was explained.

Source: https://support.deezer.com/hc/en-gb/articles/115003884605-Listen-To-Deezer-Offline

The owner reports that v1.96.0 plays tracks directly from search and works with
their account in the Netherlands, where the unmodified Free client blocks use.
The owner then confirmed that lyrics and downloads still enter Premium gates.
Do not describe all eight AudioPatchLab features as functionally equivalent
until those two paths are validated. Comparison and Reddit copy must distinguish
the released v1.96.0 from this development candidate.

## Native implementation batch

- Target only the signed original 9.0.27.3/9002703 APKM used for the release.
- Preserve all legacy/modern player instructions except the two inspected
  `disable_lyrics_feature` branches into `try_to_go_lyrics`.
- The conversion-entry getter has two registers for two parameters: no locals.
  Preserve its implementation behind a private native alias. A three-register
  wrapper filters the download and ads-free entries through independent flags.
- The existing full-streaming policy already enables OFFLINE. The download
  patch exposes the native action by removing its contextual conversion offer.
- Keep account, licence, media transport, native lyrics loading and existing
  per-track visibility checks. The owner confirmed native lyrics access and
  album/playlist downloads with offline playback in the engineering candidate.

## LRCLIB fallback contract

Use HTTPS `GET /api/get` with the current track's title, artist, album and valid
duration in seconds (1–3600). Encode the full title; `Choosin' Texas` becomes
`Choosin%27+Texas`. Compare normalized punctuation/case without discarding mix
or edit names, and check returned duration within two seconds. A placeholder
album such as `-` is not a conflicting album identity.

Do not cast LRCLIB JSON into Deezer DTOs. Confirm the native schema and timing
units first. Normalize plain lyrics and LRC separately, then adapt into the
native model. Preserve attribution. The real sample on 22 November returns
record 24450071, duration 231 seconds, plain and synced text, and first timestamp
`[00:17.11]` (17110 milliseconds). Do not store real lyrics in test fixtures or
diagnostic logs.

Availability must require native usable lyrics or a matching, non-empty fallback
payload. Hide for loading, 404, instrumentals, empty text and errors. Fence async
results by current-track generation. Cache bounded positive and negative
results, identify the client, serialize requests, and honor `Retry-After`.

## Bounded acceptance

After the connected batch builds, update the existing standard-package phone
copy through its current Morphe signing identity. Inspect one native lyric
result, a track without lyrics, the download menu, and absence of Listen
without ads. Confirm a completed native download and playback through Deezer's
own offline mode. Preserve account data and restore the original offline mode.
If native lyrics access fails, retain the result, stop the owned session and
complete the fallback batch before another acceptance run. Do not introduce
cloned or diagnostic production patches.

## Owner acceptance of eeb9d25d

The owner confirmed native lyrics, completed album/playlist downloads and
offline playback on the standard-package phone build. Reuse those results.
The individual track menu lost its conversion offer but has no native DOWNLOAD
enum member (its only download member is DOWNLOAD_ENTRYPOINT). Treat direct
track downloading as an additional missing action, not a hidden entitlement.
The Downloaded music page also still renders its subscription banner.

The historical 02683c1d batch added a normal native menu row with the selected row's exact track
ID. Its callback resolves the current activity's synchronizer component and
submits a TRACK resource through Deezer's existing asynchronous synchronizer.
It does not cache an account or synchronizer globally, change album/playlist
commands, download URLs independently, or report synthetic progress. Hide the
row for non-track items, uploaded/invalid IDs and unsupported contexts.
The downloaded-page banner takes the original no-banner branch; downloaded
collections, filters, sorting and native playback remain intact.

That standalone-track experiment is withdrawn under the current owner decision.
Acceptance for the cleaned candidate: native album/playlist/Favorite tracks
downloads, normal Downloaded music registration and offline playback, absence
of the subscription banner and no custom track-menu download action. LRCLIB
remains a separate candidate batch. Normalization, cache, client, stream flow
and native bindings pass local checks against the original 9002703 input.
The complete repository verification passed. The later LRCLIB batch was accepted
by the owner in review `0e5e9c067bff`; see the implementation note for its final
artwork binding and deferred-close repair.

## Track menu regression in 02683c1d

The owner reported that the track menu stopped opening. Read-only inspection of
the installed APK confirmed the intended adapter, but its `<init>` was emitted
with flags 1 in the virtual-method table. The helper must use `ACC_CONSTRUCTOR`
and live in the direct-method table, as required by ART. Correct that encoding
and assert both properties against the serialized adapter DEX. No phone UI or
emulator testing is performed by the agent; runtime acceptance belongs to the
owner. The native download request and the banner-removal path are unchanged.

The owner then confirmed the menu opens, but Download is still absent; Repair
track appears on already downloaded tracks. The adapter's visibility checks
were narrower than the actual native contract: both `IIIIlllIIIIlIll` and
`IIlIIIllllll` implement the track interface, native IDs may have a type prefix
such as `0.12345`, and the native component is application-scoped. Accept the
interface, normalize through Deezer's own ID converter and resolve the existing
application component. Keep invalid/uploaded IDs rejected. The callback stores
only the application context, never an Activity, account or synchronizer.
