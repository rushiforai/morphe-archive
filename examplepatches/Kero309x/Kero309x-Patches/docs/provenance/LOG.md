# Provenance log

Every derived fact about a target application is recorded here, together with how
it was obtained. The point is that a reviewer can retrace the work without
assuming anything was carried over from another project.

## Environment record

| Date | Item | Value |
|---|---|---|
| 2026-11-04 | Stock build used | `com.anghami` 8.0.28, version code 8000280 |
| 2026-11-04 | Build container | APKM bundle, universal variant, seven DEX files in the base APK |
| 2026-11-04 | Minimum SDK declared by the build | 23 |
| 2026-11-04 | Signing certificate subject | `O=Anghami, C=LB` |
| 2026-11-04 | Signing certificate SHA-256 | `5e5d1b3609403e1db445d142ef36433a2ad2008030281d437d9e632c01c45659` |
| 2026-11-10 | Stock build used | `com.emeint.android.myservices` 2026.11.1, version code 1246 |
| 2026-11-10 | Build container | APKM bundle, eighteen entries, 23 DEX files in the base APK, no native libraries in the base APK |
| 2026-11-10 | Minimum SDK declared by the build | 24 |
| 2026-11-10 | Signing certificate subject | `CN=EME International, O=EMEINT, L=Cairo, ST=El Maadi, C=20` |
| 2026-11-10 | Signing certificate SHA-256 | `7671c18d28517819385163cccb7c76e4ce4a083d05866403fac5ba0547b95485` |

## Derivation records

| Date | Behaviour | Consulted | Derived | Verified |
|---|---|---|---|---|
| 2026-11-04 | platform metadata | stock APKM `info.json` and `META-INF/BNDLTOOL.RSA` | package name, version name, version code, minimum SDK, signing certificate digest | certificate digest recomputed from the DER certificate |
| 2026-11-10 | platform metadata, Ana Vodafone | stock APKM `info.json`, `aapt dump badging`, `apksigner verify --print-certs` | package name, version name, version code, minimum SDK, signing certificate digest, 23 DEX files, no native libraries in the base APK | certificate digest reported for the v2/v3 scheme by `apksigner` |

> The certificate digest above was read from the v1 JAR signature of the base
> APK. Before release it must be confirmed against the v2/v3 signing block with
> `apksigner verify --print-certs`, so that the value enforced at install time is
> the one recorded here.

## Behaviour derivations

### How the application models a subscription ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â mapped 2026-11-04

Every behaviour in this bundle that depends on whether the user pays reaches that
answer through the same small class, so the map is recorded once here and referred
to from the individual specs.

| Fact | Value |
|---|---|
| Account state object | `Lcom/anghami/ghost/local/Account;`, a single instance field, handed out by `getAccountInstance()` |
| The decision that matters | `isPlusUser()Z` on that instance ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â true when the stored plan type is `PLUS`, or `FREE_TRIAL`, or when `isGoldUser()` is true |
| The static shorthand | `Account.isPlus()Z` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â wraps `isPlusUser()` of the current instance through a compiler-generated callback object |
| Gold tier | `isGoldUser()Z` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â stored plan type equals `GOLD`; `Account.isGold()Z` is its static wrapper |
| Persistence | the instance is read from an on-disk account file and written back by one write helper, so the stored plan type is a local copy of what the server sent |
| Instance hand-out | `getAccountInstance()Z` is a plain singleton getter: it returns one static field and has no caching layer of its own |
| Attribute helpers | `getAccountAttribute` and `getBooleanAttribute` resolve that one instance and then call the supplied callback; neither caches a result |
| Clones | `Account$AccountReference` and `Account.clone()` copy the instance, so an answer patched on the instance also applies to a reference

**Why this matters for patch design:** changing `isPlusUser()` changes every
decision built on it at once, and there are dozens of call sites across playback,
downloads, lyrics, settings and the player. That is powerful and it is broad: a
single change would silently turn the entitlement, the badge and the lyrics gate
into one behaviour, which is exactly what this bundle avoids. The shared class is
therefore treated as a place to *read* state from, not as a shortcut to rewrite.

### `anghami.system.rating-prompt` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the libraries bundled in the build and noticed the Play in-app review
   library is present.
2. Searched, across the whole application, for code that references that
   library. Two synthetic classes matched.
3. One of them logs the tag `AppRater`, which led to the package the
   application uses for rating.
4. Enumerated that package and inspected its members.

**Derived facts:**

| Fact | Value |
|---|---|
| Rating controller | `Lcom/anghami/ghost/rating/AppRater;`, a singleton |
| Decision predicate | `getShouldShowDialog()Z` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â true only when online, past a reset window, past a minimum time since first launch, past a minimum launch count, not already rated for this version, and past a minimum event count |
| Call sites of the predicate | exactly one outside the class: the rating-event handler in the main activity |
| Store-presence gate | `Lcom/anghami/util/c;->g(Landroidx/fragment/app/n;)Z`, true when the store package is installed |
| Two presentation paths | a custom dialog when the store is absent, the Play in-app review sheet when it is present |

**Decision:** change the predicate, not the dialog and not the review call. One
change then covers both presentation paths, and the dialog code and the review
library stay untouched. This also avoids depending on the two synthetic classes,
which are compiler-generated and unstable.

**Verification run:** 2026-11-04, `verifyPatches` against the stock base APK.
Result: the fingerprint matched exactly one method (`validate = true` enforces
that a fingerprint matches at most one method), and the patch applied with no
exception.

### `anghami.playback.track-skips` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Read the fields of the account type that describe skipping: a skip allowance,
   a skip counter, the timestamp the counter was last reset, a minimum play time
   before a skip counts, and a separate radio allowance.
2. Searched every reference to the skip allowance across the whole application,
   then for the predicate that consumes it. One queue method was found.
3. Followed that predicate's callers: the private skip-recording method of the
   queue, the public no-argument wrapper of that method, and a list adapter that
   decorates song rows.
4. Read the branches each caller takes when the predicate is false.

**Derived facts:**

| Fact | Value |
|---|---|
| The gate | `Lcom/anghami/odin/playqueue/PlayQueue;.isSkipLogicEnabled(Lcom/anghami/ghost/local/Account;)Z` |
| Stock body | true when the queue's own "skip limit disabled" flag is false, the account is not a subscriber, and the skip allowance is positive |
| Effect of a false answer in the queue | the recording method takes its early "no restriction" branch: no counter increment, no limit message, the skip is accepted |
| Effect of a false answer in the UI | the adapter treats the row as unrestricted, so the remaining-skip hint is not added |
| Separate gate | the queue also has a no-argument `checkAndRecordSkipToSong()Z` that consults the same predicate, so the same answer covers it |
| Radio queue | the radio queue has no copy of this predicate; it reuses the same method through the base class |

**Decision:** answer the queue predicate, not the entitlement and not the account's
skip allowance field. The empty-queue and "not the current queue" protections live
outside this predicate and keep working, and the entitlement stays available to
the download and lyrics patches, which are separate behaviours.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.media.lyrics-access` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched the whole application for the account's lyrics members. The only
   instance predicate is `lyricsEnabled()Z`; there is also a write-through
   preference helper that clears a *local* lyrics mode, which is unrelated to
   entitlement.
2. Enumerated the callers of the predicate. Only one is a gate: the static entry
   point of the lyrics screen.
3. Read the entry point around the call: when the predicate is false it reports a
   failed-attempt analytics event and asks the host screen to open the
   subscription page; when it is true it continues to start the lyrics activity.

**Derived facts:**

| Fact | Value |
|---|---|
| The gate | `Lcom/anghami/ghost/local/Account;.lyricsEnabled()Z` |
| Stock body | subscriber, or the server-provided free-lyrics flag is set |
| Gate site | `Lcom/anghami/app/lyrics/LyricsActivity$a;.a(...)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â one read, one branch |
| Paywall action | `showSubscribeActivity("lyrics")` on the host screen |
| Unrelated member with a similar name | `PreferenceHelper.clearLyricsEnabled()`, which only resets a locally remembered mode at sign-out |

**Decision:** answer the account predicate, not the entitlement. The entitlement is
shared with downloads and skips, so changing it would implement three behaviours
at once. Replacing the first instruction of the predicate also removes the failed
attempt branch at the entry point, because that branch is only reached when the
answer is false.

**Verification run:** 2026-11-04, `verifyPatches` against the stock base APK. For
both patches above, the fingerprint matched exactly one method and the patch
applied with no exception.

