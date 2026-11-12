# Oxbow

Fork of [FeurStagram](https://github.com/jean-voila/FeurStagram). An oxbow is a calm lake
cut off from the river's main current: Instagram off the stream, keeping what matters.

**Direction: calm + keep.** Upstream's wellbeing patches stay the core (we merge `upstream`
for new Instagram versions). On top of them, utilities that let you *keep* things, never ones
that pull you back into scrolling.

## Features (Instagram 455.0.0.51.72)

On-device status below is from a smoke test of the 455 clone on the test phone (classic docked
tab bar, no pill highlight, no Create tab; tested with the Reels icon hidden and shown). The 455
.apkm carries 11 feature splits; the in-app browser still opens bio links. The 455 test covered
install and launch, the tab bar, Notes hidden, the settings long-press, the post menu (Download
and Copy caption rows on an own post, Download saved to Pictures/Oxbow, Copy caption's toast on
a caption-less post) and a feed of organic posts, with no crashes in the log. Rows marked *last
passed on 454* keep their 454 results; everything else was re-verified as listed.

| Feature | Patch / extension | Tested on device |
|---|---|---|
| Download: posts, carousel slide, videos | `download/DownloadPatch.kt`, `Download.java` | post photo: yes on 455 (saved to Pictures/Oxbow). Carousel slide, video: yes on 454 (hold-Download saved all 12 slides of a carousel); the 455 rework of the menu hook is byte-verified but those three saves were not repeated |
| Download: stories, highlights | same | yes on 454 (story photo and a highlight photo saved) |
| Download: reels viewer (any menu variant) | same (`addClipsRow`) | yes on 454 (reel video saved from the `⋯` row) |
| HD profile picture: long-press avatar | same (`profileAvatarLongPress`) | yes on 454 (1080px) |
| Clean share links (allowlist: `img_index`, `story_media_id`, `comment_id`, `hl`) | `privacy/CleanLinksPatch.kt`, `ShareLinks.java` | yes on 454 (Copy link and a share-sheet paste, both clean). 455: both hooks byte-verified at the top of the share intent builder and its video branch; a live paste was not repeated |
| Ghost: stories not marked seen | `privacy/GhostModePatch.kt` + `Block.java` | stories open fine on 454; "not in viewer list" needs a 2nd account |
| Ghost: no DM read receipts | same (`holdReceipt`, inbox seen check) | 453: yes (two accounts: sender stays on Delivered, the chat clears and stays cleared after a restart). 454: patch applies (the inbox unread answer needed a new match) and the hooks are in the bytecode; not exercised on the phone (needs a second account) |
| Ghost: no typing indicator | same | not exercised (needs a real chat) |
| Ghost: Hide screenshots (view-once / replayable / vanish-mode photo or video; the switch also lifts the disappearing-media window's FLAG_SECURE block, from HushGram) | same (both screenshot detectors' hand-off, the secure-window helper, every `Window.setFlags`/`addFlags` call), `Config.isScreenshotHidden` | yes on 454, end to end (second account): switch on — the screenshot is allowed and the sender sees no notice; switch off — the stock block returns. The detector gate on a screenshotable surface (vanish mode) not exercised separately |
| Ghost: long-press New message flips the Ghost switches | `Hiders.java` (`GhostShortcut`) | yes on 454 (toast, all four switches on) |
| Comments off (feed + reels buttons, composer, sheet, endpoints) | `distraction/CommentsAndScrollPatch.kt`, `Scroll.java`, `Block.java` | yes on 454 (feed button and count gone, sheet never opens, endpoints throw before leaving the phone; Reels button hidden, composer never opens). 454 had moved the branches past the old hooks — fixed (commit 7f639df) |
| No endless scrolling (reel viewer swipe, "more like this" feeds, Inspiration reels) | same | yes on 454 (reel viewer stays on the same reel); the other surfaces not retested |
| No story swipe-up (reply box, reactions, keyboard; Send message still replies) | same (`StorySwipeUpFingerprint`) | yes on 454 (photo story: no keyboard, no reply bar) |
| Feed ads (sponsored posts dropped at parse time) | `network/FeedItemFilterPatch.kt`, `Block.java` | yes on 454 (with the block off, the network trace shows "drop sponsored media" twice; with it on, no sponsored post reaches the feed) |
| Hide Home: Back leaves the app from the first tab left (Back history) | `settings/BackHistoryPatch.kt`, `Hiders.backHistoryDepth` (from FeurStagram) | yes on 454 (Home hidden: Back from Messages lands on Reels, one more Back leaves the app; the feed never comes back) |
| Hide Meta AI / Muse (share sheet target, Meet Muse promo cards, Vibes / Meta AI / Imagine feed units) | `metaai/HideMetaAiPatch.kt`, `MetaAi.java`, `Block.java` | no crash across the 454 smoke test; this account never shows the Muse surfaces, so removal not seen |
| Hide Home (long-press Messages opens settings) | `Hiders.java`, `HomeTabWatcher.java`, `Config.java` | yes on 455 (settings open from the long-press; Home itself hidden and the bar re-flows) |

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
| Clean links | Ghost: story seen, DM read receipts, typing, screenshots |
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
