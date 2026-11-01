# Tumblr 46.9.1.100 app map

Static notes on the Tumblr build HushTumblr targets, taken from the APK with a dexlib2 probe on 2026-10-31. Use it to find hooks again when Tumblr ships a new version. Obfuscated names (three or four lowercase letters, like `rm8`) change with every release, so each one below says how to find it again by shape.

## The APK

| Fact | Value |
|---|---|
| Package | `com.tumblr` |
| Version | 46.9.1.100, versionCode 1460901100 (stable) |
| SDK | minSdk 26 (Android 8.0), targetSdk 36 |
| Shipped as | Split bundle only on APKMirror (base plus 4 ABI, 7 density and 14 language splits) |
| Bundle | `tumblr-46.9.1.100-1460901100.apkm`, 42,582,435 bytes, SHA-256 `87df0c0e3d57eb4b280092e2f3a6c521c7692dc3e684b33cd8e65ecbe18b4eec` |
| Merged APK | `tumblr-46.9.1.100-1460901100.apk`, 86,565,531 bytes, made with `scripts/MergeSplits.java` |
| Dex | 9 files in base.apk, about 57 MB, 69,948 classes |
| Application | `com.tumblr.App` |
| Launcher | `com.tumblr.ui.activity.JumpoffActivity` |
| Signer | `CN=Tumblr, OU=Tumblr, O=Tumblr, L=New York, ST=NY, C=US`, v2 and v3 schemes plus a Google source stamp |
| Cert SHA-256 | `39ac9c821ad2d605e4849f066e8aad3cca27d5e13eb03ad8755be234a2985dfd` |
| Cert SHA-1 | `cd177dd4057daf3af7eca430825ee7dc08ad56fa` |
| APKMirror path | `tumblr-inc/tumblr` (titles read "Tumblr: Social Media & Art") |

Tumblr keeps the real names of its API models (`com.tumblr.rumblr.model.*`, `com.tumblr.rumblr.response.*`) and of `com.tumblr.UserInfo`. Most other code is renamed by R8.

## Feature flags

Tumblr reads 217 server-controlled flags from `/v2/config`. They live in one enum, `rm8` in this build.

- **Find it:** the enum whose static initializer holds the string "Whether or not we should show the Tumblr Blaze landing page banner". It also has fields named `FEATURE_BUCKETS`, `immutableFeatureStateMap`, `analyticsFeatureReadStateMap` and `analyticsFeatureExposedStateMap`, and its companion holds "You're checking for Feature.isEnabled() with a non-boolean bucket!".
- **Constant names are kept** (`IN_APP_UPDATE`, `AD_FREE_CTA_BANNER` and so on). `toString()` turns them into the API's camelCase (`inAppUpdate`, `adFreeCtaBanner`).
- **The check path:** the static checks `l(rm8)Z` and `p(rm8)Z`, the instance checks `n()` and `o()` and the varargs `i(rm8[])Z` all end in the companion (`rm8$b`). `d(rm8)Z` caches the answer in `immutableFeatureStateMap` after asking `e(rm8)Z`. `e` calls `f(rm8, bucket)Z`, which calls `g(rm8, String)Z`.
- **`g(feature, expected)`** reads the server value through `ok5.d(ok5, rm8, Z, I, Object)String` (a default-argument bridge to `ok5.c(rm8, Z)String`), compares it with `expected` ignoring case, logs the exposure through `l(rm8, Z)` and returns the result. Hooking the result right after its `move-result` (before the `l` call) overrides every boolean check, including the cached one, since the cache stores what `e` returned. A flag override applies after Tumblr restarts.
- `ok5` is the configuration holder. It also carries `AdPlacementConfiguration`, `Gdpr`, `Privacy`, `ClientControl` and `Dismissals`.

Flags worth a switch (all boolean):

