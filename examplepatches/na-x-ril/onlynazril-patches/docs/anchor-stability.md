# Anchor stability

Every anchor the patches depend on, why it was chosen, and what happens when it is gone. Run
`tools/dexprobe/run.sh VerifyAnchors "<apk>" [app]` against a new TikTok version before a release;
a non-zero exit means an anchor is missing. `app` defaults to `tiktok`, and each app has its own set
of checks inside the probe.

The full dump of the comment component — class, views, layout, ids — is in
[comment-cell-47.0.3.md](./comment-cell-47.0.3.md).

## The rules behind the choices

1. **Enum names survive obfuscation, class names do not.** The Settings anchors therefore rest on
   field names (`SECTION_HEADER`, `OPEN_DEBUG`), not on class names (`X.1THF`). Class names change
   every build; constant names do not.
2. **Position never comes from ordering.** Our row is placed immediately after the Support group's
   `SECTION_HEADER` — not at an index computed from a sorted list.
3. **Structural anchors, not method names.** An obfuscated method is matched from its signature or
   the calls it makes (the rows-sort helper, for instance), never from its name.
4. **Fail hard, never silently.** An unexpected anchor shape throws `PatchException`. A patch that
   "succeeds" without doing anything costs more than a patch that fails the build.
5. **Registers are never hardcoded.** Use `requireRegisters`/`requireLocals` with
   `getFreeRegisterProvider`/`findFreeRegister`.

## Anchors

