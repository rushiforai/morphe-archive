# Google Cast investigation (2026-10-04)

The report only says casting does not work. No device, failure stage, or runtime log was provided. No Cast receiver is available in this workspace, so the reported failure itself has not been reproduced.

## Confirmed code findings

- Device discovery in `NicoidChromecastReceiverSelect.onCreate` and receiver launch in `NicoidChormecastSenderService$c.a(Bundle)` use the original custom receiver application ID `FAB5A9D8`. Messages use the custom namespace `urn:x-cast:com.sauzask.nicoid`. Receiver availability and compatibility cannot be inferred from the sender APK.
- `NicoidChormecastSenderService.b()` sets `d0.t = true`. The `d0$a.run()` branch calls `p.a(String, CookieStore, String)`, which constructs the local HTTP relay URL on port 52862 and starts `o2`.
- `ModernPlayback.stream()` now obtains a `.m3u8` URL and captures `domand_bid` separately in `ModernPlayback.domandCookie`.
- `o2` captures only the Apache `CookieStore` string in its constructor. Its relay requests do not merge the separately captured delivery cookie or supply the same Origin header as the working cache path. Thus current delivery authentication is missing from the Cast path.
- `o2` forwards remote bodies as byte streams, without rewriting HLS playlist URIs. The initial load URL embeds the remote URL after the local relay base. Ordinary path-relative entries can preserve the embedded upstream URL and remain on the relay. Root-relative entries resolve to the phone root, however, and no longer contain the upstream HTTP URL expected by its request handler. Absolute segment/key URLs bypass the relay instead and do not inherit the sender's delivery credential. Audio, video, initialization segments and encryption-key requests require an HLS-aware relay or receiver.
- The `video/mp4` response path belongs to local cache files. It is not evidence that the initial remote HLS response itself is mislabeled, because that path forwards upstream headers.

These are concrete incompatibilities in the playback path, not proof that the reported device failed at that stage. A failed legacy receiver launch or discovery issue is still possible.

## Diagnostics added in v1.5.0-dev.2

`CastDiagnostics` records discovery start, Google API connection, receiver launch Status, and whether an HLS stream reached the legacy relay. It does not record playback URLs, cookies, or device addresses. After a failed attempt, use Settings > Debug > Share debug log.

## Transfer repair in v1.5.0-dev.4

- The filter UI now uses an inline PreferenceCategory, immediately below comments.
- CastRelay snapshots domand_bid when the modern HLS callback arrives, attaches to that playback’s existing o2 server before it starts, and replaces only the media URL with opaque, session-specific routes.
- CastHls resolves and rewrites every playlist URI line and URI attribute (variants, alternate audio, keys and initialization segments). Signed upstream URLs and cookies are not exposed in rewritten playlists. Byte-range declarations are preserved.
- Every registered resource is fetched through the phone with the Origin/Referer headers. The delivery cookie is supplied only to the exact domand.nicovideo.jp domain or its subdomains, including manual redirect handling. Other hosts do not receive it. No user-session CookieStore is forwarded.
- The local handler supports GET, HEAD, single byte ranges and CORS preflight. Four bounded workers permit independent audio/video requests. Stop/error exit closes worker sockets and upstream connections and discards routes; the existing comment.json formatter and non-HLS/cache server paths remain in use.
- Host regression checks cover URI resolution, master/media/key/init transfer, byte ranges, HEAD metadata, credential isolation across redirects, parallel requests, comments and teardown. The released bundle must also be applied to the supported original APK.
- This repairs the identified sender-side transfer problems. Discovery and availability/codec compatibility of receiver FAB5A9D8 still require a real Cast device; there is no receiver in this workspace.

## Receiver compatibility

Fixing authenticated HLS playback requires a session-bound relay for every playlist, audio/video segment, initialization segment and key, plus receiver compatibility verification. Changing the receiver ID alone is insufficient: Google's default receiver does not implement the original custom message protocol or comment overlay. The sender-side relay repair does not establish that the original receiver is currently available or that end-to-end playback works on the reported device.

Google documentation:
- https://developers.google.com/cast/docs/overview (sender/receiver app IDs and authentication requirements)
- https://developers.google.com/cast/docs/media/streaming_protocols (HLS playlists, audio/video renditions and segments)
