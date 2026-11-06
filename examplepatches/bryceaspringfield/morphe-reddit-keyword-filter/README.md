# Reddit Keyword Filter for Morphe

A Morphe patch bundle whose main patch, **Hide keyword content**, hides Reddit posts and comments by keyword,
community, account, flair, post type, score, and number of comments. It can also hide the Inbox tab, sidebar rows,
and the sidebar button's badge. Three more patches select together with it (see Other patches). Select the bundle
together with the official Morphe Patches source.

[Add this source to Morphe](https://morphe.software/add-source?github=bryceaspringfield/morphe-reddit-keyword-filter),
or add it by hand:

```text
https://github.com/bryceaspringfield/morphe-reddit-keyword-filter
```

## Use

1. In Morphe, keep the Morphe Patches source and add this one.
2. Patch Reddit with Morphe Patches' Reddit patches and **Hide keyword content** selected together.
3. In the patched app, open Settings > Morphe (in General, under Account settings). The filters are in the section
   Keyword filter, after Ads; the switches for the bottom bar and the sidebar join Morphe's own Navigation bar and
   Sidebar sections.

Settings apply as soon as they are saved. Every filter shows everything until it is set.

### Keyword filter

| Setting | Effect |
|---|---|
| Keywords to hide | Rules for every post, one a line (table below) |
| Keywords apply to | The fields keyword rules read: post title, post text, flair, poster, community, and link domain (title and text by default) |
| Show text-only, photo, video, repost (crosspost), and 18+ posts | A switch for each type: on shows the type beside the rest, off hides it (all on by default) |
| Show only these post types | The types to show alone, every other post hidden; with two types chosen, a post of either type is shown |
| Score (upvotes) | A lower bound, an upper bound, or both; posts outside the range are hidden |
| Number of comments | The same, for the number of comments |
| Hide communities by topic | A screen of checkboxes, one a built-in list (Zionism; Fascism, Nazism, and white supremacy; Incels), and your own list of communities to hide |
| Subreddit filters | Every subreddit with filters of its own, and Add a subreddit (below) |
| Profile filters | Every account with filters of its own, and Add a profile (below) |
| Where post filters apply | Home, Popular, News, community pages, search results, profiles, and other feeds (custom feeds and Latest) |
| Comment keywords to hide | Rules for comment text and authors (the same forms as for posts); replies under a hidden comment are hidden too |
| Comment score (upvotes) | A lower bound, an upper bound, or both |

| Rule | Hides posts |
|---|---|
| `r/name` | in the community `name` |
| `u/name` | by the account `name` |
| `flair:Meme` | with the flair Meme |
| `!flair:Meme` | without the flair Meme |
| `"phrase"` | containing the phrase as whole words |
| any other text | containing the text anywhere |

Rules ignore letter case. A rule typed with a subreddit or account and a colon in front (for example `r/pics: cat`
or `u/name, r/news: !flair:Politics`) moves to that subreddit's or profile's filters. A translated post is checked in
both its original language and the translation, including a translation shown after the feed loads.

### A subreddit's or profile's filters

Each subreddit or profile in Subreddit filters or Profile filters opens a screen of its own. Its filters apply to
the subreddit's posts, or the account's posts and comments, in every feed.

| Setting | Effect |
|---|---|
| Hide all posts from r/name (Hide all posts and comments by u/name) | Hides the subreddit or account whole |
| Keywords to hide, Comment keywords to hide | Rules for its posts and comments only |
| Show text-only, photo, video, repost, and 18+ posts; Show only these post types | The same switches as above, for its posts only |
| Flairs (subreddits) | Each flair seen in the subreddit, and Add a flair: Off hides posts with the flair, On shows them, and Only shows them and hides the subreddit's posts with no Only flair |
| Score (upvotes), Number of comments | Ranges for its posts only |
| Remove all filters | Deletes its filters and its row in the list |

### Navigation bar and Sidebar

| Setting | Section | Effect |
|---|---|---|
| Hide Inbox button | Navigation bar | Removes the Inbox tab from the bottom bar; Morphe offers a restart when you leave its settings |
| Hide Popular, News, Latest, Discover communities, Start a community, and Custom feeds | Sidebar | A switch for each sidebar row |
| Hide Recently Visited shelf | Sidebar | Only when Morphe Patches' own switch of that name is absent |
| Hide sidebar button badge | Sidebar | Hides the orange dot on the sidebar (menu) button; Morphe offers a restart when you leave its settings |

A section Morphe Patches leaves out (its patch not selected) is added with the same title.

## Other patches

Each patch below needs **Hide keyword content** selected too.

| Patch | Default | Effect |
|---|---|---|
| Fix search media taps | On | Opens the tapped post from a search's Media tab; after an account is blocked there, Reddit opens the post next to it |
| Morphe branding | Off | Adds switches in Settings > Morphe > Branding, off until turned on, for Morphe's logo in place of the Snoo and Morphe's loading animation in place of Reddit's; its patch option Morphe launcher icon (off by default) sets Reddit's default launcher icon to Morphe's |
| Say subreddits | Off | Renames communities to subreddits throughout Reddit's own text, in English and Spanish, and in this bundle's settings |

## Supported versions

The same Reddit versions as Morphe Patches: 2026.10.0, 2026.24.0, and 2026.40.0, with 2026.42.0, 2026.43.0, and
2026.44.0 experimental. Tested on 2026.44.0 with Morphe Patches 2.1.0-dev.7.

## License

GPLv3, from the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
