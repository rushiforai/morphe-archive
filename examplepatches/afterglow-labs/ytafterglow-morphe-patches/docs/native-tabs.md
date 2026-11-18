# Native tabs

Afterglow's `nativeTabsHookPatch` composes YouTube 21.43.523's pivot item list from the existing `TabStore` settings. It is an unnamed dependency of the Tab bar owner, and depends on the existing tab-label/indicator and startup hooks. The named owner is required at runtime; without its `tab-bar` marker, the item list and row remain native.

The frozen iOS reference supplies the six-item native row, saved-position bonus row, left/right anchor policy, default `YTAGControlCenter` identity and Lite Mode's Home/Subscriptions/Library/Afterglow selection. Existing Android storage still accepts all eleven IDs. Unavailable top-row entries do not promote saved bonus entries. Lite Mode uses Home startup and one row without changing saved tab/startup preferences or Morphe settings.

## Native boundaries

- `Lnaz.b(String,String,Lbgdf;Z):Lbkil` constructs the native browse item; `Lavcl.a(Lbkil):j$.util.Optional` creates the native renderer. The native icon enum lookup and immutable list builder are resolved by their exact signatures.
- `Lavcl.a:MessageLite` is serialized using YouTube's existing `MessageLite.toByteArray()`. A bounded read-only parser reads the pivot identifier and icon; it does not rebuild server protos or discard their command extensions.
- `Lrun.G(Lalog)` identifies the native item-list field `V:Layzd`. Composition runs at the beginning of `Lrun.O(Z)`, after any upstream list adapters. Every replacement also calls the original `R:Lrvi.f(Layzd)` map update: both native implementations (`Lrus`/`Lrux`) rebuild pivot-index/page-index correlations from the new list. The patch validates that exact original read/call sequence. The single return binds the verified `o:Optional<PivotBar>` root and inherited `Lavfh.C:ArrayList<View>` to the corresponding models. Unequal or delayed model/view counts defer binding.
- `Lrup.a(Lavcl,View,Lavfz)` supplies exact item/view pairs after the native icon/avatar binder. All native listeners survive except the synthetic Afterglow item's listener, which opens `AfterglowActivity` with destination `controlCenter`. Home binding also calls `AiHomeRouter.captureHome`.
- `Lavfh.p(Context)` constructs an empty `LinearLayout` before assigning `A`. The patch substitutes a `NativeTabRow` there only for the actual `PivotBar` class. The native controller still adds/removes its own children, applies theme and avatar hooks, and owns selected state. Single-row layout delegates to `LinearLayout`; the bonus row uses the existing children with RTL-aware frames, reserves 48dp in fixed-height native containers, and restores their original height when disabled. Measurements revalidate actual container heights, including a later native one-row reset when the mini player closes; unchanged layouts do not schedule another resize.
- The synthetic Posts item uses enum value 746, which the native `Lklp` icon map resolves to `ic_yt_post_24` (`0x7f0806b9`). Value 390 (`CREATE_POST`) is an existing proto enum without a drawable-map entry in this client.

Home, Subscriptions, Library, History, Watch Later, Posts and Messages use verified native browse IDs. Shorts and Create require their supplied native command objects. Hype is available only if the host supplies it. `NativeTabs.supportedTabs()` returns picker-safe choices; `availableTabs()` reports attached native views; `openTab(id)` clicks only a view attached to the current main Activity. Stored unsupported IDs are retained by the existing store and are not fabricated into commands.

Morphe's optional Search/Settings items clone Home without changing the pivot identifier. The parser distinguishes their exact icons (1045/1160 for Search, 1162 for Settings), retains the original objects and insertion positions, and prevents either clone from becoming the captured Home command. These extra identifiers are not written to `TabStore`. Other upstream view visibility policies remain in effect.

## Validation

`python3 tools/check_native_tabs.py` runs 1,898 checks covering saved row membership, missing native renderers, all eleven stored choices, distinct anchors, frame bounds and non-overlap across sizes/densities, exact RTL mirroring, bounded malformed protobuf reads, the upstream Home-clone overlap, and native height resets/restoration without cumulative expansion. Full extension Java compilation against Android 36 and focused Kotlin compilation against patcher 2.1 pass. These are source checks; strict APK application and visual/runtime validation are separate release gates.

Build 122 cached runtime evidence exposed the missing map update: Posts became selected while Home remained visible, so its native click listener did receive the touch. The same transition reset both container heights from 252px to 126px, clipping the two-row children. The source fixes address these independently; a new APK must verify actual destination changes and both full-height rows after mini-player dismissal. Selection alone is not navigation proof.

Build124 runtime evidence confirms those two regressions are resolved. Posts opens a populated native Posts destination with its visible icon, and Home returns to the populated Home feed. History reaches the native sign-in state and Watch Later reaches the native empty-results state in the unsigned test account. Before and after closing the native mini player, both `bottom_bar_container` and `pivot_bar` remain `[0,2085][1080,2337]` (252px). Evidence: the cache's `bundle-124-qa/native-runtime/023`–`031` XML/PNG captures and `native-tab-destinations-litho.log`.

Build126 also verifies centered anchors, an Afterglow startup destination, and
Lite Mode's cold launcher profile. Lite Mode shows Home, Subscriptions, You and
Afterglow, preserves external video links, and restores the saved Afterglow
startup destination when disabled. Returning to settings immediately after its
Restart action is intentional; the launcher test uses a fresh MAIN intent.
The Bonus tabs OFF action follows the existing iOS behavior by trimming saved
overflow tabs to six. Turning it back on raises the limit without restoring those
removed entries. Evidence: `bundle-126-qa/native-runtime/022`–`061` and the
production store regression in `bonus-tabs-policy-review-126.json`.

Runtime checks: default five tabs and real Afterglow route; change order/remove/re-add while returning from settings; supplied Shorts/Create and native Library avatar; History/Watch Later/Posts/Messages navigation; seven-to-eleven tabs, bonus-row visibility and taps, anchor changes, RTL and rotation; one-row height restoration; Home/Afterglow startup from launcher while external video links remain unchanged; Lite Mode Home startup and restoration; upstream optional Search/Settings at index zero; labels/indicators and native theme behavior. Do not infer these outcomes from compilation alone.