| Anchor | Used for | Why it is stable | If it disappears |
|---|---|---|---|
| `User#getNickname()Ljava/lang/String;` | replacing the displayed name | real-named model, signature unchanged | `HandlePatch` fails (`PatchException`) |
| `User#getUniqueId()` | the source of `@handle` | same | same |
| `Aweme#getRegion()` | the source of the country code | same | same |
| `FeedBaseViewModel#paramSync2StateAccept` | entering the feed bind path | matched structurally: 2 params, the second a `VideoItemParams`, register count < 16 | patch fails |
| `com.ss.android.ugc.now.interaction.assem.Comment*`, `com.ss.android.ugc.aweme.comment*`, `com.ss.android.ugc.aweme.commentv2*` (class names) | the comment surface | recognised from the **class on the stack** while a name is rendered, so it does not depend on which obfuscated method calls the getter | the comment surface stops (checked by `VerifyAnchors`) |
| `AwemeHostApplication#onCreate` | the earliest Context for the extension | real-named, read from the manifest, framework `onCreate` | every switch other than the feed falls back to its default (the feature looks ON but does nothing) |
| `VideoAuthorInfoRelationAssem#onViewCreated(View)` | the header's root view, where `tv_post_time` is found | the method is a library API | feed time and region stop |
| `VideoAuthorInfoRelationAssem` item renderer `(Aweme) -> V` | the item being rendered (the source of time and region) | three methods have the `(Aweme) -> V` shape; the one used is the only one that calls another `(Aweme) -> V` method on itself (`ys` → `cs`; `ts` calls a no-argument method, `cs` calls one returning an int) | patch fails (the anchor has to be unique) |
| id `tv_post_time` (resource) | finding the time TextView | the resource name is readable; the header's other ids are obfuscated (`ao3`, `edj`, `wwa`) | nothing is written, and it is logged |
| `Aweme#getCreateTime()` | the source of the post time | real-named getter | the post time is not filled in when TikTok hides it |
| `BaseCommentCell` (comment list), the method that reads `Comment#getCreateTime` and then writes text | the comment's time view, where the region is written; the comment itself is read from the `getCreateTime` receiver register | the method name is obfuscated (`G8` on 47.0.3) and it writes the time twice, in two branches, so the pairs of calls are the anchor | patch fails (`Comment: … writes no text after a create time`) |
| `VideoItemParams#getAweme` / `.mAweme` | getting the item at bind | read by the extension through reflection, so it is checked by `VerifyAnchors` | region falls back |
| `Aweme#getAuthor` / `.author` | getting the item's author | same | region falls back |
| `Aweme#getRegion` / `.region` | the video's country code | same | shown without a country code |
| `User#getUniqueId` / `.uniqueId`, `User#getNickname` / `.nickname`, `User#getRegion` / `.region` | the region map keys and the displayed name | same | patch fails, or no country code |
| `SupportGroupVM#defaultState` | where the Settings rows are assembled | real-named view model | patch fails |
| `OpenDebugCellVM#defaultState` | the carrier cell's state | real-named view model | the icon branch is skipped (`methodOrNull`), the rest runs |
| `X.1THF {SECTION_HEADER, OPEN_DEBUG}` | the row's position and carrier | **field names**, not class names | patch fails |
| `SettingsComposeRvmpFragment` rows-sort | the order of the settings rows | structural: a `V` method that calls a `(Comparator, Iterable) -> List` helper | falls back to the `defaultState` branch |
| `AdPersonalizationActivity#onCreate/onBackPressed` | the host of the Tweaks screen | real-named activity | patch fails |
| the row's icon | the gear glyph | **no APK anchor**: the extension resolves a drawable by name (`cog`), falling back to `android.R.drawable.ic_menu_preferences` | falls back to the framework icon |
| `IFeedApi#fetchFeedList` (the class implementing it) | the feed filter's hook, at the page's return | structural: the one class implementing `com.ss.android.ugc.aweme.feed.cache.IFeedApi` whose single-parameter method returns the page and has a body. The names are real today (`feed.FeedApiService#fetchFeedList`) but are not the anchor | the patch fails (`expected one implementation …`) |
| `FeedItemList#setItems(List)` | the feed filter's second hook: every list stored as a page's items | real-named model accessor, and the method's write to the `items` field is checked too | the patch fails (`FeedItemList#setItems was not found`) |
| `FeedItemList#clone()` | the feed filter's third hook: the copy of a page, whose `items` is written directly | real-named model accessor; the one write to `items` that is not a setter call | the patch fails (`FeedItemList#clone was not found`) |
| the pager's item model, and the storage behind its list contract | the feed filter's fourth hook, where the items the feed renders are kept | structural: the class carrying `getItems`/`getListCount`/`insertItemList`/`setItems` that no other such class sits above, then the contract its `getItems` calls, then that contract's implementations — no obfuscated name is written down | the patch fails, naming the candidates it found |
| `Aweme#isAd`, `#isSoftAd`, `#isWithPromotionalMusic`, `#getAwemeRawAd` | what the ad filter drops | real-named flags and payload read by the extension through reflection, so checked here | that signal stops matching (the item is kept) |
| `Aweme#getStatistics` → `AwemeStatistics#getPlayCount` / `#getDiggCount` | the view and like ranges | real-named getters, same reading | that count stops filtering (the item is kept, never dropped wrongly) |

## Surfaces (where the stamp appears)

`User#getNickname()` has 762 call sites on 47.0.3, so "which surface is this" cannot be inferred
from the caller list. What is used instead:

- **Feed** — a ThreadLocal marker set by the binder hook (`BindBridge.onBind`), with a stack-based
  fallback as in the first implementation.
- **Comments** and **DM tag** — recognised from the **class on the stack** while a name is rendered.
  That was chosen after the first hook failed: on 47.0.3 the comment name is read from a comment
  cell, not from the author helper that was hooked, so its marker never fired. A class on the stack
  does not care which obfuscated method calls the getter, and being per-thread it cannot leak into
  the next render. The stack is only walked while the relevant surface toggle is ON, so the default
  configuration pays nothing for it.
- **Master switch** turns the whole feature off. Without the app being able to read its preferences,
  every switch other than the feed falls back to its default — which is why `Application#onCreate`
  is hooked to hand over a Context as early as possible.

Adding a surface means adding one class name and one row to the surface table.

## Region and post time (feed)

Both live in the header's **time TextView** (which is already dimmer than the name), because
`HandleDelegate` returns a `String` — text carried in the name cannot be partially coloured, so a
`· CC` inside the name's string always takes the name's colour. How it works:

