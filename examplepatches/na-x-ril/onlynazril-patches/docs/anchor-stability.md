# Anchor stability

Every anchor the patches depend on, why it was chosen, and what happens when it is gone. Run
`tools/dexprobe/run.sh VerifyAnchors "<apk>" [app]` against a new TikTok version before a release;
a non-zero exit means an anchor is missing. `app` defaults to `tiktok`, and each app has its own set
of checks inside the probe.

Support is narrowed to **47.7.1, 47.7.2 and 47.7.3**. The per-feature dumps that used to sit beside this
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
6. **Ask the patcher's indexes before walking the bundle.** A real-named class is a class-map
   lookup (`classDefBy`, or `definingClass` on a `Fingerprint`); a surviving string is a `strings`
   filter or `classDefByStrings` (the string index); a literal, type, call or field access is a
   `literal`/`newInstance`/`methodCall`/`fieldAccess` filter (the instruction index).
   `classDefForEach` is the last resort, for a shape no index can express (the pager's method-name
   set, the list contract's implementations). A `custom` block still visits every method the other
   fields leave, so declare the shape as a filter whenever it can be written as one.

## Anchors

| Anchor | Used for | Why it is stable | If it disappears |
|---|---|---|---|
| `User#getNickname()Ljava/lang/String;` | replacing the displayed name | real-named model, signature unchanged | `HandlePatch` fails (`PatchException`) |
| `User#getUniqueId()` | the source of `@handle` | same | same |
| `Aweme#getRegion()` | the source of the country code | same | same |
| `FeedBaseViewModel#paramSync2StateAccept` | entering the feed bind path | matched structurally: 2 params, the second a `VideoItemParams`, register count < 16 | patch fails |
| `com.ss.android.ugc.now.interaction.assem.Comment*`, `com.ss.android.ugc.aweme.comment*`, `com.ss.android.ugc.aweme.commentv2*` (class names) | the comment surface | recognised from the **class on the stack** while a name is rendered, so it does not depend on which obfuscated method calls the getter | the comment surface stops (checked by `VerifyAnchors`) |
| `AwemeHostApplication#onCreate` | the earliest Context for the extension, and the point where the refresh-rate lifecycle callback is installed | real-named, read from the manifest, framework `onCreate` | every switch other than the feed falls back to its default (the feature looks ON but does nothing), and the refresh-rate choice is not applied |
| `VideoAuthorInfoRelationAssem#onViewCreated(View)` | the header's root view, where `tv_post_time` is found | the method is a library API | feed time and region stop |
| `VideoAuthorInfoRelationAssem` item renderer `(Aweme) -> V` | the item being rendered (the source of time and region) | three methods have the `(Aweme) -> V` shape; the one used is the only one that calls another `(Aweme) -> V` method on itself, while the others call a no-argument or an int-returning method | patch fails (the anchor has to be unique) |
| id `tv_post_time` (resource) | finding the time TextView | the resource name is readable; the header's other ids are obfuscated | nothing is written, and it is logged |
| `Aweme#getCreateTime()` | the source of the post time | real-named getter | the post time is not filled in when TikTok hides it |
| `BaseCommentCell` (comment list), the method that reads `Comment#getCreateTime` and then writes text | the comment's time view, where the post time and the region are written; the comment is fetched again through the getter that filled the `getCreateTime` receiver register | the method name is obfuscated (`S8` on 47.7.1, `T8` on 47.7.3) and it writes the time twice, in two branches, so the pairs of calls are the anchor. 47.7.1 reuses the comment register for an unrelated check before the write, so the register is not treated as live across the pair | patch fails (`Comment: … writes no text after a create time`) |
| `VideoItemParams#getAweme` / `.mAweme` | getting the item at bind | read by the extension through reflection, so it is checked by `VerifyAnchors` | region falls back |
| `Aweme#getAuthor` / `.author` | getting the item's author | same | region falls back |
| `Aweme#getRegion` / `.region` | the video's country code | same | shown without a country code |
| `User#getUniqueId` / `.uniqueId`, `User#getNickname` / `.nickname`, `User#getRegion` / `.region` | the region map keys and the displayed name | same | patch fails, or no country code |
| `AdPersonalizationActivity#onCreate/onBackPressed` | the host of the Tweaks screen | real-named activity | patch fails |
| `IFeedApi#fetchFeedList` (the class implementing it) | the feed filter's hook, at the page's return | structural: the one class implementing `com.ss.android.ugc.aweme.feed.cache.IFeedApi` whose single-parameter method returns the page and has a body. The names are real today (`feed.FeedApiService#fetchFeedList`) but are not the anchor | the patch fails (`expected one implementation …`) |
| the pager's item model, and the storage behind its list contract | the feed filter's second hook, where the items the feed renders are kept | structural: the class carrying `getItems`/`getListCount`/`insertItemList`/`setItems` that no other such class sits above, then the contract its `getItems` calls, then that contract's implementations; no obfuscated name is written down. `FeedItemList#setItems`/`#clone` are also hooked, but with the **ad filter only**: that model is shared with the profile, search and repost lists, where a like-count range hides the profile owner's own posts | the patch fails, naming the candidates it found |
| the pause item manager, and its list-returning method | the pause-image-search switch: an empty list hides the image-search entry while a video is paused | structural: the one constructor that asks the real-named `com.ss.android.ugc.aweme.vision.IPhotoSearchService` for its pause item, plus the class's single method returning `java.util.List`. The obfuscated names move (`X.1QhK` on 47.7.2, `X.1NRr` on 47.7.1, `X.1PB2` on 47.7.3), but the service call and the list shape do not | the patch fails hard when the constructor or the list method is gone; the switch alone does nothing |
| the visual search tag trigger, and its `(VideoItemParams) -> boolean` gate | the `Find similar` / `Search this image` pill on a paused video; returning false keeps the tag out of the interact area | structural: the real-named `SearchVisualTagComponentTrigger` and the real-named `VideoItemParams` parameter; the method itself moves (`lq` on 47.7.2, `tq` on 47.7.1, `qq` on 47.7.3), so the signature is what is matched | the patch fails hard; the pill keeps showing |
| `PlayerController#onPlayProgressChange(String, long, long)` | resume playback's save hook: the tick that carries the position and duration | real-named feed controller and exact shape; the write to `lastPosition` and the read of `mCurrentAid` are checked too, so the empty single-float overload cannot match | the patch fails (`onPlayProgressChange … was not found`) |
| `PlayerController#onPausePlay(String)` and `#onPausePlay(String, event)` | resume playback's exact save hook: the playhead is read here, after the progress tick has fallen behind | real-named controller and both pause overloads (source id alone, and source id plus event); the event type (`X.0AIw` on 47.7.1, `X.0AIt` on 47.7.2, `X.0AIx` on 47.7.3) is obfuscated, so only the shape is matched. The event overload is hooked first because it runs before the legacy callback forward; `onPlayStop` is not the main save because its position has already fallen back to the older `lastPosition` | the patch fails (`the feed player's pause callback was not found`) |
| `PlayerController#onPreparePlay(String)` / `#onPreparePlay(String, event)` | resume playback's open boundary: reset the per-open flags before the first progress tick | real-named method; the one-string and event overloads share the source-id first parameter, and the event type is obfuscated | the patch fails (`onPreparePlay … was not found`) |
| `PlayerController#onSeekStart(String, int, float)`, `#onSeekEnd(String, boolean)`, `#onRenderSeekComplete(String, boolean)` | resume playback's user-seek path, including a seek while paused and a seek to zero | exact real-named signatures; no obfuscated class is named | the patch fails (`onSeekStart` / `onSeekEnd` not found) |
| `PlayerController#onPlayCompleted(String)` / `(String, int)` and `#onLoopPlay(String, int)` | resume playback's end/loop clears, so a finished or restarted video leaves no point | exact real-named signatures; both completion overloads are kept because one is a compatibility forward | the patch fails (`onPlayCompleted` / `onLoopPlay` not found) |
| `PlayerController#onPlayRelease(String)` and `#onStopPlay(String)` | resume playback's final save when no pause callback arrives | exact real-named signatures; the position is read before it is reset | the patch fails (`no release or stop callback was found`) |
| `PlayerController#onPlayFailed(...)`, `#onRetryOnError(...)`, `#onResolutionSwitchComplete(...)` | resume playback's recovery markers: a temporary zero must not erase a real point | the source-id first parameter and the arity are matched; the error/event/reason types are obfuscated and never written down | the marker is not set; a recovery zero can clear the point |
| `PlayerController#onRenderFirstFrame(String, event)` and `#onRenderFirstFrameFromResume(String)` | resume playback's apply hook: the saved position is sought to on the item's first frame and after a background resume | real-named controller and method; the obfuscated event type (`X.0BKd` on 47.7.1, `X.0BKZ` on 47.7.2, `X.0BKb` on 47.7.3) is never written down, only the real-named source-id parameter and the two-parameter shape | the patch fails (`onRenderFirstFrame … was not found`); the resume callback is optional |
| `Aweme#isAd`, `#isSoftAd`, `#isWithPromotionalMusic`, `#getAwemeRawAd` | what the ad filter drops | real-named flags and payload read by the extension through reflection, so checked here | that signal stops matching (the item is kept) |
| `Aweme#getStatistics` → `AwemeStatistics#getPlayCount` / `#getDiggCount` | the view and like ranges | real-named getters, same reading | that count stops filtering (the item is kept, never dropped wrongly) |
| `ACLCommonShare#getCode()` / `#getShowType()` / `#getTranscode()` | the app's download restriction and the watermark | real-named getters on the real-named model, two instructions each; the values are adapted from ReVanced's TikTok download patch | the download stays restricted and the file keeps its watermark |
| `Video#getDownloadAddr()` | the address the app saves, redirected to the highest quality playback variant | real-named getter on the real-named model | the file is fetched from the watermarked address |
| the profile-background gate holder, and its `(boolean) -> boolean` gate | the profile-background patch's hook, answered `true` | structural: the one class reading `profile_bg_in_allow_list` / `profile_bg_enable_consumption_group` that also carries a `(Z)→Z` method next to a `(Z)→V` setter. Class and method names are obfuscated and rename every build (`X.0O6G`/`LJFF` on 47.7.1, `X.0O6A`/`LJFF` on 47.7.2, `X.0O68`/`LJFF` on 47.7.3), so the shape is the anchor. 47.7.x also carries several unrelated no-arg boolean AB flags in the same class; only the gate is hooked | the patch fails (`expected one gate holder …`), or `VerifyAnchors` reports the shape missing |
| the custom-font factory holder, and the static nine-parameter resolver on it | the custom-font patch's hook: the one method every face TikTok draws with passes through | structural: the class that reads a bundled face (`font/TikTok-Display-Regular.otf` or `font/TikTok-Text-Regular.otf`) in its factory method **and** carries a static `(F, I, F, F, Float, F, I, Map, I) → Typeface`. The class renames every build (`X.06tX` on 47.7.1, `X.06tY` on 47.7.3) and every other `Typeface` factory in the bundle takes fewer parameters, so the pair is unique | the patch fails, naming the classes it found; the app's own faces stay |
| the Compose font loader holder, and its instance `(Context, request) → Typeface` method | the custom-font patch's second hook: where Jetpack Compose reaches the app's own faces, so the Settings and privacy screen (built with Compose) is covered | structural: the class that reads a bundled face **and** carries a non-static two-parameter `Typeface` method whose first parameter is `android.content.Context`. The class renames every build (`X.06lt` on 47.7.1, `X.06lu` on 47.7.3) and no other face-reading class takes that shape, so the pair is unique | the patch fails, naming the classes it found; every Compose surface keeps TikTok's own text |
| the asset loader holder, and its static `(AssetManager, String) → Typeface` method | the custom-font patch's third hook: where Lynx's own `TypefaceCache` reads a bundled face | structural: the one static `(AssetManager, String) → Typeface` whose body calls `Typeface.createFromAsset`. Class and method rename every build (`X.00kC#C4` on 47.7.1, `X.00kD#x4` on 47.7.3) and no other method takes that shape, so it is unique. The bridge answers only a `font/TikTok…` path, because the same method also loads sticker and editor fonts | the patch fails, naming the candidates it found; Lynx pages keep TikTok's own text |
| the WebView font interceptor holder, and its `shouldInterceptRequest(WebView, …) → WebResourceResponse` methods | the custom-font patch's fourth hook: where a hybrid (H5) page is served its font bytes (Activity Center, Manage posts, Creator Center) | structural: the class that reads a bundled `font/TikTok…` face **and** answers a `WebView` with a `WebResourceResponse`, both the deprecated `(WebView, String)` and the current `(WebView, WebResourceRequest)` overload. The class keeps its name (`FontLoadManager$init$1` on both checked builds), and the bridge answers only a font request (a font URL or content type) | the patch fails, naming the candidates it found; hybrid pages keep TikTok's own text |
| `com.bytedance.ies.foundation.activity.BaseActivity#onActivityResult(I, I, Intent)` | where the font picker's answer comes back | a ByteDance foundation class name plus the framework's own signature, so neither half moves; every activity result in the app passes through it | the patch fails (the fingerprint has to match), so no font can be imported |
| the comment-copy builder, and the plain clipboard helper | the copy-comment patch's two hooks: the static `(String, String, List) -> ClipData` builder the comment sheet's Copy flows through, and the `void (String, String, Context, Cert)` helper every other route calls | structural: the builder carries `"copy_label"` and builds with `ClipData.newPlainText`; the helper's signature is the framework's plus ByteDance's own cert type and it builds the same way. The menus that hand the helper a comment's text are found by `Comment#getText` + `Comment#getUser` beside that call, never by name. Class and method names rename every build (`X.18RD`/`X.1KSa` on 47.7.1, `X.1I0V`/`X.0kOI` on 47.7.2, `X.0sNn`/`X.1NDC` on 47.7.3) | the patch fails, naming the candidates it found; the username stays in the copied text |
| `SecApiImpl#popCaptchaV2` / `#popCaptcha`, `LiveHostUser#popCaptchaV2` | the captcha patch's hooks: each entry point is guarded at its top, and the callback it was handed is told the puzzle is over | real-named ByteDance classes and method names that have not moved (`com.ss.android.ugc.aweme.sec.SecApiImpl`, `com.ss.android.ugc.aweme.live.livehostimpl.LiveHostUser`). The obfuscated callback type (parameter 3) is read off the match, and only the dismiss method name (`LIZJ` / `LIZIZ`) is written; the patch fails if the class declares no such method | the patch fails, naming the method or the callback; every puzzle stays |
| `com.tts.oecverify.BdTuring#showVerifyDialog` (both shapes) | the captcha patch's second surface: the Turing (oecverify) dialog the `sec` entry points never carry, and the one behind a puzzle that appears while they stay silent | real-named class and method (`com.tts.oecverify.BdTuring`), with the real-named `com.tts.oecverify.BdTuringCallback` as the last parameter and the `Activity` as the first, so the obfuscated middle parameter is never written down. The callback is told the SDK's own close answer (`onFail(3, null)`), read off the callback's dismiss method; the patch fails unless it finds exactly the two shapes | the patch fails, naming the shapes found; the Turing dialog keeps showing |
| `BaseActivity#onResume` and `#onPause` | the keep-screen patch's two hooks: set the window flag while a screen is in front, clear it when it leaves | real-named lifecycle overrides on the real-named ByteDance base (`com.bytedance.ies.foundation.activity.BaseActivity`), instance methods with no parameters and `V`; the activity is `p0`, so no register is assumed | the patch fails (the fingerprint has to match); the screen follows the system timeout |

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
- when the time toggle is ON, the time is computed from `getCreateTime()` (seconds converted to
  milliseconds) rather than read off the view, so a recycled view cannot carry the previous video's
  age: `now` / `Nm ago` / `Nh ago` / `Nd ago` / `Nw ago` in English, `baru saja` / `N mnt lalu` /
  `N j lalu` / `N h lalu` / `N mgg lalu` in Indonesian, CLDR for every other language on API 24+,
  and the platform's own aging text on API 23. Under a minute reads `now` / `baru saja` rather than
  a seconds count, and the relative ladder ends at 28 days, where the date takes over. When TikTok
  hides the time entirely it is filled the same way. TikTok's own wording **cannot be copied**: it
  exists neither as a string resource nor as a literal in the dex (checked with `aapt2 dump
  resources` and a string scan), it arrives from their i18n packs;
- the date format is one of `Auto`, `yyyy-MM-dd`, `dd/MM/yyyy` and `Custom`. The saved ids are not
  the list order, and every id the list no longer carries reads back as `Auto`. `Auto` asks the
  locale for its own month-and-day skeleton and adds the year once the post is from another year.
  `Custom` uses the pattern typed in the row below it: accepted only when it formats a real date
  (not empty, at most 40 characters, a day or time field outside quotes, no illegal pattern
  letter), and a missing or invalid pattern falls back to `Auto` so a render never throws. The
  pattern row is only shown while `Custom` is the chosen format. Comments use the same path from
  `Comment.getCreateTime`, so a comment carries the chosen format too;
- `Hour in dates` appends the locale's short time (`9 Nov 2025, 14.32`) to the date on a post's
  header and on a comment, once the relative ladder has handed over to the date. On by default,
  under the post-time switch;
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

## Time and region in comments (the time view)

A comment has a time view under its text, and that is where the time and the region go, the same
arrangement the feed uses for the post time: the view is already dimmed, it sits away from the name,
and it does not press against the verified badge or "Creator" label beside the name.

1. For the comment surface, `HandleDelegate` returns `@handle` alone — no region in the name.
2. The hook on the comment list's cell bind (`BaseCommentCell`, the method that reads
   `Comment#getCreateTime` and then writes text; its name is obfuscated, `S8` on 47.7.1, `T8` on
   47.7.3) hands over the **comment** and the **time view** to `CommentDateBridge`. The comment is
   fetched again through the getter that produced the `getCreateTime` receiver, at the write site,
   instead of being kept in that register: 47.7.1 reuses the register for an unrelated check before
   the write, so treating it as live across the pair was an assumption that only held on older
   builds.
