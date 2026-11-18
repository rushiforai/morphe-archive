# AD Android Auto nieuws — obfuscation-resistant fingerprint strategy

Status: implemented for 9.22.0 (`patches/ad/CarNieuwsPatch.kt`,
`extensions/ad`); on-device Android Auto acceptance still pending. Evidence
base: AD 9.22.0 (build 9220000, `be.persgroep.android.news.mobilead`,
`kubusapp` application skeleton, the two known DPG publisher certificates),
decompiled with jadx on 2026-11-05 and compared against the Volkskrant 7.53.1
Android Auto implementation (`patches/volkskrant/CarNieuwsPatch.kt`,
`extensions/volkskrant`).

## Why AD needs a different strategy

Parool and Trouw 7.53.1 ship the Amalia car SDK unminified: their
`classes6.dex` car stack is byte-identical to Volkskrant's apart from R8 build
map IDs, so the Volkskrant fingerprints port verbatim. AD 9.22.0 is a rebuilt
app generation: R8 renames the browse layer to short `defpackage` names while
serialization keep-rules preserve the data models. Verified renaming:

| Volkskrant/Parool/Trouw anchor | AD 9.22.0 state |
| --- | --- |
| `AmaliaAudioPlayerService` (+ manifest `MediaSessionService`/`MediaBrowserService`) | **kept** |
| `CarTabUi`, `CarTabSdUiResponse`, `CarAudioQueue`, `CarItemTrackingArgs`, radio models | **kept** (kotlinx.serialization) |
| `AudioItemContentResponse` DTO family, `ImageDto`, `AmaliaTtsDisclaimerResponse` | **kept** (26 string references) |
| `CarAudioQueue$Companion.fromJsonString` | **kept** |
| `CarApi$getTabStart$…` coroutine | renamed (`vo2`/`to2` shape) |
| `RootController.get` | renamed (`jq2` browse controller) |
| `CarMediaItemMapper`/`TabMapper`/`QueueMapper` | renamed (`nq2`, `mp2`) |
| `AmaliaResult$Success` | renamed (`m10`/`l10`/`k10` hierarchy) |
| `CarMediaSessionCallbackDelegate.readLaneQueue` | renamed (uses the kept `LANE_QUEUE_ITEMS` extra) |

Short names can change on every AD release, so name-based fingerprints are
unusable for the renamed half. The strategy below never relies on a minified
name surviving.

## Pillars

### 1. Hook stable-named classes directly

The service init hook is unchanged: `AmaliaAudioPlayerService.onCreate` keeps
its name and its manifest registration on every R8 pass, because Android
manifest references cannot be renamed. `init(Context)` from the extension
attaches there exactly as in the Volkskrant patch.

### 2. Resolve renamed hop points by surviving constants and type references

Every obfuscated hop point is found at patch time through an anchor R8 must
keep, then verified by instruction shape before any injection:

- **Start-tab wrap point** (Volkskrant step 2): find the suspend-lambda
  `invokeSuspend` whose body deserializes `CarTabSdUiResponse` and constructs
  the single success wrapper around it. Anchor: the method's references to
  `CarTabSdUiResponse` plus exactly one construction whose type is the local
  success wrapper; the wrapper class is discovered from that construction, not
  from a name.
- **Tab title and route** (step 3–4): the browse controller builds the root
  `MediaItem` list with the constants `"/start"`, `"/podcast"`, `"/radio"` and
  the authority `"amalia.android.auto"` (present verbatim in AD 9.22.0). Anchor
  on the `UriMatcher` construction or the `const-string "/start"` site within a
  method returning `List<MediaItem>`; the title rewrite targets the resolved
  string call feeding the start tab's builder.
- **Queue delivery** (steps 5–6): the bundle extra key `LANE_QUEUE_ITEMS` and
  the decoder `CarAudioQueue$Companion.fromJsonString` both survive. Anchor the
  read path on the `getString("LANE_QUEUE_ITEMS")` call site; the browse-row
  slimming hook anchors on the queue mapper call whose result feeds
  `CarLaneItemQueue`-shaped objects (discovered by field shape, not name).
- **Row synthesis** (extension runtime): the DTO constructor for rows is
  reached reflectively via the kept `AudioItemContentResponse` class name and
  the surviving `"spoken_article"` / `"Playlist"` / `"Nieuws"` constants, as
  the Volkskrant extension already does.
- **Queue commit / player publication** (steps 8–10): anchor on
  `androidx.media3.common` types (`Player$Commands`, `Timeline`,
  `MediaItem`) and the notification command provider discovered as the only
  method returning `Player$Commands` from the media service package.

### 3. Fail closed per build

Each structural fingerprint carries the same contract assertions as the
Volkskrant patch (`"… contract changed"` checks): expected instruction shape,
single match, register/opcode expectations. A renamed or regressed anchor
aborts the patch with a named error instead of mis-patching. AD targets stay a
single `AppTarget` entry; no multi-version tolerance, so every new AD release
re-runs the assertions during patching.

### 4. Re-derive the feed anchor per release

The `kubusapp` skeleton does not share the `nl.persgroep.edition`
`OverviewPageRepositoryImpl` feed path the Volkskrant runtime uses
reflectively. A future AD patch must first locate AD's own overview repository
and text-to-speech DTOs in a bounded decompile pass (the same
download → jadx → anchor-verify loop used for this design) and wire the
extension's feed walk to those names. Until that pass lands, no AD Android
Auto patch is published.

## Maintenance cadence

