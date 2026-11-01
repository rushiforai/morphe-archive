# Pinterest factory app audit for 14.39.0

This reference combines a signed-in survey of the original Pinterest Android app, targeted analysis of its APK, and a review of HushPinterest's source. It is intended for maintaining existing patches and choosing new ones.

The first survey ran on October 9, 2026 with Pinterest 14.38.0 (version code 14388010). A signed-in follow-up on October 12 captured the original 14.39.0 app (14398020), its native settings and pin actions, then completed the four-phase counter study. The detailed October 9 screen rows remain dated historical evidence. The four settings images below are fresh 14.39.0 captures.

## Read this first

| Reference | Contents |
|---|---|
| [Factory app map](pinterest-14.39.0-factory-map.md) | APK identity, signing, manifest, components, package layout and stable update anchors |
| [Advertising delivery](pinterest-14.39.0-ads.md) | Native content models, third-party ad configuration, GMA headers and payloads, current filters, gaps and acceptance criteria |
| [Tracking and privacy](pinterest-14.39.0-privacy.md) | All nine telemetry paths, ten startup jobs, eight manifest flags, identifier/referrer/link flows and limits |
| [Runtime measurements](pinterest-14.39.0-runtime.md) | Attributed network observations, CPU and media timers, background scheduling and battery measurement limits |
| [Patch coverage and customization](pinterest-14.39.0-patch-reference.md) | All 33 patches, native alternatives, concrete additions and a maintenance checklist |
| This page | Live screen observations, evidence boundaries, key decisions and the next investigation priorities |

The strongest immediate leads are GMA initialization and request-header boundaries, and the difference between visible filtering and network suppression. The typed shopping-story mismatch and the partial ad-hook coverage report found here have since been handled: Ads reads the typed story field and the settings page says "N of M parts" when only some targets matched. Native settings also cover more ground than the patch list alone suggests. Pinterest already offers theme, comment, notification, personalization and AI-content controls.

No patch behavior was changed for this audit. The reference distinguishes a code fact from a screen observation and from a proposal. It does not claim complete ad or tracking suppression.

## Baseline and evidence

| Item | Recorded state |
|---|---|
| Pinterest package | `com.pinterest` |
| Surveyed APK | 14.38.0, version code 14388010, SHA-256 `af6b383adb445cebee1ca43f14ac409f91475c1d62e0e11ef52ef52e29fb0553` |
| Audited APK | 14.39.0, version code 14398020, SHA-256 `4ecc7f9a34c89fd98d0e2133c294517772857b935969847bfd92b3e25b13e78d`. Static checks on October 10, signed-in survey and counter study on October 12. It was the supported build then |
| Supported build now | The one `patches-list.json` declares: 14.42.0, version code 14428010, on main as of October 31 (v0.0.13 targets 14.41.0). Nothing on this page was measured again on 14.40.0, 14.41.0 or 14.42.0, so its rows are 14.38.0 and 14.39.0 evidence |
| Original signing certificate SHA-256 | `341d6881b1ecf38361fbf8c8fbae0aa516b45375c39ef5e78b161869acc1bcfa` |
| Hush source reviewed | `932f0c5` for the survey, with 23 catalog entries. The references were refreshed at `6383001`, which had 26. The patch reference covers the 27 that ship in 0.0.7 |
| Published bundle at inspection | v0.0.5. v0.0.6 followed on October 10 and still targets 14.38.0. v0.0.7 followed on October 11 and targets 14.39.0 only. Later source changes are not assumed to be in any of them |
| Live environment | Android 13/API 33 emulator, x86_64, 1080 by 2400 pixels, English (United States), Wi-Fi |
| App installation | Original signed APK. No Hush extension or selected patches |
| Account | Signed in manually. Credentials were not part of the audit |
| Native theme | System default, appearing light |
| Account experiments | On October 9, Labs was already enabled and listed **AI Forward**, `search_ai_fwd_conversation`. This page was not repeated in the October 12 captures |
| Account preservation | Login survived a cold emulator restart. A named local snapshot and separately verified offline AVD backup were retained |

This is a factory **binary** baseline with an existing signed-in account. It is not a claim that every account preference is a new-account default. Server experiments, region, account history and app configuration can change the UI without changing the APK. The Labs finding is one reason to avoid treating these screens as universal.

