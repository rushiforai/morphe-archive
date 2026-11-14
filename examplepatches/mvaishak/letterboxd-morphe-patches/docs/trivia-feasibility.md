# IMDb trivia feasibility

November 11, 2026. **Retrieval passed on the OPPO for personal use.** The user reported written IMDb authorization for a personal project and said it did not prescribe a retrieval method. The native patch uses IMDb's public page and its ordinary pagination controls. Public distribution rights were not established.

## Repository audit

The local `dev` checkout was at `2ad3220` before the audit. Kotlin patch definitions live in `patches` and the Java runtime lives in `extensions/extension`, which packages `extensions/extension.mpe`. The project uses the Morphe patches Gradle plugin 1.3.4 and declares Morphe patcher 1.11.0. The local Gradle wrapper reported 9.7.1 on Homebrew OpenJDK 21.0.13.0.3. The installed Android SDK has API 36 and Build Tools 36.0.0.

The [custom artwork patch](../patches/src/main/kotlin/app/template/patches/letterboxd/CustomArtworkPatch.kt) already injects a hook at the end of the film actions dialog's `onViewCreated` and declares compatibility with Letterboxd 3.5.4, 3.5.6, and 3.6.7. [ArtworkHooks](../extensions/extension/src/main/java/app/template/extension/artwork/ArtworkHooks.java) reads `Film.getLinks()`, takes the IMDb title ID from the link ID or URL path, and takes the TMDB movie ID from its URL. The [TMDB client](../extensions/extension/src/main/java/app/template/extension/artwork/TmdbClient.java) can look up a TMDB movie by IMDb ID. The reverse lookup would need separate validation if the Letterboxd model lacks an IMDb link. The [Mods settings](../extensions/extension/src/main/java/app/template/extension/settings/ModSettingsView.java) expose the artwork settings when its hook reports availability. These provide starting points for a future film action and optional setting. Runtime availability of a film's IDs was not measured on the phone.

## Direct HTTP

One ordinary curl GET per title, using the default user agent with 5 seconds to connect and a 15-second total limit. The responses had no redirect and each returned the same 118-byte HTML error page headed `403 Forbidden`. The body contained none of the checked markers (`__NEXT_DATA__`, `ipc-html-content-inner-div`, `trivia-item`, or `captcha`). An independent browser-fetch service also reported 403 for all five pages.

| Title | IMDb ID | HTTP | Entries retrieved | Response time |
| --- | --- | ---: | ---: | ---: |
| The Matrix (1999) | tt0133093 | 403 | 0 | 191 ms |
| Inception (2010) | tt1375666 | 403 | 0 | 2,311 ms |
| The Dark Knight (2008) | tt0468569 | 403 | 0 | 187 ms |
| Parasite (2019) | tt6751668 | 403 | 0 | 211 ms |
| Primer (2004) | tt0390384 | 403 | 0 | 145 ms |

Primer was selected as the smaller film. This table records only the rejected desktop requests. Zero refers to entries retrieved by this method. [Per-film JSON](trivia-feasibility.json)

## What lb-imdb 1.6.6 does

The checked revision was `505d3f3c160fe58a7e1845edb8c4eb84c1404130`. The content script extracts the title ID from the IMDb link on the Letterboxd film page and asks the extension background script to fetch trivia. It inserts a Trivia tab once it has entries and offers an IMDb link on errors. The extension's spoiler hiding is optional and defaults to off. A native implementation would keep the requested hidden-by-default behavior. [Content script](https://github.com/combatwombat/lb-imdb/blob/505d3f3c160fe58a7e1845edb8c4eb84c1404130/src/shared/js/content.js)

The background script calls a private IMDb GraphQL service using the persisted operation `TitleTriviaPagination`. It fetches spoiler and non-spoiler entries separately, 50 per page, and follows `pageInfo.endCursor` while `hasNextPage` is true. It groups the returned article HTML by category ID and falls back to Uncategorized for entries without a category. The extension caches the operation hash locally and can refresh it from the author's GitHub Pages when IMDb reports that the persisted query is missing. No explicit request timeout or page cap is present in the checked code. Running the upstream background script against mocked responses verified cursor continuation, both spoiler streams, category grouping, and the Uncategorized fallback. No live endpoint request or Android retrieval was verified by this test. [Background script](https://github.com/combatwombat/lb-imdb/blob/505d3f3c160fe58a7e1845edb8c4eb84c1404130/src/shared/js/background.js)

