# Reddit patches for Morphe

These three independent patches target Reddit 2026.14.0:

- **Reddit - Hide app posts** hides Reddit Dev Platform games and apps in legacy listings and modern post feeds. It adds a **Hide apps in feed** switch after the ad settings in Reddit's Morphe settings → Ads, without a subtitle. The switch defaults to on and applies when feed cards are loaded or rebuilt. This patch requires the upstream Morphe settings patch for the switch.
- **Reddit - NSFW mode** adds its own **NSFW** button to the bottom bar, after Vertical if present or otherwise after Home. It uses Reddit's blur-content icon, with a filled icon and active highlight when enabled. Inbox keeps its normal function. Turning the mode on enables Show NSFW, turns blur off, and shows only NSFW posts in the feed. Turning it off disables Show NSFW, turns blur back on, and shows only non-NSFW posts. The current feed refreshes after Reddit acknowledges both settings, without restarting the screen. Further taps while an update is pending queue the latest requested mode. Normal operation is silent; only unavailable settings, failed updates, or timeouts show a toast.
- **Reddit - Vertical home feed** adds a **Vertical** button with a video icon to the bottom bar. It opens the current post feed (Home, subreddit, profile Posts, Popular, and other native post feeds) at the first visible image/video or the next one. Swiping up follows that feed's order; near the end it requests another page from that same feed and skips repeated post IDs. Titles, usernames, subreddit, and controls start hidden; tap the media to show or hide them. Tap the subreddit in the overlay to open its community. The underlying feed follows the current media post, so Back returns to the same position. Normal post taps retain Reddit's behavior. The patch keeps its original name so existing selections continue to work.

Add the GitHub source in Morphe Manager:

https://morphe.software/add-source?github=sillyredsoup/reddit-morphe-patches

In Expert mode, select both this source and the built-in Morphe source. Select the patches you want here, then select the upstream Reddit patches you want. **Hide navigation buttons** with **Hide Games** can be used alongside the NSFW button.

If you used version 0.1.x, select the two new patch names explicitly. Morphe does not carry the old combined patch selection over to them.

## Local build

Run `./build-local.sh` to build `reddit-mode.mpp` with public build tools. The bundle can also be imported as a Local source. This patch is pinned to Reddit 2026.14.0 and fails if its target bytecode changes.

## Verification

Morphe Desktop discovers all three patches and applies them together with all 18
default upstream Reddit patches from Morphe v1.46.0 to the 2026.14.0 APKM.
The authenticated Android emulator can load Home, open the vertical media viewer,
advance by swiping up, and toggle NSFW filtering both ways without a recorded crash.
See [Android testing](testing/android/README.md) for the persistent local setup.

Run `python3 testing/nsfw-regression.py` to check button ownership after another
navigation screen is created, toggling while account state lags, and pending,
confirmed, rejected, queued and timed-out account updates. These focused JVM
checks use Android/Compose fixtures. The user confirmed that v0.3.7 fixes the
profile → broken toggle reproduction on their phone.

Version 0.3.9 has build and local regression checks only. Emulator testing and
post-release download checks were skipped at the user's request; the new tab and
icon were subsequently checked in v0.3.10 after the user resumed testing.
Version 0.3.10 fixes the icon renderer lookup and was visually verified in the
emulator: NSFW is outlined when off and filled when on, with Inbox preserved and
the Vertical video icon also rendered correctly.

Run `python3 testing/vertical-regression.py` to check source-feed ownership, media
ordering, duplicate post IDs, scroll events, and pagination cancellation when a
viewer closes. These JVM checks supplement the Android emulator checks.

Version 0.4.0 extends the viewer to native post feeds. Emulator checks cover Home,
subreddit, profile Posts and Popular: three upward swipes, hidden initial controls,
subreddit overlay, returning to the selected post, and reopening at that position.
Pagination uses the source feed, with its cache viewport updated while the viewer
is open. Snapshot and request ownership are isolated per viewer session.

Version 0.4.1 adds filtering for modern Devvit cards and compact posts; the saved
filter setting is read at app startup, before feeds load. Run
`python3 testing/app-posts-regression.py` for the legacy and modern card checks.
Vertical profile selection now also checks the native screen ancestry, so a
previous Home feed cannot be chosen while its visibility flag catches up.
