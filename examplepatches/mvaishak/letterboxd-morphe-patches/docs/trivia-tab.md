# IMDb Trivia in Letterboxd 3.6.7

Trivia sits immediately after Releases in the film details tab bar. On narrow screens, swipe the tab bar left to reach it. The IMDb trivia switch in Letterboxd Mods controls whether it appears.

## How it works

Letterboxd 3.6.7 creates its details tabs in a Material TabLayout. A coroutine removes empty Cast and Crew tabs and checks that their tags are the app's own enum. The patch adds Trivia after that coroutine finishes. The normal selection handler clears the previous tab's decorations, then hands Trivia to an AndroidX child fragment in the same content container as Releases. The other tabs keep their original handling. A restored Trivia child can recover the selection before the native tab loop runs, and its saved state keeps the filter and row limit.

The film page gets its IMDb ID through the link resolver used by custom artwork. Opening Trivia starts the public IMDb page in a hidden WebView. With preloading enabled, the loader can start after the film details first draw. The first recognizable trivia section goes to the native view before pagination finishes. Pagination uses the site's own buttons and waits for each group's item count to grow. The loader gives the buttons time to mount and checks for a stable final snapshot before it caches the result. Image requests are disabled, and Java parsing of article payloads runs off the UI thread. The final snapshot keeps source order within spoiler and non-spoiler groups.

Trivia uses Letterboxd’s native `item_loading_indicator` when no entries are
ready and the same animation at 20 dp beside the waiting Load more action.
Cached and partial entries appear immediately. The indicator detaches when
loading ends or the tab stops. See the [UI design playbook](design/MORPHE_DESIGN_PLAYBOOK.md).

The film page keeps its vertical scroll. Trivia adds 3 native rows first and appends up to 5 more when you tap Load more. The button shows available entries immediately and fills the rest of its 5 slots when retrieval finishes. IMDb pagination runs separately, and the control shows a loading state when it has no more local rows to display. Entries reuse Letterboxd's text appearance and line spacing, release metadata styling, and Material dividers. Basic inline formatting and HTTPS links are supported.

Category filters appear when the result has multiple categories and use the groups IMDb returned for that film. The app formats category identifiers into labels; exact source capitalization and localization can differ. Spoilers follow non-spoilers and each gets its own reveal button. Hidden spoiler text doesn't enter the view or its accessibility label. When the view is recreated, spoilers start concealed again.

Each IMDb ID has at most one active loader, owned by the film details view lifecycle. Tab changes reuse it. Leaving the film releases the request and destroys its WebView when the last owner leaves.

A speculative request reads up to 3 entries from the initial document and pauses. It gives the user 5 seconds to open Trivia and resume pagination in the same WebView. After that, the WebView closes and the entries stay in a 4-title, 60-second memory cache. Opening Trivia from that cache displays those entries immediately and starts a request to complete the result. The app still keeps up to 4 completed or explicitly empty results for 10 minutes. The source link and any entries already displayed stay visible if later pages fail.

This is a personal-use patch for Letterboxd 3.6.7. The [feasibility report](trivia-feasibility.md) records the scope of IMDb permission reported by the user. Trivia results live in memory. Preload runs whenever IMDb trivia is enabled. A markup change on IMDb can break extraction. The loader retains the 24-click and 35-second limits from the popup, plus a separate 3-second extraction deadline.

## How to verify

Run `node --test extensions/extension/src/testHost/js/ImdbTriviaPageTest.cjs` for the DOM fixtures. Build the bundle with `./gradlew buildAndroid`. Patch the original Letterboxd 3.6.7 (515) split bundle with the [recorded patch selection](../build/trivia-tab/patch-result.json).

On the USB phone, run `python3 extensions/extension/src/testHost/device/trivia_tab.py build/trivia-tab primer the-dark-knight --detail --preload`. The runner opens the films, uses the native tabs, checks Load more and spoiler reveal on Primer, filters Cameo on The Dark Knight, and measures cache hits across repeated tab switches.

## Original tab benchmark

November 11, 2026. Tests ran on the USB-connected OPPO CPH2293 with Android 13 and Android System WebView 156.0.8078.47. The popup APK and its results came from the [testing phase](trivia-device-test.md). The new APK used the same signing certificate and installed in place. All 9 patches in the previous selection applied successfully.

### Performance comparison

Times below are **median / p95** in seconds, with the sample count in parentheses. The popup only published rows after full retrieval, so the old loader time is the earliest the popup could show an entry. The new first-frame measurement starts in the selection handler and ends when the native rows are ready to draw. Cold runs restart the app process and retain the WebView's disk cache. Cached runs switch away from Trivia and back in the same process.

| Film | Entries | Popup full / first possible | Tab first frame | Tab full retrieval | Tab cached first frame | Final APK first / full |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Primer | 17 | 4.82 / 5.06 (2) | 2.08 / 2.55 (2) | 4.22 / 4.36 (2) | 0.04 / 0.05 (4) | 2.48 / 6.11 (1) |
| Parasite | 112 | 6.96 / 7.80 (2) | 1.78 / 2.34 (2) | 6.85 / 8.28 (2) | 0.05 / 0.05 (3) | 1.72 / 4.99 (1) |
| Inception | 137 | 7.04 / 8.22 (2) | 1.82 / 1.89 (2) | 6.28 / 7.42 (2) | 0.06 / 0.06 (3) | 1.58 / 6.27 (1) |
| The Matrix | 279 | 9.22 / 9.99 (2) | 1.81 / 2.05 (2) | 9.11 / 10.68 (2) | 0.04 / 0.05 (3) | 2.02 / 7.64 (1) |
| The Dark Knight | 501 | 12.54 / 14.70 (2) | 1.49 / 1.49 (2) | 13.50 / 17.51 (2) | 0.06 / 0.06 (4) | 1.35 / 10.36 (1) |