### `anghami.privacy.analytics` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Located the class the application reports through and listed every method on it
   whose body reaches a third-party SDK, by scanning each method for class
   references to the Amplitude, Adjust, Branch, Firebase and Facebook packages.
2. Checked which of those methods return a value, and whether any caller reads it.
3. Followed the bootstrap: which SDKs it starts, who calls it, and what the rest of
   the app reads from the fields it fills.
4. Enumerated the callers of the one non-void method the rest of the app uses, and
   read what it does when the SDK object was never created.

**Derived facts:**

| Fact | Value |
|---|---|
| Facade | `Lcom/anghami/ghost/analytics/Analytics;` |
| Bootstrap | `init(String, boolean, FacebookAppEventLogger)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â posts one runnable to the IO pool |
| What the runnable starts | Firebase Analytics, Amplitude, Adjust (with its app secret), Branch, and the Facebook logger if provided |
| Caller of the bootstrap | `Lcom/anghami/AnghamiApplication;` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â one call, result ignored |
| Latch safety | the `CountDownLatch` used to wait for Branch is awaited only inside that same runnable, so nothing else waits for a start that never happens |
| Firebase field safety | the analytics field is null-checked immediately before its only read |
| Event sinks (void) | `postEvent` ÃƒÆ’Ã¢â‚¬â€4, `postGoogleAnalyticsEvent`, `postBranchEvent`, `logBranchPurchaseEvent`, `postAdjustEvent` ÃƒÆ’Ã¢â‚¬â€2, `postOpenLinkAdjustEvent` |
| Event builders | dozens of `postÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦Event` helpers, all of which end in one of the sinks above |
| Value-returning methods, deliberately untouched | `AmplitudeExperiment.getMinArtistNumberForOnBoarding(int)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â falls back to its argument when the client is null, one caller outside the package; `shouldSendEventAndRecordTimeStamp(String, long)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â a local rate limiter that sends nothing |
| Experiment bootstrap | `AmplitudeExperiment.init(String)`, called only from the facade's bootstrap |
| Crash reporting | travels through the same facade as an ordinary event; no Firebase Crashlytics entry point is called by app code |

**Decision:** silence the bootstrap and, independently, every void sink. Silencing
only the bootstrap would still leave a sink reachable if a future build moved the
bootstrap; silencing only the sinks would leave the SDKs running and uploading
whatever they collect themselves. The value-returning methods stay as they are,
because silencing them would change a decision ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â which artists to show ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â rather
than stop a report.

**Open limitation:** BugSnag is present in the build as a library with an internal
hook, but no app code calls it, so there is nothing in the app to silence for it.
The patch does not attempt to disable a library that the app does not drive.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.ads.sponsored-content` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Listed every field whose name contains "sponsored" and every method that reads
   one, across the whole application.
2. Separated the model that carries the flag from the views that draw it, and read
   each view.
3. Checked whether anything filters on the flag, or reacts to it on a click, before
   deciding that removing the marker is the whole of the client behaviour.

**Derived facts:**

| Fact | Value |
|---|---|
| The flag | `Lcom/anghami/ghost/pojo/Song;->isSponsored:Z`, serialised from the JSON key `sponsored` |
| How it is populated | reflective JSON mapping ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â there is no assignment to the field anywhere in the bytecode, and no mapper calls the protobuf getter either |
| Readers | `SongCardModel._bind(SquareViewHolder)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â passed to the shared badge helper; `SongRowModel._bind(RowViewHolder)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â caption visibility; `SongWideModel._bind(WideViewHolder)` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â caption visibility |
| Non-readers | no click handler, no filter, no sort, no playback decision |
| Section flag | `Section;->sponsored:Z` is copied from the response and written to a parcel, but no view reads it |
| In-car sponsor | `PreferenceHelper.getACRSponsoredImage()/getACRSponsoredText()`, read once by `com.anghami.acr.ACRActivity`; an empty value is its documented "nothing to show" state |

**Decision:** replace the four reads that draw a marker with a constant false, and
answer the two in-car getters with an empty string. Editing assignments was not an
option: the flag arrives through a reflective mapper, so the bytecode has no store
to change. Removing the songs is not attempted, because the client never does that
itself and pretending otherwise would describe a behaviour the patch cannot keep.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.ads.promotional-popups` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-04

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Found the two classes whose stock source names are the promotion surfaces: the
   popup ad component and the ad popup handler.
2. Read the one method on each that starts a draw, and confirmed both take the
   server-provided ad model rather than a generic UI model.
3. Enumerated every caller of both methods, to be sure that patching them does not
   suppress anything that is not an ad.
4. Checked what reads the handler's visibility query, to be sure nothing waits for
   a dialog to be dismissed.

**Derived facts:**

| Fact | Value |
|---|---|
| Popup window surface | `Lcom/anghami/ui/popupwindow/x;`, source `PopupAdShower.kt`, created once in `AnghamiApplication` |
| Popup start method | `x.i(Lcom/anghami/ui/popupwindow/a;)V`, called from the main screen and from two base-screen helpers |
| Full-screen surface | `Lp4/d;`, source `AdsPopupHandler.java`, one instance per main screen |
| Flyer start method | `p4.d.a(Lcom/anghami/odin/ads/e;)V`, called on an ad event and on resume |
| Visibility query | `p4.d.b()Z` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â reads the dialog, returns false when there is none; no caller waits on it |
| Non-ad users of the popup component | none: its only model parameter is the popup ad model |

**Decision:** answer both start methods immediately. They are the only two places
that put a promotion on top of the user, and neither is shared with a non-ad
surface. The ad pipeline itself is untouched, so the patch cannot leave the client
in a state where an ad is half-built.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.ads.audio-ads` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-05

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Located the playback core by tracing which class constructs the audio ad
   player, then listed every method in that class whose name mentions ads.
2. Read the branch that runs when a track ends, and separated "is an ad allowed
   here" from "play the ad that was chosen".
3. Confirmed the ad is only ever started from that branch, by listing every
   caller of the start method, and confirmed the second caller is the
   back-to-back step that runs after an ad has already started.

**Derived facts:**

| Fact | Value |
|---|---|
| Playback core | `Lcom/anghami/odin/core/S;`, source `OdinPlayer.java` |
| Ad decision | `S.L0()Z` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â the single "does an ad belong after this track" answer |
| What it reads | the queue's `getDisableAds()`, the server's `AdSettings.getNoAd(currentSong)`, `adFrequency` or `adVideoFrequency` depending on video mode, and the player's own offline flag |
| Where it is used | once when a track ends, and once when the reported item duration is calculated |
| Start method | `S.w1(Lcom/anghami/odin/ads/A;)V` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â the only place an ad is handed to a player |
| Callers of the start method | the track-end branch, gated by `L0()`; and `S.b1()`, the back-to-back step, which only runs while an ad is already playing |
| Ad pipeline | separate from the decision: loaders and players are built regardless, so skipping the decision leaves no partial state |

**Decision:** answer `L0()` with false. The stock code already has a branch for
"no ad here" ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â it is the branch taken when the server sends no ad, when the queue
disables ads or when the song is exempt ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â and it advances the queue normally.
Returning false therefore reuses existing behaviour instead of suppressing a call
and hoping the caller recovers. The ad pipeline is left intact on purpose: it
still fetches and caches its models, and a player handed an ad from elsewhere
would still work.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.playback.forced-shuffle` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-05

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Started from the player, not from the list: read how a queue is obtained when a
   list is started, and found that the presenter asks one private predicate
   before it decides what kind of queue to build.
2. Listed every caller of that predicate across all seven DEX files. There are
   exactly two, both in the same presenter: the page play button and the
   play-one-song action.
3. Read both branches. The true branch builds a radio queue; the false branch
   builds a queue over the list it was given. Followed the radio path into the
   queue constructors to see where the queue's own play mode comes from.
4. Checked whether the server marks anything else that would make the false
   branch behave like the true one, by looking at how a section's play mode is
   consumed when a queue is filled.

**Derived facts:**

| Fact | Value |
|---|---|
| The predicate | `Lcom/anghami/app/base/list_fragment/c;->shouldPlayRadio(Lcom/anghami/ghost/pojo/Song;Lcom/anghami/ghost/pojo/section/Section;)Z` |
| Callers | two, both in `c`: the page play button path and `getPlayQueueFromSection` |
| Stock inputs | `Account.isPlus()Z`; the first song's `playMode`; the section's `playMode` |
| Stock answer | for non-Plus: true when either play mode is `shuffle`; for Plus: true only when the section's play mode is `shuffle` |
| True branch | `buildRadioQueue(...)`, which builds a `Radio` of type `SONGLIST` over the joined song ids and a queue whose play mode is `shuffle` |
| False branch | `buildRelatedPlayQueue(...)` when the page allows it, otherwise a plain queue over the same list, starting at the chosen song |
| Why shuffle cannot be turned off | the queue is a radio whose own play mode is `shuffle`; the player's toggle does not describe the list the user opened |
| Effect of a plain queue | the section play mode `shuffle` is not mapped onto the queue flag; only `infinite` is, so the queue is genuinely in list order |

**Decision:** inject a guard at the start of the predicate that answers false for
accounts without an active plan and otherwise falls through to the untouched
stock body. The Plus case is preserved deliberately: for Plus accounts the same
play mode marks content that is meant to be a radio, and removing it would take
away a feature rather than a restriction. The patch also does not touch the
queue's shuffle control, so the user keeps a working toggle over the plain queue.

**Known limitation:** the false branch does not expand the list into a radio, so a
free account hears the songs the list contains and not the extra recommendations
the radio queue would have fetched. This is the client-side part of the change.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.interface.shuffle-badges` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-05

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Located the model field whose name describes shuffle state, then listed every
   write and every read of it across all seven DEX files.