3. With the post-time switch on, the bridge dates the comment from `Comment.getCreateTime` through
   the same `StampText` path as the feed: compact age, weeks, then the chosen date format. With
   `Hour in dates` on, the date also carries the locale's short time. With the post-time switch
   off, TikTok's own text is left in place: the two switches are asked separately.
4. When the region is on, the bridge computes it from that comment (`Comment#getUser` →
   `User#getRegion`, then the per-handle map) and appends it to the time text: `28m ago · ID`.
5. The view is drawn one step (`1sp`) larger than TikTok laid it out, so the time, the clock and
   the region stay readable at comment-row size. The original size is kept on the view and restored
   when the bridge writes nothing, and a recycled cell is never enlarged twice.

## Reply handles

A reply line (`@name > @name`) draws two names. The first is the commenter, a full user with a uid.
The second is a stand-in the app builds for the person being replied to: it has no uid, and its
`uniqueId` reads back as the nickname, so the render alone proves nothing.

The comment does. `replyToUserId` names the account, and `replyToReplyCommentId` (the
`replyToReplyId` field) names the parent comment. `CommentDateBridge` records both at the cell bind
and `HandleDelegate` resolves the stand-in by that uid. There is no `nickname -> uid` join any more.

The parent comment is the second source. Every bound comment records its `cid` against its author's
uid, nickname and handle, so a reply whose parent is in the list is checked three ways:

