# Thread Ripper patches

Morphe patches for the YouTube Android app that make playback with spoofed (non-SABR) video streams smoother: multi-connection download, buffer preload, stall recovery, and Cloudflare WARP while open.

## Streaming

**SABR**:
YouTube's server-driven streaming protocol (POST with a request body, UMP responses); the default client uses it and the patches leave it alone.

**UMP**:
The framed response format of YouTube's media requests; the app's UMP media data source (`alai` in 21.16.256) is where the download hook sits.

**Spoofed client**:
A non-SABR client identity chosen in Morphe's "Spoof video streams" (visionOS, Android VR Downgraded) that makes the app fetch plain `/videoplayback` byte ranges.
_Avoid_: legacy client

**Range**:
One `/videoplayback` byte range the app asks for, about one ~10 s segment.
_Avoid_: segment request

**Chunk**:
A part of a range (1 MiB by default, `chunk_kib`) that the patch downloads as its own request; chunks are delivered to the player strictly in order.
_Avoid_: piece, part

**BTR**:
[Bilibili-thread-ripper](https://github.com/MrTangLuyao/Bilibili-thread-ripper), the userscript whose split-download-deliver-in-order idea the download patch follows.

## Buffer

**LoadControl**:
The app's media3 component that decides whether to keep loading (`shouldContinueLoading`) and when to start playback (`shouldStartPlayback`); preload and stall recovery hook it.

**Preload**:
The `Video buffer preload` patch: keeps loading until `preload_s` of video or `preload_mib` of memory is buffered.
_Avoid_: prefetch

**Official Maximum**:
Morphe's own "Playback buffer size" option at its Maximum setting (`PlaybackBufferPatch`), which preload combines with.

**Stall**:
A freeze of 0.5 s or more after the first PLAYING, counted from a screen recording, not from MediaSession BUFFERING.
_Avoid_: rebuffer (that is the stall recovery setting's name)