2. Confirmed the field is filled in reflectively: the only writes are a copy
   constructor, a remote-update copy and a parcel write, so there is no mapper
   assignment to rewrite and the value has to be handled at the read sites.
3. Grouped the reads by the method that contains them, and read each method. Three
   groups draw something: a subtitle leading drawable on card layouts, an image
   span inside row subtitle text, and a dedicated badge view in headers and one
   carousel layout.
4. Checked the remaining reads to make sure they are not drawing decisions:
   persistence, remote update, diff flags, section flattening and objectbox
   cursors all only carry or compare the value.

**Derived facts:**

| Fact | Value |
|---|---|
| The flag | `Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z` |
| How it is populated | reflective JSON mapping; no assignment in the bytecode |
| Card surfaces | `AlbumCardModel`, `PlaylistCardModel` and `LinkCardModel`, each in `getSubtitleStartingDrawable()`, returning the shuffle glyph resource or `-1` |
| Row surfaces | `AlbumRowModel` and `PlaylistRowModel` in `getSubtitleText()`, and both `LinkModel.setSubtitleView` overloads, which prepend an image span |
| Dedicated badge views | `LinkNewCardModel._bind(HeaderLinkHolder)` and `StoreCarouselSubModel._bind(StoreSubViewHolder)`, both toggling a view's visibility |
| Header predicate | `getHasShuffleBadge()Z` declared on `BaseHeaderModel` and overridden by `AlbumHeaderModel` and `PlaylistHeaderModel` |
| Non-visual reads left alone | `PossiblyGenericModel.updateFromRemote`, `writeToParcel`, `BaseModel.fillChangeFlags`, `t4.f` and `P5.h` section flattening, `StoredPlaylist.updateMetadataFromRemote`, objectbox cursors |

**Decision:** replace only the drawing reads with a constant false, and answer the
three header predicates with false. The field keeps its value, so persistence,
diffing and queue building are untouched. Every read site that produces a badge
was enumerated, so the patch asserts that at least one read exists in each method
it edits and fails loudly if the layout changes.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.system.screenshots` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched the application packages for the numeric window flag that blocks
   capture, rather than for a method name. The only place that adds it to a window
   is one method on the shared activity base, and the other hits are unrelated
   bits with the same value.
2. Read that method. It asks a single boolean, applies the flag when the answer is
   true, and clears it when the answer is false; the flag is stored on the window
   itself, not on the activity.
3. Listed every declaration of that boolean across all seven DEX files. There are
   four: the base, which answers false, and three overrides, which answer true.
4. Checked that no other code path adds the flag, so the four declarations are the
   whole of the behaviour.

**Derived facts:**

| Fact | Value |
|---|---|
| The question | `shouldUseSecureMode()Z` |
| Base declaration | `Lcom/anghami/app/base/o;`, answers false |
| Overrides that answer true | `com/anghami/app/main/MainActivity`, `com/anghami/app/stories/live_radio/LiveRadioFullscreenVideoActivity`, `com/anghami/player/video/VideoPlayerActivity` |
| The consequence | `refreshSecureMode()V` on the same base adds `0x2000` (`FLAG_SECURE`) to the window when the answer is true, and clears it otherwise |
| Extra condition on the flag | the flag is applied only while a playback service object exists and reports a state the base treats as requiring protection; the clear path runs regardless |
| Other users of `0x2000` in the app packages | none for window flags; the remaining hits are text and system-UI flags |

**Decision:** answer false on all four declarations. The three overrides are the
real change; the base is included so the patch does not depend on the base
happening to answer false in this build. The method that applies the flag is left
alone so an already-marked window is still cleared.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.interface.premium-buttons` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Listed the account's boolean answers whose names mention karaoke, then read
   each one. Three describe the feature itself; one is a server-sent attribute
   that only says whether to advertise it.
2. Listed every reader of that attribute across the application. There are two.
3. Read both. One sets the visibility of a view in the full player screen, guarded
   by the track's own karaoke marker; the other passes the answer as a flag into a
   row holder in the player's queue list.
4. Checked that no other surface reads the track's karaoke marker in the player,
   model or UI packages, and searched for a separately advertised remix button.
   There is none in this build.

**Derived facts:**

| Fact | Value |
|---|---|
| The answer | `Lcom/anghami/ghost/local/Account;->isShowKaraokeUpsellButton()Z` |
| What it reads | a boolean attribute sent with the account, not a computed plan check |
| Reader one | `com/anghami/player/ui/l`, which shows a view when the track's `hasKaraoke` is true and this answer is true |
| Reader two | `y8/a`, the player's queue adapter, which passes the answer into `F8/X` when it creates a row holder |
| Feature answers left alone | `isShowKaraoke()Z` and `isCanUseKaraoke()Z` |
| Remix teaser | none in the player or queue of this build |

**Decision:** answer false on the getter. Both surfaces already have a path for
"do not draw the button", and neither needs its layout touched. The feature
answers stay as they are, so an account that legitimately has karaoke keeps its
entry point and only loses the advertisement.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.entitlement.profile-badge` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Listed the view holder fields whose names mention a badge, which produced one
   dedicated view on the profile header and a boolean on the settings row model.
2. Read the header bind around that view. It has three branches: gold profile,
   plus profile, hidden. The gold and plus answers both come from the profile
   object, not from the account.
3. Read the start of the same bind and found it already computes whether the
   profile belongs to the signed-in account, then discards that answer before the
   badge branch.
4. Traced the settings row model back to its producer: a coroutine that copies the
   account's plus answer into the row, which a second class then turns into the
   row list.

**Derived facts:**

| Fact | Value |
|---|---|
| Header badge view | `UserHeaderViewHolder.plusBadge`, drawn by `UserHeaderModel._bind` |
| Gold branch | `GoldUtilsKt.isGold(profile)` shows the gold drawable `0x7f0803e0` |
| Plus branch | `Profile;->isPlus:Z` shows the plus drawable `0x7f0805d4` |
| Ownership check already present | `Account.isMe(profile.id)` at the start of the same bind |
| Settings row producer | `com/anghami/app/settings/view/ui/mainsettings/q` copies `Account.isPlusUser()` into the row model at two construction sites |
| Settings row consumer | `com/anghami/app/settings/view/ui/mainsettings/r` copies that boolean into `SettingsRow$UserInfo` |

**Decision:** replace the single plus read in the header with the ownership check
that the method already computed, and answer true at the two row-model
construction sites. The account's own answer and the profile's flag are not
rewritten, so this stays cosmetic. The gold branch is above the changed read and
keeps working.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.entitlement.plus` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Read the account's plus answer end to end and found it is a derivation over
   the stored plan type: plus plan, free trial, or gold.
2. Confirmed the cached static wrapper delegates to it by reading the wrapper and
   its callable.
3. Counted the readers of both forms across all seven DEX files. They are spread
   over the download manager, the player, play queues, lyrics, settings, lists and
   the remote-control screens, which is why the derivation is the only practical
   place to answer.
4. Checked what else reads the plan type directly. Apart from the tier answers
   themselves, those readers only display it or write it back to the account.

**Derived facts:**