The median and p95 columns cover 2 benchmark passes before the final review fixes. The last column repeats each title once on the exact installed APK, which includes the completion guard and local Load more changes. The benchmark p95 uses nearest rank, which is the slowest sample at these sample sizes. Treat it as a check on the observed runs, not a population estimate. The original files don't have a warm timer or an Android first-frame timer, so there's no measured warm speedup against the popup.

Across the 10 benchmark cold samples, the first frame had a median of 1.68 s. Across the 5 final APK samples, it had a median of 1.72 s. The 17 cached reopens had a median of 49 ms and p95 of 61 ms, with no additional WebView load. All 5 films matched the popup's final counts. Full retrieval still varies; The Dark Knight had a 9.49 s run and a 17.51 s run even though its first rows appeared at about 1.49 s in both.

IMDb ID resolution took a few milliseconds. Median WebView creation was 121 ms, document commit was 1.40 s, final Java parsing was 6 ms, and the wait from binding the first rows to pre-draw was 15 ms. Document loading dominates the wait for the first rows. For large titles, IMDb's pagination dominates the remaining time. The cold runs used 1 WebView each. The per-run results include main document timing, WebView resource dispatch counts and pagination clicks. WebView dispatches can include cache hits; they don't measure the number of requests sent over the network.

ADB snapshots showed the Letterboxd process PSS rising by about 27 to 44 MiB around the first frame. This samples the app process and excludes separately attributed WebView renderer memory. The earlier test phase didn't record comparable PSS. These results don't establish a memory improvement.

### Coverage

The Gradle APK build and all 9 host tests passed. The phone tests matched the popup's entry counts for all 5 films, exercised repeated Releases and Trivia switches, used Load more through Primer's 17 entries, checked hidden spoiler placeholders and single-entry reveal, and filtered The Dark Knight to its 3 Cameo entries. A rapid switch from Primer to Parasite canceled the first loader and showed only Parasite entries. Back left Trivia.

The offline test showed the connection error, left the IMDb link available, and loaded Primer after reconnecting and tapping Retry.

The explicit empty response is covered by a host fixture. A live zero-trivia film and a controlled slow network weren't available for these runs. Letterboxd's main activity declares portrait orientation, so landscape wasn't exercised. The extension-wide Android lint task reports 6 errors in unchanged files outside Trivia.

### Artifacts

- [Signed final APK](../build/trivia-tab/Letterboxd-3.6.7-Trivia.apk) and [checksum](../build/trivia-tab/final-sha256.txt)
- [Primer tab](../build/trivia-tab/primer-trivia-tab.png), [hidden spoilers](../build/trivia-tab/primer-spoilers-hidden.png), and [Cameo filter](../build/trivia-tab/the-dark-knight-cameo.png)
- [Per-run timings and device checks](trivia-tab-results.json)
- [Popup baseline APK](../build/trivia-probe/Letterboxd-3.6.7-imdb-trivia-personal.apk) and [raw baseline runs](../build/trivia-probe/native-device-results.jsonl)


## Preload comparison

On November 11, 2026, the OPPO CPH2293 ran the same patched 3.6.7 APK with
preload off and on. Each condition had one cold-process run per film. The
previous exact-APK first-frame times were 2,480 ms for Primer and 1,350 ms for
The Dark Knight. Those runs had no preload and used the prior tab loader.

| Film | Preload | Details view ready | Tap to first Trivia frame | App PSS before tapping / at first entry | WebViews |
| --- | --- | ---: | ---: | ---: | ---: |
| Primer | Off | 546 ms | 4,488 ms | 331.2 / 331.3 MiB | 1 |
| Primer | On | 642 ms | 81 ms | 343.5 / 316.7 MiB | 2 |
| The Dark Knight | Off | 988 ms | 3,221 ms | 283.5 / 309.3 MiB | 1 |
| The Dark Knight | On | 717 ms | 90 ms | 324.9 / 307.3 MiB | 2 |

The details view timer starts at the native details fragment’s `onViewCreated`
and ends after its first draw following tab setup. The before-tap PSS sample
with preload enabled was taken after the 3-entry preview. These app-process
snapshots omit separately attributed WebView renderer memory and do not
measure peak memory or scrolling frame times.

In both preload runs, the automation took longer than the 5-second hold to
reach Trivia. The first WebView closed with 0 pagination clicks. The second
completed the same 17 and 501 entries as the respective off runs. The samples
show faster initial display and extra WebView work when the hold expires.

A final-APK run opened Trivia before the preload expired. Primer displayed
its first entries in 42 ms and finished all 17 with 1 WebView. In a separate
run, Back destroyed an active speculative WebView. With preload off, the
delivery APK also passed Load more, spoiler reveal, the Cameo filter, and a
completed-cache reopen on both titles. A switch from Primer to Parasite
cancelled the first WebView and showed the next film's entries. An offline
request showed the connection error and IMDb link. Tapping Retry after
reconnecting loaded Primer.

With preload enabled on a test build, Primer showed the cached preview
91 ms after tapping Trivia and returned all 17 entries. The speculative
WebView closed after its five-second hold without requesting any additional
pages. Opening Trivia after that point started a second WebView. This smoke
test did not measure scrolling or peak memory.

Run the device script with `--preload` on builds with automatic preload.
The available tests did not measure idle
battery or network use, renderer memory, or scroll responsiveness. The
[preload results](trivia-preload-results.json) record the measured runs and
WebView diagnostics.
