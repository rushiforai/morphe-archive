# IMDb trivia physical-device test

November 11, 2026. **Retrieval and native display passed** on a USB-authorized OPPO CPH2293 running Android 13 (API 33) with Android System WebView 156.0.8078.47.

## Installation

ADB initially reported Letterboxd 3.5.6 (498). The package was absent at the first launch attempt. At the user's request, the existing signed Letterboxd 3.6.7 (515) was installed, followed by in-place updates for the diagnostic and native builds. The new build's signing certificate matched the baseline, and Android accepted the in-place update. The standalone test app was canceled before a successful build at the user's direction.

## Observations

| Film | Native entries | Spoilers | Retrieval and parsing time |
| --- | ---: | ---: | ---: |
| The Matrix | 279 | 84 | 9.989 s |
| Inception | 137 | 18 | 8.223 s |
| The Dark Knight | 501 | 103 | 14.701 s |
| Parasite | 112 | 28 | 7.800 s |
| Primer | 17 | 2 | 5.057 s |

- The final installed APK was verified by SHA-256 and retested on all five films. All five resolved their IMDb IDs through Letterboxd's existing film data. The native rows displayed real entry text. Director Trademark and Cameo were observed in the source groups.
- Primer showed a **Reveal 2 spoilers** action before any spoiler rows. The spoiler heading appeared after a tap. Closing and reopening restored the concealed state, and no new retrieval appeared in the app's diagnostic logs on the same-process reopen.
- The Letterboxd Mods switch removed the action when off and restored it when re-enabled. The device was left with the feature enabled.
- Rotation was attempted and restored to the original system setting. Letterboxd 3.6.7 declares portrait orientation for its main activity, so the phone stayed in portrait. Landscape sheet behavior was not exercised.
- The initial native Matrix attempt timed out after 35.148 seconds and showed a retryable error. A subsequent build started checking the document without waiting for every subresource to finish, and the repeat returned 279 entries.
- The Dark Knight hit the earlier diagnostic's ten-click cap at 405 entries. The native run used fairer pagination and reached 501 entries with no remaining pagination control. Source-wide completeness was not independently measured.
- Five host tests exercised category grouping, bounded retry, stalled pagination, spoiler-only pages, and the explicit empty state. A confirmed empty source page, a deliberately disconnected network, and a long-running resource leak test were not exercised. See the per-film JSON for observed errors and timing.

## Local artifacts

- [Signed native APK](../build/trivia-probe/Letterboxd-3.6.7-imdb-trivia-personal.apk)
- [Signed diagnostic APK](../build/trivia-probe/Letterboxd-3.6.7-trivia-probe.apk)
- [Device screenshot before spoiler reveal](../build/trivia-probe/trivia-native-before-reveal.png)
- [Morphe patch](../patches/src/main/kotlin/app/template/patches/letterboxd/ImdbTriviaPatch.kt)
- [Host pagination tests](../extensions/extension/src/testHost/js/ImdbTriviaPageTest.cjs)
- [Per-film results](trivia-feasibility.json)