| Fact | Value |
|---|---|
| The derivation | `Lcom/anghami/ghost/local/Account;->isPlusUser()Z` |
| Its inputs | `planType` equals the plus plan, equals the free-trial plan, or `isGoldUser()` |
| Static wrapper | `Account.isPlus()Z`, which calls the instance answer through `Account$4` |
| Readers | 83 call sites of the instance and static forms across all seven DEX files |
| Direct plan-type readers outside the tier answers | account display, diagnostics, protobuf fill and account persistence |
| Gold answer | a separate derivation over the same plan type, left untouched |
| Player restriction flag | `Account.enablePlayerRestrictions()Z`, a server flag; one reader |
| Player restriction upsell flag | `W7.a.f()Z`, the `upsellOnPlayerRestrictions` server flag, read before seek, repeat and play-more |

**Decision:** answer the derivation with a constant true. Changing the stored plan
type instead would make the account screen claim a plan the server never sent and
would leak into persistence; changing the static wrapper alone would miss the
instance callers. The gold derivation and the plan type stay as they are.

The audit that followed found two more answers a subscriber never trips, both
server-flag driven and neither consult the plan: the restricted-player flag and
the upsell-on-restriction flag. Answering them false is what a subscriber's own
payload does, so they are answered here rather than in a separate behaviour. The
first is read only by the restriction helper, and the second is read before the
seek, repeat and play-more paths, where a true answer replaces the action with a
subscription prompt.

**Known limitations:** a server-gated feature still fails, and the account screen
still shows the stored plan. Both are recorded in the spec.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
behaviour has not been observed on a device, because no test device is available.

### `anghami.store.gold-upsell` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â re-derived 2026-11-06 (first derivation 2026-11-04)

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched every DEX for the Gold plan comparison and found two account-level
   declarations: one static answer and one instance answer.
2. Followed the render-side helpers and found three overloads that compare a
   profile, ranked user or story author with the same plan value.
3. Read the readers of all five answers. Two conclusions came out of that read:
   both account answers are already false for a free account, and the render-side
   helpers drive badges and a click target, not an advertisement.
4. Searched the section payload for a Gold promotion and found one optional field
   on `Section`, read in exactly one class.
5. Read that class end to end: it branches on the field once to decide whether the
   call-to-action container is shown, and reads it again to label the button.

**Derived facts:**

| Fact | Value |
|---|---|
| Account, static | `Account.isGold()Z`, delegates through `Account$5` to the instance answer |
| Account, instance | `Account.isGoldUser()Z`, compares `planType` with `PLAN_TYPE_GOLD` |
| Render-side helpers | `GoldUtilsKt.isGold(Profile)`, `isGold(RankedUser)`, `isGold(Story$User)` |
| Render-side effect | badge decoration (`A7/H.c`) and, for a non-Gold viewer, a click target on a Gold user's header |
| Gold promotion | `Section.goldCTA`, read only by `TitleModel._bind(TitleModel$TitleViewHolder)` |
| Promotion effect | container visibility and button text; the branch takes the hidden path when the field is null |
| Gold sheet construction | one site, in `com/anghami/app/base/j.executeAnghamiDeepLink`, reached from the `subscribesheet` deep link |
| Raw plan field | unchanged; also read by account refresh, authentication and issue reporting |

**Decision:** hide the promotion at its only read, by writing null into the
register the following branch tests. The first derivation answered the five tier
predicates false; that was wrong for this behaviour. It changed nothing for a free
account (the answers were already false) and it removed other users' Gold badges,
which state something true about those users and are decoration, not advertising.
The account answers, the render-side helpers and the stored plan type are all left
as they are.

**Known limitations:** server-side Gold checks still fail, Gold destinations are
not removed from the payload, and two badge-driven entry points remain: tapping a
Gold badge, and tapping the header of a Gold user while the viewer is not Gold.
Closing them would mean deleting the badge or the title they are attached to.
Recorded in the spec.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
edit was confirmed in the decompiled output. The behaviour has not been observed
on a device, because no test device is available.

**Verification run:** all 16 registered patches applied in one run; the Gold
answers are among the 36 modified classes written to the patched APK.
`Hide Gold upsell` reported PASS.

### `anghami.store.upgrade-banners` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Started from the preference getters that drive the navigation entry and the
   restricted-queue prompt, then enumerated their readers across every DEX.
2. Followed the header promo bar to its only binding method and its two callers.
3. Traced the feed cells back to the two model classes that bind server buttons
   and links, and to the list assembler that filters models before the adapter.
4. Traced the settings rows to the cached payload getters and confirmed both row
   builders null-check them.
5. Traced the library promo button to the configuration getter and confirmed its
   consumer null-checks the answer.
6. Followed the downloads-screen notice cells to the account flag all four read
   before building their text, and confirmed no other screen reads it.

**Derived facts:**

| Fact | Value |
|---|---|
| Navigation flag | `PreferenceHelper.getPlusTab()Z`; read by `o.1`, `MainActivity` and its cached static |
| Restricted-queue flag | `PreferenceHelper.getHasRestrictedQueue()Z`; read by the list fragment, `P6/o` and `q6/h` |
| Downloads notice flag | `Account.showPlusNotice()Z`; read by four downloads-screen cells and nothing else |
| Header bar | `com/anghami/ui/bar/HeaderBar.setData(BlueBarItem)`; callers `B5/d0` and `MainActivity$a` |
| Button cell | `ButtonModel._bind(ButtonViewHolder)`; carries `APIButton.deeplink` |
| Link cell | `LinkModel._bind(LinkViewHolder)`; carries `Link.deeplink` |
| Settings upgrade row | `PreferenceHelper.getUpgradeModel()`, read and null-checked by `subscriptions/d` |
| Settings question row | `PreferenceHelper.getSettingsQuestion()`, read and null-checked by `mainsettings/r` |
| Library promo button | `LibraryConfiguration.getButton()`, read by `S5/n`, null-checked by `S5/o` |
| Feed filter | `list_fragment/e.shouldInclude(ConfigurableModel, String)`, sole caller `filterModels`, which removes the model from the list |

**Decision:** close each surface where its consumer decides to create the cell or
row. Boolean flags answer false, model suppliers answer null, the header bar
collapses before binding, matching button and link cells have their recycled item
view set to GONE (and reset to VISIBLE otherwise), and the list filter drops the
automation teaser and matching button or link models. The downloads notice is
closed as a group at the one flag its four cells share. The stored preferences and
cached payloads are not rewritten.

**Known limitations:** the feed match is a case-insensitive substring heuristic,
so an unrelated destination containing one of the fragments is hidden too. Deep
links are not intercepted; the subscription screen remains reachable when opened
deliberately. Recorded in the spec.

**Verification run:** all 16 registered patches applied in one run.
`Hide upgrade banners` reported PASS, and the final run wrote
`verify-out/patched.apk`.

### `anghami.downloads.limits` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-06

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Started from the download entry point and read the validator it calls before
   accepting a request. The validator throws for every refusal reason, so it is the
   natural first gate.
2. Enumerated its callers and readers of the offline allowance field
   (`maxOfflineSongs`) across all seven DEX files. The field is read in three
   further places outside the validator.
3. Read the download loop that runs after the validator, and found it calls the
   counter again per record.
4. Read the download service callback and found the same count expressed as a
   boolean before the record is handed to the download helper.
5. Followed the post-sign-in cleanup and found it deletes records above the cached
   allowance, and calls `clearDownloads()` outright when the allowance is zero.

**Derived facts:**

| Fact | Value |
|---|---|
| Upfront validator | `DownloadManager.assertDownloadRestrictions(Account, int, SongDownloadReason)`; throws `DownloadRequestException` per reason |
| Per-record counter | `DownloadManager.assertDownloadLimitReached(Account, int)`; throws `LIMIT_REACHED` |
| Service-side check | `DownloadService.canDownloadRecordWithMaxOfflineCount(SongDownloadRecord)`; compares `getDownloadsCount()` with the allowance |
| Post-sign-in trim | `SimpleDownloadActions.cleanDownloads$lambda$2()`; deletes records above the allowance and clears everything at zero |
| Directory reconciliation | `SimpleDownloadActions.cleanDownloadDirectory$default(false, 1, null)`, also called by the trim |
| Allowance source | `Account.maxOfflineSongs`, a locally cached field |
| Limited-plan check | `DownloadManager.isOnLimitedPlan(Account)`, reads the same field |
| Corruption flag | `PreferenceHelper`, re-thrown by the patch exactly as stock does |

**Decision:** replace the validator body with a corruption-only check, return
immediately from the per-record counter, answer the service check true, and reduce
the post-sign-in trim to the directory reconciliation it already performs. The
allowance field and the stored plan are not rewritten.

