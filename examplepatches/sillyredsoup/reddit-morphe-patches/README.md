# Reddit patches for Morphe

These three independent patches target Reddit 2026.14.0:

- **Reddit - Hide app posts** hides Reddit Dev Platform games and apps in listings. It adds a **Hide games in feed** switch under Reddit's Morphe settings → Feed. The switch defaults to on and applies to newly loaded listings. This patch requires the upstream Morphe settings patch for the switch.
- **Reddit - NSFW mode** uses the Inbox slot for an NSFW button in the bottom bar. It keeps the Inbox icon; the Home and Games buttons stay in place. Turning it on enables Show NSFW, turns blur off, and shows only NSFW posts in the feed. Turning it off disables Show NSFW, turns blur back on, and shows only non-NSFW posts. Toggling updates visible posts and refreshes the current feed without restarting the screen.
- **Reddit - Vertical home feed** adds a **Vertical** button with a video icon to the bottom bar. From Home, it opens Reddit's full screen media player at the first visible post (or the next image/video), in Home's order. Near the end it requests another page from Home's own pager and appends its images and videos. Repeated posts are skipped by post ID. Titles, usernames, and controls start hidden; tap the media to show or hide them. Normal post taps retain Reddit's behavior. This patch is experimental until tested in the app.

Add the GitHub source in Morphe Manager:

https://morphe.software/add-source?github=sillyredsoup/reddit-morphe-patches

In Expert mode, select both this source and the built-in Morphe source. Select the patches you want here, then select the upstream Reddit patches you want. **Hide navigation buttons** with **Hide Games** can be used alongside the NSFW button.

If you used version 0.1.x, select the two new patch names explicitly. Morphe does not carry the old combined patch selection over to them.

## Local build

Run `./build-local.sh` to build `reddit-mode.mpp` with public build tools. The bundle can also be imported as a Local source. This patch is pinned to Reddit 2026.14.0 and fails if its target bytecode changes.

## Verification

Morphe Desktop discovers all three patches and applies them together with the upstream **Hide ads** and **Hide navigation buttons** patches to the 2026.14.0 APKM. The vertical viewer still needs device testing.