The three 7.53-line apps keep name-based fingerprints and only need the
regular latest-release check. AD needs the bounded decompile pass above per
release. The constants in this document (`amalia.android.auto`,
`LANE_QUEUE_ITEMS`, `spoken_article`, `/start`) are the tripwires: if a future
AD build drops one, the strategy must be re-evaluated before patching.

## Verified anchor table (AD 9.22.0, build 9220000 — 2026-11-05 pass)

Patch-time discovery uses the Morphe patcher's `classDefByStrings`,
predicate `classDefBy` and `Fingerprint(custom=…)`; no minified name is ever
referenced. Verified against the decompiled original:

| Hook (Volkskrant step) | AD site | Discovery anchor |
| --- | --- | --- |
| 1 service init | `AmaliaAudioPlayerService.onCreate` (unrenamed, manifest-kept) | exact fingerprint |
| 2 start-tab wrap | `vo2.invokeSuspend` (fetches `"/v4/car/tabs/start"`, constructs the success wrapper around `CarTabSdUiResponse`) | class via `classDefByStrings("/v4/car/tabs/start")`; wrapper type discovered from the construction site; at runtime the wrapper class is taken from the observed result object |
| 3 tab title | `jq2.a(String, continuation)` route case 10: `yp2.a(R.drawable.car_tab_start, "/start", afg.a(<start key>))` | method containing `"/start"`, `"/podcast"`, `"/radio"` const-strings; title = nearest preceding `move-result-object` before the `"/start"` call |
| 4 tab styling | same site as 3, after the 3-arg tab-builder call returns | same |
| 5 queue slimming | row-extras writer in `xp2` (`putString("LANE_QUEUE_ITEMS", …)`) | `classDefByStrings("LANE_QUEUE_ITEMS")`; note AD's row builder `xp2.b(String,String,String,String,CarItemTrackingArgs)` differs from the 7.53 `buildPlayableMediaItem` shape — AD's car SDK is a different generation, hooks must be re-derived, not copied |
| 6 queue restore | `dq2.c(qta, continuation)` reads `LANE_QUEUE_ITEMS` and decodes via the kept `CarAudioQueue.INSTANCE.fromJsonString`, builds `QueueUid` | `classDefByStrings("LANE_QUEUE_ITEMS")` + the kept-model call site |
| 8 queue commits | holder class holding a `CurrentQueue` state flow; `CurrentQueue` itself is the renamed `z44` data class | `classDefByStrings("CurrentQueue(currentItemQueueUid=")` (kept `toString` template) → references to that class |
| 9/10 player + commands | media3 types survive (`androidx.media3.common.*` kept, 164 refs) | methods returning `androidx.media3.common.Player` / `Player$Commands` in the media-service neighborhood — still to be traced to exact sites in the implementation batch |

Result-wrapper note: the renamed success/failure pair (`l10`/`k10`) is used
uniformly across the car browse (`vo2`, `jq2`), so the extension learns it once
from any wrapped result and never needs its name.

Feed side (runtime duck-typing, no patch-time names): AD uses Koin
(`MainApplication` → `KoinExtKt.androidContext`), and the
`com.popular.core.model.data` DTOs are `@Keep`-annotated Moshi classes with
full getters — `AudioBundleTeaserItem` exposes exactly the spoken-headline
fields (`getUrn`, `getTitle`, `getDuration`, `getPicture`, `getPaidContent`,
`getTextToSpeechEnabled`), and `ArticleItem` marks TTS availability per
article. The extension resolves the home feed by probing Koin-scoped beans for
a method returning sections that contain `AudioBundleTeaserItem` instances,
degrading to an empty Nieuws tab when resolution fails (same fail-closed
behaviour as the Volkskrant runtime).

## Implementation notes (9.22.0 pass)

The implemented patch differs from the Volkskrant shape where AD's car SDK
generation does, and every delta below is verified against the applied bundle:

- **Feed = capture-at-parse.** The Moshi adapter class
  `com.kubus.module.network.model.AudioBundleTeaserJsonAdapter` survives by
  name (Moshi's reflective class-name convention), so the patch hooks its
  `fromJson` result: every audio bundle the app itself parses refreshes the
  Nieuws cache. The block's field names are minified, so the runtime collects
  its item lists by shape (public `List` fields holding `AudioBundleTeaserItem`
  instances). An empty cache renders an empty tab, never the old Start
  content; no Koin walking and no endpoint knowledge is required.
- **Queue windowing happens at the row builder's entry.** AD's playable-row
  builder takes `(route, CarAudioQueue, …)`, so each row is windowed by
  re-writing its queue argument; the full queue is retained in memory and in
  the durable feed store.
- **Queue restore happens at the kept codec.** The browse callback decodes
  `LANE_QUEUE_ITEMS` through `CarAudioQueue$Companion.fromJsonString`; the
  hook replaces the decoded window with the retained full queue before
  playback, so native Next/Previous and Up next follow the whole feed.
- **Playback publication stays native.** AD renames the media3 core and the
  Amalia player stack, so the Volkskrant session-player wrapper hooks are not
  portable; the restored full queue flows through the app's own holder
  (`CurrentQueue` commit observed at the holder's single-argument commit
  method, discovered via the kept `toString` template) and player. On-device
  acceptance must confirm ordered playback and notification controls.
- **The result wrapper is learned, not named.** The minified success wrapper's
  constructor takes the response (or `Object`); the runtime discovers the
  wrapper from the observed result and re-wraps the synthesized response.