- the hook on the header component's **view creation** stores its root view, and the time view's id
  (`tv_post_time`) is resolved once per process. On every item render the text is written **inside
  that renderer call, immediately before each `return-void`** — not through `post`: deferring to the
  next message gives a recycled view a window to be rebound underneath, which is what put one
  video's region and age into another video's header. At a return nothing reads the borrowed
  registers again, so it is safe. This is used because the component's own text setter (`rs`) is
  **never called** inside its class: the real write path is `setText` directly, and the time view is
  only reachable by id;
- the final text is `· [time][ · CC]`: the dot in front of the time is **forced** by us, because the
  header separates the name from the time with a margin rather than a dot. The time's own value
  stays TikTok's while it agrees with that item's `createTime`; `· CC` is only appended when the row
  does not already carry a country code;
- when the time toggle is ON, the text on screen is compared with `getCreateTime()` (seconds
  converted to milliseconds). While it agrees it is used as it stands — including TikTok's own
  wording. What disagrees is replaced by a value computed here, because the text can belong to the
  previous video: when the render runs, a recycled view still carries the old video's age, and it is
  shaped exactly like the right one. Only verified shapes can be judged — `now`,
  `Nm ago` / `Nh ago` / `Nd ago` ("ago" on every unit), and `MM-dd` past a week; anything else,
  another locale included, is left alone. When TikTok hides the time entirely, it is filled from
  `getCreateTime()` in the same shapes. TikTok's own wording **cannot be copied**: it exists neither
  as a string resource nor as a literal in the dex (checked with `aapt2 dump resources` and a string
  scan) — it arrives from their i18n packs;
- the base that was used is stored in the view's tag (an int key), so re-writing is idempotent and a
  recycled view is updated again when the item changes;
- the region and time values are read from **the item the item renderer was given** (`(Aweme) -> V`),
  not from "the component's current item". In the For You feed the component already holds the next,
  prefetched video, so reading the current item produces the neighbouring video's region and age —
  while search and DM (no such prefetching) looked correct. The "last seen" fallback was removed:
  guessing is worse than not writing.

Which class actually renders a comment name cannot be settled from the dex alone (the getter is
called from several classes, and parts of the chain are obfuscated). If no surface matches while a
surface toggle is ON, the extension writes the top 8 frames to the log (`tiktokHandle`, at most 8
times) — that is how the class is read off a device.

The region and post-time toggles are independent of the handle master switch and of the surface
switches. The DM tag has no view of its own to put a region in, so there it stays on the name, with
the longer chain described under **Fallback notes**. The order in that chain matters for a comment
opened from the For You feed: if the feed item's region came first, what shows would be the region
of the video behind the comment panel rather than the commenter's.

## Fallback notes

Region has two chains, because the feed and the other surfaces take it from different places.

**Feed (time view)** — `AuthorInfoBridge.regionOf`, two steps:

1. the item author's account region (`Aweme#getAuthor` then `User#getRegion`);
2. the item's own region (`Aweme#getRegion`), when the account carries none.

The value comes from the item the item renderer was handed, so the per-handle map is not needed
here.

**Everything else** — `HandleDelegate.regionOf`, two steps:

1. the author's account region (`User#getRegion`) — in comments this is the one that proved right;
2. the `handle -> region` map, filled at bind (`BindBridge.onBind(VideoItemParams)`) and by the
   `Aweme#getRegion` hook. **Its value is the account region**, the same thing step 1 returns, not
   the item's region: a video may carry a region of its own, and pinning that on the person's name is
   a different claim. The old ThreadLocal only worked when `Aweme.getRegion()` was called on the
   same thread as `User#getNickname()`, which is not the case in the feed, so the per-handle map
   replaced it.

A third step — "the region of the last feed item bound" — has been removed. It was not a fallback but
a guess: its value belongs to the video behind the comment panel, and on a device the result was
**every comment showing the same region**. Writing no region is better than writing a wrong one.

