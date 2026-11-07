# HT News apps (Mint & Hindustan Times) — patch analysis

Status: **analysis only — no fingerprints written, nothing shipped yet.**
This document is the honest feasibility map for the two HT Media Ltd apps,
`com.htmedia.mint` (Mint: Stock & Business News) and `com.ht.news`
(Hindustan Times: News & ePaper), both Android 8.0+.

No APK was available in this workspace and the sandbox cannot fetch one, so
every candidate below is marked with a confidence level and the exact thing the
binary must confirm before any patch is written. **Do not ship fingerprints
guessed from web listings** — they compile in CI but fail at patch time on a
real install.

## App facts (public store listings, 2026-11-06)

| App | Package | Developer | Latest seen | Notes |
|---|---|---|---|---|
| Mint | `com.htmedia.mint` | HT Media Ltd | 5.7.5 (Aug 2025), 5.8.4 | Business & markets focus |
| Hindustan Times | `com.ht.news` | HT Media Ltd | 4.9.16 (Oct 2026), target API 36 | News + ePaper, English |

Both are first-party HT Media apps, very likely sharing UI stack, analytics
and ad rails — one decompile probably covers both.

## Already works today (no new code)

- **Remove dangerous permissions** (universal, app-agnostic): POST_NOTIFICATIONS,
  AD_ID, LOCATION, MIC, CAMERA, STORAGE, SMS, etc. — works on both apps as-is.
- **Block analytics & tracking SDKs** (universal, heuristic; v2.2.8 extends the
  marker list to `com/webengage`, `com/clevertap`, `com/flurry`, `io/branch`,
  `com/kochava` on top of Firebase Analytics / AppsFlyer / Adjust / Facebook /
  Segment / Amplitude / Mixpanel / Localytics / Countly / UrbanAirship). Off by
  default; verify with `adb logcat` that `logEvent` calls disappear on first run.
- **Fix Firebase after re-signing** (universal): needed because these apps will
  be re-signed by the patcher.

## Candidate patches (blocked on an APK unless marked otherwise)

| # | Patch | Type | Confidence | Binary must confirm |
|---|---|---|---|---|
| 1 | Disable video autoplay in feeds — **heuristic shipped** (universal + Mint/HT scoped); binary fingerprint still ideal | bytecode (ExoPlayer/Media3 `setPlayWhenReady(true)` sites) | HIGH (heuristic) | Player creation sites for a precise version once APK lands |
| 2 | Block/neutralize in-feed sponsored articles & native ads | bytecode heuristic (ad SDK call sites + promoted-flag heuristic à la RedditFeedHelper) | MEDIUM | Which ad SDK (GAM/AdMob/in-house) renders rows; any `promoted`/`sponsored` flag on row models |
| 3 | Open article links in external browser — **Custom Tabs path shipped** (universal + Mint/HT scoped); article WebViews still need the binary | bytecode (WebView path / intent builder) | HIGH (Custom Tabs) / — (WebViews) | Whether articles render in in-app WebView or native views |
| 4 | AMOLED black reading surface | resource (night/dark themes) + optional WebView CSS, à la Amazon dark patch | HIGH (WebView confirmed) / MEDIUM (native themes) | WebView usage for article bodies; dark theme resources |
| 5 | Remove rating / in-app review nag (`ReviewManager`) — **blocked**: fabricating `Task<ReviewInfo>` needs the play-review classes on the extension compile classpath, which this bundle does not have | bytecode (invocation sites) | MEDIUM-HIGH | `com/google/android/play/core/review` usage in the APK |
| 6 | Disable push permission nag | bytecode (POST_NOTIFICATIONS rationale UI) | MEDIUM | Custom nag vs system dialog |
| 7 | Mute "breaking news" notification categories | resource/bytecode (notification channel defaults) | MEDIUM | Channel definitions in manifest `<meta-data>` / channels in code |
| 8 | ePaper ad cleanup | WebView/resource | LOW-MEDIUM | ePaper rendering path (page viewer? web pages? images?) |

