# Automatic original APK intake

The agent should download updates itself. Do not routinely ask the user to
download the file. Use this procedure for Pizza and Coffee, then retain the
original archive, provenance and verification outside Git.

## First try: the small HTTP helper

```powershell
python scripts/apkmirror_download.py pizza --output-dir E:\Pizza-update\intake
# coffee selects the corresponding app and publisher certificate.
```

The helper reads the live APKMirror app listing rather than search-engine
caches, selects a numeric stable release, and attempts the normal download
chain. It prefers a complete bundle when the page provides that option.
Ambiguous variants require agent browser inspection. JSON `BROWSER_REQUIRED`
with exit3 is an instruction for the agent to use the browser fallback below,
not an instruction to ask the user for a manual download. HTTP403/429 is not
retried in a loop. Exit0 means the original ZIP, package and TapBlaze signing
certificate were verified; exit1 means validation or I/O failed.

## Verified normal-browser fallback

Use the supported in-app browser (`cua_repl`, hidden by default). No cookies,
Cloudflare clearance, credentials or other browser state need to be exported.

1. Open the live release URL from the helper. Inspect its available variants.
   Select a full ARM64 APKM/XAPK or a full standalone APK. A small base APK can
   omit the game's assets. The latest version on the live page can be newer
   than the search index.
2. Read the actual selected variant page and click its official **Download APK
   Bundle** / **Download APK** link. Avoid advertisement download controls.
3. Inspect the resulting **Your download is starting...** page. Its **here**
   link points to APKMirror's `download.php`. A Google interstitial may capture
   a click and append `#google_vignette` without downloading anything.
4. If an interstitial is present, inspect the fresh accessibility tree and
   close its actual **Close ad** control. Its element index is transient;
   never retain the numeric index as a selector for a future run.
5. Prepare `tab.playwright.waitForEvent('download', {timeoutMs: 55000})`, then
   click the exact **here** link. Await the event and its `path()`. Do not count
   the landing page, a click or an expired wait as a successful download.
6. Verify the actual file with the helper:

```powershell
python scripts/apkmirror_download.py pizza --output-dir E:\Pizza-update\intake `
  --adopt 'C:\Users\Komputer\Downloads\actual-downloaded-file.apk' `
  --release-url 'https://www.apkmirror.com/apk/tapblaze/good-pizza-great-pizza/ACTUAL-RELEASE/'
```

This checks every ZIP entry and, for bundles, every embedded APK's ZIP and
signature. The actual APK entry set must exactly match XAPK's
`manifest.json` / `split_apks`, or APKMirror's `META-INF/MANIFEST.MF` entry
inventory. APKMirror v5's `info.json` alone has no split filenames. A missing
declared asset-pack APK is rejected even if the remaining files still have
many assets and the native library. Containers lacking a usable inventory are
rejected with a completeness-unproven error. This is a consistency check
against retained container metadata, not a separate claim that the unsigned
XAPK metadata is authenticated.

Android SDK `aapt2` establishes package/version/code; `apksigner` verifies all
APKs against the known TapBlaze certificate. Split version codes must agree.
The game must also have its ARM64 library and an assets payload; no arbitrary
minimum asset count establishes completeness. Standalone APKs have no container
split inventory, so their payload checks do not replace the game's
version-specific intake/patch audit of exact assets and packaging compatibility.
Originals and provenance stay private. Do not commit signed URLs or download keys.

If the browser presents a CAPTCHA, the agent must follow the browser tool's
confirmation rules; this procedure does not solve or bypass it. Do not claim
that the website can never change its checks. A failure should retain a
specific URL/reason and the last browser state instead of repeatedly timing
out or automatically shifting the download back to the user.

## Evidence on 2026-10-29

Live Pizza release: **5.59.2 / 2337**, uploaded October26. APKMirror offered a
complete standalone ARM64 + ARMv7 APK, **437633872 bytes**. The app listing was
HTTP-accessible; release/variant/final-download HTTP requests returned
Cloudflare403. Ordinary in-app-browser navigation displayed the pages without
a CAPTCHA. `downloadMedia` timed out; a later click was intercepted by a Google
vignette. After closing **Close ad**, the final **here** click plus download
event completed in **9.46s**. The user did not download the update manually.

Verified original SHA256:
`ea0fd7c38af20c4f8e8c083f2991db4ee18c3d5cd8c2ec8f347d1fcca029ae39`.
Publisher certificate SHA256:
`0eb1a98d45c137dc00fb01d89cf6d08cc228d56907a2b00700f7d55cda62d6f7`.
ZIP integrity and publisher signature pass; the APK has6736 asset files and32
native libraries across both ABIs, with no PairIP archive entries.

Private source/provenance and the RED/GREEN helper test logs:
`E:/Codex-Morphe-Pizza-20261029/intake/`. The publisher-signed original is
`pizza-5.59.2-2337-original.apk`; `pizza-5.59.2-provenance.json` records the
canonical source URL and actual manifest identity. This verifies the fallback
for this download. Coffee uses the same flow but has not been re-downloaded
through it during this task.
