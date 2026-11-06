# Anchor stability

Every anchor the patches depend on, why it was chosen, and what happens when it is gone. Run
`tools/dexprobe/run.sh VerifyAnchors "<apk>" [app]` against a new TikTok version before a release;
a non-zero exit means an anchor is missing. `app` defaults to `tiktok`, and each app has its own set
of checks inside the probe.

Support is narrowed to **47.7.1 and 47.7.2**. The per-feature dumps that used to sit beside this
file were retired with the older versions; the sections below carry the behaviour worth keeping, and
the code that implements each hook is the source of truth for its shape.

## The rules behind the choices

1. **Real-named model accessors survive obfuscation, class names do not.** The anchors therefore
   rest on accessors such as `FeedItemList#setItems` and `Aweme#getCreateTime`, not on the
   obfuscated storage and cell classes around them.
2. **Position never comes from ordering.** A hook is placed at the call it answers: the setter
   that receives the list, the `setText` that follows a time read, never at an index computed
   from a list.
3. **Structural anchors, not method names.** An obfuscated method is matched from its signature or
   the calls it makes (the `(Z)→Z` gate next to a `(Z)→V` setter, the `ClipData.newPlainText`
   call), never from its name.
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
| `VideoAuthorInfoRelationAssem` item renderer `(Aweme) -> V` | the item being rendered (the source of time and region) | three methods have the `(Aweme) -> V` shape; the one used is the only one that calls another `(Aweme) -> V` method on itself, while the others call a no-argument or an int-returning method | patch fails (the anchor has to be unique) |
| id `tv_post_time` (resource) | finding the time TextView | the resource name is readable; the header's other ids are obfuscated | nothing is written, and it is logged |
| `Aweme#getCreateTime()` | the source of the post time | real-named getter | the post time is not filled in when TikTok hides it |
| `BaseCommentCell` (comment list), the method that reads `Comment#getCreateTime` and then writes text | the comment's time view, where the region is written; the comment is fetched again through the getter that filled the `getCreateTime` receiver register | the method name is obfuscated (`S8` on 47.7.1) and it writes the time twice, in two branches, so the pairs of calls are the anchor. 47.7.1 reuses the comment register for an unrelated check before the write, so the register is not treated as live across the pair | patch fails (`Comment: … writes no text after a create time`) |
| `VideoItemParams#getAweme` / `.mAweme` | getting the item at bind | read by the extension through reflection, so it is checked by `VerifyAnchors` | region falls back |
| `Aweme#getAuthor` / `.author` | getting the item's author | same | region falls back |
| `Aweme#getRegion` / `.region` | the video's country code | same | shown without a country code |
| `User#getUniqueId` / `.uniqueId`, `User#getNickname` / `.nickname`, `User#getRegion` / `.region` | the region map keys and the displayed name | same | patch fails, or no country code |
| `AdPersonalizationActivity#onCreate/onBackPressed` | the host of the Tweaks screen | real-named activity | patch fails |
| `IFeedApi#fetchFeedList` (the class implementing it) | the feed filter's hook, at the page's return | structural: the one class implementing `com.ss.android.ugc.aweme.feed.cache.IFeedApi` whose single-parameter method returns the page and has a body. The names are real today (`feed.FeedApiService#fetchFeedList`) but are not the anchor | the patch fails (`expected one implementation …`) |
| `FeedItemList#setItems(List)` | the feed filter's second hook: every list stored as a page's items | real-named model accessor, and the method's write to the `items` field is checked too | the patch fails (`FeedItemList#setItems was not found`) |
| `FeedItemList#clone()` | the feed filter's third hook: the copy of a page, whose `items` is written directly | real-named model accessor; the one write to `items` that is not a setter call | the patch fails (`FeedItemList#clone was not found`) |
| the pager's item model, and the storage behind its list contract | the feed filter's fourth hook, where the items the feed renders are kept | structural: the class carrying `getItems`/`getListCount`/`insertItemList`/`setItems` that no other such class sits above, then the contract its `getItems` calls, then that contract's implementations — no obfuscated name is written down | the patch fails, naming the candidates it found |
| `Aweme#isAd`, `#isSoftAd`, `#isWithPromotionalMusic`, `#getAwemeRawAd` | what the ad filter drops | real-named flags and payload read by the extension through reflection, so checked here | that signal stops matching (the item is kept) |
| `Aweme#getStatistics` → `AwemeStatistics#getPlayCount` / `#getDiggCount` | the view and like ranges | real-named getters, same reading | that count stops filtering (the item is kept, never dropped wrongly) |
| `ACLCommonShare#getCode()` / `#getShowType()` / `#getTranscode()` | the app's download restriction and the watermark | real-named getters on the real-named model, two instructions each; the values are adapted from ReVanced's TikTok download patch | the download stays restricted and the file keeps its watermark |
| `Video#getDownloadAddr()` | the address the app saves, redirected to the highest quality playback variant | real-named getter on the real-named model | the file is fetched from the watermarked address |
| the profile-background gate holder, and its `(boolean) -> boolean` gate | the profile-background patch's hook, answered `true` | structural: the one class reading `profile_bg_in_allow_list` / `profile_bg_enable_consumption_group` that also carries a `(Z)→Z` method next to a `(Z)→V` setter. Class and method names are obfuscated and rename every build (`X.0O6G`/`LJFF` on 47.7.1, `X.0O6A`/`LJFF` on 47.7.2), so the shape is the anchor. 47.7.x also carries several unrelated no-arg boolean AB flags in the same class; only the gate is hooked | the patch fails (`expected one gate holder …`), or `VerifyAnchors` reports the shape missing |
| the custom-font factory holder, and the static nine-parameter resolver on it | the custom-font patch's hook: the one method every face TikTok draws with passes through | structural: the class that reads a bundled face (`font/TikTok-Display-Regular.otf` or `font/TikTok-Text-Regular.otf`) in its factory method **and** carries a static `(F, I, F, F, Float, F, I, Map, I) → Typeface`. The class renames every build (`X.06tX` on 47.7.1) and every other `Typeface` factory in the bundle takes fewer parameters, so the pair is unique | the patch fails, naming the classes it found; the app's own faces stay |
| the Compose font loader holder, and its instance `(Context, request) → Typeface` method | the custom-font patch's second hook: where Jetpack Compose reaches the app's own faces, so the Settings and privacy screen (built with Compose) is covered | structural: the class that reads a bundled face **and** carries a non-static two-parameter `Typeface` method whose first parameter is `android.content.Context`. The class renames every build (`X.06lt` on 47.7.1) and no other face-reading class takes that shape, so the pair is unique | the patch fails, naming the classes it found; every Compose surface keeps TikTok's own text |
| the asset loader holder, and its static `(AssetManager, String) → Typeface` method | the custom-font patch's third hook: where Lynx's own `TypefaceCache` reads a bundled face | structural: the one static `(AssetManager, String) → Typeface` whose body calls `Typeface.createFromAsset`. Class and method rename every build (`X.00kC#C4` on 47.7.1) and no other method takes that shape, so it is unique. The bridge answers only a `font/TikTok…` path, because the same method also loads sticker and editor fonts | the patch fails, naming the candidates it found; Lynx pages keep TikTok's own text |
| the WebView font interceptor holder, and its `shouldInterceptRequest(WebView, …) → WebResourceResponse` methods | the custom-font patch's fourth hook: where a hybrid (H5) page is served its font bytes (Activity Center, Manage posts, Creator Center) | structural: the class that reads a bundled `font/TikTok…` face **and** answers a `WebView` with a `WebResourceResponse`, both the deprecated `(WebView, String)` and the current `(WebView, WebResourceRequest)` overload. The class keeps its name (`FontLoadManager$init$1` on both checked builds), and the bridge answers only a font request (a font URL or content type) | the patch fails, naming the candidates it found; hybrid pages keep TikTok's own text |
| `com.bytedance.ies.foundation.activity.BaseActivity#onActivityResult(I, I, Intent)` | where the font picker's answer comes back | a ByteDance foundation class name plus the framework's own signature, so neither half moves; every activity result in the app passes through it | the patch fails (the fingerprint has to match), so no font can be imported |
| the comment-copy builder, and the plain clipboard helper | the copy-comment patch's two hooks: the static `(String, String, List) -> ClipData` builder the comment sheet's Copy flows through, and the `void (String, String, Context, Cert)` helper every other route calls | structural: the builder carries `"copy_label"` and builds with `ClipData.newPlainText`; the helper's signature is the framework's plus ByteDance's own cert type and it builds the same way. The menus that hand the helper a comment's text are found by `Comment#getText` + `Comment#getUser` beside that call, never by name. Class and method names rename every build (`X.18RD`/`X.1KSa` on 47.7.1, `X.1I0V`/`X.0kOI` on 47.7.2) | the patch fails, naming the candidates it found; the username stays in the copied text |
| `SecApiImpl#popCaptchaV2` / `#popCaptcha`, `LiveHostUser#popCaptchaV2` | the captcha patch's hooks: each entry point is guarded at its top, and the callback it was handed is told the puzzle is over | real-named ByteDance classes and method names that have not moved (`com.ss.android.ugc.aweme.sec.SecApiImpl`, `com.ss.android.ugc.aweme.live.livehostimpl.LiveHostUser`). The obfuscated callback type (parameter 3) is read off the match, and only the dismiss method name (`LIZJ` / `LIZIZ`) is written; the patch fails if the class declares no such method | the patch fails, naming the method or the callback; every puzzle stays |
| `com.tts.oecverify.BdTuring#showVerifyDialog` (both shapes) | the captcha patch's second surface: the Turing (oecverify) dialog the `sec` entry points never carry, and the one behind a puzzle that appears while they stay silent | real-named class and method (`com.tts.oecverify.BdTuring`), with the real-named `com.tts.oecverify.BdTuringCallback` as the last parameter and the `Activity` as the first, so the obfuscated middle parameter is never written down. The callback is told the SDK's own close answer (`onFail(3, null)`), read off the callback's dismiss method; the patch fails unless it finds exactly the two shapes | the patch fails, naming the shapes found; the Turing dialog keeps showing |