Explicitly **out of scope**: "Mint Premium" / "HT Premium". Mod-APK builds
circulate in search results, but the premium text itself is served behind
**server-side** entitlement. A client patch can bypass the local UI gate at
best — not the paywall — and will likely just fail. Not attempted, not promised.

## Verification once the APK lands

```bash
# On the device (both apps installed), get the APK paths incl. splits:
adb shell pm path com.htmedia.mint
adb shell pm path com.ht.news
adb pull /data/app/<...>/base.apk mint-base.apk      # and any split_config.*.apk
adb pull /data/app/<...>/base.apk ht-base.apk

# Then, in the repo:
python3 - <<'EOF'
import zipfile
for apk in ["mint-base.apk", "ht-base.apk"]:
    z = zipfile.ZipFile(apk)
    print(apk, "->", z.read("AndroidManifest.xml") and "manifest ok")
    print(z.namelist())
EOF
# SDK + string probe (no JDK needed): pip install androguard
# androguard axml AndroidManifest.xml; androguard dx --list classes*.dex for packages
# grep -a -o 'ca-app-pub-[0-9]*' classes*.dex | sort | uniq -c   # AdMob IDs
# grep -a -oE '(app-measurement|firebase|webengage|clevertap|exoplayer|play/core/review)' classes*.dex | sort | uniq -c
```

Only after this dump do fingerprints get written, via the usual repo QC:
CI build + `:patches:test*` + the same review the Brave patches received.

## What the v2.2.8 re-cut ships for these apps (and what it does not)

The re-cut **v2.2.8** (same release number; prior builds were deleted and
re-created from the updated commit) includes:

1. **Mint: Block analytics & tracking SDKs** — scoped entry visible under
   `com.htmedia.mint` in the patcher. Applies the *same universal heuristic*
   as the universal patch (marker list extended to WebEngage / CleverTap /
   Flurry / Branch / Kochava). `compatibleWith` lists Mint 5.7.5 and 5.8.4 —
   the versions observed on store listings on 2026-11-06. Nothing was
   decompiled or fingerprinted; there is no app-specific bytecode in the bundle.
2. **Hindustan Times: Block analytics & tracking SDKs** — same, scoped to
   `com.ht.news` (target 4.9.16).
3. **Disable video autoplay (ExoPlayer/Media3)** — new universal heuristic:
   flips literal `setPlayWhenReady(true)` call sites to `false`. Off by default;
   can stop playback entirely in apps whose only play path is such a literal —
   disable it if videos never start.
   - **Mint: Disable video autoplay (ExoPlayer)** — scoped wrapper.
   - **Hindustan Times: Disable video autoplay (ExoPlayer)** — scoped wrapper.
4. **Prefer external browser over Custom Tabs** — existing universal rewrite
   (CustomTabsIntent.launchUrl → ACTION_VIEW), plus scoped wrappers:
   - **Mint: Prefer external browser over Custom Tabs**
   - **Hindustan Times: Prefer external browser over Custom Tabs**
   Covers Custom Tabs call sites only — not article WebViews.
5. The universal Block-analytics marker extension + this analysis.
6. All v2.2.7 content.

What it does **not** include, and why:

- **No sponsored / in-feed ad suppression** — needs to know which ad SDK(s)
  and which row/flag model each app uses; binary-only analysis, no APK in hand.
- **No ePaper ad cleanup** — ePaper rendering path unknown (WebView? image
  viewer? PDF viewer?); binary-only.
- **No AMOLED reading surface** — needs the theme/resource layout of this
  build; binary-only.
- **No rating-nag (Play In-App Review) removal** — the swap needs a fabricated
  `Task<ReviewInfo>` passenger type, and this bundle has no `play-review`
  classes to compile against, so nothing is faked. Marked blocked, not guessed.
- **No premium unlock** — "Mint Premium" / "HT Premium" are server-side
  entitlements; a client patch cannot bypass them. Never in scope.
- **Version targets are listing-observed only** — the `compatibleWith` lists
  are the store versions seen on 2026-11-06; other builds will not be offered
  the patch until the lists are extended.
- **Unverified on device** — none of the entries has been run on a device;
  heuristics may under- or over-match.

To implement the binary-specific targets, provide the APKs (see the `adb`
section); they would land in a new release.