| Area | Flags |
|---|---|
| Updates and nags | `IN_APP_UPDATE`, `IN_APP_PLAY_STORE_REVIEW`, `ENABLE_REPROMPTING_APP_REVIEW`, `AD_FREE_CTA_BANNER`, `SCREENSHOT_INTERCEPTION` |
| Tumblr TV | `TUMBLR_TV_MOBILE_NAV`, `TUMBLR_TV_ONBOARDING_REDIRECT`, `VIDEO_HUBS_RELATED_NUDGE` |
| Blaze | `BLAZE_DASHBOARD_ENTRYPOINT_IN_USER_BLOG_HEADER`, `BLAZE_DASHBOARD_ENTRYPOINT_NEAR_PREMIUM`, `BLAZE_NUDGE_AFTER_POST`, `SHOW_BLAZE_SETTINGS_BANNER`, `TUMBLR_BLAZE_LANDING_PAGE_BANNER` |
| Communities | `COMMUNITIES_TAB_BAR_ITEM`, `COMMUNITIES_TOOLTIPS`, `COMMUNITIES_SEARCH_TAB` |
| Ad requests | `MAKE_ADX_REQUESTS`, `MAKE_APS_AD_REQUESTS`, `MAKE_DISPLAY_IO_REQUEST`, `MAKE_DISPLAY_IO_INTERSCROLLER_REQUEST`, `MAKE_FAN_REQUESTS`, `MAKE_NIMBUS_CLIENT_AD_REQUESTS`, `GOOGLE_BANNER_ADS`, `GOOGLE_NATIVE_ADS`, `GOOGLE_REWARDED_ADS`, `SMART_BANNER_ADS`, `RENDER_NIMBUS_ADS`, `RENDER_VUNGLE_ADS`, `RENDER_DISPLAY_IO_INTERSCROLLER_S2S_ADS` |
| Tracking | `LIVERAMP_ATS`, `ENABLE_OM_SDK`, `MOAT_VIDEO_AD_BEACONING`, `LITTLE_SISTER_MOAT_LOGGING`, `SEND_FEATURE_EXPOSED_ANALYTICS`, `SEND_NETWORK_USAGE_DATA`, `SUPPLY_LOGGING`, `MOBILE_PERFORMANCE_LOGGING` |
| Shop and premium | `TUMBLRMART_EARNED_BADGES_NOTIFICATIONS`, `PREMIUM_PERK_GIFTS`, `TUMBLR_FREE_PREMIUM` |

Turning an ad-request flag off is a second line behind the feed filter, not a replacement for it: server-side ads (`GEMINI_AD`) arrive in the timeline whatever the flags say.

## Timeline

