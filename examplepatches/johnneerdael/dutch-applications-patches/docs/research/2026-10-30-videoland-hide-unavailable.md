# Videoland TV: hide subscription-unavailable catalogue content

Status: catalogue filtering is implemented and user-confirmed on the TV. The requested subscription-button follow-up passes native ART tests.

## Scope

The independent **Hide unavailable content** selection is initially off by default. It removes catalogue items whose primary activation target contains the server-supplied `RequireSubscriptionLock`. It keeps available entries, mixed series, secondary upsells, other lock types and unknown availability. The same selection also omits a subscription-required button through the native absent-action presentation result. It does not change account products, playback authorization, DRM, media requests or the experimental subscription-routing selection.

The inspected input is `nl.rtl.videoland.v2` TV 1.117.0/code1622/minSDK24, supplied as `/Users/jneerdael/Scripts/videoland-atv.apks`. APKS SHA256: `f3ceb9e7a87552d51f37e1bfe2b5c8d7d21e337e8e7564835a4891b92732bbdb`. Publisher base SHA256: `86b891e101c30b2c5588ff1e285d37a68e574a9e005f574844fc1b4df3760298`.

## Implementation

`Availability.keep` inspects `Item.o()`, `Action.P` and retained regular/optional lock targets with identity-cycle detection and a 32-target budget. Unknown or malformed availability stays visible. Filtering creates shallow list/model copies only when entries are removed and preserves original Item/Action/Target identity and order.

Only Belly, paginated Belly, Grid, paginated Grid, horizontal List and SlideShow templates (R/S/T/U/V/X) are projected. Solo, SideGlass, Spotlight, third-party and unknown templates remain intact. The legacy `d8.a` and newer `f8.a` constructors project presentation blocks and selection indices. The newer item factory is wrapped in `j8.Q`, where its Block template is still available; the generic `V.s` and layout-block source factory remain unchanged.

`FilteredSource` operates after the native source has calculated its raw keys. Empty filtered pages coalesce in the requested direction until usable data, a genuine end, or a native error/invalid result. It forwards suspension/caller context and exceptional completion, links invalidation both ways, preserves spanning raw keys and detects repeated keys. Compact pages use unknown placeholder counts. Refresh restarts at the source beginning because a visible anchor is not a raw positional offset; this can reset scroll position on refresh.

For legacy native lists, a new `H` uses the original source, a copied seed/config and the original notify/fetch dispatchers. Placeholder counts are disabled without changing raw page size or load metadata. An all-filtered seed schedules native asynchronous loading instead of blocking the UI or declaring exhaustion. Source lists and cached models remain unchanged.

Legacy horizontal rows use exhaustion-aware `Qk.t.c` with weak UI/list references, a source-retained callback and coalesced main-thread notifications. Pending publication stays visible. Existing Grid/Belly handling remains in use. Five newer rendering seams skip exhausted empty collections through their original restart/group cleanup: HorizontalList, Grid, Belly, normal PaginatedGrid and its custom `il.l` renderer. They continue collecting paging and reading observable count/load state. Loading/error/unknown states retain UI; successful refresh plus both exhausted directions is required to hide. Slideshow already exits on empty projected content.

The follow-up hooks the shared presentation mapper `kn.k.c(Action,kn.e)`. A subscription-positive target chain returns its already-supported null action description, so native consumers omit the button and its focus/layout target. Available play, login-only and unknown actions take the unchanged original mapper. This applies to the offered subscription action without relying on tier-name strings or altering its cached Action/Target. Native binders already use absent descriptions for unknown actions. Cover’s secondary-action binder needed an additional reset: absent actions clear text/listener and hide the button; a later available description restores its visibility. ART executes the actual native binder against test-only unattached UI receivers to verify recycled-view behavior; those receiver classes never enter the candidate APK.

## Contracts and validation

All original-input and native ABI/hook contracts resolve before mutation. Contracts pin declarations and full operand/control-flow digests for the inspected native dependencies. The only direct patch dependency is originalInput. Compile-only vendor declarations remain outside the extension DEX, including the case-sensitive Bv/bv packages.

The independent verifier compares all 140,770 original method graphs, all original class/field declarations, the manifest and exact owned helper inventory/effects. It permits twelve specified hook additions. Explicit encoded default field values may be omitted by the DEX writer without changing their values. Mutations to hooks, cleanup destinations, helpers or unrelated code are rejected.

Actual-device ART fixtures load candidate DEX with native app models, paging classes, coroutine continuations and adapter notifications. External page delivery/state holders are fixtures; they do not install/start the app or contact the backend. Tests cover conservative classification, copied models/indices, newer native first-page filtering, raw-key append/prepend and empty-seed loading, suspension/cancellation/errors/invalidation, legacy pending/exhausted rows, native UI notifications and newer empty/loading/error states. JVM fixtures exercise production ABI/input contracts and rejection before mutation. Filter-only and filter+ads+tracking candidates are built from the original APKS with FULL mode. Experimental routing is unselected.

