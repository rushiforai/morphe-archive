# pomee4 Patches

Extra patches for [Morphe](https://morphe.software), meant to be applied **together with** the official
[Morphe Patches](https://github.com/MorpheApp/morphe-patches). This bundle only contains the patches that
are not part of Morphe Patches.

## Add this repository to Morphe

In Morphe, add a patch source with the URL:

`https://github.com/pomee4/morphe-patches`

Then patch the app with both Morphe Patches and pomee4 Patches selected.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v3.3.0](https://github.com/pomee4/morphe-patches/releases/tag/v3.3.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **2 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**MySpoti**](PATCHES.md#myspoti-appmyspotidev) | 1 | `2.3.0` | [`app.myspoti.dev`](https://play.google.com/store/apps/details?id=app.myspoti.dev) |
| 2 | [**Reddit**](PATCHES.md#reddit-comredditfrontpage) | 1 | `experimental 2026.46.0`, `experimental 2026.45.0`, `experimental 2026.44.0`, `2026.40.0` | [`com.reddit.frontpage`](https://play.google.com/store/apps/details?id=com.reddit.frontpage) |
<!-- PATCHES_END -->

### Reddit: Swipe actions

Swipe comments and posts left or right, like in Sync for Reddit. Each direction has a first and a second
action: a short swipe does the first, a longer swipe the second.

- **Comments:** upvote, downvote, reply, save, share, collapse, collapse thread, more options, open profile.
  Defaults: swipe left to upvote (downvote on a longer swipe), swipe right to collapse (reply).
- **Posts**, in every post list (home, popular, subreddits, custom feeds, profiles, saved posts, history):
  upvote, downvote, save, hide, share, open comments, more options, open profile, open subreddit.
  Defaults: swipe left to upvote (downvote), swipe right to save (hide). On posts with a gallery or a carousel, a swipe
  that starts on the gallery or carousel still pages it; a swipe that starts on the rest of the post swipes
  the post. Search results are not supported yet.
- Votes and Save toggle: swiping again undoes them. A hidden post can be brought back with Reddit's Undo.
- If the second action is **None**, any swipe distance does the first action. If both actions of a direction
  are **None**, that direction does not swipe. Swiping back past the start switches to the other direction.
- **Collapse** works like a tap on a comment: it collapses the comment and its replies, and swiping a
  collapsed comment expands it again. It also works on top-level comments.

**Settings:** in Reddit, open **Settings** and tap **Swipe actions** in the **General** section, under
**Morphe**. Comments and posts each have an on/off switch and their two directions. The settings row and
the settings style need the Morphe Patches for Reddit 2026.30.0 or newer, which every Reddit patch of Morphe
Patches applies.

Supported Reddit versions: the same as Morphe Patches (2026.40.0, 2026.44.0 - 2026.46.0).

## Build

```bash
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with the `read:packages` scope (`GITHUB_ACTOR` and `GITHUB_TOKEN`, or the
`gpr.user` and `gpr.key` Gradle properties), for the Morphe Gradle plugin. The bundle is written to
`patches/build/libs/patches-<version>.mpp`.

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE). The Comment swipe actions patch was first written in a
fork of Morphe Patches.
