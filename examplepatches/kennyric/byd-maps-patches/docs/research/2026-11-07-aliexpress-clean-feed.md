# AliExpress 8.180.1 promotion audit and design

Input: `aliexpress-8-180-1.apk`, SHA-256 `275a02dc778b0792ec15f729a261a2c5b37aaf63ff822b2bc25f07160d658ddb`.
The four owner screenshots show Home sale/coupon/deal floors, Fast & Free campaign content, account reward/game entries and Ad-labelled recommendation products.

## Current status

The implementation has passed the real target product-flow checks on the supplied APK: Home and paginated recommendations, Account campaign/game/coin/coupon removal with ordinary account controls retained, independent switches, typed and paginated search without Ad/Bundle/countdown labels, product price/tax/shipping/cart and SKU updates without coin/coupon/countdown offers, and native Account sign-in opening/cancelling without credentials. The tested local APK and bundle are retained with exact hashes in private receipts. No phone was touched, and no main promotion or publication is authorized. Complete canonical verification and terminal storage cleanup are recorded in the private final job receipt before delivery. Historical sections below retain failures and corrections.

One acceptance session's product observations completed before its deadline, but its VM stop was late while evidence was finalized. This is retained as an operational failure, not a timing pass; all owned runtime resources were then stopped. The two approved inspection sessions finished within their bounds.

## Evidence from the supplied APK

- `assets/aheTemplate/search/ahe_app_rcmd_new_card/10136/main.ahe` binds `model.p4p.adTag.tagText` and P4P exposure/click events. Remove the product, not its disclosure.
- `com.aliexpress.android.aesearch.common.floor.product.e.H0(JSONObject)` reads `productId`, `tItemType`, and `p4p`. The recommendation parser reads `mods.listItems`; common waterfall also reads `models` and `cells`; legacy search reads `itemList.content`.
- `JSONObject.getJSONArray(String)` converts strings through JSON.parse and other values through JSON.toJSON. The released entry hook only sees raw Lists under two names and misses converted arrays and other list names. Filter the converted JSONArray before return.
- `DefaultGopData.getCacheData()` supplies Ultron `data` and `hierarchy.structure`. The `new_entertainment` row links Play & Earn, GoGo Match, Merge Boss, Prize Land and Share & Earn. Coin cards use `myae_coin` / `myae_coin_us`; promotional account banners use `myae_banner`.
- Home and account both call `zq.b.c(JSONObject)` -> `zq.a.a(JSONObject, boolean)` before selecting Ultron or Galaxy parsing. Ultron uses `hierarchy.structure`; Galaxy uses `page.structure`, a component dictionary under `data`, and `compName` for template identity.
- Bundled Home promotion templates include `ae_home_banner`, big-sale/code variants, bundle-deals and regional deal floors. Search recommendations also have distinct banner/channel/code/coupon templates. Core search and recommendation product lists must remain.
- `TopBarUseCase.e(qt.g)` returns a default coin entry even without a server entry. CoinEntryView and PigEntryView render methods explicitly control visibility.

## Design

Extend the existing sponsored-products patch to filter converted arrays by explicit P4P metadata across list names, retaining organic item identity/order and prices. Add a separate default-on `Remove promotions and games` patch for inline campaign floors and entertainment entries. Filter the normalized `cr.b` header/body/footer lists after the native parser completes (via checked `cr.c.getData()` and `IDMComponent.getData()` bridges); preserve account header, order/payment/history/wishlist and ordinary recommendation lists. Hide native coin/pig entry views at their render boundary, including fallback entries. Keep popup and splash controls separate. The separate recommendation factory also skips its `marketingFloorChoice` floor while retaining category tabs. No reranking, price manipulation, disclosure-only hiding or guessed sponsorship from product titles.

A view-text blacklist would be locale-dependent and leave gaps; blocking all network recommendations would remove useful products. Source-identified component filtering is the selected implementation approach.

## Limits and acceptance gates