`Settings (Handle)` has two ways of being installed, and both are verified separately:

1. the main path — copy the already-sorted row list and move `OPEN_DEBUG` to the front;
2. the fallback — insert `OPEN_DEBUG` immediately after `SECTION_HEADER` in
   `SupportGroupVM#defaultState`.

When the main path cannot find its anchor, the patch uses path 2 without failing.

## Region in comments (the time view)

A comment has a time view under its text, and that is where the region goes — the same arrangement
the feed uses for the post time: the view is already dimmed, it sits away from the name, and it does
not press against the verified badge or "Creator" label beside the name.

1. For the comment surface, `HandleDelegate` returns `@handle` alone — no region in the name.
2. The hook on the comment list's cell bind (`BaseCommentCell`, the method that reads
   `Comment#getCreateTime` and then writes text; its name is obfuscated, `G8` on 47.0.3) hands over
   the **comment** and the **time view** to `CommentDateBridge`. The comment comes from the receiver
   register of the `getCreateTime` call, and the patch refuses to build if that register is written
   again between the read and the write.
3. The bridge computes the region from that comment (`Comment#getUser` → `User#getRegion`, then the
   per-handle map) and appends it to the time text: `28m ago · ID`.

Two earlier attempts failed in ways worth recording, because both were reasonable on paper:

- Hooking the `now.interaction` cell — that cell exists in this APK, but the comment list does not
  use it. The device log settled it: the name render's frames named the chain
  `BaseCommentCell#R5 <- BaseCommentCell#W6 <- CommentSecondaryItemCell#J8`.
- A bridge that looked for the name on screen (the `@handle · REGION` stamp in the same row) — the
  time is written **before** the name is, so what it looked for was not there yet. In the comment
  list's cell every view id is obfuscated as well (`epa`, `n76`, …), so there was nothing to look it
  up by either. Reading the region from the comment removes both dependencies.

## Feed filter

Four places, because a page's items are written, copied and re-stored before the feed shows them.

1. **The fetch's return** — `com.ss.android.ugc.aweme.feed.FeedApiService#fetchFeedList` on 47.0.3.
   The chain is `FeedApiService#fetchFeedList → FeedApi#LIZIZ → FeedApi#LIZ`, and `LIZIZ` is what
   reads the page's `hasAd` and `preloadAds`, so the page seen here already carries the merged ads.
2. **`FeedItemList#setItems`** — every list stored as a page's items, filtered on entry.
3. **`FeedItemList#clone`** — the copy, filtered before it returns.
4. **The pager's list storage** — the list the feed renders from, of which the page's `items` is only
   a snapshot.

Hooks 1–3 did not hold on their own. `X.07zq#getData` sets a page's items three times — the parsed
list, the clone, then the model's own list — and the last overwrites everything the first two
removed. The items have to be stopped where they enter the model's storage.

That storage is reached without writing an obfuscated name down. The pager model is the class
carrying `getItems` / `getListCount` / `insertItemList` / `setItems` that no other such class sits
above; its `getItems` calls exactly one method, and that method's owner is the list contract; the
contract's implementations that take a list are the storage. Every void method there that takes a
`java.util.List` is hooked — `setData`, `LJ`, `cw` on 47.0.3 — because the storage is filled by
additions and not by the setter alone (the setter carried 2 of 200 calls in a session).

**Filtering the read is wrong, and was tried.** Removing from the list `getItems` returns shrinks
what the pager counts, so its positions shift and it runs to *No more results* while items remain —
the loading spinner after every few scrolls is that, not TikTok's paging. A drop only belongs where
no position holds the item yet.

The hooks do not hand over the same shape, and the extension accepts both: the fetch and the copy
pass a page, the setter and the storage pass a bare list.

A further path is still open and only a device can close it: a page served from the preload task or
the `X.04MJ` static without any of those writes. The census line says which happened — `ads=0` with
`preload=` above zero means the ad came from a slot the page did not carry in `items`.

