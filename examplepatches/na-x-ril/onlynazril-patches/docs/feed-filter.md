# Feed filter

The `Feed filter` patch removes ads, promotional-music posts, survey cards, LIVE items, drama
videos, and videos outside a view/like range from the feed. It is a bytecode patch plus the
`extensions/tiktok/feedfilter` code.

Version scope: 47.9.1, 47.9.2, 47.9.3, 48.0.1 and 48.0.2.

## What is filtered where

Two filter sets run, because the lists are not all the feed:

| Surface | Filter | Why |
|---|---|---|
| Feed API return | ads + LIVE + drama + views + likes | the main feed |
| Feed pager storage | ads + LIVE + drama + views + likes | the list the feed renders from |
| `FeedItemList#setItems` / `#clone` | ads only | shared with profile, search and repost lists; a count, LIVE or drama filter there would hide the profile owner's own posts |
| Feed panel insert callback | ads, survey cards, LIVE cards, drama cards | the batch's source names the card; the item filter handles ads, LIVE and drama videos |

The generic model being ads-only is the fix for "my own posts are missing from my profile". The
feed's own hooks still apply the view/like and LIVE filters.

## Survey, LIVE and drama

Each is a separate switch in Tweaks, off by default. They are independent: turning one on does not
change the others.

**Survey cards.** Two paths exist on the same panel. The direct insert builds a `singletonList` and
uses the literal `"survey_card"` as its source; the panel callback sees the same source. The patch
drops the batch at the callback when the source contains `survey`, and makes the direct method
return early when `FeedFilterSettings.isSurveyEnabled()` is true.

**LIVE.** The item filter asks the app's own `AwemeSaaSExtKt.isLive(Aweme)`, resolved once by
reflection. It runs in the feed's full filter (the fetch and the pager storage) and in the panel
insert callback. The LIVE entry card is inserted with a source beginning `live_card`; the panel
callback drops that batch when the LIVE switch is on. Profile, search and repost lists keep their
LIVE items because those surfaces only run the ad filter.

**Drama.** A video is drama when its `PaidContentInfo` carries a `miniDramaInfo` string, a
`miniDramaCardInfo`, a `paidContentMiniDramaInfo`, an `episodeNumber`, or the limited-free
short-drama flag. The filter runs in the feed's full filter (the fetch and the pager storage) and in
the panel insert callback. A card whose insert source contains `drama` is dropped at the panel
callback. Profile, search and repost lists keep drama items because they only run the ad filter.

## What is filtered after the page

Only ads, and only through the adapter's own list. An ad can be added straight into the list's
`ArrayList`, without a fetch, a setter or an insert callback: the profile feed does exactly that
(`@shopeepay_id` rendered with no page or setter line before it). The list field is replaced at
construction with `AdFreeList`, which refuses **ads only** and logs `list refused ad@…` with six
frames.

Nothing else is filtered after it enters a list. Earlier builds wrapped the same lists with the full
filter and hooked every storage method; that edited the list the pager counts and produced three
regressions:

- refusing the item restored at launch emptied the feed, which the app draws as its own error view;
- holding that item instead showed a filtered video at launch;
- refusing a link's video left nothing to open, so a URL did nothing.

The rules that replaced it:

- the **page** runs the full filter, at the home presenter's own entry, one-item pages included;
- `FeedItemList#setItems` and `#clone` run the ad filter for the lists shared with
  profile/search/repost;
- the adapter's list refuses **ads only**; the panel's insert callback and survey hook handle cards.

## The launch page

The video at launch is the **first page of a normal request**: it arrives through
`X.06v7#handleMsg -> X.07CC#handleData -> LJJI` about a second after start, as a one-item
`FeedItemList`. The page-level filter used to exempt any single-item batch, because that is the
shape of a deep link, so this page was never filtered.

The full filter runs at the **home presenter's own page entry**, `(FeedItemList) -> void` on the
class that carries the pager model (`getItems`, `getListCount`, `insertItemList`, `setItems`). It
has to be that class and not the shared base: hooking the base filtered every presenter in the app,
and the log showed another screen (`X.0OKB`) losing every item of every page to the drama filter.
A one-item page is filtered like any other, so the launch item can be dropped before it reaches a
list. If that leaves the page empty the app moves on to its next page. The fetch is the
right place because it is before any list: nothing has to be refused, held or dropped from a pager.

Two attempts were made to remove the page instead of the item, and neither is in the build:

- **`Skip the cached first video`** answered null from `FeedCachePreloadTask.LIZ(int, boolean)`. The
  log showed the method is never called on 47.9.3 (`launch preload fetch seen` zero times, file and
  logcat), so the switch did nothing and was removed.
- **Dropping the page at the presenter** (`LJJI`) left the app in its first-load error state; it
  re-requested every few seconds and never recovered.

## Deep links and single items

A single item inserted into a list is the video the user opened: a shared link, a profile tap, an
inserted card. It is refused only when it is an ad. The range, LIVE and drama filters apply to
**pages**, and a page is a different shape from an insert, so a link to a filtered video still opens
while the feed itself stays filtered.

## Alternatives considered

| Approach | Strength | Cost |
|---|---|---|
| Block at the ad service or request | One clean point | No stable anchor; the SDK has many paths and AB flags |
| Hook every insert callback | Not invasive | Many insert paths, and they change between builds |
| Filter where the list is read | Simple | The pager count shifts, so it runs to *No more results* while items remain |
| Wrap the live lists with the **full** filter | Catches a direct ad `add` too | Edits the list the pager counts: the launch error, the launch leak and the dead links. Removed |
| Wrap the adapter's list with **ads only** | Catches the profile ad that arrives with no page or setter above it | None seen: ads never affect whether a video opens, so a refusal cannot break a surface |
| **Filter the pages, never a live list** | No list is edited; the launch page is filtered at the fetch | A page that filters to nothing is left empty; the app moves on to its next page |

The ads-only wrapper stays, with a reason: 33 refusals in one session, all profile ads that had no
page or setter line above them.

## Verifying on a device

```bash
adb logcat -d | grep 'feedfilter:'
```

Useful lines:

```
feedfilter: storage list wrapped field=09gj.LIZ size=0
feedfilter: storage refused ad@mastercard
feedfilter: generic-set ... ads=1 dropped=[ad@shopee_id]
feedfilter: store ... likes[2000..MAX]=1 dropped=[likes=343@user]
feedfilter: insert source=survey_card items=1 kept=0 dropped=survey
```

`09gf` / `09gj` are obfuscated and change per build; the line shape does not.

If an ad is still visible and no `storage refused` or `insert … ads=1` line appears for it, it is
rendered from a separate ad pager, not the feed's item lists. That needs a new hook at that pager,
not another list filter.