Client metadata cannot establish that the server's remaining ranking is unbiased. Remote templates and WebView campaign pages require runtime verification. Fast & Free is the `navigation_choice` menu destination (MainActivity and TabBarDecoratorDelegate). Gate `MenuItemImpl.isVisible()` for this resource ID. This filters both the native visible-item count and bound view without mutating the menu during construction or shifting other IDs. The private campaign destination remains reachable through externally supplied deep links; remote page internals are not yet verified.

Build and regression checks must use the complete local verification command. Patch the exact owner APK and inspect applied/failed patch identities. Then one bounded emulator session: Home, paginated recommendations, query search, product detail, account orders/history/wishlist and removal of campaign/game entries. Attach existing Frida observation before stimuli; no phone authorization is implied. Keep the goal open until real target acceptance closes every surface. Do not promote to main or publish without owner confirmation.

## Review correction

The initial raw structure-edge filter was replaced before runtime: both native parsers apply delta insert/replace/reload independently of those edges, and omitting cached component targets can break reload. `zq.b.b()` creates fresh wrapper arrays from the full native parser state and constructs `cr.b`; both Home (including HomeCacheParser) and MyAE consume these arrays. Filtering this normalized displayed-list boundary leaves native component maps and all delta operations intact. Unit regressions preserve parser structures/delta targets and exercise full/delta-equivalent visible lists. The initial setVisible mutation during binding was replaced by an isVisible predicate to avoid synchronous presenter reentry.

The new native promotion patch advertises only the supplied 8.180.1 build 80005998. Existing patches retain their existing 8.180.0 support; no claim is made that obfuscated native wrapper bindings were verified on an unavailable older APK. Metadata, Android build and generated documentation need one affected-check checkpoint after this restriction; existing behavioural test evidence remains valid.

## First acceptance result and connected correction

The exact candidate installed and started on an owned read-only API36 instance. The unchanged observer covered main before Activity resume. Back from optional registration exposed the native registration-retention gift dialog (`SkyShellActivity.onBackPressed`, preference `CAN_SHOW_RETAIN_USER_DIALOG`); it is separate from the coupon popup framework. A subsequently discovered `:channel` process was not covered. UI stimuli stopped, logs/screenshots were retained, clients/server/forward/emulator stopped, and original baseline size/mtime identity was verified unchanged. Home, feeds, search, details and account acceptance remain open; this was not a passing run.

The correction filters only the native retention-eligibility boolean after SharedPreferences.getBoolean, preserving in-progress sign-in guards, back-stack handling and onLoginCancel callbacks. The existing Frida CLI await command must watch `com.alibaba.aliexpresshd:channel` before main is spawned/resumed on the next bounded acceptance run; neither observer source nor hooks change. The restored stock APK was rehashed and still matches the original SHA-256 above.

## Second acceptance result: failed

With the corrected registration guard, both main PID 3994 and channel PID 4371 reported unchanged-observer hooks ready before UI input. Native registration cancellation advanced without the gift retention dialog. Notification permission was declined and optional cookies rejected through the app's normal UI. Home then loaded paid Ad-labelled cards, a new-shopper coupon floor and the Fast & Free tab. This contradicts the intended filtering behavior; feeds, search, details, account-game removal, pagination and switch behavior are not accepted. No publication or promotion is authorized.

UI stimuli stopped at the failed Home checkpoint. Existing crash/exit evidence and screenshots were retained; both Frida clients, the owned server, forward, logcat and emulator were stopped. Read-only baseline image size/mtime checks matched. No physical phone was used.

Inspection of the final APK confirms installed-patch description methods return the intended strings, feature gates still call those methods and default to enabled, and the JSON return hooks and native bridges exist. The stock APK also passes cryptographic signature verification and contains no custom extension classes. AliExpressApp inherits AEApp.onCreate. Static evidence therefore does not show a folded-away switch or an already-patched input.

Home has legacy ANC and newer harness routes. ANCContainerView.setBody/List sends IAncItemModel data to AsyncListDiffer after separate UI-token transformation, while cr.b is a narrower normalized protocol route. The existing lifecycle/crash observer cannot establish which route and P4P shape the displayed cards use, nor why the navigation predicate does not hide the tab. A named, bounded read-only control/payload-shape inspection was requested under AGENTS.md's validation-tooling freeze; it has not been created or run pending owner approval.