## Surfaces (where the stamp appears)

`User#getNickname()` has hundreds of call sites, so "which surface is this" cannot be inferred
from the caller list. What is used instead:

- **Feed** — a ThreadLocal marker set by the binder hook (`BindBridge.onBind`), with a stack-based
  fallback as in the first implementation.
- **Comments** and **DM tag** — recognised from the **class on the stack** while a name is rendered.
  That was chosen after the first hook failed: the comment name is read from a comment
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

## Region in comments (the time view)

A comment has a time view under its text, and that is where the region goes — the same arrangement
the feed uses for the post time: the view is already dimmed, it sits away from the name, and it does
not press against the verified badge or "Creator" label beside the name.

1. For the comment surface, `HandleDelegate` returns `@handle` alone — no region in the name.
2. The hook on the comment list's cell bind (`BaseCommentCell`, the method that reads
   `Comment#getCreateTime` and then writes text; its name is obfuscated, `S8` on 47.7.1) hands over
   the **comment** and the **time view** to `CommentDateBridge`. The comment is fetched again through
   the getter that produced the `getCreateTime` receiver, at the write site, instead of being kept in
   that register: 47.7.1 reuses the register for an unrelated check before the write, so treating it
   as live across the pair was an assumption that only held on older builds.
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

## Tweaks shortcut (the Home tab)

