# v0.4.0 — Article WebView ad blocking

For Hatena Bookmark **5.80 / versionCode 58000** only.

## New fourth patch

**Block ads in in-app article browser** (default enabled) adds a WebViewClient.shouldInterceptRequest override for ad host matching and injects small, generic CSS at onPageFinished. Main-frame navigation is never blocked, exception domains always win, no JavaScript scriptlets or anti-adblock circumvention are implemented.

- blockInAppBrowserAds (default true): false leaves the app WebView method unmodified.
- updateAdBlockLists (default true): true reads locally stored validated snapshots and checks the repository's filter-data branch once per 24 hours. False runs with embedded seed hosts/CSS only.
- Seed hosts: doubleclick.net, googlesyndication.com, googletagservices.com, amazon-adsystem.com, criteo.com, criteo.net, taboola.com, outbrain.com.

### Filters and provenance

A scheduled workflow downloads the current public EasyList and AdGuard Japanese Filter, strictly converts only full-host rules (||host^), with exact (@@||host^) exceptions and generic allowlisted CSS, validates host bounds (10,000–100,000), compresses and publishes a snapshot to the [filter-data branch](https://github.com/rikunode/hatena-bookmark-hide-pr-patches/tree/filter-data). The Android helper validates version, counts, bounds and sha256; gzip is limited to 2 MiB. Snapshots are saved via Android AtomicFile with a validated previous file fallback. Network/parse errors fail open and do not affect the previously stored snapshot.

Download: https://raw.githubusercontent.com/rikunode/hatena-bookmark-hide-pr-patches/filter-data/filters.json.gz

Sources and licensing: [EasyList](https://easylist.to/pages/licence.html) (GPL v3+ or CC BY-SA 3.0+) and [AdGuard Japanese Filter](https://github.com/AdguardTeam/AdguardFilters) (GPL-3.0). The [NOTICE](../filter-lists/NOTICE) is copied to the distribution branch.

**SHA-256 protocol**: UTF-8 bytes of version, newline, generated_at, newline, each lexicographically sorted block host and newline, then --EXCEPTIONS-- and newline, sorted exception hosts each with newline, --CSS-- and newline and the CSS literal. The sha256 property itself is excluded. The output is a gzip-compressed JSON object with keys version, generated_at, hosts, exceptions, css, sha256. The app and Actions converter share this protocol.

The existing PR filtering, cloned package support, and weekly ranking patch are unchanged. This release does **not** claim real-device verification; static tests and build results are separate from an installed-app test.