## Native-cache diagnosis and next connected batch

A separately bounded diagnostic used the unchanged observer and built-in Android dumps/cache copying only. No custom inspection script, hook, fixture or runner was added. Both main and channel reported hooks ready before input. The installed APK SHA-256 matched the failed candidate. Original baseline image metadata matched after all owned resources stopped.

Activity state identifies ANCHomeTabViewPagerFragment -> KRHomeFragmentV5. Its native cache contains a previously unmatched `ahe$home-coupon-package-*` floor and `rainbow.rainbowType=channelProduct` entries linking into deal channels. Remaining ordinary prices must not be reinterpreted as generally available deal prices, so channel-only products are removed whole rather than having their conditions relabelled.

The supplied source also reconstructs snapshot products directly from IDMComponent into j8.c/AHEListBean (`nk0.d`), including its P4P object, outside the lazy JSON-array getter. The final ANCContainerView body/sticky/section-list setters are shared by these native models and normal response models. The new batch filters there using exported IAncItemModel/IDMComponent getters, copying changed lists without mutating the parser's lists, cache, or section grouping. These bindings are installed only for 8.180.1 build 80005998.

The native navigation view was already GONE in the captured initial hierarchy, so a completely inactive switch is not the explanation. DefaultBottomBarDecorator and its optimized country implementation both read `isHiddenChoiceTab`; the later native refresh controls the separate overlay frame as well as MenuItem visibility. The batch binds that existing hidden state after config parsing, retaining the native ordered refresh rather than changing a menu during construction. Native recommendation-tab models (`MTL-Tab` / `nt_rcmd_tab`) are removed; normal category/filter controls remain.

Required checkpoint: affected Android build/unit checks, exact-stock-input patch with all expected patch identities and SDK signature verification, and generated bilingual documentation checks. Earlier unrelated release/Python/Medium evidence remains valid. One subsequent bounded acceptance session must check settled Home, delayed campaign updates, feed pagination, search, detail, account/game surfaces and switches. The goal remains unproven until those gates close.

The final presentation filter also keeps native top-bar and navigation configuration (`ae_home_kr_topBar`, `ae_home_tabbar_choice`), since those payloads carry ordinary icons and message state. Campaign appearance is suppressed through the native hidden-tab state and rendered item filtering. The global JSON-array hook remains paid-placement-only so it cannot strip template-catalogue entries. These connected preservation corrections were completed before runtime acceptance.

## Rendered-model acceptance and canonical product correction

The next candidate removed the coupon floor, recommendation-tab strip and Fast & Free navigation in the observed settled Home. Ad-labelled and Bundle deals cards remained; input stopped at that failed checkpoint. Both owned processes stayed covered and the original read-only baseline was unchanged after terminal cleanup. No cache/homeData directory existed at the final collection point, so that collection is not claimed as successful.

Source tracing resolves the model ownership mismatch: `AHEListBean.onParse` stores the full product JSON in its model and decodes its paid marker in p4pObj before returning a legacy view model. `j8.c.getData()` returns its presentation component, while the AHE holder constructs that component later. The earlier final-list filter could therefore receive a null or minimal presentation map even though the product bean already contained paid and channel metadata. Newer product models separately retain their raw JSON and decoded P4P object.

The correction reads canonical legacy product models and newer raw models alongside the existing presentation fallback, and uses the SDK's decoded paid marker. It does not infer sponsorship from titles or analytics parameter names. Existing read-only-list/section preservation and native tab policy are retained. Earlier Home coupon/tab/navigation evidence stays valid; paid/channel feed removal and the remaining shopping/Account gates still require acceptance.


### Canonical model candidate: runtime result

The next connected batch added exact legacy AHE bean and newer raw/decoded paid-marker bindings. The Android and bilingual documentation checkpoint passed, the original APK patched with all ten expected patches, and the resulting APK passed signature verification. Single-class decompilation confirmed the generated bridges and their call sites in the actual candidate.

