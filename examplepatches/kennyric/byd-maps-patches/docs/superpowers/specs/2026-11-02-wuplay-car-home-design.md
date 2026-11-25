# Wuplay car Home and autoplay

## Intent and agreed direction

Make the Wuplay interface in Gearslip feel like the user's Home: recognizable catalog rows, horizontal carousels and posters, with enough title information to choose confidently. Add automatic stream selection capped at 10 Mbps. Deliver through the existing Wuplay Mobile Morphe patch in this repository.

The user selected existing Gearslip carousels over a separately drawn TV interface. The display in scope is Wuplay inside Gearslip on the car screen. The earlier Android TV APK was the wrong implementation target.

## Verified baseline

- Source: fetched `origin/main`, commit `48b890819bb8f98c629a14ba3b41000efd2c5229`. The primary checkout was 19 commits behind and contains unrelated changes; leave it intact.
- Target: `app.wuplay.android` 0.1.9-alpha / 9, patch **Add Gearslip car interface**.
- Read-only pull from the user's CPH2747: `.analysis/wuplay-phone-20261102/wuplay-mobile-installed.apk` in the primary checkout; SHA-256 `aff1dee97cb0aedeed0659d240e1ce77bf52dea9a007748638ab77377067d5b7`. Installed signer is Morphe, certificate SHA-256 `8a47c1bacd4161681c22797ce63c240ae706a5e69778bebde95c7c5fe8b0c4e5`.
- Installed Gearslip: 0.3.31-alpha / 13. Its source supports `SectionedItemTemplate`, `GridSection` and horizontal artwork shelves. The current Wuplay extension uses text-only lists, despite native metadata containing posters, backgrounds, runtime and ratings.
- The phone APK is inspection/acceptance evidence. Production patching continues to target the supported original publisher APK, not an already patched input.

## Approaches

1. **Selected: extend the Wuplay patch with native Gearslip shelves.** Reuse the host's carousel renderer, native Wuplay repositories and existing playback owner. Keeps installation as a Wuplay patch and requires no Gearslip fork. Layout follows host capabilities, including square artwork slots; fit portrait posters without cropping rather than promising arbitrary poster dimensions.
2. **Considered: custom surface-rendered Home.** Allows a bespoke featured banner and exact poster proportions, but adds a separate rendering, scrolling, focus and input system beside the existing player. The user chose the first approach.

## Home and navigation

- Open directly to Home, using the currently selected Wuplay profile and its Home-enabled catalogs in native order. Preserve native access, content filtering and PIN enforcement.
- Show catalog names above horizontal poster shelves. Display title plus concise available year/rating metadata; use a designed placeholder when artwork is unavailable.
- Keep all eligible Home catalogs reachable. Fetch a bounded initial group and provide further groups and **More titles** within catalogs; choose concrete batch sizes during implementation based on real host limits and measured responsiveness.
- Load network data and resized artwork off the main thread with bounded concurrency, timeouts and memory/disk cache limits. Do not fetch full-size artwork for every catalog title.
- Make loading, unavailable rows, empty catalogs and retry states readable. One failed catalog must not prevent the remaining Home from appearing.
- Series detail opens season shelves: one horizontal thumbnail carousel per season, sorted by season/episode, with episode number/title and an episode detail/play action; Back retains the selected season and episode. Missing season metadata gets an explicit Episodes group, and season 0 is Specials.
- Selecting a poster opens a detail page with artwork, title information, a short synopsis and a prominent **Play · ≤10 Mbps** action. Series expose episode selection with the same play action for each selected episode.
- Preserve the relevant Home/catalog page when returning from details or playback. Keep Now playing reachable while browsing.
- Keep alternate sources, audio tracks and subtitles accessible as secondary controls. Do not require a source-list visit before normal playback.
- Use host-supported templates and artwork transport. Check Car API negotiation; retain an artwork/list fallback for hosts below the API required by sectioned shelves.
- Account for Gearslip's process-wide shelf cache, which keys by app/tab/index/title and does not automatically replace populated sections on invalidation. Bind shelf identity to a session/profile/content revision using supported template/tab identity; verify profile changes, refresh and artwork updates cannot reuse old content. Do not alter catalog names with hidden suffixes or modify Gearslip.

## Autoplay and the data limit

- Here autoplay means automatic source selection after **Play**, rather than choosing an unexplained link. Automatic playback merely on opening Home or connecting the car is outside this change. Automatic next-episode progression is also outside this first change.
- Resolve direct playable streams through the existing profile's enabled add-ons, preserving query eligibility, request headers and native decoder compatibility. Use native preferred add-on/stream preferences where available among eligible candidates, with deterministic fallback ranking.
- Enforce an independent car eligibility check at every playback entry, including manual source selection and automatic retry. Never fall back to streams known to exceed 10,000,000 bits/second when all candidates fail.
- Accept trustworthy bitrate metadata, or a positive file-size/runtime estimate; verify missing size through bounded native/header probing when appropriate. Unknown or invalid bitrate remains ineligible for autoplay. Label estimates honestly. A resolution label alone is insufficient.
- Restrict adaptive rendition selection to the limit where supported. A source estimate is an average, not a guarantee about instantaneous network transfer or buffering bursts; this change does not claim a hard network traffic shaper. Include this distinction in documentation and acceptance evidence.
- If nothing qualifies, show **No suitable stream within 10 Mbps**, with retry and source information. Do not bypass the cap silently. Skip failed candidates only within the eligible set, with bounded attempts and cancellation when the user navigates away or changes profile.
- Preserve playback ownership, surface replacement, seek/pause/resume, subtitles, audio and screen-off behavior. Do not autoplay trailer videos while browsing.

## Delivery and verification

- Implement in an isolated worktree from the fetched main. Keep existing account-bearing phone installations and recovery state intact. Do not uninstall the user's app or export its private account data.
- Add meaningful checks for bitrate boundaries, unknown/malformed sizes, all-over-limit results, preference ordering, retry/cancellation, pagination and stale profile/artwork results. Reuse existing lifecycle regression tests.
- Run required Python and Gradle checks; patch the supported original APK, inspect emitted DEX/resources and verify compatibility and signer before any installation.
- Demonstrate the actual Home shelves, posters, detail/play flow and automatic eligible source choice in Gearslip Preview, including rejection of a controlled over-limit stream. Verify reconnect/profile refresh and existing playback controls. Use authored media for repeatable bandwidth cases; separate emulator evidence from physical car acceptance.
- Deliver the patch bundle, validation evidence and a compatible test APK. User phone updates require an available matching signer and an authorized in-place update; otherwise preserve the installation and report the signing constraint.
- Keep source metadata and release-app trailers accurate. No manual version bump or stable promotion without the repository-required confirmation.

## Builder discretion

Choose concrete shelf limits, artwork dimensions, cache implementation, class boundaries, retry timeouts and concise copy within these contracts. Reuse existing runtime dependencies. Keep implementation and tests proportional; do not add another login client, a Gearslip fork or a second Compose/Media3 runtime.

Status: independent builder review found no important unanswered questions. Approved by the user; implementation authorized, including season/episode carousels. The seven existing car-interface regression tests pass on this baseline.