1. the parent's uid must equal `replyToUserId`;
2. the parent's nickname must equal the name on the reply line;
3. a handle the parent carries must agree with the one learned for the uid.

Any disagreement suppresses the stamp. A parent that was never bound adds no evidence, and the uid
mapping alone still answers. The rule stays the same: no proven handle, no stamp.

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
of the screen; the first tab-sized clickable child is Home. Both id names are readable in 47.7.1 through
47.7.3. If a build strips them, a fallback takes the first tab-sized clickable view in the bottom
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

See [feed-filter.md](feed-filter.md) for the full behaviour and the list-wrapper design.

Six hooks, scoped by what each list is allowed to remove.

1. **The fetch's return**: `com.ss.android.ugc.aweme.feed.FeedApiService#fetchFeedList`.
   The chain is `FeedApiService#fetchFeedList → FeedApi#LIZIZ → FeedApi#LIZ`, and `LIZIZ` is what
   reads the page's `hasAd` and `preloadAds`. The hook also clears `preloadAds` before the page is
   returned, so a slot the page carries on the side cannot be merged in during a later scroll.
2. **`FeedItemList#setItems`**: the generic page model, shared with profile/search/repost. Only the
   **ad filter** runs here; a count, LIVE or drama filter would hide the profile owner's own posts.