The bounded emulator acceptance failed on Home: cards explicitly labelled Ad remained visible, as did a native recommendation tab strip. No pagination, search, product-detail, Account or switch acceptance followed this failure. Main and channel observer attachment was established before UI input. All owned runtimes were stopped; the documented baseline file metadata remained unchanged. See the private runtime4 receipt and screenshot. This candidate is not ready for promotion or publication.

Existing logs do not expose the runtime model class or patch-switch values for escaping cards. A named request is pending for one bounded control-state inspection observer; no inspection script or bundle has been created. No further speculative product changes or repeated UI acceptance is justified until this missing runtime fact is resolved.


### Section-body submission gap

Offline inspection found a missing native submission path: `ANCContainerView.setSectionList` only records grouped section metadata, whereas `setSectionBody` independently flattens its argument and calls `AsyncListDiffer.submitList`. Only the former was hooked. The connected fix applies the existing grouped-list filter to both methods, keeping section groups and original model identities. Existing copy/preservation and independent-switch tests cover that helper. Runtime coverage remains unproven until the next bounded acceptance. This concrete source gap permits further product work without changing observation tooling.


### Section-body candidate: acceptance remains failed

The generated APK contains the new grouped-section render hook; exact ten-patch application, cryptographic signature and Android/documentation checks passed. The first runtime could not reach observation readiness: Android killed the paused process after exactly ten seconds with INITIALIZATION FAILURE / start timeout. No UI input occurred. A separately justified retry of the remaining mandatory acceptance gate used the standard Frida CLI automatic resume, unchanged observer and same APK.

The retry reached settled Home with main PID 4083 and channel PID 4431 traced before UI input. The installed base APK SHA-256 matched the candidate. Home still displayed paid Ad cards and campaign recommendation tabs. Further stimuli were stopped immediately; pagination, search, detail, Account and switch acceptance remain unproven. All owned clients, server, forward and emulator were stopped, and reusable baseline metadata was preserved. See private runtime5/runtime6 receipts and runtime6-home.png.

The section submission gap alone does not explain the actual escaping models. The current blocker is the still-unapproved named control-state/model inspection. Do not publish this candidate or repeat acceptance based on further guessed bindings.


### Approved bounded model inspection

The owner approved the exact control-state inspection and compiled bundle. The single emulator-only inspection finished within five minutes, used the unchanged main/channel lifecycle observer plus only the two approved inspection hooks, emitted twelve bounded inspection events, and preserved the baseline. No product values or account data were recorded.

Both feature flags were true. Native outer Home submissions included `nj0.a` wrappers with the recommendation payload at `fields.data[].mods.listItems`. The ordinary legacy `j8.c` filter did execute and reduced a twenty-card list to eight by classifying channel deals. The first native header submission also contained `ha.d` with null presentation/product JSON; source confirms its `RcmdTabBean.getTypeName()` is `nt_rcmd_tab`. The captured screen still showed an Ad card and campaign tabs.

The next product batch filters only the identified nested product lists before their separate parser, checks field-level template names, and reads legacy native bean type names before presentation binding. Protocol component dictionaries, delta targets and template catalogues remain intact. Added regression cases cover independent flags, ordinary order/object/price preservation, array and map payload envelopes, and unrelated lists/catalogues. Runtime result remains unproven until the next grouped checkpoint and bounded acceptance.


### DSA Ad disclosure without the normal p4p object

The outer-payload batch removed the native campaign tab strip in the real emulator. Native accessibility evidence still contained Ad TextViews. Two preceding attempts were incomplete because the host emulator aborted inside an internal gRPC callback; disabling the WiFiPacketStream/Uwb/GnssGrpcV1 backends through existing launch flags permitted the bounded Home capture without changing the reusable baseline. The final installed-hash capture was interrupted during cleanup and is not claimed as collected.

Offline inspection of the stock `ahe_app_rcmd_new_card/10136/main.ahe` found a second disclosure input, `model.trace.custom.p4pExtendParam`, beside the DSA disclosure strings. Its leading printed exclamation mark in naive strings output is the binary string length byte 0x21 (33), not a negation operator. In the already retained native Home cache, six of nineteen product rows have this nonempty extension despite no normal p4p object; each extension decodes to company_name/store_name metadata. No seller values were exported into the report. The next product batch classifies this exact Ad-contract field as sponsored, with both string and object forms; empty values and unrelated trace fields remain preserved. Regression cases retain ordinary object identity/order/prices and independent toggles. Runtime closure remains required.