**Known limitations:** a server-side refusal is not bypassed, and offline playback
still depends on the server having granted the download. Recorded in the spec.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
four edits were confirmed by decompiling the patched output. The behaviour has not
been observed on a device, because no test device is available.

### `anghami.integrity.signature-assertion` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-07

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched the application package for the signature type and the package-info
   field that holds signers. Exactly one class reads it.
2. Read that class end to end. It hashes the certificate, appends a per-request
   salt and hashes the request body on top, and both signature headers come from
   the same answer.
3. Enumerated the other package-info readers in the application: they read the
   version code, the installer or the package name, never the signers.
4. Took the store build's certificate from the stock APK with `keytool` and
   confirmed its SHA-256 equals the value the bundle already uses for the
   compatibility check.
5. Read the derivation again to place the change at the certificate read rather
   than at the method entry, so the salt and the body still contribute.

**Derived facts:**

| Fact | Value |
|---|---|
| Derivation | `Lcom/anghami/ghost/utils/SignatureUtils;->getAppSignature(Ljava/lang/String;[B)Ljava/lang/String;` |
| Signer source | `PackageManager.getPackageInfo(packageName, 0x40)` then `PackageInfo.signatures[0]` |
| Certificate step | `Signature.toByteArray()`, hashed with `MessageDigest("SHA")`, base64 encoded |
| Final step | `SHA-256` over base64 hash + salt + request body, then hex |
| Headers | `X-ANGH-RGSIG` and `X-ANGH-APP-RGSIG`, both from this answer |
| Other signer readers | none in the application package |
| Stock certificate | 846-byte DER, SHA-256 `5e5d1b36ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦45659`, digest checked by a unit test |

**Decision:** replace the certificate byte read with a decode of the store
certificate. Constructing the value directly would drop the salt and the body and
would no longer be a derivation; replacing the whole method would hard-code a
value the server expects per request. The installed signature is untouched, so
every other package-manager reader still sees the truth.

The edit inserts the decode before the certificate read and then removes that one
read. The framework's `replaceInstructions` removes as many instructions as the
replacement contains, which at this site would also remove the result move and
the digest update: the method would still compile, but it would hash an empty
certificate. The patch therefore inserts and removes explicitly, and then checks
that the result move and the digest update still follow.

**Known limitations:** server-side attestation, Play Integrity and certificate
pinning are out of reach; the patch closes the client-side half only. A request
the store build never makes has no known expected value. Recorded in the spec.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
edit was confirmed in the decompiled output: the store certificate is decoded
before the result move, the decoded bytes still feed the SHA digest, and the salt
and the request body still contribute afterwards. The unit test comparing the
embedded certificate digest to the compatibility value passes. The behaviour has
not been observed on a device or against the server, because neither is
available.

### `anghami.ads.feed-banners` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-07

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched the application code for the advertising SDK's request type and
   excluded the SDK's own classes. Two application classes refer to it: the popup
   shower that `anghami.ads.promotional-popups` already covers, and one list
   model.
2. Enumerated the constructors of that list model. Exactly one class builds it.
3. Read that class end to end. It exposes a single runnable whose whole body is
   the banner insertion: it refuses to act when a banner already exists, when the
   server supplied no ad tag, or when the current song is exempt, and otherwise
   creates the banner, appends it to the list and asks the SDK to load it.
4. Confirmed the runnable does nothing else: it does not build ordinary cells and
   does not touch saved state, so skipping it is equivalent to the stock path
   where the ad tag is absent.
5. Confirmed the audio-ad behaviour touches a different decision
   (`odin/core/S.L0`), so the banner placement was genuinely uncovered.

**Derived facts:**

| Fact | Value |
|---|---|
| Banner model | `Lcom/anghami/model/adapter/AdTagModel;`, constructed in one place |
| Inserter | a `run()V` in an obfuscated class, identified by the model construction and `AdSettings.noAd(Song)` |
| Gates inside it | no existing banner, non-blank ad tag from the host, current song not ad-exempt |
| Effect when skipped | the banner is never created, appended or loaded; the list keeps its ordinary cells |
| Other banner paths | none; the only other ad surface in the request-type search is the popup shower |
| Audio ads | separate decision point, covered by `anghami.ads.audio-ads` |

**Decision:** answer the inserter with an early return. Hiding the banner view
after creation would leave the model in the list and an empty row behind, and
answering the per-song exemption true would change the player's ad decision too.
Skipping the inserter is the same code path the stock build takes when the server
sends no ad tag.

**Known limitations:** the server still decides that a placement exists and still
records the impression it never receives; the patch cannot change that. The
advertising identifiers the client sends are untouched, as are the audio ad and
popup decisions, which have their own behaviours.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
edit was confirmed in the decompiled output. The behaviour has not been observed
on a device, because no test device is available.

### `anghami.system.forced-update` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-07

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Searched the application code for the update vocabulary and excluded the Play
   core library's own classes. Besides the in-app update manager, the application
   has a stored preference named `forceUpdate`.
2. Read the preference's getter and setter. The getter reads a boolean with a
   `false` default; the setter is called from two server responses: the
   configuration response field `forceupdate` and the sign-in response field of
   the same name.
3. Searched for every reader of the getter. There are two: the main screen, where
   a true answer posts a blocking dialog whose only action opens the store, and
   the sign-in bookkeeping, where the same answer adjusts the session timestamp.
4. Checked the other update surfaces. The Play in-app update manager is a
   voluntary flow with its own availability check and does not consult this
   preference.

**Derived facts:**

| Fact | Value |
|---|---|
| Stored question | `PreferenceHelper.shouldForceUpdate()Z`, reads the `forceUpdate` boolean |
| Written by | the configuration response (`ConfigResponse.forceUpdate`) and the sign-in response (`Authenticate.forceUpdate`) |
| Readers | the main screen's blocking dialog, and the session bookkeeping in `f6.1/b` |
| In-app update flow | separate, voluntary, does not read the preference |
| Effect when answered false | the same branch the client takes when the server does not require an update |

**Decision:** answer the stored question false with an early return. Clearing the
preference instead would only last until the next sign-in writes it back, and
answering the server fields would change what the client stores. Changing the
getter's answer leaves both stored values intact and only affects the local
decision.

**Known limitations:** the patched build stays on the version it was built for and
does not receive later fixes, including security fixes. The server still regards
the build as outdated and may refuse version-gated features. The patch removes the
local dead end; it does not change the server's decision.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. The
edit was confirmed in the decompiled output. The behaviour has not been observed
on a device, because no test device is available.

### `anghami.privacy.silo-telemetry` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-08

**Consulted:** the stock 8.0.28 build only.

**How it was found:**

1. Started from the application's own reporting package,
   `com.anghami.ghost.silo`, and listed its reporters: play-song, playqueue,
   click, impression, time spent, generic errors and device information.
2. Read the preference getters those reporters consult. Two of them are switches
   the sign-in response writes: `getSiloSongTrackingEnabled()` over
   `silo_song_tracking`, and `isSiloInstrumentationEnabled()` over
   `product_instrumentation`. Both default to `false`.
3. Searched for every reader of each getter. The song-tracking answer is read
   only by `SiloPlaySongReporting.reportSongPlayEvent`, which returns `false`
   before it builds or queues a payload. The instrumentation answer is read by
   the click, impression, time-spent and playqueue reporters, and each one logs
   "disabled by API" and returns.
4. Checked the reporters that turned out to have no gate at all: the generic
   application-error reporter, which queues a payload whenever it is given a
   non-empty source, and the device-specification upload, which is private and
   called only from the tail of `prepareDeviceSpecs`.
5. Looked for a central gate in `SiloManager`. There is none: it queues and sends
   whatever the reporters hand it, so the reporters are where the decisions live.
6. Traced the quartile preference separately. `getEnableSiloSongQuartiles()` is
   read only while `odin/core/X.b` builds a play-song payload, and that payload
   reaches the queue only through `reportSongPlayEvent`.

**Derived facts:**

| Fact | Value |
|---|---|
| Song tracking | `PreferenceHelper.getSiloSongTrackingEnabled()Z`, reads `silo_song_tracking` |
| Song tracking reader | `SiloPlaySongReporting.reportSongPlayEvent`, returns `false` at the gate |
| Instrumentation | `PreferenceHelper.isSiloInstrumentationEnabled()Z`, reads `product_instrumentation` |
| Instrumentation readers | `SiloClickReporting.postClick`, `SiloImpressionReporting.postImpressionEvent`, `SiloTimeSpentReporting.postTimeSpentEvent`, `SiloPlayqueueReporting.postPlayqueueCreated` |
| Quartile gate | `getEnableSiloSongQuartiles()`, `enable_silo_song_quartiles`, read only in `odin/core/X.b` |
| Ungated error reporter | `SiloErrorReporting.postAppGenericErrorEvent(Ljava/lang/String;)V` |
| Ungated device upload | `SiloDeviceInfoReporting.reportDeviceSpecsAsync(Lcom/anghami/ghost/pojo/DeviceSpecs;)V` |
| Central gate | none in `SiloManager` |
| Stock path when a gate is false | the reporter logs and returns; nothing is queued |

