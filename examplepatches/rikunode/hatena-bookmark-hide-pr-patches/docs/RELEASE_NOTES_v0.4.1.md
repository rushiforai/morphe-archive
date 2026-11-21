# v0.4.1 — Ad-block coverage correction

Hatena Bookmark 5.80 / versionCode 58000 only. Four Morphe patches; the existing PR, clone and weekly-ranking patches are unchanged.

- The EasyList/AdGuard Japanese converter now accepts bare `||host^` and exactly `||host^$third-party` (including `@@` exceptions). Other options, path-scoped rules and domain-scoped cosmetic rules remain excluded. Snapshot format version 1, canonical SHA-256, host-count and size checks remain unchanged.
- After validating PRIMARY or PREVIOUS snapshot data, the Android helper merges snapshot hosts with the eight embedded seed hosts, removes exact snapshot exceptions, and combines the seed CSS with snapshot CSS. Runtime exception precedence continues for matched subdomains. Without a valid snapshot (or when list updates are disabled), it uses only the seed.
- Background loading, fail-open requests, main-frame exclusion, once-per-24-hour conditional ETag fetches, AtomicFile storage and fixed rules for a currently displayed WebView are unchanged.

Filter source and attribution: [EasyList](https://easylist.to/pages/licence.html), [AdGuard Japanese Filter](https://github.com/AdguardTeam/AdguardFilters), and the [NOTICE](../filter-lists/NOTICE) reproduced in the [filter-data branch](https://github.com/rikunode/hatena-bookmark-hide-pr-patches/tree/filter-data). The upstream lists may not contain every bare advertisement-domain root; the embedded seeds persist even after a valid snapshot download.

No real-device ad-removal claim is made. Build, tests and APK application are separate verification gates.
