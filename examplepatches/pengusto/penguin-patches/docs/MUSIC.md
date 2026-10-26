# Music Player: track-specific cover artwork

Target: original official Fossify Music Player 1.8.4, musicplayer-17-foss-release.apk. SHA-256 ddac49843267914b39c6340c2b050c0d6a597232d8586a34166cac34d095b1fc. Release https://github.com/FossifyOrg/Music-Player/releases/tag/1.8.4 . Issue https://github.com/FossifyOrg/Music-Player/issues/50 .

The original worker uses nonempty album artwork before looking at a track file. The patch reads embedded bytes from the current file first, decodes at bounded sampled dimensions, then uses the original album/thumbnail/null fallback and original main-thread callback. It does not change album grouping, database cover strings, audio tags or file contents.

Android MediaMetadataRetriever supplies MP3 APIC covers but did not expose the Opus fixture picture. Existing jaudiotagger 3.0.1 also lacks an Opus reader; no new library is bundled. A read-only Ogg OpusTags parser searches up to 128 pages/8 MiB for METADATA_BLOCK_PICTURE, prefers type 3 front cover, validates lengths and returns null on malformed metadata. File decoding happens in Fossify's original artwork worker. Large/invalid/unsupported art retains existing fallback. No network content is fetched by this reader. Existing asynchronous recycled-view behavior is unchanged and not claimed fixed.

Original versus patched official APK: two synthetic MP3 tones share album ID but have red/blue embedded covers; before both red, after blue/red. Pixel assertions cover MP3 and Opus, missing/empty/no-cover/corrupt fallback and malformed tags. Native source tests additionally validate original callback output and unchanged file hashes using bundled test assets. Build/Lint/Detekt required. Android 15 ARM64 only; physical devices and other file formats/scoped document-only URIs remain unverified.

Attribution: issue author and Aga-C/knuxyl/aicode8000 comments identified the album-art preference and supplied reproduction/workarounds. This independently preserves grouping and fallback instead of clearing stored cover fields or editing tags.

## Before / after

| Before | After |
| --- | --- |
| <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/contact-music/music/before.png?raw=true" width="320" alt="Original app" /> | <img src="https://github.com/pengusto/penguin-patches/blob/pr-assets/contact-music/music/after.png?raw=true" width="320" alt="Patched official app" /> |

Images: same emulator and native 1080 x 1920 viewport, synthetic content only. Source candidate is separately tested, not the source of these images. Input must be the official original APK; same-certificate patched installation can update in place. Different signing identities need a verified data-preserving migration plan.