### Feed verified; detail upsells found and batched

The unchanged DSA-marker APK showed a clean settled Home, then the next focused session completed three pagination swipes with no native Ad nodes while ordinary products remained. The actual installed APK hash matched the candidate. An ordinary product opened with a real price, reviews, delivery information and Add to cart. Its detail still showed Extra 1% off with coins and coupon Collect rows; acceptance stopped at this failure before search/Account/switch testing. Both app processes remained covered until planned force-stop, and the reusable wireless API36 baseline metadata was unchanged. Explicit -BluetoothEmulation alongside the existing radio feature flags avoided the host gRPC crash for this session.

Offline stock page-flash processors identify separate offer-only AHE floors: galaxy_coupon_block, galaxy_kr_coupon_merge, galaxy_non_coupon_interest, galaxy_kr_interest_merge and galaxy_main_mind, plus their legacy counterparts. They are distinct from price banners, SKU selection, reviews, lowest-price information and native shipping. The next connected batch filters those named floors at normalized and rendered boundaries, handles Ultron array-valued type names (also used in Account), and gates the nullable native coin-entry factory. It retains the existing product price/purchase policy and coin account/grant methods. Unit cases preserve the actual shopping floors and independent switches. Runtime closure remains mandatory.


### Account guest header artwork

The next exact APK verified removal of Account's games/coin row and coupon blocks, while orders, history, wishlist, owned coupons, payment entries and Settings remained accessible. Its logged-out header still carried Fast & Free campaign artwork, so the session stopped and later gates remain open. Stock DefaultGopData.DEFAULT_HEADER identifies the optional bgImg field independently of signUrl, signTip and userID. The connected fix removes only bgImg from native/modern Account header models at their existing constructor boundary, including the fallback path. It does not change authentication or remove profile/settings controls. Unit coverage preserves all other header fields. Runtime verification remains required.


### Guest header native fallback correction

Clearing bgImg alone was insufficient: the separate AHE header retained its pig/ticket campaign artwork, while the removed backdrop reduced text contrast. The failed result was preserved and runtime stopped. The connected correction selects the app's already-registered native myae_native_header floor through its public model layout fields, keeps the native profile/sign-in toolbar, supplies only the app's existing fallback signTip/signUrl when absent, and keeps the toolbar in its normal readable contrast state. Signed-in identity/authentication policy and original click listeners remain intact. The disabled promotion switch preserves the native unmodified header path. This is a product-layout correction, not an observation change. Runtime verification remains mandatory.


### Remaining remote Account floor

The native-layout correction produced a readable Sign in/Register toolbar and settings control, but a separate AHE guest campaign floor remained below it. Existing native hierarchy capture locates an anonymous 533-pixel AHERootView; the small Account preference capture contains only an experiment boolean, not floor data. No corresponding Account header template is bundled in the original APK. Runtime stopped with baseline unchanged; the actual installed hash matched the current candidate. The follow-up request changes only the existing inspection source/bundle to record internal floor names for Account submissions, under the same bounded message/model limits and a single five-minute emulator run. No follow-up observer changes have been made.


### Approved Account-only capture closes the floor-identity gap

The owner approved the named follow-up source/bundle change. The same two hooks recorded only Account submissions, with five batches, at most twenty models per batch, and sixteen messages; the single emulator session and cleanup finished within five minutes and baseline metadata matched. No product/account values were emitted. The server batch identified the remaining hero as myae_unlogin_tips_us (imgUrl/actionUrl/button styling) and the sale/countdown fusion strip as MyAE_Native__top_sticky__ (isBigSale/countdown/bigSaleLink). Both differ from myae_native_header, myae_numbers, myae_grid_common and the genuine order/appeal floor. The next product batch removes those named campaign families and the source-identified myae_coupon_banner family, while retaining native sign-in/profile and ordinary account controls. No further observer expansion is required for this batch. Runtime closure remains mandatory.