Fresh read-only review found an initial newer-UI header gap; the five guarded cleanup paths address it. The reviewer checked emitted targets, scratch-register liveness, group cleanup and observable-state placement, with no further required fix.

## TV acceptance and limits

The existing installed rollback APK was copied before replacement; SHA256 `d0c6e622c932a2cc626f491418a8e1e286031267ba1d1add79a11f0b3c507f2f`. On 30 October the TV's existing app showed the pairing screen, so its earlier account login could not be assumed current. The catalogue subsequently became available. Live UI inspection retained Bureau Groningen programme information and showed only episode3 in its Season1 row, with episode1/2 cards absent. The user then confirmed “It works I already tested it” and requested removal of the subscription button. Native newer-UI layout/focus remains bounded to static cleanup review and ART state tests; no full live Compose journey is claimed.

An unmarked item that fails only when its stream is requested remains visible. This feature filters explicit subscription locks; it does not predict all backend failures. It does not hide chronological guide entries or change native subscriptions/playback checks. No release/version bump or publication is part of this delivery.

## Recorded checks

- 92 actual-device ART assertions, including five native subscription-button cases and three recycled-cover reset/restoration cases.
- 74 production JVM contract assertions;23 existing experimental-routing/input regressions.
- 281 repository Python tests passed (17 artifact/environment-dependent cases skipped); the availability artifact suite separately checks eight preservation/mutation cases against the final candidate.
- Filter-only and combined outputs independently preserve 140,770 original method graphs, original class declarations, manifest ownership and the owned helper inventory (9 classes/40 methods).
- 58 bilingual app pages pass their template check. Full MkDocs output checking could not run because the local environment lacks the i18n plugin; no online download was attempted.

The final updated combined build was installed after 92 ART checks and full independent verification. Live subscription-button appearance remains awaiting the user’s visual check; no additional TV navigation was performed after the user confirmed filtering.

The supplied MPP remains a local development bundle. The signed combined APK keeps ads/tracking controls selected and experimental subscription routing unselected. A compatible pre-filter rollback APK is retained beside delivery artifacts. SHA256SUMS identifies exact binaries; no publication was performed.

## Follow-up: season headings with no episodes

The user reported that seasons without watchable episodes still left headings. A native failure condition was reproduced: `c8.e.a(a8.b)` returns null for an empty paginated seed even when its metadata retains a next-page marker. The horizontal binder submits that null pager directly and cannot manufacture later loads. `Rows.count` previously treated the marker as pending work and kept the empty section indefinitely.

For a whitelisted collection with known empty content and no native pager, the heading now collapses regardless of that inert marker. Nonempty/unknown content and every active-pager exhaustion/publication path remain unchanged. Later model replacement reevaluates the current row and can restore its heading. Four additional ART cases cover the real factory’s null result, heading removal, available content and unknown content. The old installed candidate fails the heading assertion; the updated candidate passes all 85 ART assertions. Fresh read-only review found no required change. The exact live season payload reported by the user has not been captured, so this evidence establishes the reproduced empty-seed condition rather than a complete live traffic trace.

## Live diagnosis: stale parent adapter count

The user reported that the first heading fix did not remove the visible empty seasons. A temporary diagnostic build traced only section metadata/counts and pager/render state. On Echte Gooische Moeders, seasons 5/4/3 initially had eight subscription-locked items each, then zero visible items, a successful exhausted source and horizontal row count zero. Their headings nevertheless remained on screen. Seasons 1/2 were exhausted at initial layout and did not appear; season 6 retained two available episodes.

The live discrepancy led to `Nk.a$b.a()`: its `onChanged` observer forwarded a fixed-size range redraw without updating the parent’s cached total `R` or child offsets `S[].c`. The parent therefore continued presenting rows that its children had removed. The new guarded notification hook handles only availability-owned collection rows or current nested section adapters when their counts differ from the cached span. It calls native `Nk.a.y()` to recompute offsets/count, then forwards a dataset change. Same-count, unrelated, uninitialized and absent-slot paths retain the original behavior. Native ART regression tests reproduce the old nested count failure, then verify removal, sibling offsets, restoration and those guards.

The final clean build was installed and visually verified on the same TV: season 6 and its two episodes are followed directly by Trailers, with seasons 1–5 headings absent. Remote focus remained on an available episode. All 92 ART assertions and 74 JVM contract assertions passed; the independent verifier checks 140,770 original methods plus original declarations and 40 owned helper methods across 9 classes. Eight artifact regressions and 281 Python tests passed (17 conditional skips). Fresh review found no required fix.

The diagnostic helper and test hooks are enabled only by `scripts/build_videoland.py --diagnostic` and are absent from the delivered production APK/MPP selection. The final runtime inventory explicitly excludes SectionTrace and compile-only vendor classes. No online research was used.
