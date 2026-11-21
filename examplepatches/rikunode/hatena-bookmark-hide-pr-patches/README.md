# Hatena Bookmark — native PR article filter for Morphe

**Current experimental bundle: v0.4.4** — compatible with Hatena Bookmark **5.80 / versionCode 58000 only**. PR filtering was user-confirmed on a real device (2026-10-17); the new ranking patch is not yet device-verified.

[**Add Hatena Bookmark PR Filter to Morphe (one tap)**](https://morphe.software/add-source?github=rikunode/hatena-bookmark-hide-pr-patches)

Morphe Manager remote source:

```text
https://github.com/rikunode/hatena-bookmark-hide-pr-patches
```

## Why the fix was necessary

An actual Android user confirmed v0.2.0 could install, launch and load article feeds, but the **`総合` feed still showed an article labeled `広告`**. The old patch hooked only `MuteHelperKt.filteredWithMuteWords()`, which is never called if the user is logged out or has zero mute words.

**v0.2.1** additionally filters `CategoryHotEntryPagingSource.withDate(List<BookmarkEntry>, ZonedDateTime)` before it converts hot-feed entries into date-tagged list items. This is invoked on the paged hot-entry path irrespective of mute configuration. It calls the original `filterByMuteWords(entries, emptyList(), null)` with the patched PR-flag guard, keeping normal entries and removing `isPrEntry()` entries. The original mute-matching logic continues to run when the user has configured rules.

**v0.4.2 crash fix:** v0.4.1 incorrectly called `injectCss(WebView, boolean)` after the original `onPageFinished` method reused its `p1` register for a `SimpleUriIdlingResource`; v0.4.2 moves the call directly after the superclass callback, before that overwrite. This fixes the observed DEX type mismatch. See [v0.4.2 release notes](docs/RELEASE_NOTES_v0.4.2.md). Device-level article opening remains pending confirmation.

### Five included Morphe patches

- **Hide native PR entries from article feeds** — native PR entries excluded at the model/list level, not just the visible advertisement label. V0.2.1 includes the unconditional hot-feed fix.
- **Clone Hatena Bookmark for safe side-by-side testing** — changes package to `com.hatena.android.bookmark.morphe`, one custom receiver permission and three ContentProvider authorities so the working original 5.84 can stay installed. Both existing patches remain enabled by default.

- **Hide weekly bookmark ranking announcement** — hides only announcements containing `ブクマ数ランキング` via `TopFragment.showAnnouncement`, with `hideWeeklyRanking` defaulting to true. **v0.3.0 failed Morphe application on a real device because the code-size guard used 128 instead of 64 code units; v0.3.1 corrects that guard. v0.3.1 real-device confirmation pending.**

- **Block ads in in-app article browser** — default-on fourth patch. Blocks full-host EasyList/AdGuard Japanese subrequests in the article WebView (never main-frame loads), honors exception domains, and injects limited generic CSS. Options: `blockInAppBrowserAds` (default true), `updateAdBlockLists` (default true). The existing three patches are unchanged.

- **Preserve article WebView cookies and storage** — fifth patch with the `preserveArticleWebStorage` option **default ON**. By default, suppresses the automatic `onDestroy` call clearing all WebView cookies and the app startup thread clearing WebStorage. This applies to **all** article sites, not only NHK: sites may retain sign-ins and tracking data. Manual account logout and explicit data clearing remain unmodified. NHK consent/region persistence awaits owner verification on a real device; emulator verification may use test-site cookies instead. See [v0.4.4 release notes](docs/RELEASE_NOTES_v0.4.4.md).

The code checks fixed 5.80 bytecode fingerprints (including article WebView `onPageFinished` registerCount=10 and `insns_size`=82) and refuses unknown layouts.

## Verified v0.2.1

The source 5.80 APK has SHA256 `f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b` and a valid v2/v3 signature under a certificate labeled `CN=Hatena Inc.`. This does not guarantee the third-party archive is malware-free.

Morphe Desktop applied **2/2 patches, 0 failures**, rebuilt and signed an output APK. Android SDK `apksigner` verified the v2 signature; `dexdump` confirmed the unconditional `withDate` filter call and the early `isPrEntry()` guard in the executable output DEX; the original `classes2.dex` remained identical. v0.2.1 specific tests verify these properties.

**Real-device user confirmation (2026-10-17):** The user reported that v0.2.1 successfully removes ads in the patched Android app. This is a user-confirmed outcome, not an independent test of every feed or configuration. **Not separately verified:** other tabs, signed-in/mute-word combinations, login and bookmarking. Do not claim full ad-free coverage across all screens.

## Risks and earlier versions

- Historical 5.80 APK is dated 2024 and originates from third-party APK archives. Same hashes across APKPure and Uptodown and valid APK signatures help establish identity but do not establish absence of malware or old vulnerabilities.
- Public GitHub source distributes **only Morphe patches, no APK files or credentials**. Never uninstall your working 5.84 merely to test the clone, and never disable Play Protect.
- Previous **v0.2.0** for 5.80: patch applied and app rendered live feed, but PR ad remained due missing unconditional hot-feed filter.
- Earlier **v0.1.1** for 5.84: modifying APK triggered a Pairip Play license failure on actual phone; still marked as known-broken prerelease.

### Automatic filter updates (v0.4.2)

Every day, [GitHub Actions](.github/workflows/update-filters.yml) converts official [EasyList](https://raw.githubusercontent.com/easylist/easylist/gh-pages/easylist.txt) and [AdGuard Japanese Filter](https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_7_Japanese/filter.txt) rules to a strictly validated gzip snapshot in the [`filter-data` branch](https://github.com/rikunode/hatena-bookmark-hide-pr-patches/tree/filter-data). The Android helper checks [the snapshot URL](https://raw.githubusercontent.com/rikunode/hatena-bookmark-hide-pr-patches/filter-data/filters.json.gz) no more than once per 24 hours (ETag supported), validates SHA-256 and count limits, keeps a previous file, and merges validated snapshots with the embedded seed hosts and CSS (exceptions take precedence). The converter additionally accepts standalone `$third-party` host rules, while still excluding other options. Disabling `updateAdBlockLists` uses only the seed. **Licensing:** EasyList GPL-3.0-or-later / CC BY-SA 3.0-or-later dual-license, and AdGuard GPL-3.0. Attribution [NOTICE](filter-lists/NOTICE) is published alongside the snapshot. See [v0.4.2 notes](docs/RELEASE_NOTES_v0.4.2.md) for digest protocol and limitations. No real-device ad blocking claim is made yet.

Documentation: [Morphe Manager guide (JA)](docs/MORPHE_MANAGER_SETUP_JA.md), [v0.3.1 release notes](docs/RELEASE_NOTES_v0.3.1.md), [5.80 safety/integration evidence](docs/EXPERIMENT_58000_SECURITY_AND_PORT.md).

## Developer verification

```bash
./gradlew.bat :patches:generatePatchesList --offline
python scripts/validate_morphe_release.py
python -m unittest discover -s tests -v
```

Output `patches/build/libs/patches-0.4.4.mpp`. Source metadata `patches-bundle.json`, `patches-list.json`. GitHub Actions compiles Android DEX and checks both on clean checkout; local actual-APK regression tests are skipped there because the user's APK is not distributed.