### Search app-bar campaign submission

The identified Account hero and sale-strip filters passed real target acceptance: the plain sign-in/settings toolbar, orders/history/wishlist/owned coupons/payment and ordinary recommendations remained. Both patch switches were changed independently, observed in native checkbox state, restored to enabled, and the private patch-preference file retained. A focused usb cable query produced ordinary products with no native Ad nodes. Its separate 11.11 sale/countdown header remained, so further stimuli stopped before detail verification.

Stock source identifies that header as the bigSaleBanner model in the native AncAppBarLayout sticky/slide/collapsible submission, separate from ANCContainerView product lists. The next connected batch filters that submission using the existing copy-preserving model filter and a checked modern view-type getter, including optional single collapsible models. It retains query/sort/category/brand/shipping controls, all native parser model dictionaries and normal refresh behavior. Regression cases preserve ordinary app-bar models and disabled-switch identity. Runtime closure of this header and the prior detail-offer batch remains mandatory.


### Bundle campaign route family

The next real search run verified the countdown header was removed while native query/sort/brand/shipping controls and Ad-free products remained. It exposed quantity-conditional Bundle deals cards, so further stimuli stopped before detail testing. The retained original native Home payload identifies the explicit owned campaign path /ssr/300000512/BundleDealsDutyCovered under rainbow.url. The next batch adds that exact route family to product-level promotion classification as well as rainbowType=channelProduct; it does not guess from translated labels, product names or prices, and never relabels a conditional amount as a normal price. Tests preserve disabled-control behavior, actual prices, ordinary routes and lookalike-host safety. Runtime closure remains required.


### Isolated runtime and exact detail price payload

The owner requested a new emulator and approved the older shared build-cache cleanup. A task-private API36 Google APIs AVD was created without modifying or interrupting shared baselines. The reused Frida input had been removed from the other task's scratch folder; it was restored from the official 17.23.3 release and verified byte-identical to prior SHA-256 8887fb3dc84222416e2cdde706a10037c920df01d7858025168739d926c2fe17. The observer remains unchanged and both inputs now live in private task-owned storage.

The real product-detail run retained price/cart, ratings, shipping information and lowest-price text; the coupon Collect row was removed. It still displayed a coin upsell and a price-banner countdown, so the session stopped. Private native payload/template capture identifies the text-only ahe$galaxy_price_extend/10300 template as the coin benefit row, not the actual price. The downloaded price_us_galaxy/508 template binds its optional bannerInfo separately from price/tax/quantity fields. Stock AIPriceHolder.T passes those fields directly into the renderer; i20.a stores the same fields from GalaxyComponent for initial/cached rendering. The connected correction removes the two price-extend offer floors, clears only bannerInfo at initial model creation and subsequent SKU renders, and preserves price/tax/quantity/lowest-price data. The earlier assumption that price_extend was core price data was disproved by this payload. Runtime closure remains required.


### Final product-flow closure

The isolated AVD reused initialized app data through an in-place signed upgrade. The ordinary product detail displayed its genuine price, VAT/import information, shipping, options and Add to cart, without the coin row, coupon collection offer or countdown. Changing Brown to black and selecting a size updated the product while preserving price/cart and no campaign banner. An exact usb cable query returned ordinary products with no native Ad, Bundle deals or countdown labels; further search results remained clear after two pagination swipes. Native Account sign-in opened authentic registration/login UI and cancelled normally, with no credentials entered. Main and channel remained covered through the UI actions, and the installed APK hash matched the candidate. Initial back navigation was observed during an asynchronous transition; a subsequent read-only layout confirmed Main before further input. No source, hook or app policy was changed during acceptance.

Private receipt isolated-runtime3-receipt.json separates those passing product observations from the late VM-stop incident. Runtime clients, server, forward, logcat and emulator were subsequently confirmed terminal. The temporary profile and raw payload storage are removed after compact evidence is retained at terminal delivery; shared baselines remain untouched. Remaining server ranking is outside the client's observable metadata contract: retained products keep their original order and price data, and no claim of server ranking neutrality is made.