**Decision:** answer the two preference questions `false` and return early from
the two ungated reporters. The quartile gate is left alone: it only decides
whether quartile data is included in the play-song payload, and that payload is
sent through the reporter the song-tracking answer already silences, so editing
it would add no behaviour. The stored preferences are not rewritten; only the
local answers change.

**Known limitations:** the patch stops new reports, it does not purge the local
Silo store, so events queued by an earlier build and still on disk can be sent at
the next launch. It covers Silo only; the third-party SDKs are a separate
behaviour (`anghami.privacy.analytics`). It does not stop ordinary local logging,
which stays available for bug reports.

**Verification run:** the unified run applies all registered patches to the stock
8.0.28 APK and reports `PASS` for this patch, and the patched APK compiles. All
four edits were confirmed in the decompiled output. The behaviour has not been
observed on a device, because no test device is available.

### `vodafone.integrity.license-check` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Read the application element of the manifest. It names
   `com.pairip.application.Application`, a wrapper class that is not part of the
   application's own package.
2. Read that class: it extends `vodafone.vis.engezly.AnaVodafoneApplication` and
   overrides `attachBaseContext` only to call
   `LicenseClient.checkLicense(context)` after the super call. There is no
   `VMRunner` and no `libpairipcore.so` in the bundle.
3. Searched the whole decompiled tree for `checkLicense`. It is called from the
   wrapper above and from `LicenseContentProvider.onCreate`; the manifest does not
   register that provider, so only the wrapper call runs.
4. Read `LicenseClient`: `checkLicense` posts a runnable on the main thread.
   The runnable binds to the licensing service of `com.android.vending`, and
   `performLocalInstallerCheck` accepts the installation only when the installer
   is `com.android.vending`. A response code of 2 leads to a paywall activity; 3
   is reported as "Request package name invalid"; a bind failure is retried three
   times and then shows an error dialog and schedules an application shutdown.

**Derived facts:**

| Fact | Value |
|---|---|
| Manifest application | `com.pairip.application.Application` |
| Application base class | `vodafone.vis.engezly.AnaVodafoneApplication` |
| Startup call | `LicenseClient.checkLicense(Landroid/content/Context;)V`, static |
| Other call site | `LicenseContentProvider.onCreate`, provider not registered |
| Service bound to | `com.android.vending` licensing service |
| Installer requirement | `com.android.vending`, checked by `performLocalInstallerCheck` |
| Forced rejection | paywall activity, error dialog and delayed shutdown |
| Side effects of the call | none beyond the check itself |

**Decision:** return early from the static entry point. It is the single call on
the startup path and it initialises nothing the rest of the application reads, so
one edit removes the refusal without touching any other code.

**Known limitations:** the patch does not make the installation licensed and does
not change anything the server is told. Features the server gates by entitlement
stay gated.

**Verification run:** the unified run applies all registered Ana Vodafone
patches to the stock base APK and reports `PASS` for this patch, and the patched
APK compiles. The injected return was confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

### `vodafone.system.forced-update` ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the classes in the `main.prenavigation` package and found
   `UpdateChecker`, which also carries the methods named `checkAppForceUpdate`,
   `showAppSoftUpdateIfExists`, `getUpdateInfo` and
   `checkFeatureHasMaintenance`.
2. Read the whole class to separate the four gates it runs before a screen is
   shown: an application force check, a feature force check, a feature soft
   overlay and an application soft prompt.
3. Traced where the update type comes from. `GetAppUpdateTypeUseCase` maps the
   `updateType` string of the channel configuration to `UpdateType`;
   `GetModuleUpdateTypeUseCase` maps the per-module entry the same way. The
   mapping is used only to decide these prompts.
4. Read the two force answers. The application answer shows a blocking dialog and
   returns `true`; the feature answer opens the store and returns `true`. Both
   return `false` for every other type, and the caller then continues.
5. Read the soft handlers. Both act only on the soft type, so leaving the
   computed update type untouched keeps the voluntary prompt working.

**Derived facts:**

| Fact | Value |
|---|---|
| Owner | `Lvodafone/vis/engezly/main/prenavigation/UpdateChecker;` |
| Application force answer | `AnimatedBarChartKtAnimatedBarChart1111(UpdateType; Continuation;)Object`, boxed `Boolean` |
| Feature force answer | `AnimatedBarChartKtAnimatedBarChart1(UpdateType; String;)Z` |
| Application soft prompt | `showAppSoftUpdateIfExists`, acts only on the soft type |
| Feature soft overlay | acts only on the soft type |
| Blocking action | dialog with a store action for the application; store launch for a feature |
| Caller behaviour on `false` | proceeds into the normal screens |

**Decision:** answer both force questions `false` and leave the computed update
type and the programs that consume it alone. The soft prompt keeps working, the
stored configuration is not rewritten and the store entry points the application
offers voluntarily are untouched.

**Known limitations:** the patched build stays on the version it was built for and
does not receive later fixes, and a feature the server refuses for an outdated
client stays refused.

**Verification run:** the unified run applies all registered Ana Vodafone
patches to the stock base APK and reports `PASS` for this patch, and the patched
APK compiles. Both injected answers were confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

### `vodafone.privacy.tracking` - derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the packages of the application and found a tracking package with a
   `common/model` folder that holds the tool types: `ANALYTICS`, `SOCIAL_MEDIA`,
   `SURVEY` and `TECHNICAL`.
2. Read the dispatcher, the class whose metadata names it `EventLogger`. Its
   only method takes a tool type, a key and a map, and routes the event to the
   logger of that tool: the analytics logger, the social-media logger or the
   survey logger. The technical tool does nothing.
3. Read the caller, the singleton whose metadata names it `Logger`. It adds the
   common data to an event, and for the survey tool it hands the event to a
   background coroutine. Both paths end at the dispatcher, so the dispatcher is
   the only place an event leaves the application.
4. Searched for the callers of the social-media handler, the class whose
   metadata names it `SocialMediaEventHandler`. It is not reached through the
   dispatcher alone: the dashboard, the offers screen, the gift screens and the
   scratch card call it directly.
5. Read the handler. It is the only place that calls the attribution SDK with
   an event and the analytics API with an event for the social tool.
6. Searched the whole application for calls to the analytics API and found two
   that do not pass any of the above: the login flow reports its experiment
   events through the API directly.
7. Read the startup path. The application creates the Firebase app, asks the
   tracking singleton to initialise itself and asks it to start the libraries,
   and the social handler is given the application context. The SDKs are
   therefore started whatever this patch does.

**Derived facts:**

| Fact | Value |
|---|---|
| Dispatcher | `Lo/LivenessInstructionsUi;->AnimatedBarChartPreview(Lvodafone/vis/engezly/tracking/common/model/ToolType;Ljava/lang/String;Ljava/util/Map;)V` |
| Dispatcher reads | the tool type, the event key and the event map |
| Tools | analytics, social media, survey, technical |
| Social handler | `Lo/clearOnScrollListeners;->AnimatedBarChartKtAnimatedBarChart1111(Lo/clearOnChildAttachStateChangeListeners;)V` |
| Social handler, second entry point | `Lo/clearOnScrollListeners;->AnimatedBarChartKtAnimatedBarChart1111(Ljava/lang/String;D)V` |
| Screens that call the social handler directly | dashboard, offers, gift selection, gift mass, scratch card |
| Analytics API call | `Lcom/google/firebase/analytics/FirebaseAnalytics;->logEvent(Ljava/lang/String;Landroid/os/Bundle;)V` |
| Experiment events | reported by the login flow, through the analytics API directly |
| SDK start-up | `FirebaseApp.initializeApp`, the tracking singleton's `init` and `initLibraries`, the social handler's `init` |
| Return types of every patched method | void |

**Decision:** silence the dispatcher, both entry points of the social handler
and the analytics API call. The dispatcher covers the application's own event
vocabulary, the social handler covers the screens that report without asking
the dispatcher, and the API call covers the experiment events. Every method is
void, so no caller can be left waiting for a value.