**Read the outcome off the screen, not the log.** The Tweaks screen's About section prints the build
marker and the filter's own tally, and tapping it copies the block (build, tally, log path) while
writing the same block to the log:

```
Build b7
Feed filter: 188 call(s), 123 dropped · items=6 removed=1 ads=0 likes[10000..MAX]=1 unreadCounts=1 preload=-1 dropped=[likes=17913]
Log: /sdcard/Android/data/com.zhiliaoapp.musically/files/tiktokhandle.log
```

A count filter carries its bound in the line, so a drop and the reason for it are read together:
`dropped=[likes=17913]` under `likes[10000..MAX]` says the item was *kept* by that bound, and under
`likes[50000..MAX]` says it was dropped by it. Without the bound the line records that something went
and not why — which is the one thing a report has to settle. `unreadCounts` is how many items had no
statistics at all; those are kept. If the tally says `no list seen this run` after scrolling, no hook
ran, which is a different fault from "it ran and matched nothing".

**The log spends its lines on actions, not on arrival order.** A line is written for every call that
dropped something (up to 100 a session), and only the first few calls that dropped nothing (6). A
budget spent in order instead goes on the cold start's two-item pages, which is exactly what left
123 drops unrecorded before this.

All three are gated in the extension, so a build with every switch off pays three calls per page.

What the predicates are, and which of them the app no longer has, is in the table above; the
`FeedApiProbe` run that produced that list is `tools/dexprobe/run.sh FeedApiProbe "<apk>"`.

A counter that cannot be read — an ad has no statistics, an item may not have its count yet — is
kept, never dropped: the range only ever hides a video whose count is known and outside it. The two
count filters have no switch of their own: the range *is* the switch, since a full `0..MAX` range
hides nothing and a stored flag beside it could only disagree with what the screen shows.

An ad is taken out on any of four signals — `isAd`, `isSoftAd`, `isWithPromotionalMusic`, or a
non-null `awemeRawAd` — because the app does not use one for every unit. The census line reports
each filter separately, so an ad that survives says which of two things happened: the page never
carried it (`ads=0`, look at `preload=` and the insert path), or it carried it and no signal held
(then a fifth signal is what is missing, not the hook).

## The trail on a device

Everything goes through `Debug.print` — three channels (`System.out`, `Log.w`, and a file), prefix
`TIKTOK_HANDLE`, so it can be grepped from logcat or from the log file. Each line type is capped so
one session cannot flood the log:

| line | meaning |
|---|---|
| `extension attached` | the extension is installed and the `Application#onCreate` hook fired |
| `surface miss: ...` | a name render matched no surface, with the top 8 frames (max 8) |
| `name render on <surface>: '<text>' via <frames>` | a name was stamped; 16 frames with method names, without the extension's own frames. A render goes through helpers, so the cell that drew it only appears a few frames down (max 8) |
| `name region: @x model=... -> ID (from account\|bound\|nothing)` | the region for a surface other than the feed, the model's raw value (`'ID'`, `null (declared, unset)`, or `absent (no getter or field)`), and **where** the answer came from (max 12) |
| `comment time region: ...` | the outcome of writing the region into a comment's time view: written, no comment, that commenter has no region, or the time text is empty (max 12) |
| `header item: author=... createTime=... base='...' -> '...'` | one feed header render: the item's values against what was drawn (max 12) |
| `feedfilter: items=N removed=R ads=A likes[M..MAX]=L … dropped=[…]` | one list: how many items it held, how many each filter removed (each count filter with the bound it enforced), how many had no readable statistics, how many ad slots the page carried, and the reason for the first few drops. Written for every call that dropped something (max 100) and the first few that did not (6) |
| `state: Build bN … Log: <path>` | the About block, written when it is tapped for copying |
| `file sink: <path>` | where the log file went, once per process |

Reading order for "the region in comments is not what I expected": `name region` first (is the value
right, and where did it come from), then `name render` (which class drew it), then
`comment time region` (did the hook fire at all).