3. **`FeedItemList#clone`**: the same ad-only filter for the copy.
4. **The feed panel's insert callback** (`yX2` on 47.7.1, `xX2` on 47.7.2, `zX2` on 47.7.3): the detail feed's
   `DataLayerAbility` inserts an ad with a bare list here. Ads, survey cards, LIVE cards and drama
   cards are selected by the batch's source string.
5. **The direct survey insert** on the same panel: a `(int, Aweme)` method whose body carries the
   literal `"survey_card"`. It does not pass through the callback above; the hook returns early
   when the survey switch is on. The name is obfuscated, the literal and shape are the anchor.
6. **The pager's list storage**: the list the feed renders from, full filter. Its own `ArrayList`
   field is also replaced at construction with an `AdFreeList`, so a direct `add` from the ad SDK is
   refused even when no insert callback runs. The wrapper is **ads-only**: the same storage and
   adapter model are rebuilt for the detail feed and a profile's video list, where refusing the
   opened LIVE or drama item leaves a black screen or the previous surface's video. The storage's
   `getList` returns a copy, so the field is found by its declared `ArrayList` type, never through
   that getter.

The fetch hook alone did not hold. The page model's `getData` sets a page's items three times: the
parsed list, the clone, then the model's own list, and the last overwrites everything the fetch
removed. The items have to be stopped where they enter the model's storage.