The initial logged-out capture is in the [app map](pinterest-14.39.0-factory-map.md#clean-install-launch-survey). The signed-in survey inspected Home, organic pin details, overflow and Share, Search, Saved, creation entry and the settings described below. It did not save pins, follow people, message recipients, visit advertiser destinations or change account preferences. One neutral search was submitted. Browsing and searching can themselves affect recommendations.

### Evidence labels

| Label | What it establishes | What it does not establish |
|---|---|---|
| **Live** | A saved screenshot was visually inspected and its current UI hierarchy recorded | Every account, rollout or device has the same screen |
| **Measured runtime** | A timed capture or operating-system counter records activity under the stated protocol | Encrypted payload contents, universal behavior or causal battery savings |
| **Native static** | An instruction, annotation, resource or manifest node exists in the original APK | The branch ran, a value was populated, or a server received it |
| **Patch source** | Current code targets a particular boundary and implements a behavior | The reviewed source is installed on a phone or every runtime branch passed |
| **Documented by Pinterest/platform** | The linked official source describes a supported behavior | Exact implementation or account availability in this APK |
| **Candidate** | There is a specific investigation or patch opportunity | The hook has been implemented or verified |

Raw signed-in screenshots, hierarchy files and packet data remain local because they can contain account information, suggestions and history. Four account-name-free settings captures are included below. Evidence IDs in the survey table refer to the retained local capture sequence. Repeated return screens are omitted from the table.

### Measured runtime summary

The [runtime study](pinterest-14.39.0-runtime.md) was repeated on 14.39.0 on October 12 using cumulative primary-app-UID network counters and operating-system activity statistics. Six feed swipes received 2,319,319 bytes over the 184.99-second counter span and recorded 38.205 seconds of video activity. The following background counter intervals added 7,280 combined bytes with the display on and 6,868 with it off. The fresh guest packet capture has not been retrieved, so destinations and encrypted request contents are unverified.

The earlier 14.38.0 study remains separate. It captured 10,122 packets and correlated visible startup connections with Pinterest API/tracking and AppsFlyer service names. Those packet and service observations must not be attributed to 14.39.0.

Those byte totals use Android's primary-app-UID counters and the chapter's recorded counter intervals. They do not identify encrypted request bodies or assign every byte to an ad. A short background sample also cannot rule out the delayed workers found in the scheduler. The emulator provides software activity measurements. Physical battery drain remains unmeasured while the prepared phone is connected to USB power.

## How ads reach the screen

The APK connects ordinary Pinterest content requests with ad-bearing models and, on eligible paths, third-party SDK rendering. Ads are not confined to a separate banner request. The live survey found sponsored content mixed into Home and placed inside shopping modules on Search and an ordinary pin's detail page.

```mermaid
flowchart TD
    A[Experiments and consent] --> B[Cached third-party ad configuration]
    B --> C[GMA readiness and initialization]
    C --> D[Per-surface ad headers]
    D --> E[Pinterest content request]
    E --> F[Typed pins and modules with ad metadata]
    F --> G[Shared list holders]
    G --> H[Native presenters and views]
    F --> I[Third-party ad payload loading]
    I --> J[Embedded ad SDK]
    K[Hide ads startup guard] -.-> C
    L[Feed filtering] -.-> G
    M[Ad-view hiding] -.-> H
```

This diagram summarizes traced stages, not a promise that every ad follows one path. The [ad reference](pinterest-14.39.0-ads.md) gives the actual methods, fields and service paths. In particular, `ad_data.third_party` can carry an encoded payload, while helpers prepare `x-pinterest-gma` through `x-pinterest-gma-5` for several content surfaces. A separate `third_party_v2` model is a coverage lead.

Three outcomes need separate evidence when evaluating an ad patch:

- The placement is no longer rendered, including its empty container.
- The client avoids preparation, fetch or media work that is unnecessary once the placement is hidden.
- Impression or measurement events do not leave through another path.

The current shared-list hook supports the first outcome at recognized holders. It does not establish all three by itself. An item has already reached the app by the time its decoded model is filtered.

Pinterest publicly describes multiple image, video and shopping formats across browsing and search. That supports looking beyond one feed-card shape, but the source trace and live capture must establish which format a patch actually reaches. [Pinterest advertising formats](https://business.pinterest.com/advertise/).

## Signed-in screen survey

The detailed rows below describe the October 9 survey on 14.38.0. On October 12, fresh 14.39.0 captures repeated Home, an organic pin and its Share and overflow routes, Search, Saved, the creation entry, native settings, privacy, social permissions, content permissions, notifications, AI recommendation controls and populated comments. They do not repeat every historical subpage. Theme, Profile visibility, Labs, typeahead and Search filters keep their earlier date. The resource names under [stable live anchors](#stable-live-anchors-from-this-account) remain checked against 14.39.0.

### Home, pin actions and Search

| Step and evidence | Live result | Maintenance value and limits |
|---|---|---|
| 1. Home (`01`, `02`) | A two-column masonry feed, Home/Search/Saved at the bottom, Create and Inbox in the header. A promoted video was already partially visible near the bottom | The retained five-value navigation enum is not a five-button layout contract. Header controls and bottom tabs need separate coverage |
| 2. Scrolled Home (`03`, `04`) | A wide sponsored video card followed by image ads with a **Learn more** action, advertiser label and **Sponsored** text. Several promoted nodes coexisted with ordinary pins | Measure wide video and ordinary-width image cards separately. Do not infer an overall ad rate from one viewport |
| 3. Ordinary pin detail (`05`, `10`) | Image, visual-search button, reactions, comments, Share, overflow, Save and creator attribution. A comment preview and sponsored **Shopping ideas** appeared underneath | A pin can be organic while lower modules contain ads. Test nested module cleanup and avoid deleting the whole closeup |
| 4. Download education (`05` through `08`) | A blue tip said Download image had moved to Share. Early taps did not open the requested menu while the tip was visible. Leaving and reopening the pin removed it | First-use education can interfere with automation. This is a reproducible observation in this run, not a diagnosis of all tooltip behavior |
| 5. Native Share (`11`) | A pin-preview carousel, suggested recipient area, Copy link, Messages, Gmail and More | No recipient was selected. System-share integration should avoid stale pin identity and should preserve intentional pin selection. The first viewport did not show Download image |
| 6. Overflow (`13`) | See more, See less, Copy link, Download image, Add to collage and Report | Download image remained in overflow despite the tip. Preserve native feedback/report actions and distinguish them from passive telemetry |
| 7. Search landing (`16`) | Editorial artwork, recent searches and recommendation modules. Search expanded into the bottom bar with a visual-search camera icon | The search-history patch needs both the landing and typeahead paths. Header-only cleanup will miss this layout |
| 8. Typeahead (`17`, `18`) | Recent entries with removal affordances, then matching query suggestions after typing | Hiding history visually is different from stopping local persistence or server recommendations. No existing history entry was removed |
| 9. Results (`19`) | Searching **desk organization** produced a sponsored **Shopping ideas for you** group with six promoted product tiles above ordinary results. Topic chips and a Filter button floated above bottom navigation | A multi-item commercial module is a distinct regression case from a single promoted pin. Verify its heading, padding and wrappers disappear when appropriate |
| 10. Search filters (`20`) | All Pins, Videos, Boards, Profiles and Products. All Pins was selected, Apply disabled until a change | A content-type filter already exists. A default filter or remembered choice could extend it, but must preserve deliberate switching |

The advertiser destination domains displayed in descriptions are UI labels. They are not a list of servers contacted. No ad destination was opened, and a visible retailer name does not identify whether Pinterest, GMA or another path supplied the creative.

### Saved, creation and account settings

| Step and evidence | Live result | Maintenance value and limits |
|---|---|---|
| 11. Saved (`22`) | Pins, Boards and Collages tabs, a search field, voice-search affordance, Create and Settings. Pins showed an empty-state explanation and Explore Pins | Loaded-board download still needs a populated board. The audit did not manufacture saved content to populate this account |
| 12. Account menu (`23`) | Account management, Profile visibility, Refine your recommendations, Link to Pinterest, Social permissions, Content permissions, Notifications, Privacy and data, Reports and violations center, Labs, account and security entries | This account reached settings through the gear on Saved. Account and security routes should survive any header cleanup |
| 13. Privacy and data (`24` through `26`) | Seven advertising controls, Pinterest Canvas training, data request/deletion and cache entries | Native account preferences are independent of Hush's upload hooks. No switch, export, cache-clear or deletion action was submitted |
| 14. Social permissions (`28` through `30`) | Message settings, comment permissions and phrase filters, mentions, blocked accounts, similar products, video downloads and cellular autoplay | Existing native controls should be documented before adding duplicates. Wi-Fi autoplay exists in resources but was absent from this account's visible page |
| 15. Content permissions (`32`) | Automatic product tagging for current/future pins, with catalog-based explanation and a manually tagged-pin exclusion | Controls the account's own content. It is not a control for hiding shopping content while browsing |
| 16. Notifications (`34` through `36`) | Categories for created/saved pins, social activity, recommendations and other notices. Expanding Shopping Pins exposed separate Push, Email and In-app switches | Native preference choices and Android notification permission are separate layers. This audit did not receive a live push or prove delivery |
| 17. Account management and theme (`38`, `39`) | Account-management entry points, business conversion, app sounds and theme. Theme offered System default, Light and Dark | Day/Night is retained in resources but wasn't offered here. No theme or account state was changed. Account details stay out of public screenshots |
| 18. Profile visibility (`42`) | Private profile and search-engine privacy options | These affect who can find/view account content, not what telemetry leaves the client |
| 19. Labs (`44`) | Join Pinterest Labs was already enabled. Active experiment **AI Forward**, key `search_ai_fwd_conversation`, was displayed | Record experiment state during regressions. No experiment was enabled or disabled for this audit |
| 20. Recommendation controls (`46`, `47`) | AI content and Activity tabs. A global Show AI content control and nine topic switches appeared | Pinterest explicitly warns that some AI-modified content may remain. Hush's disclosure-based filtering has a different boundary |
| 21. Creation entry (`50`) | A sheet offered Pin, Collage and Board | The sheet was dismissed. Media access, editing, publishing, drafts, camera and upload behavior remain unexercised |

### Native preference details worth retaining

**Advertising.** The live Privacy and data screen names Use info from sites you visit, Use of partner info, Ads about Pinterest, Activity for ads reporting, Sharing info with partners, Use of Pinterest Activity and Ads off Pinterest. It separately exposes Use your data to train Pinterest Canvas. These controls should not be presented as effects of Hush's Disable analytics switch. Pinterest documents personalization controls separately from ad removal. [Pinterest personalization settings](https://help.pinterest.com/en/article/edit-personalization-settings).

**Social and media.** The word filters distinguish comments on the account's own pins from comments on others' pins. Similar-product recommendations affect shopping on the account's own content. Video-download permission refers to others downloading the account's 9:16 video pins and describes a username watermark. Cellular autoplay sits on this page too. Turning off playback should not be assumed to stop prefetch.

**Notification noise.** Recommendations include home-feed inspiration, interests, activity, suggested boards/searches, followed or suggested people's pins and Shopping Pins. Other categories include announcements, surveys/quizzes, reports/violations and Shuffles. The Shopping Pins description refers to saved-pin price drops. A useful cleanup should preserve user-requested price alerts when desired, and keep messages/security separate from recommendation noise.

**AI-content preferences.** The topics shown were Architecture, Art, Beauty, Entertainment, Fashion, Food & drink, Health, Home decor and Sport. This is an account recommendation control. The current local filter checks supplied disclosure metadata and cannot identify all unlabeled generated imagery. Per-topic filtering would require reliable topic metadata and an explicit rule for unknown topics.

<p>
  <img src="images/pinterest-stock-privacy.png" width="250" alt="Factory Pinterest Privacy and data advertising controls">
  <img src="images/pinterest-stock-social.png" width="250" alt="Factory Pinterest social permissions with similar products, video downloads and cellular autoplay">
</p>

<p>
  <img src="images/pinterest-stock-notifications.png" width="250" alt="Factory Pinterest Shopping Pins notification summary showing push, email and in-app state">
  <img src="images/pinterest-stock-ai-preferences.png" width="250" alt="Factory Pinterest AI-content recommendation controls with global and topic choices">
</p>

These four images were recaptured on October 12 with the original Pinterest 14.39.0 app. They show one account's observed state. The switch positions are not universal defaults, and the notification image shows channel summaries rather than expanded switches.

## Interface findings and customization opportunities

The app exposes many useful native controls, but their placement is uneven. Theme and sounds are under Account management, autoplay under Social permissions, and ad controls under Privacy and data. A Hush setup guide or native-settings shortcut could make these easier to find without taking ownership of account preferences.

| Finding | Evidence and effect | Practical opportunity |
|---|---|---|
| Commercial modules surround ordinary content | Home ads, related shopping and the search product grid were visible | Expand coverage by actual module type. Keep shopping filters separate from ads so users can retain organic products |
| Floating controls occupy the content area | Home navigation and search chips/bar overlap the lower viewport | Investigate optional compact navigation and chip suppression. Preserve back/settings access and scroll padding |
| Download guidance contradicts overflow contents | First-use tip versus live menu | Preserve both entry paths during updates. Add a comparison fixture for experiments that move native download actions |
| Suggested recipients are prominent in Share | Native Share screen | Keep system sharing as an explicit choice. Do not silently select recipients or rewrite unrelated board invitations |
| Native settings are spread across unrelated headings | Theme/autoplay/privacy routes above | Add accurate discovery/help links before designing duplicate toggles |
| Multiple meanings of “less AI” | Native preference versus labeled-pin removal | Explain both controls. Consider topic-aware filtering only after metadata research |
| Ad/network claims are easy to overstate | Filtering occurs after decoded content exists | Diagnostics should distinguish filtered models, collapsed views, skipped tasks and observed network attempts |

### Accessibility observations

The hierarchy supplied useful labels for Home, Search, Saved, visual search, Share, overflow, Save, promoted pins and filter radio choices. The search filter exposed its selection and disabled Apply state. Those are useful regression anchors.

Some compressed settings rows and menu parents had empty text/description even when text was visible. Several switched rows exposed text but no separate checked-state node in the compressed dump. This may be a result of node merging or the capture mode. It requires a TalkBack and uncompressed-tree check before being called an accessibility defect.

Floating navigation can cover part of a card in a still image, and gray secondary text, tiny overflow targets and the first-use tip deserve attention at large text sizes. The audit did not measure contrast, use TalkBack/Switch Access, test screen magnification or assess keyboard focus. It is not a WCAG compliance review. Any new hiding patch should check focus removal, content descriptions, traversal and empty space as well as pixels.

## Priorities for patch work

These were proposed work items when the table was written, so it is a historical list. Where a row says part of it has shipped, that part is current behavior, and what's left in the row is still only a proposal. The linked chapters contain concrete native anchors, risks and acceptance conditions.

| Priority | Work | Why it comes first |
|---|---|---|
| P1 | Verify nested shopping modules in search and closeups | Both were directly observed. Hide ads, Hide AI-labeled pins and Hide shopping now look one level inside feed modules and drop a module left empty, and Hide shopping also hides Shop the look under a pin. What's still proposed is checking wrapper/headline removal, preserved organic content and list pagination on a device |
| P1 | Trace GMA headers and lifecycle after toggles | Startup suppression does not tear down an already initialized SDK. Measure cold/warm starts and preserve native header cleanup before guarding additions |
| P1 | Compare patches against the measured factory network baseline | Guest capture now records app traffic and Android UID counters. Repeat equivalent workloads with patched configurations before claiming suppression or savings |
| P2 | Diff endpoints, SDK transports, startup tags and identifier readers on each APK update | Existing fingerprints can still match while upstream adds new telemetry |
| P2 | Trace APP_START, first-party referrer storage and optional request headers | The source constructs attribution data outside AppsFlyer. Determine whether final delivery is already covered before adding redundant blocks |
| P2 | Extend regional-host link handling | Plain pin links (off by default) already gives canonical pin links, resolves `pin.it` short links and covers the country-site hosts from the 14.39.0 app-link list. The APP_START attribution keys `mweb_unauth_id` and `amp_client_id` are still outside the removal set, and signed URLs and board or invite routes stay as they are |
| P2 | Check Hide survey prompts on a device | It landed in 0.0.6 and declines the invite through Pinterest's own Maybe later path. Keep security/account dialogs and user-initiated surveys intact |
| P2 | Make original image quality network-aware | Original-media choices can increase data use. Downloads now have optional unmetered and roaming limits, but feed image quality doesn't |
| P2 | Extend native controls with clear scope | Pinterest's own settings page with info rows for its native controls has shipped. Independent save/follow-up messages, autoplay/prefetch control and notification categories are still concrete leads |
| P3 | Check native toasts on a device | They landed after 0.0.6 in the settings patch, with Android toasts whenever Pinterest's toast layer isn't showing. Download board and Long-press download, the other two leads here, landed in 0.0.6 |

The repository's open issue intake was also checked. [Issue #3](https://github.com/SysAdminDoc/HushPinterest/issues/3) concerns release structure and update discovery, and [issue #4](https://github.com/SysAdminDoc/HushPinterest/issues/4) concerns combining patch sources. Neither is evidence of an ad or privacy defect. The historical version mismatch in #3 is not the current index state. The published index reported v0.0.5 at the first survey, then v0.0.6 on October 10 and v0.0.7 on October 11. Issue status and reporter confirmation should remain independent of this documentation work.

## Repeating this audit on the next version

1. Retain the exact original APK, version/code, hash and signer. Never call a runtime-off patched APK a factory install. Manifest edits remain even with Pause on.
2. Use a separate preserved account/device baseline. Record Android version, locale, native settings and experiment state. A snapshot can preserve tokens, but the server can still expire or revoke them.
3. Inventory manifest/components/network policy, DEX annotations, model fields, readable enum names, endpoint declarations, startup labels and default resources. Diff those inventories against this version before changing fingerprints.
4. Re-resolve semantic anchors. For each target, record class/method signature, parameters, return type, callers, relevant instruction order, registers and expected match count. A string match alone is a lead.
5. Trace the full path around the proposed edit. Include caches, nested containers, initialization order and the off/Pause path. Do not label user feedback or creator analytics reads as passive telemetry just because the route contains a familiar word.
6. Run the relevant existing fixture and runtime checks when implementing a change. Their locations are in the [patch reference](pinterest-14.39.0-patch-reference.md#maintenance-checklist). This documentation audit did not rebuild or install a candidate patch bundle.
7. Repeat the live surface with the actual eligible content. Keep native, patched-on, patched-off, Pause, cold-start and warm-start evidence distinct. Record bytes/timing only when the capture/profiler is validated.
8. Sanitize the evidence. Publish useful labels, schema keys and method identities. Keep emails, user IDs, tokens, pin history, account databases, full traffic dumps and emulator images local.

### Stable live anchors from this account

Resource names below all use the `com.pinterest:id/` prefix. They were seen on 14.38.0, and every one is still defined in 14.39.0. Numeric positions and pixel coordinates are not durable anchors.

| Area | Observed resource names |
|---|---|
| Home/navigation | `home_feed_greeting_header_create_icon`, `bottom_nav_home_icon`, `menu_search`, `profile_menu_view` |
| Pin content/actions | `pin_rep_id`, `pin_image_view`, `flashlight_search_button`, `action_module_comments_icon`, `action_module_share_icon_sab`, `overflow_button`, `save_pinit_bt`, `closeup_back_button` |
| Comments | `new_comments_module_container` |
| Native pin modal | `modal_header_dismiss_bt`, `modal_header_pin_image`, `gestalt_icon_social_button`, `drag_handle` |
| Search | `search_landing_bundle`, `static_search_text`, `static_search_bar_trailing_icon`, `view_typeahead_search_bar_container`, `edit_text`, `autocomplete_pin`, `fragment_search_content`, `one_bar_module_filter_button_id`, `search_guide` |
| Saved/account | `start_container_avatar`, `end_container_icon_bt`, `gestalt_end_action_one`, `settings_menu_container`, `settings_account_management`, `settings_profile_visibility`, `settings_social_permission`, `settings_content_permission`, `settings_privacy_and_data` |
| Settings detail | `settings_item_text`, `settings_app_theme_radio_group`, `auto_product_tagging_toggle`, `collapsed_view_container`, `toggle_item_push`, `toggle_item_email`, `toggle_item_news`, `labs_opt_in_toggle`, `tv_description_section`, `list_action` |

These names locate live elements. A generic `list_action`, sheet button or Gestalt container is shared by unrelated features and must not become a global hiding rule.

## Remaining evidence gaps

The audit did not cover business-account tooling, paid campaigns, populated-board actions, all video formats, full creation/edit/publish flows, private messaging, actual notification delivery, login-provider compatibility, password recovery, regional consent flows, offline recovery, large-text/TalkBack use or exhaustive remote experiments. The [runtime chapter](pinterest-14.39.0-runtime.md) separates fresh 14.39.0 counter measurements from the historical 14.38.0 packet study. Neither measures physical battery drain or compares a newly built patched APK.

Original-media, share-link and push behavior from earlier patch work can remain useful historical evidence, but it must not be relabeled as a fresh factory observation. The retained October 9 snapshot preserves the earlier signed-in baseline. The fresh survey and counter inputs stay local for later comparisons.
