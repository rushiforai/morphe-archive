# Oxbow

Fork of [FeurStagram](https://github.com/jean-voila/FeurStagram). An oxbow is a calm lake
cut off from the river's main current: Instagram off the stream, keeping what matters.

**Direction: calm + keep.** Upstream's wellbeing patches stay the core (we merge `upstream`
for new Instagram versions). On top of them, utilities that let you *keep* things, never ones
that pull you back into scrolling.

## Features (Instagram 453.0.0.55.79)

| Feature | Patch / extension | Tested on device |
|---|---|---|
| Download: posts, carousel slide, videos | `download/DownloadPatch.kt`, `Download.java` | yes |
| Download: stories, highlights | same | yes |
| Download: reels viewer (any menu variant) | same (`addClipsRow`) | yes |
| HD profile picture: long-press avatar | same (`profileAvatarLongPress`) | yes (1080px) |
| Clean share links (allowlist: `img_index`, `story_media_id`, `comment_id`, `hl`) | `privacy/CleanLinksPatch.kt`, `ShareLinks.java` | yes (copy link) |
| Ghost: stories not marked seen | `privacy/GhostModePatch.kt` + `Block.java` | opens fine; "not in viewer list" needs a 2nd account |
| Ghost: no DM read receipts | same (`holdReceipt`, inbox seen check) | yes (two accounts: sender stays on Delivered, the chat clears and stays cleared after a restart) |
| Ghost: no typing indicator | same | not exercised (needs a real chat) |
| Comments off (feed + reels buttons, composer, sheet, endpoints) | `distraction/CommentsAndScrollPatch.kt`, `Scroll.java`, `Block.java` | yes |
| No endless scrolling (reel viewer swipe, "more like this" feeds, Inspiration reels) | same | yes (swipe) |
| No story swipe-up (reply box, reactions, keyboard; Send message still replies) | same (`StorySwipeUpFingerprint`) | yes (photo + video stories) |
| Hide Meta AI / Muse (share sheet target, Meet Muse promo cards, Vibes / Meta AI / Imagine feed units) | `metaai/HideMetaAiPatch.kt`, `MetaAi.java`, `Block.java` | build + no crash; this account never gets the Muse target, so removal not seen |
| Hide Home (long-press Messages opens settings) | `Hiders.java`, `HomeTabWatcher.java`, `Config.java` | yes |

Settings: *Keep and privacy* page (downloads, clean links, ghost mode); comments and endless
scrolling live in *Blocked surfaces* so the permanent lock covers them.

## Defaults (fresh install)

Calm first: distraction is blocked, privacy extras are opt-in. Source of truth: `Config.java`.
A changed default only reaches toggles the user never touched.

| On | Off |
|---|---|
| Block feed, Reels, Explore, Friends lane, Instants, Notes, suggested, ads, Meta AI | Block stories, comments, notifications button |
| Block endless scrolling, story swipe-up | Following-only feed |
| Downloads | Download all carousel slides |
| Clean links | Ghost: story seen, DM read receipts, typing |
| Hide Instagram popups | Permanent lock |
| Force SDR | Reels tab icon (hidden) |
| Update check on launch | |

Landing page: Home. All other tab icons are shown.

## How the patches stay version-proof

- Anchors are stable things: named classes (`LiveTreeJNI`, `TreeJNI`, `ViewPager2`,
  `ClipboardManager`), API strings (`mark_thread_seen-`, `indicate_activity`,
  `media/seen/?reel=...`), `__redex_internal_original_name` values, and method shapes.
  Purge-log strings are matched by suffix (their `android_purge_26_q3_` prefix changes).
- Media and user data are read from Instagram's Pando trees by **API field name**: the tree
  keys every field by `String.hashCode()` of its name, so `"image_versions2".hashCode()` works
  in every version.
- Menu rows are Instagram's own (`MediaOption$Option.DOWNLOAD`, its icon and label), added
  through Instagram's own row builders found by signature.

## Releasing

```sh
./release.sh instagram.apkm          # builds oxbow.apk + oxbow-clone.apk, publishes vX-Y-Z
```

Signing: `oxbow.keystore` (git-ignored) with the password in `~/.config/oxbow/release.env`;
a backup lives in `~/.config/oxbow/`. Lose both and existing installs can't update.

## Rebrand notes

User-visible names, the clone package (`com.instagram.android.oxbow`), the updater
(`aic0d3r/oxbow`) and the signing key are Oxbow's. Internal Java/Kotlin packages stay
`com.feurstagram.*` on purpose, so upstream merges stay clean.

## Not done / known limits

- F-Droid can't ship Oxbow (it builds from source only); Obtainium works from GitHub releases.
- DM read receipts off leaves the message unread for the sender, which is the point. On this
  phone the chat still clears when you open it or reply, and stays cleared after a refresh or a
  restart, but counts Instagram keeps on its own side (the account switcher, another device)
  keep showing the chat unread.
- Story-seen blocking: stories you watch while it is on will be reported if you switch it off
  later and they are still in your tray (Instagram re-sends locally seen ids with the tray).
- Re-downloading the same item creates `name-1.jpg` (Android's DownloadManager), not a skip.