That storage is reached without writing an obfuscated name down. The pager model is the class
carrying `getItems` / `getListCount` / `insertItemList` / `setItems` that no other such class sits
above; its `getItems` calls exactly one method, and that method's owner is the list contract; the
contract's implementations that take a list are the storage. Every void method there that takes a
`java.util.List` is hooked, because the storage is filled by
additions and not by the setter alone (the setter carried 2 of 200 calls in a session).

`FeedItemList#setItems` and `#clone` are generic to every `AwemeList`, so they run the ad filter
only. The profile/search/repost lists must never take a like/view range; the feed's own hooks carry
those.

**Filtering the read is wrong, and was tried.** Removing from the list `getItems` returns shrinks
what the pager counts, so its positions shift and it runs to *No more results* while items remain —
the loading spinner after every few scrolls is that, not TikTok's paging. A drop only belongs where
no position holds the item yet.

A single-item batch is never filtered unless that item is an ad. That batch is the deep-link or
current video being inserted; removing it leaves the surface with nothing to open. A lone ad still
goes.

The census line says what happened: `ads=0` with `preload=` above zero means the ad came from a slot
the page did not carry in `items`; `preload=N cleared` means it was removed before the merge.

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
| `comment time: ...` | the outcome of writing a comment's time view: the written text, or no comment, no region, switches off (max 12) |
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
`comment time` (did the hook fire at all).