**Known limitations:** the SDKs are still created and started, so the traffic
they produce on their own, such as install attribution and session reporting,
is not stopped. The events are still prepared before they are reported, so the
work is done even though nothing is sent.

**Verification run:** the unified run applies the Ana Vodafone patches to the
stock base APK and reports `PASS` for each of them, and the patched APK
compiles. The injected returns were confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

### `vodafone.account.remote-actions` - derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the notification package and found a push listener whose metadata
   names it `VodafonePushListener`. It implements the push service's listener
   interface and holds a logout use case, a silent-notification view model and
   an application scope.
2. Read the silent-push path. It reads a key out of the message and compares it
   with the keys of the action enum: the token-expiry key, the user-token key
   and the shopping-cart key are each handled by the application itself.
3. Read the action enum. It has five entries: clearing the application data,
   logging out, updating the token expiry, resetting the user token and
   updating the shopping-cart count.
4. Followed the branch that the three handled keys do not take. It hands the key
   to the destructive handler.
5. Read the destructive handler. It reads the current activity, reads the user
   information and launches a coroutine. The coroutine compares the key with
   the clearing key and calls the system service that clears the application's
   data, and compares it with the logout key and runs the logout use case.
6. Searched for other callers of the destructive handler and found only the
   silent-push path.

**Derived facts:**

| Fact | Value |
|---|---|
| Push listener | `Lo/getChildPosition;`, the push service's listener interface |
| Key of the message | the `silent_push_key` extra |
| Keys the application handles itself | `update_token_expire_date`, `RefreshData`, `UpdateEshopCartCount` |
| Destructive handler | `Lo/getChildPosition;->AnimatedBarChartPreview(Ljava/lang/String;)V` |
| Clearing key | `ClearAppCache` |
| Clearing action | `ActivityManager.clearApplicationUserData()` |
| Logout key | `ForceLogout` |
| Logout action | the logout use case, then the user is sent back to the login screen |
| Other callers of the handler | none |

**Decision:** answer the destructive handler with an early return. It is
reached only for the keys the application does not handle itself, so the token
refresh, the user-token reset and the shopping-cart count keep working, and the
two destructive actions never run.

**Known limitations:** the server still sends the messages and still believes it
may wipe the installation or end the session. A session the server has already
refused still ends.

**Verification run:** the unified run applies the Ana Vodafone patches to the
stock base APK and reports `PASS` for each of them, and the patched APK
compiles. The injected return was confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

### `vodafone.promotion.ad-space` - derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the application packages and found an `adspace` package with a
   presentation folder, a model folder and a domain folder.
2. Read the view model whose metadata names it `AdSpaceViewModel`. It holds the
   state of the card, asks a use case for the offer and asks another use case
   to redeem it. The state starts empty and is filled when the offer arrives.
3. Read the presentation model. It carries the description, the price, the
   gift, the redemption pattern, the confirmation and rejection buttons and the
   destination of the offer.
4. Searched for the code that draws the card and found one composable that
   takes the view model and the state and draws the offer.
5. Listed its callers. The home screen, the recharge and balance screen, the
   payment screen and the flex management home call it, directly or through the
   copies the shrinker left behind.

**Derived facts:**

| Fact | Value |
|---|---|
| View model | `Lvodafone/vis/engezly/adspace/presentation/AdSpaceViewModel;` |
| Offer use case | `GetAdSpacePromoUseCase` |
| Redemption use case | `RedeemAdSpacePromoUseCase` |
| State | a flow that starts empty and is filled when the offer arrives |
| Composables that draw the card | one |
| Card composable | `Lo/updateAnchorInfoForLayout;->AdSpaceCard-lVb_Clg(...)V` |
| Screens that call it | flex home, recharge and balance, payment, flex management home |
| Return type | void |

**Decision:** answer the card composable with an early return, so it draws
nothing. A composable that emits no nodes leaves no space behind, and no screen
reads the offer back from the card.

**Known limitations:** the offer is still requested from the server and still
held by the view model; only the drawing is stopped. The redemption flow stays
reachable through the server answer, but not through the interface.

**Verification run:** the unified run applies the Ana Vodafone patches to the
stock base APK and reports `PASS` for each of them, and the patched APK
compiles. The injected return was confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

### `vodafone.account.account-limit` - derived 2026-11-11

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the account packages and found the switch-account overlay, the
   credential-login overlay and the screen that says too many accounts are
   saved.
2. Searched the account packages for a comparison of a list size with a
   constant and found two places. The first is a method of its own that asks
   whether the accounts are at the limit; it compares the size with six when the
   first account is a seamless one and with five otherwise. The second is the
   comparison inside the method that asks which account to switch to; it
   compares the size with five and shows the screen when the list is at least
   that long.
3. Read the method that asks which account to switch to. When the list is
   shorter than the limit it takes the path that switches to the account whose
   number matches the user; when the list is at the limit it takes the other
   path. The comparison is the only thing that decides between the two.
4. Searched the whole application for other counts against five or six and
   found a third one, in the screen that shows the accounts with the button
   that adds another account. It compares the size of the saved accounts with
   five and, when the list is that long, builds the message that says too many
   accounts are saved instead of opening the screen that asks for a number.

**The first attempt, and why it was not enough:** the derivation stopped at the
two checks of the overlays, and the patch changed only those. On a device with
five accounts saved, the button that adds another account still showed the
message that too many accounts are saved. The third check is the one that
fired.

**Derived facts:**

| Fact | Value |
|---|---|
| Limit | five saved accounts, six when the first of them is a seamless one |
| First check | `SwitchAccountOverlayKt.checkIfAccountsMaxLimit(List)Z` |
| Second check | `CredentialsLoginOverlayKt.onSwitchAccountClicked(SavedAccountsUiState, Function0, Function0)V` |
| Third check | `LoginLandingScreenKt.LoginLandingScreen$lambda$23$lambda$17(LoginSharedViewModel, State, Boolean)Unit` |
| Fourth check | `CredentialLoginRepoImp.login(LoginInfoModel, Continuation)Object` |
| Screen shown when the limit is reached | the saved-accounts-exceed-limit overlay |
| Return types | the first check answers a boolean, the others are void except the fourth, which answers the login result |

**Decision:** answer the first check with "the list is not full", make the next
two count zero saved accounts, which is the answer the comparison takes for a
list that is not full, and answer the count of the fourth with zero as well.
The account that is being switched to is found in the list in the same way as
before.

**Known limitations:** the server still decides what each account may do, and
the accounts are still stored the way they always were. The text that says how
many accounts can be saved is a text of the resources and still says five.

**Where the message comes from, and where the check is:**

The message "Maximum Accounts Reached" is not a text of the resources. It is
the text of the error that the operator's content service sends for the error
code `-1234566`. The application builds that error itself: the method
`LoginErrorHandler.getMaximumAccountErrorInfo()` returns an error with the
code `-1234566` and the use case `login`, and the list of error features that
the content service sent is looked up for that code. The application then
shows it with `LoginScaffoldKt.HandleLoginErrorState`, which compares the
error code with `-1234566` to decide how the buttons of the message behave.

So the check that decides whether the message appears is in the application,
and the wording of the message is the operator's. The message is shown on the
overlay and on the landing screen when the error carries the code `-1234566`,
and the code is put on the error by the login repository, which is the fourth
check below.

**The fourth check, found on 2026-11-12:** the message was still shown on the
screen that asks for the password of a sixth number after the three checks were
changed, while the network was closed. That made the producer of the error the
place to read. The error code `-1234566` is built in one method only, and the
class is the credential-login repository, whose Kotlin metadata names its
methods:

| Method, as the shrinker named it | Name in the metadata |
|---|---|
| `GetTargetFragmentUsageViolation->AnimatedBarChartKtAnimatedBarChart1112(LoginInfoModel, Continuation)Object` | `login` |
| `GetTargetFragmentUsageViolation->AnimatedBarChartKtAnimatedBarChart1111()I` | `getUsersCountWithoutSeamless` |
| `GetTargetFragmentUsageViolation->AnimatedBarChartPreview(String)UserAuthInfoEntity` | `checkIsUserNotFoundAndNotSeamless` |

The body of `login` asks the cache how many saved accounts are not seamless,
compares the answer with five, and, when it is equal, looks the number being
signed in up in the saved accounts. When the number is not there, the method
returns an error of its own with the code `-1234566` and never calls the login
service. The comparison is `const/4 v1, 0x5` followed by `if-ne`, which is the
check the device was seeing. It fires at exactly five saved accounts and a
number that is not one of them: the sixth account. The count method is called
in this one place, so answering it with zero changes nothing else.