- `com.tumblr.rumblr.model.TimelineObject` wraps one feed item: `getData()` returns a `Timelineable`, and the metadata adds `isShowSponsoredLabel()Z`, `getSponsoredBadgeUrl()`, `getRecommendationReason()`, `getPlacementId()` and `getServeId()`.
- `Timelineable.getTimelineObjectType()` returns `com.tumblr.rumblr.model.TimelineObjectType`. Its ad and promotion constants in this build: `GEMINI_AD`, `FACEBOOK_BIDDAABLE` (Tumblr's spelling), `NIMBUS_AD`, `DISPLAY_IO_INTERSCROLLER_S2S_ADS`, `VUNGLE_AD`, `CLIENT_SIDE_AD`, `CLIENT_SIDE_MEDIATION`, `DISPLAY_IO_INTERSCROLLER_AD`, `GOOGLE_NATIVE` and `BLAZED_POST`. Other notable ones: `COMMUNITY_CARD`, `COMMUNITY_ROW`, `VIDEO_HUB_CARD`, `VIDEO_HUBS_ROW`, `TRENDING_TOPIC`, `TAG_RIBBON`, `BLOG_CARD`, `CAROUSEL`, `TIMELINE_MESSAGE`, `BANNER`, `RICH_BANNER`, `ANNOUNCEMENT`. `COMMUNITY_CARD` (`list_item_community_card_dashboard`) is the card a feed suggests, alone or in a carousel. `COMMUNITY_ROW` (`list_item_community_row`, root `community_row_root`) is a line of a list of communities: a category of Communities' Browse page (`CommunitiesBrowseActivity`) and a search's Communities tab. Browse, its categories and the Communities landing page load through `TumblrCommunitiesTimelineService` as a `WrappedTimelineResponse`, the dashboard's own response, so the call stack can't tell them from a feed and Hide suggested communities takes cards only. A suggested tag carousel is a `CAROUSEL` whose items are `TAG_CAROUSEL_CARD` (model `TagCarouselCard`: `isFollowed`, `items`, `borderColor`), headed by a `TITLE` ("Check out these tags", "Trending on Tumblr today", "Related tags" on a search's Posts tab, "Explore more #tag" on a tag's page). A page of lone `TAG_CAROUSEL_CARD` items is the carousel loading more of itself. `FOLLOWED_TAG_CAROUSEL_CARD` (`FollowedTagCarouselCard`, no follow state) is a tag you follow. `SIGNPOST` (`Signpost`: `display` with title and media, `resources` with description and options) is "Know someone who'd love #tag?" between a tag's posts and the "Follow tags to get updates here" message of an empty Your tags tab, a page with no posts. A search's Tags tab is `TITLE`, `COMMUNITY_HUB_HEADER_CARD`, `TITLE`, `TAG_CARDS_COLLECTION`.
- Ad models: `ClientAd`, `NimbusClientAd`, `advertising.ServerSideAd`, `advertising.SimpleAd`, `BlazedPost` (which wraps a `post.Post` and a `blazerBlog`).
- **Lists to filter**, both reached from Moshi with the parsed list as the first argument:
  - `Timeline.<init>(List, PaginationLink)` (wrapped by `WrappedTimelineResponse`, the dashboard path).
  - `TimelineResponse.<init>(List, PaginationLink, Map)`, the base of `PostsResponse` (blog posts), `LikesResponse` and `BlogSearchResponse`.
- **What a page was parsed for.** A page with items is only built inside a generated Moshi adapter's `fromJson`, so that adapter is on the call stack when the list hook runs, and Moshi finds these adapters by name, so their names are kept. `Timeline.<init>(List, PaginationLink)` is called from `TimelineJsonAdapter.fromJson` alone. Ten adapters read a `Timeline` field, and each asks Moshi for it in its constructor (`const-class Timeline`):
  - Search: `response.SearchResultsResponseJsonAdapter`. Every search tab is a `GraywaterSearchResultsFragment` (`SearchActivity$f.X(I)` builds nothing else). It loads `TumblrCommonService.searchTimeline` (`GET timeline/search`) and then `searchTimelinePagination`, the only two calls that return a `SearchResultsResponse`. Blog and community cards here are results, so the two suggestion switches leave them.
  - Feeds: `response.WrappedTimelineResponseJsonAdapter` (dashboard, Explore, hubs, the Communities tab), `response.CommunityHubResponseJsonAdapter` (`/v2/hubs/{hub_name}/timeline`, a tag's page) and `model.RelatedBlogsJsonAdapter` (the blogs offered beside a blog card).
  - The rest, where the cards are left alone: `response.PostNotesResponse`, `response.PostResponse`, `response.VideoHubResponse`, `model.post.PostReplyPreview`, `model.note.RichNote` and `model.answertime.AnswertimeResponse`.
  - `TimelineResponse.<init>` is called from the `fromJson` of the `TimelineResponse`, `PostsResponse`, `LikesResponse` and `BlogSearchResponse` adapters, the last three through their own constructors. All four count as feeds.
  - `TumblrCommunitiesTimelineService.browsePage` (`/v2/communities/categories`) and `categoryPage` load a `WrappedTimelineResponse` like the dashboard does, so nothing on the stack tells those two lists from a feed.
- **How a loaded page reaches the screen.** The dashboard, a blog's posts and likes and every search tab are built on `com.tumblr.ui.fragment.TimelineFragment`, and each page they load is handed to `TimelineFragment.p4(type, items, links, extras, fromCache)`. The type is the renamed enum `xrl`, whose constant for a next page is `PAGINATION` (that's the name its `<clinit>` passes, so `name()` reads it).
  - The items `p4` gets are a converted copy of the parsed list, built on another thread, and the dashboard's first page can come from a read made before the screen opened. Nothing ties that list to the one the list hook saw.
  - `p4` asks `items.isEmpty()` first. An empty `PAGINATION` page calls `R5()` when `y5()` isn't null and returns. The finished request stays in `TimelineFragment.W` (a `retrofit2.Call`) and the links in `PaginationFragment.k` aren't replaced. An empty page of any other type sets `PaginationFragment.l` (no more pages) and calls `P4()`, which shows the empty view, the "No results" screen.
  - A page with items clears `W`, calls `S5(type)` (it stops a refresh's spinner, or hides the loading row for `PAGINATION`), stores the links in `k` and clears `l`.
  - The next page is asked for from a row bind. `Z3()` posts a runnable that ends in `b6()`, which is `x6(PAGINATION, true)`, but only while `W` is null, `l` and `X` are false and two seconds have passed since `y`. `x6(type, flag)` is protected. It reads the link through `K5(type)`, which for `PAGINATION` is `k.d()` (`TimelinePaginationLink.d()`, a `Link` or null), and starts the request. So one empty `PAGINATION` page ends a feed for good, because `W` is never cleared again.
  - The paging hook goes right after `p4` keeps the `isEmpty()` answer (in `v7`, which held the extras), where the local `v1` is about to be written and so is free. `S5` and `x6` are protected, so the next load has to be made from code inside the fragment.
- `post.Post` is partly renamed. Its Blaze data is `BlazeCampaign` (field `O1`, getter `G()`) and `BlazeControl` (field `a2`, getter `h0()`). A post on your own blog can carry both, so they don't mark a paid placement on their own.
- **Filtered posts.** A post that matches one of your filtered tags or words arrives with a note, `post.asset.Filtered`, which `PostJsonAdapter` writes under "filtered" through `Post.c0()`. The note's adapter writes "tags" through `Filtered.b()List` and "content" through `Filtered.a()List`. The post's view model copies the two lists (an empty list when the note is null), and `GraywaterFragment` covers the post with "This post contains filtered tags" or "... filtered content" when either has an entry.

## Settings hub

The Settings screen is Jetpack Compose: `com.tumblr.settingshub.impl.hub.SettingsHubActivity`.

- **Rows:** the view model `settingshub.impl.hub.d` builds them in `K()List`. It starts a list builder (`p04.c()`), adds one `zj0` per row and freezes the list with `p04.a(List)List` just before returning. Appending a row means adding to the builder before that last call.
- **Row model `zj0`:** `<init>(ak0 kind, int titleRes, bpa icon, Integer subtitleRes)`, plus a default-argument bridge. The getters are `b()` kind, `c()` title, `a()` icon, `d()` subtitle.
- **Kinds `ak0`:** `PREFERENCES`, `NOTIFICATIONS`, `SUBSCRIPTIONS`, `LABS`, `PANEL` (only when `f73.a()`), `ACCOUNT`.
- **Icons:** `com.tumblr.compose.ds.icons.outline.<Name>Kt.get<Name>(Lus7;)Lbpa;` with `us7.a` as the argument. The set includes `Hide`, `Shield`, `Settings` and `Sparkle`.
- **Clicks:** the row's click lambda `hub.b$a` (fields `a` the event sink, `b` the `zj0`) sends `hub.c$b(kind)`. The view model's `I(ak0)` maps the kind to an Intent through `j1j` and the activity's `A3(a$b)` starts it, toasting "This section isn't available yet." when the target is missing. A row of our own is recognized in the click lambda by its title resource before the kind is read.
- **Row keys:** the list's key function is private static `hub.b.m(zj0)`, which returns the kind's `name()`. The lambda `t1j` reaches it through the synthetic accessor `hub.b.d(zj0)`.

## Dashboard logo

The "t" at the top of the dashboard is `com.tumblr.ui.widget.TLogoView`, a `FrameLayout` holding a `SimpleDraweeView` (`t_logo`, layout `view_t_logo`). Its layout names the class, so the name is kept.

- **Bind:** `tabbeddashboard.fragments.TabbedDashboardHostFragment.o6(View)`, called from `onViewCreated`, picks `t_logo_view_top_bar` when `APP_TOP_NAVIGATION_UPDATE` is on and `t_logo_view` otherwise, makes it visible and gives it a tap (`nmk`) with `TLogoView.setOnClickListener`, the only call to it outside the class itself. The logo is in `v1` at that call.
- **Listeners:** `TLogoView.setOnClickListener` wraps the listener in `ikk`, which runs the logo's own `d()` first when its flag `a` is set, and the constructor sets one too, so the view always reports a click listener. Nothing sets a long press or touch listener on it, so the settings patch's long press leaves the tap alone.
- `n6(TLogoView)` only recolors and animates the logo for `HUNGRY_HUNGRY_DASHBOARD`.

## Themes and colors

Tumblr colors a screen in three ways, and a palette's background has to change in all of them. Read on 2026-10-31.

- **Activity themes:** `ok0$a.J(yh0, int)` calls `setTheme` with the palette's style for that activity, but only when the palette's map names the activity (`wq6` for Dark, read through `gk0.b`). Screens the map leaves out never get a palette theme, and the Compose settings (`settingshub.impl.hub.SettingsHubActivity`, `settingshub.impl.preferences.SettingsPreferencesActivity`) are among them. Find it as the one instance `(activity, int)` method that calls `setTheme(int)` on its first parameter and then reads its own companion.
- **Older Compose theme:** `TumblrTheme` is `ejl.e(ke5, gam, sfm, rg9, tf5, int, int)`. Its colors come from `vam.<init>(Context, int)`, which wraps the context in the style `le5.a(ke5, boolean)` picks (`BaseTumblrTheme`, `.Dark`, `.GothRave`, `.LCD`, `.Pride`). The palette parameter defaults to True Blue and several callers leave it there whatever the person picked (the dashboard's `TitleViewHolder.r1`, the Blaze screens), so a True Blue theme turns up in a Dark session.
- **Design system:** `DsTheme` is `ku7.e(ke5, js7, rg9, tf5, int, int)`, found by its Compose note `com.tumblr.compose.ds.DsTheme (`. Its colors (`js7`) aren't read from a theme. Each palette has a holder whose static initializer builds them once from the color list `qr7`: `vq6` Dark, `w5m` True Blue, `m7c` Low-Contrast Classic, `xt9` Goth Rave, `zfg` Pride. System asks `njk.a(Configuration)` and takes `vq6` at night, which is how to tell the Dark holder from the rest.
- **The Dark holder's grays:** in `vq6.<clinit>` the gray behind a screen is `qr7.y()` (#0d0d0d, `ds_colorGray95`) at 37, 123, 284 and 288, filling `Chrome.chrome`, `Content.mobileContainer`, `Global.sideMenu` and `Global.topMenu`. The next gray up is `qr7.x()` (#1a1a1a, `ds_colorGray90`) at 39, 49, 113 and 292, filling `Chrome.panel`, `Chrome.mobile`, `Content.panel` and `Global.modal`. The group classes keep those names in `toString` (`it3` Chrome, `gt5` Content, `lr9` Global). The settings screens draw their bar and rows with `Content.panel` (`gt5.g()`).
- **Layouts:** the same eight surfaces are theme attributes for Views. `BaseTumblrTheme.Dark` sets `st_chrome`, `st_content_mobile_container`, `st_side_menu` and `st_top_menu` to Gray95, and `st_chrome_panel`, `st_chrome_mobile`, `st_content_panel` and `st_modal` to Gray90. The redesigned post card reads `?attr/st_content_panel` through its header, footer and shadow drawables.
- **Blog and tag pages:** `ey2.s(BlogTheme)I` is the page color a blog or tag timeline paints behind its cards, read from `BlogTheme.d()`. Those colors come from the blog, so no palette reaches them. Other direct readers of `BlogTheme.d()`: `ey2$e$a.e(BlogTheme)I`, `ey2$e.d(Context, BlogTheme)Drawable`, `AvatarBackingFrameLayout.b(BlogTheme, Z)V`, `ui/widget/c.j0` and `ntl.h`. `ey2.z(BlogTheme)I` reads `BlogTheme.u()` (`title_color`) and paints the title and description in `ui/widget/c.u0`. `ey2.n(BlogTheme)I` reads `BlogTheme.a()` (`link_color`) and paints the header's small text in `ui/widget/c.s0`. Neither looks at `s`, so a dark title vanishes on a dark page. Only `ey2.p(BlogTheme)I`, which runs `n` through `jmm.B` against `s` for buttons and links, picks a readable color by itself. `ey2.l` is the comparison that names all three getters by key.

## Fonts

Tumblr's own fonts reach the screen two ways, and post fonts share the first. Read on 2026-10-31.

- **AndroidX loader:** `lih.n(Context, int, TypedValue, int, lih$e, Handler, Z, Z)Typeface`, private static, found by its `Font resource ID #0x` failure text. Every resource font passes through it: `lih.c`, `h`, `i`, `j`, `androidx/appcompat/widget/f0.j`, Compose's `f60.c` and `d`, `f0l.f`, `g` and `m`, `s59.a`, `TabbedDashboardHostFragment$h` and exoplayer. Tumblr's own code never calls `Resources.getFont` or `TypedArray.getFont`, but Android's plain `TextView` does, past this method. A waiting callback gets its face from `lih$e.d(Typeface, Handler)V`.
- **Pre-inflated rows:** `eq0` (its tag is `AsyncViewProvider`) is built by `GraywaterDashboardFragment.T7` and `GraywaterExploreTimelineFragment.T7`. It inflates rows on the background inflater `wp0`, which has no AppCompat, so they're plain `android.widget.TextView` and `Button` objects that read `android:fontFamily` inside Android and never reach the loader. `dumpsys activity top` shows both kinds side by side on a cold dashboard under the same ids (`blog_name`, `header_cta`). Those rows leave through `eq0.c(int, ViewGroup)View`, found by its `Returning pre-inflated View for resId: ` log line. Its fallback `eq0.r` uses the parent's inflater, which gives AppCompat views.
- **Font picker:** `s59.a(Context, com.tumblr.font.a)Typeface`, static, 89 callers. Its Favorit cases go through `lih.h`, and `ROBOTO_REGULAR` and `ROBOTO_MEDIUM` answer `Typeface.SANS_SERIF` and `Typeface.create("sans-serif-medium", 0)` without loading anything. `UNKNOWN` answers null. The enum's own static initializer also holds `sans-serif-medium`, so a search on that string needs the picker's shape too.
- **Resource ids:** `0x7f090000` boop_spleen, `01` calluna_regular, `02` clarendon_text_pro_webfont, `03` clearface_regular_webfont, `04` fairwater_script_regular, `05` favorit_tumblr (an .otf), `06` favorit_tumblr_bold_700, `07` favorit_tumblr_medium, `08` favorit_tumblr_regular_400, `09` roboto_medium_numbers, `0a` source_code_pro_regular, `0b` ziclets_webfont. The ones a post's author can pick stay out of App font's list. Resolve ids by name, as they move between builds.

## Other anchors

- `com.tumblr.UserInfo` keeps its name and has about 40 static preference getters, 23 of them `()Z`. `G()Z` reads `pref_is_premium_user`.
- The blog notification reminder reads `blog_notify_enabled` in private static `rs2.l()Z`, used only by `rs2.s(View)Z`. The class owns a `PopupWindow` and a constructor reading `R$string.blog_cta_message`. Its show decision increments a per-blog reminder counter and shows at count 2. `BlogHeaderFragment.Y5()` and `BlogHeaderLegacyFragment.f6()` call it. The optional hook answers false at the decision's entry, without writing the preference. Deliberate subscriptions queue `PendingSubscriptionInfo` through `com.tumblr.ui.widget.a.u(String,String,Z)`, a separate path.
- Unsolicited gift prompts are scheduled by `BlogHeaderFragment.l6(Boolean)V` and `BlogHeaderLegacyFragment.t6(Boolean)V`, the only readers of `R$string.ad_free_browsing_gift_message`. Both construct `fr9` with `ref.GIVE_GIFT`, read its seen key and post a delayed callback. `fr9.h(Activity,View,float,OnClickListener)V` renders both those prompts and the crab tip. It reads `popup_gift_message`, `popup_gift_message_right` and `popup_text_message`, and contains `textMessage`. `fr9.p()String` exposes its instance key. Static `fr9.f(fr9)String` distinguishes `key_has_seen_ad_free_browsing_gift_popup` and `key_has_seen_summon_crabs_popup`. The optional render-time hook suppresses only the exact gift key, so queued callbacks use the current switch and crab/unknown keys stay native. Deliberate gifting bypasses this renderer through `BlogHeaderFragment.o6()` and `BlogHeaderLegacyFragment.w6()`, which call `hgd.T(...,"gift")` then `startActivity`.
- Play Core's in-app update library is present (`com.google.android.play.core.appupdate`) and gated by `IN_APP_UPDATE`.
- Ad and tracking SDKs in the dex: Google Mobile Ads, Amazon APS, Facebook Audience Network, Vungle (Liftoff), Mintegral, Smart AdServer, Nimbus, Display.io, LiveRamp ATS and the IAB Open Measurement SDK.
- Timeline spacing: `prl.h` draws the gap between timeline objects. Its branch for the `debug_timeline_object_spacing` debug option already paints each gap, which Line between posts reuses.
- Opening one post: `PostPermalinkTimelineFragment$a.b(TumblrService)Call` asks for a post by its id. That request answers through the same timeline list code as a feed, so the feed switches apply to it unless they're told it was asked for by name.