The source documents a 403 when the request lacks an IMDb referrer and uses Chrome's network rules or Firefox's request listener to rewrite that header. This makes the private service a different path from the trivia-page GETs above. The project's MIT license applies to its code. IMDb's terms separately require written consent for automated website extraction. The Android implementation uses a normal public page load. The page can make its own requests when its buttons are activated. Hash rotations, request requirements, and schema changes are the main risks of relying on this private interface. [Chrome network rules](https://github.com/combatwombat/lb-imdb/blob/505d3f3c160fe58a7e1845edb8c4eb84c1404130/src/chrome/rules.json) · [IMDb Conditions of Use](https://www.imdb.com/conditions)

## Public page on Android

On desktop Brave, normal navigation to The Matrix produced five initial entries. IMDb's “50 more” control increased the list to 55, and activating the separate Spoilers control loaded five initial spoiler entries. The title also rendered actual trivia in Chrome on the OPPO. An in-place Letterboxd diagnostic build then loaded the same public page in a WebView. An early run found five entries and timed out while waiting for expansion. Adding a rendering delay, bounded retries when the count stayed unchanged, and a full-width layout made the diagnostic repeatable across the five films.

| Film | Diagnostic entries | Spoilers | WebView time |
| --- | ---: | ---: | ---: |
| The Matrix | 279 | 84 | 10.791 s |
| Inception | 137 | 18 | 8.648 s |
| The Dark Knight | 405, capped in diagnostic | 7 | 12.658 s |
| Parasite | 112 | 28 | 6.924 s |
| Primer | 17 | 2 | 4.950 s |

Director Trademark appeared for Inception, and Cameo appeared for The Dark Knight. The test identified spoiler groups from the source section's `--spoilers` suffix. The native build alternates expansion across groups and found 501 entries for The Dark Knight, including 103 spoilers. The browser controls reached their observed end. The complete catalog counts have not been independently reconciled with IMDb. [Per-film JSON](trivia-feasibility.json)

## Letterboxd implementation

The personal patch is off by default in Morphe's patch list and targets Letterboxd 3.6.7. Selecting it enables the IMDb trivia action in the film's More menu. The Letterboxd Mods setting can turn it off. The runtime reuses the artwork hook's film metadata, loads only the canonical IMDb trivia page, and renders the extracted text in a native bottom sheet. Categories are displayed from IMDb's section identifiers. Spoiler rows are created only after the user chooses to reveal the category.

The loader limits expansion to 24 clicks, limits waiting to 35 seconds plus a 3-second extraction deadline, and stops when page requests are denied. Results are cached in memory for up to ten minutes for four film IDs. Partial responses are labeled in the sheet and are not cached. The source page remains available via Open IMDb. [Device test](trivia-device-test.md)

## Official options

- **Free non-commercial datasets.** The published TSV file list contains no trivia dataset. IMDb's software-use guidance limits the non-commercial allowance to its published datasets. [Dataset list](https://developer.imdb.com/non-commercial-datasets/) · [Software-use guidance](https://help.imdb.com/article/imdb/general-information/can-i-use-imdb-data-in-my-software/G5JTRESSHJBBHTGX)
- **Licensed Trivia & Goofs bulk add-on.** IMDb offers it through AWS Data Exchange. The documented bulk payload is JSON Lines keyed by `titleId`. Its `trivia` array holds up to 10 English entries per title, ordered by interest, with `text`, `category`, and `isSpoiler`. The documented top-ten limit cannot provide website parity on titles with more than ten entries. Add-on pricing and the terms for mobile display, caching, and redistribution require confirmation with IMDb. No price or public distribution rights were verified. [IMDb products](https://data.imdb.com/) · [AWS Marketplace listing](https://aws.amazon.com/marketplace/pp/prodview-yeuyizioqmfsy) · [Bulk schema](https://data.imdb.com/documentation/bulk-data-documentation/data-dictionary/titles/#trivia)
- **Licensed GraphQL API.** Requires an AWS Data Exchange subscription, AWS request signing, and an IMDb API key. The general API documents cursor pagination using `after`, `endCursor`, and `hasNextPage`. Trivia coverage and the trivia-specific schema were not verified for the API or its advertised free trial. An AWS subscription or trial alone does not establish redistribution rights. [API documentation](https://data.imdb.com/documentation/api-documentation/key-concepts/) · [Trial listing](https://aws.amazon.com/marketplace/pp/prodview-3n67c76ppu2yy)

## Decision

**Personal integration completed. Public distribution remains restricted.** The user's reported permission covers their personal project. The public-page method depends on IMDb retaining recognizable section IDs and pagination controls. The licensed add-on remains an alternative if wider use or a stable data contract is required. [IMDb licensing](https://data.imdb.com/) · [IMDb linking guidance](https://help.imdb.com/article/imdb/general-information/how-do-i-link-to-a-specific-page-on-your-site/GTRTF6K8UA9JP9QQ)