The check was missed by the first search because it counts the saved accounts
through a method of its own and names the number it compares with in a
constant, instead of counting a list inline the way the other three do. The
earlier claim that the two producers of the error were the overlay and the
landing screen was wrong: those two only show an error that already carries
the code, and the repository is what builds it.

**Verification run:** the unified run applies all registered Ana Vodafone
patches to the stock base APK and reports `PASS` for each of them, and the
patched APK compiles. The four answers were confirmed in the decompiled
output of the patched build: `const/4 v0, 0x0` sits where `move-result` was,
before `const/4 v1, 0x5` and `if-ne`, so the branch to the error is not taken.
The behaviour was observed on a device on 2026-11-11 with five accounts saved:
before the third check was changed, the button that adds another account showed
the message that too many accounts are saved; with it, the button opens the
screen that asks for the number. The same device, with the message appearing on
the screen that asks for the password of the sixth account, showed that the
message is built before the operator answers: the application had built the
error itself, and the wording came from the content the operator had sent
earlier. That observation is what led to the fourth check. The fourth check has
not been run on a device yet: at the time it was found the device could not be
reached, and the patch is confirmed by the apply run and by the disassembly of
its method.


### `vodafone.network.certificate-pinning` - derived 2026-11-10

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Searched the application for the certificate pinning API and found two
   builders of a pinner: one in the application's own network layer and one in
   the authentication layer.
2. Read both builders. They are the same code: a pinner for one host with two
   public keys.
3. Read the place where the pinner is attached to the client. The
   application's own layer attaches it when its configuration asks for it, and
   the authentication layer does the same.
4. Searched the whole application for other uses of the certificate API. The
   remaining ones belong to libraries that build a client without pins.

**Derived facts:**

| Fact | Value |
|---|---|
| Pinned host | `mobile.vodafone.com.eg` |
| Pinned keys | `sha256/wdks7OHYA8F/OIfcK4rPxn5H2QjOLZN2paEk/D+64W8=` and `sha256/yMoKrrKMydah5ZHYUtRtI5IJtR+5hZ1Ls7rO8jHsLjU=` |
| Application pinner | `Lo/getPrintScreenEK5gGoQ$AnimatedBarChartKtAnimatedBarChart1;->AnimatedBarChartKtAnimatedBarChart1()Lokhttp3/CertificatePinner;` |
| Authentication pinner | `Lo/updateAuxData$AnimatedBarChartKtAnimatedBarChart1;->AnimatedBarChartKtAnimatedBarChart1()Lokhttp3/CertificatePinner;` |
| Other pins | none |

**Decision:** remove the pins from both pinners, so the pinner the client carries
has no host and enforces nothing. The pins are removed rather than pointed at
another host: the library makes a host out of the pattern of a pin and refuses
one it cannot make, so an empty pattern would make the application fail to
start instead of just not pinning.
### `vodafone.cash.current-connection` - derived 2026-11-11

**Consulted:** the stock 2026.11.1 base APK only, decompiled locally with
apktool 3.0.2 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Read the strings of the application for the messages of the cash service
   and found the two that are about the connection: one that says the cash
   service is not available through Wi-Fi and one that says the mobile data
   has to be connected through the Vodafone network.
2. Looked for the place that decides between them and found that the keys of
   the two errors are read by the application as errors of the operator and not
   as something the application decides on its own.
3. Searched the whole cash part of the application for a check of the
   connection and found none: there is no call of the connectivity of the
   device anywhere in it.
4. Followed the network of the cash requests. The cash service talks to the
   operator through a network manager of its own, and the provider of that
   network manager has a method that puts it as the base of the network the
   requests go out over, right before every request.
5. Read that method. It prepares the network, sets the cash network manager as
   the base instance of the network manager of the application, and sets it a
   second time on the network of the cash service.

**Derived facts:**

| Fact | Value |
|---|---|
| The messages | `cash_internet_error_title`, `cash_internet_error_desc`, `cash_diff_carrier_error_description` |
| Where they come from | the operator, the keys are read as errors of the answer |
| Is there a check in the application | no, there is none in the cash part |
| The network of the cash requests | a network manager of its own, put on the mobile data before every request |
| The method that does it | `NetworkInstanceProviderImpl.updateCashBaseNetworkInstance()` |
| The class it sits in | `Lo/FailureInfo;`, the implementation of the provider of the cash network |

**Decision:** leave the network as it is, so that the cash requests go out
over the connection the device already has. The method that puts the cash
network on the mobile data is answered with an early return.

**Known limitations:** the operator ties the cash service to the mobile network
of the line, so it is likely to refuse a request that goes out over another
connection, and the message of the operator is then shown. The service also
reads the identity of the line from the card of the device, so a device
without the card of the line has no identity to read.

**Verification run:** the unified run applies all registered Ana Vodafone
patches to the stock base APK and reports `PASS` for each of them, and the
patched APK compiles. The injected return was confirmed in the decompiled
output. What the operator answers over a connection that is not the mobile
data of the line was not observed.
that has no row yet has nothing to keep, and its password stays empty, as it
is in the stock build.

**Verification run:** the unified run applies all registered Ana Vodafone
patches to the stock base APK and reports `PASS` for each of them, and the
patched APK compiles. The three changed statements were confirmed in the
decompiled output of the patched build. The behaviour was observed on a device
on 2026-11-11: the stored password was 158 and 159 characters in the two
databases after the sign in, the same after the sign out and the same after the
restart, and opening the account after the sign out logged it in and showed
the home screen without asking for the password. Before the patch the stored
password was 0 characters in both databases after the sign out and after the
restart, and the account asked for the password again.
### `vodafone.system.screenshots` - derived 2026-11-11

**Consulted:** the stock 2026.11.1 APKM only, decompiled locally with apktool
3.0.3 and `--no-res`. No other patch collection was opened.

**How it was found:**

1. Listed the libraries the application starts at launch and found a security
   library, `com.cyshield.appshield`, with initializers of its own.
2. Read the manifest. The library is started by the startup provider of the
   application, and its initializer is registered with the application context.
3. Read the initializer of the library. It registers two callbacks that watch
   the screens of the application: one that follows them and one that protects
   them.
4. Read the protection callback. It keeps a flag that says whether the
   protection is on, a prefix of the package names it applies to, and the
   screens that are open. When a screen is created, started or resumed, it
   checks whether the screen belongs to the application and, if it does, sets
   the secure flag on the window of that screen.
5. Read the rest of the library. It carries a list of the checks it can run,
   among them the checks for root, for a developer build, for USB debugging,
   for an emulator, for a hooking framework and for a screen recording,
   together with the entry point that starts them and the one that builds its
   own certificate pinner.
6. Searched the whole application for calls to those two entry points and found
   none. The library is initialised with the two callbacks and nothing else, so
   the device checks and its own pinner are never used in this build.

**Derived facts:**

| Fact | Value |
|---|---|
| Library | `com.cyshield.appshield`, started by the startup provider of the application |
| Initializer | `com.cyshield.appshield.utils.SecuritySdkInitializer` |
| Screen protection | `com.cyshield.appshield.utils.ScreenProtectionManager` |
| Method that protects a screen | `Lo/notifySurfaceUpdate;->AnimatedBarCharthGBTI10(Landroid/app/Activity;)V` |
| What it does | `Window.addFlags(0x2000)`, the secure flag |
| Checks the library can run | root, developer mode, debug build, USB debugging, emulator, screen recording, hooking frameworks, prevent screenshots |
| Are those checks run | no, nothing calls the entry point that starts them |
| Is the library's own pinner used | no, nothing calls the method that builds it |
| Is the screen protection turned on | no, only the library's own entry point turns it on and nothing calls it |

**Decision:** answer the method that protects a screen with an early return, so
the window is left as the application made it.

**Known limitations:** the library stays in the build and keeps watching the
screens; only the flag it sets on their windows is gone. In this build the
library never turns the protection on, so the patch changes nothing today: it
is a guarantee rather than a repair. The window of the running application was
checked on a device and carries no secure flag, with and without the patch.

**Verification run:** the unified run applies all registered Ana Vodafone patches
to the stock base APK and reports `PASS` for each of them, and the patched APK
compiles. The injected return was confirmed in the decompiled output. The
behaviour has not been observed on a device, because no test device is
available.

## Not consulted

No source, comment, identifier, helper or fingerprint from any other patch
collection has been used to produce anything in this repository.
