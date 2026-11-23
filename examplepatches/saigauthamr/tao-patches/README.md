# Tao Patches

[Morphe](https://morphe.software) patches for the FanFiction.Net Android app (`com.fictionpress.fanfiction`).
They make the app send far fewer requests to the server, remove its telemetry, and keep it responsive.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: https://github.com/saigauthamr/tao-patches

<a href="https://morphe.software/add-source?github=saigauthamr/tao-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Patch the APKM bundle of FanFiction.Net 66.5 from APKMirror. The patched app is signed with a different key,
so uninstall the official app first, or apply "Clone app" from the Morphe patches to install it next to the
official app.

## Why

The app's server answers each user's requests one at a time, in order. Every unnecessary request makes the
screen you are waiting for load later. Measured on a real device (see [docs/measurements.md](docs/measurements.md)):

- Reopening the app sends 3 API requests instead of about 25-29.
- Covers and avatars were about half of all requests, because the app downloads every image again each time it
  is shown. They are now cached for 7 days.
- Firebase Analytics, Crashlytics and logging connections drop from about 33 in two minutes to none.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/saigauthamr/tao-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 FanFiction.Net&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**Package name:** `com.fictionpress.fanfiction`

**🎯 Supported versions:**

| 66.5-dbdae8198b |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Cache images](#cache-images) | Keeps story covers and avatars on the device for 7 days instead of downloading them again every time they are shown. Images use the same one-at-a-time server queue as everything else, so this also makes stories and lists load sooner. |  |
| [Disable Firebase telemetry](#disable-firebase-telemetry) | Stops Firebase Analytics, Crashlytics and Sessions from collecting and uploading data. |  |
| [Enable debug logging](#enable-debug-logging) | Logs network requests, request failures, HTTP/2 frames and the app's internal debug messages to logcat under the tag FFNTao. For troubleshooting only. |  |
| [Favorites letter filter](#favorites-letter-filter) | Opens favorite stories filtered to one starting letter instead of all titles. Use this when the full favorites list fails to load. Other letters stay available in the A-Z bar. | • Starting letter |
| [Merge duplicate requests](#merge-duplicate-requests) | Sends identical API requests that are in flight at the same time only once, and shares the response. The server answers one request at a time, so every duplicate removed makes the rest of the app respond sooner. |  |
| [Network timeout](#network-timeout) | Changes the default API request timeout from 30 seconds. The server answers one request at a time, so a longer timeout also makes screens wait longer behind a slow request. | • Timeout |
| [Remove ad tracking permissions](#remove-ad-tracking-permissions) | Removes the advertising ID, ad attribution and install referrer permissions. |  |
| [Test build branding](#test-build-branding) | Renames the app and recolors its launcher icon so a patched install can be told apart from the official app installed alongside it. | • App name |
| [Throttle sync](#throttle-sync) | Skips pulling synced bookmarks, folders, history and offline stories from the server when the same sync already ran recently. Saves about six server requests on most app starts. | • Minimum time between syncs |

</details>

<!-- PATCHES_END -->

## Known issue: favorites

Since 2026-11-20 the server's favorite stories endpoint is extremely slow for every app user, so large
favorites lists never load. This is a server problem that no patch can fix. As a stopgap, enable both
"Favorites letter filter" and "Network timeout": favorites then open one starting letter at a time.
While a letter loads, other screens wait behind it.

## Building

Requires JDK 17+, the Android SDK, and a GitHub token with `read:packages`
([setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)).

```sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token> ./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Work happens on the `dev` branch: `feat:` and
`fix:` commits there publish pre-releases, and merging `dev` into `main` publishes a stable release.

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE). Not affiliated with FanFiction.Net, FictionPress, or the
Morphe project.
