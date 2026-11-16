# Feed filter

The `Feed filter` patch removes ads, promotional-music posts, survey cards, LIVE items, drama
videos, and videos outside a view/like range from the feed. It is a bytecode patch plus the
`extensions/tiktok/feedfilter` code.

Version scope: 47.7.1, 47.7.2 and 47.7.3.

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
callback drops that batch when the LIVE switch is on. The storage's direct-add wrapper is ads-only,
because that list is shared with the detail feed and a profile's own video list; refusing a LIVE
item there removes the video the user just opened. Profile, search and repost lists keep their LIVE
items because those surfaces only run the ad filter.

**Drama.** A video is drama when its `PaidContentInfo` carries a `miniDramaInfo` string, a
`miniDramaCardInfo`, a `paidContentMiniDramaInfo`, an `episodeNumber`, or the limited-free
short-drama flag. The filter runs in the feed's full filter (the fetch and the pager storage) and in
the panel insert callback. A card whose insert source contains `drama` is dropped at the panel
callback. Profile, search and repost lists keep drama items because they only run the ad filter; the
storage's direct-add wrapper is ads-only for the same reason as LIVE.

## Why the storage lists are wrapped

The ad SDK can add to the pager's live `ArrayList` directly, without calling a setter or an insert
callback. Each storage's `ArrayList` field, and the adapter model's list behind it, is replaced at
construction with `AdFreeList`: an `ArrayList` subclass whose `add`, `addAll` and `set` refuse an
item the ad filter recognises. Only ads are refused. The same storage and adapter model are rebuilt
for the detail feed and a profile's video list; refusing a LIVE or drama item there drops the video
that was just opened, which shows as a black screen or keeps the previous surface's video. The feed's
own hooks carry those filters. The field is found through the class hierarchy, because the actual
instance is often a subclass of the class that declares it.

The storage's `getList()` returns a copy, so it is never used to find the live field.

## Deep links and single items

A batch with one item is kept unless that item is an ad. Opening a shared video inserts a
single-item batch; removing it left the pager empty and the link could not open. A lone ad still
goes through the normal filter.

## Alternatives considered

The storage-list wrapper is not the only possible design. It is the one that survived the paths seen
on 47.7.x:

| Approach | Strength | Cost |
|---|---|---|
| Block at the ad service or request | One clean point | No stable anchor; the SDK has many paths and AB flags |
| Hook every insert callback | Not invasive | Many insert paths, and they change between builds; this is what let ads through |
| Filter where the list is read | Simple | The pager count shifts, so it runs to *No more results* while items remain |
| Hide the cell at bind time | Always looks gone | Leaves an empty page; the pager still counts the ad |
| **Hook inserts and wrap the live lists** | Catches a direct ad `add` too, including paths no callback sees | Reflection into obfuscated fields; slightly invasive; fields must be found through subclasses |

The wrapper is the last line, not the only line. The fetch, page-model and panel-insert hooks stay
because each build reaches the list by a different route.

The weak point is field discovery: if TikTok renames the storage or adapter-model class, the wrapper
may not install. The log makes that visible: `storage list not wrapped for …` means the guard was
not placed, while `storage list wrapped field=…` means it was.

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