The long press is installed at runtime, not by a bytecode hook. The bottom bar is the view with id
`bottom_tab_container` (fallback `bottom_tab_layout`), accepted only when it sits in the lower half
of the screen; the first tab-sized clickable child is Home. Both id names are readable in 47.7.1 and
47.7.2. If a build strips them, a fallback takes the first tab-sized clickable view in the bottom
fifth of the screen; a bar drawn as one opaque view takes the press itself. The log names the view
that received it. There is no second entry: if nothing is found, the log line is the only evidence
that the shortcut needs another shape.

## Profile background: what the hook can and cannot do

The patch answers the client's AB gate. It cannot make the server accept a save from an account that
is not in the rollout: the background still has to arrive in the profile response, and the same
component draws it for your own page and everybody else's. The switch is off by default for that
reason: the pickers open, the save may go through, but other people only see the result when the
account is in the rollout.

## Feed filter

Four places, because a page's items are written, copied and re-stored before the feed shows them.

1. **The fetch's return**: `com.ss.android.ugc.aweme.feed.FeedApiService#fetchFeedList`.
   The chain is `FeedApiService#fetchFeedList → FeedApi#LIZIZ → FeedApi#LIZ`, and `LIZIZ` is what
   reads the page's `hasAd` and `preloadAds`, so the page seen here already carries the merged ads.
2. **`FeedItemList#setItems`** — every list stored as a page's items, filtered on entry.
3. **`FeedItemList#clone`** — the copy, filtered before it returns.
4. **The pager's list storage** — the list the feed renders from, of which the page's `items` is only
   a snapshot.

Hooks 1–3 did not hold on their own. The page model's `getData` sets a page's items three times: the parsed
list, the clone, then the model's own list — and the last overwrites everything the first two
removed. The items have to be stopped where they enter the model's storage.

That storage is reached without writing an obfuscated name down. The pager model is the class
carrying `getItems` / `getListCount` / `insertItemList` / `setItems` that no other such class sits
above; its `getItems` calls exactly one method, and that method's owner is the list contract; the
contract's implementations that take a list are the storage. Every void method there that takes a
`java.util.List` is hooked, because the storage is filled by
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
| `feed bind hook fired` | the feed binder hook was entered. **Uncapped**: one line per feed bind, so a long scroll writes a lot of it. It is there to tell "the hook never fired" from "the hook fired and matched nothing" |
| `download: N variant(s), best <gear> of [<gears>]` | one save: how many bitrate variants the video carried, which one was picked, and what the others were (max 8) |
| `download: no bitrate variants on the video` | nothing to choose from, so nothing was saved |
| `download: address lookup failed (<throwable>)` | the app's own download address could not be read, and the app's own path was left to run |
| `profilebg: gate forced on` | the AB gate was answered `true` while the switch said so (max 8) |
| `profilebg: gate lookup failed (<throwable>)` | reading the switch threw, so the gate was left exactly as the app decided it |
| `customfont: font served` | the factory answered with the imported face instead of the app's own (max 8) |
| `customfont: import succeeded` / `import failed` | the picker's file reached the bridge and was (or was not) copied into the app's own files. Only this request code is kept; every other activity result falls through untouched |
| `customfont: import handling failed (<throwable>)` | the import threw |
| `comment copy: ...` | one comment copy went through a hook: the sheet's name prefix was blanked, or the plain helper's string was replaced with the comment's own text (max 12) |
| `captcha: hiding ...` / `captcha: showing ...` | one risk-control puzzle: whether it was hidden, and which rule kept it otherwise (the switch is off, or it is account verification) (max 12) |

Reading order for "the region in comments is not what I expected": `name region` first (is the value
right, and where did it come from), then `name render` (which class drew it), then
`comment time region` (did the hook fire at all).
