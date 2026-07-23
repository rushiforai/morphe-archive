# Cobalt Downloads for Morphe

A custom Morphe patch bundle that replaces YouTube's in-app **Download** action
with a direct request to a configurable cobalt instance. For high-quality YouTube
videos, the patch downloads cobalt's separate video and audio tunnels in a
foreground service, then performs a copy-only remux into a finalized MP4 in the
normal Downloads folder.

This project uses code and fingerprints adapted from
[MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches).

## Current behavior

1. Tap **Download** on a regular YouTube video.
2. If the configured instance requires Cloudflare Turnstile, an in-app
   verification flow obtains a short-lived cobalt session behind a native
   loading screen. The webpage is revealed only if the challenge needs input.
3. The injected extension posts the video URL to the configured cobalt API on
   a background thread.
4. A cobalt `local-processing` merge response is downloaded with native
   progress reporting.
5. Android copies the selected AV1/VP9 video and Opus audio samples into a finalized,
   seekable MP4 without transcoding them.
6. Direct cobalt `tunnel` and `redirect` responses still fall back to Android's
   system `DownloadManager`.

Set **Download type** to **Audio only (MP3)** to request an audio-only file
instead. Audio downloads are processed by the cobalt instance and saved through
Android's system `DownloadManager` with their audio filename and media type intact.

The **Downloads** entry on YouTube's **You** tab opens a native cobalt download
manager instead of YouTube's Premium offline page. It keeps a persistent list
of downloads created by this patch, shows transfer and MP4 finalization
progress, opens completed files, deletes downloaded files, and lets failed
downloads be retried.

The patch adds a **Cobalt downloads** screen to Morphe's in-app settings. It
persists and validates the supported download options:

- enable or disable the download override
- cobalt API endpoint, optional Turnstile webpage, and optional API key
- video quality
- AV1, VP9, or H.264 preference
- video or audio-only download type
- filename style
- higher-quality YouTube audio preference

No cobalt instance is configured by default. After patching, enter an HTTPS API
endpoint in **Settings → Morphe → Cobalt downloads**. Leave **Turnstile webpage**
empty for auth-free or API-key instances. If an API requires Turnstile, enter
the corresponding cobalt web frontend URL there; the patch opens it only when
a fresh session is needed.

The download defaults are video, 1440p, AV1, pretty filenames, and standard
YouTube audio. Video downloads use MP4 output and preferred local processing.
Audio-only downloads use MP3 output and server-side processing for broad Android
compatibility.

The endpoint preference was reset when Turnstile support was introduced so an
old bundled endpoint cannot remain configured silently. Existing users must
choose their endpoint again after repatching.

Picker responses and local-processing operations other than a two-stream merge
are reported as unsupported. Only HTTPS download URLs are accepted. MP4 remuxing
uses Media3's compatibility muxer, including on Android 13 and older. H.264 is
available as the most broadly compatible video option.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.8.2](https://github.com/skulldogged/cobalt-morphe/releases/tag/v1.8.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.26.360 | 🧪&nbsp;21.25.523 | 🧪&nbsp;21.24.360 | 🧪&nbsp;21.05.265 | 20.51.39 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Cobalt downloads](#cobalt-downloads) | Replaces YouTube's download action and Downloads page with a native cobalt manager. |  |

</details>

<!-- PATCHES_END -->

## Build

Morphe's Gradle plugin is hosted in GitHub Packages, so the build needs a GitHub
token that can read the Morphe registry:

```powershell
$env:GITHUB_ACTOR = gh api user --jq .login
$env:GITHUB_TOKEN = gh auth token
.\gradlew.bat buildAndroid
```

The bundle is written to:

```text
patches/build/libs/patches-<version>.mpp
```

For local testing, apply that bundle with Morphe CLI. Once this repository has
a semantic-release GitHub release, add
`https://github.com/skulldogged/cobalt-morphe` as a custom source in Morphe
Manager and select **Cobalt downloads**. The patch is not selected by default.

Use a YouTube version listed in `patches-list.json`. The compatibility list is
kept aligned with the upstream download-button fingerprint.

## Design

- `CobaltDownloadsPatch.kt` injects application-context initialization and the
  download-button early return.
- `CobaltClient.java` owns the cobalt JSON request and response parsing.
- `CobaltDownloader.java` starts the foreground download flow and prevents
  accidental duplicate jobs.
- `CobaltDownloadsPageHook.java` replaces the You-tab Downloads entry using
  YouTube's stable `downloads_page_entry_point_container` resource ID.
- `CobaltDownloadsActivity.java` and `CobaltDownloadRepository.java` provide
  the native manager UI and persistent download lifecycle records.
- `CobaltDownloadService.java` owns tunnel downloads, progress notifications,
  temporary storage, the Media3 AV1/VP9 + Opus MP4 remux, and direct-response
  `DownloadManager` fallback.

Merged media is processed inside a foreground service running in YouTube's
process. Encoded samples are copied rather than decoded or re-encoded, and the
temporary component files are removed when the job finishes.

## License

Licensed under [GPL-3.0](LICENSE). See [NOTICE](NOTICE) for the required Morphe
attribution and additional terms inherited from the template and adapted code.
