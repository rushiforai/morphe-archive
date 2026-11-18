# Original Morphe features in Afterglow

The import retains the original Morphe YouTube implementations and settings. [The machine-readable catalog](../tools/morphe-catalog.json) maps every original YouTube export to an exposed wrapper, an existing Afterglow owner, a delegated compatibility wrapper, or an explicit branding exclusion. This is a source and selection inventory; it is not a claim that every imported feature has passed device testing.

The official pinned bundle contains **109 named YouTube patches**, not 108: 108 map to top-level Kotlin properties and `Open system share sheet` is a zero-argument factory. There are 86 imported feature wrappers, of which 63 are default-selected and 23 are optional. Nineteen original exports are covered by Afterglow owners, two are excluded branding patches, and two delegate through compatibility wrappers. Together with 42 Afterglow/compatibility wrappers, the bundle has **128 named patches and 105 default selections**. Downloads and Vault use Afterglow's own interface, queue and library; the original Morphe Downloads patch is not selected. The independent [Afterglow app icon](app-icon.md) uses the project owner's supplied artwork.

## Provenance and schema

| Input | Pinned identity |
| --- | --- |
| Morphe Patches | `2.0.0`, revision `6cb8e6b6ee425eda8a854e026507286359f38a32` |
| Official `patches-2.0.0.mpp` | SHA-256 `f0f5cfd857950ed61a26a7b2eeeecf37d4d66bece2e8f94802280e189b69ed00` |
| Morphe patches library | `2.1.0-dev.2`, revision `42edb9710c2b63416e8eddd8096bb6a0adff75dd` |
| Original patcher / integration patcher | `2.0.0` / `2.1.0` |
| Supported integration target | YouTube `21.43.523`, package `com.google.android.youtube` |

The inventory was enumerated with `PatchLoader.Jar` against that official bundle using exact package compatibility, then checked against the pinned source. Every catalog entry records the original name, description, selection default, fully qualified Kotlin symbol, source path and SHA-256. These hashes describe the original source, before import metadata adaptations. Imported source resides under `vendor/morphe/patches/`; its lock records the adapted files separately.

`decision=expose` creates a named Afterglow wrapper around `original_expression`, depends on the settings bridge, forwards the original options and records its `morphe-*` installation ID without inventing Afterglow preference keys. All original named exports become unnamed dependencies. `delegate_existing` uses `existing_wrapper_id` instead of adding a second named patch. A null `export_name` creates no wrapper. `original_kind=factory` preserves the distinction from a property; the one such entry is excluded as already owned.

Displayed names remain original unless they collide with an existing named patch. The four collision names are `Caption options`, `Navigation options`, `Playback speed options` and `Video quality options`. Internal classes, preference keys and attribution retain upstream names. User-facing entry points refer to Afterglow settings.

Original GPL-3.0 notices, Morphe NOTICE terms and bundled dependency licenses must remain present. The import excludes `Custom branding`, `Change header`, and the associated launcher/header logo resources. It does not introduce those assets through a renamed wrapper.

The optional Seekbar color helper omits its upstream splash-animation dependency.
Its seekbar and gradient hooks remain intact; startup appearance stays with the
existing Afterglow/native owner instead of importing branded startup assets.

## Selection and ownership rules

Patch selection and runtime enablement are separate. A default-selected DeArrow wrapper makes its original settings available; its title scopes still default off and its thumbnails still default to original images. Stored `morphe_prefs` values and upstream migrations remain effective on upgrades. Afterglow preferences use their existing separate namespace. Selecting a wrapper does not reset either preference store.

Partial overlaps remain available as optional features, including caption languages/bilingual controls, external fonts, miniplayer layouts, richer quality controls, seekbar DVR controls and additional layout filters. When two implementations can set the same playback or visibility policy, configure one policy at a time. A filter disabled in one settings group cannot restore a view still hidden by the other. Optional selection does not imply that all upstream runtime switches default off.

Afterglow remains the only selected SponsorBlock **playback skip engine**. The original SponsorBlock export is excluded rather than silently installing another engine. Its submission/voting UI is therefore an explicit remaining capability. Shared upstream SponsorBlock configuration remains packaged, as described below; excluding the named patch does not remove every upstream SponsorBlock class.

## Dependency constraints

An independent recursive audit of all 109 original patch objects found exactly these named transitive edges. Unnamed shared dependencies are retained throughout.

| Original feature | Named dependency closure | Integration implication |
| --- | --- | --- |
| GmsCore support | Clone app; Hide player overlay buttons; Spoof video streams | Reuse one original compatibility graph. The overlay-controls implementation is installed even if its optional wrapper is unselected. |
| Channel whitelist | Hide ads | Optional/off by default. It imports the original ad hooks and does not whitelist Afterglow ad removal or Afterglow speed policies. |
| Feed view count | Hide layout components | Optional/off by default. It imports the original layout implementation and its runtime defaults. |

The original `morphe_hide_autoplay_button` default is true, including when installed through GmsCore. Review the imported player settings when testing autoplay-button visibility. Hiding the original export name does not suppress this dependency or its hooks. The same distinction applies to the optional ad and layout dependencies above.

Use the complete original settings resource and initialization graph. The earlier minimal compatibility resource subset is insufficient for upstream settings activities: `morphe_settings_fragments`, `morphe_toolbar_parent`, `morphe_settings_with_toolbar`, preference XML, icons, strings and arrays must resolve. Initialize the common extension context before settings/client classes and retain one shared → youtube → shared-youtube extension merge. Do not execute both the former adapted compatibility graph and the imported originals.

The imported `Settings` initializer calls `YouTubeSponsorBlockConfig.install()` even without the original SponsorBlock patch, so its shared strings/resources and configuration remain. The upstream Downloads implementation contains an offline-segment cache path, but that original Downloads patch is not selected or transitively installed in this bundle. Afterglow owns the download sheet, resolver, transfer queue and Vault; it can reuse the compatible original stream-request helper without installing the original download UI or its hooks.

Keep Afterglow experimental `LongPressTextTools` hooks excluded while the original `Copy text` feature is installed. Existing pause-button timestamp copying remains a separate hook. Imported Copy text handles video titles and comments. The separate Afterglow Description-header action adds full description copying without replacing those interactions.

## Complete export mapping

`On` and `Off` are wrapper selection defaults. `Existing` means an existing wrapper delegates the original graph. `Owned` and `Excluded` create no new wrapper. The JSON carries exact symbols, source paths, source hashes and detailed coexistence notes for each row.

| Original patch | Export / disposition | Selection | Afterglow owner or overlap | Reason |
| --- | --- | --- | --- | --- |
| AI channel filter | AI channel filter | On | — | Adds community AI-channel filtering and reporting, which Afterglow does not provide. |
| Add to queue | Add to queue | On | — | Adds native and Morphe playback queues beyond the existing feed-menu visibility controls. |
| Ambient mode | Ambient mode | Off | ambient-mode | Adds power-saving and fullscreen controls; optional because its force-enable path overlaps Afterglow ambient-mode suppression. |
| App refresh rate | App refresh rate | On | — | Adds display refresh-rate control absent from Afterglow. |
| Ask flyout menu | Ask flyout menu | On | — | Adds Ask actions to feed menus without replacing existing menu-visibility controls. |
| Bypass image region restrictions | Afterglow-owned | Owned | fix-albums | The existing Fix album covers hook already adapts this upstream image-host fallback. |
| Bypass link redirects | Bypass link redirects | On | — | Resolves outbound redirect links; Afterglow Privacy only sanitizes shared links and related tracking. |
| Captions | Caption options | Off | captions | Adds caption languages, translation and bilingual controls beyond Afterglow auto-caption and remembered-state controls. |
| Change form factor | Change form factor | On | — | Adds phone/tablet presentation choices absent from Afterglow. |
| Change header | Branding excluded | Excluded | navigation-bar | Exclude the branded header replacement and its branding resources from this source import. |
| Change start page | Afterglow-owned | Owned | startup | Afterglow already selects the startup destination; a second startup redirect would compete for the same navigation event. |
| Channel search | Channel search | On | — | Adds channel-specific search absent from Afterglow. |
| Channel whitelist | Channel whitelist | Off | remove-ads, playback-speed | Adds per-channel exceptions, but its Hide ads dependency installs a second ad implementation; opt-in pending dependency coordination. |
| Check watch history domain name resolution | Check watch history domain name resolution | On | — | Adds diagnostics for blocked history domains absent from Afterglow. |
| Copy text | Copy text | On | long-press-tools | Preserves original title/comment copying alongside separate Afterglow Description-header and image actions. |
| Copy video link | Copy video link | On | long-press-tools | Adds explicit URL-copy player buttons alongside the existing pause-press timestamp gesture. |
| Custom branding | Branding excluded | Excluded | — | Exclude launcher branding and associated logo assets; preserve the existing app identity. |
| Custom font | Custom font | Off | typography | Adds external font-file support beyond Afterglow font presets; optional because both can assign typefaces. |
| Custom player overlay opacity | Custom player overlay opacity | Off | player-overlay | Adds adjustable opacity beyond Afterglow transparent-overlay control; optional to avoid competing alpha policies. |
| DeArrow | DeArrow | On | — | Adds original upstream community title and thumbnail replacements absent from Afterglow. |
| Disable DRC audio | Disable DRC audio | On | — | Adds dynamic-range-compression control absent from Afterglow. |
| Disable QUIC protocol | Disable QUIC protocol | On | — | Adds optional transport selection absent from Afterglow; retain the upstream runtime default. |
| Disable Shorts resuming on startup | Afterglow-owned | Owned | shorts | Afterglow already owns the Shorts resume-on-startup preference and hook. |
| Disable auto feed refresh | Disable auto feed refresh | On | — | Adds feed-refresh control absent from Afterglow. |
| Disable continue watching prompt | Afterglow-owned | Owned | watch-page | Afterglow already controls the continue-watching prompt. |
| Disable double tap actions | Afterglow-owned | Owned | player-gestures | Afterglow already controls double-tap seeking and two-finger chapter actions. |
| Disable fullscreen gestures | Disable fullscreen gestures | Off | player-gestures, fullscreen | Adds fullscreen swipe controls; optional because pinch and fullscreen behavior overlap existing controls. |
| Disable haptic feedback | Disable haptic feedback | On | — | Adds interaction-specific haptic controls absent from Afterglow. |
| Disable layout updates | Disable layout updates | On | — | Adds upstream layout experiment controls; the unfinished Afterglow old-layout setting is not a replacement. |
| Disable player popup panels | Disable player popup panels | On | — | Adds automatic player-panel suppression absent from Afterglow. |
| Disable playlist autoplay | Disable playlist autoplay | Off | autoplay | Adds playlist-specific autoplay control; optional because Afterglow also controls playback advancement. |
| Disable rolling number animations | Disable rolling number animations | On | — | Adds animated-counter control absent from Afterglow. |
| Disable scrolling speed limit | Disable scrolling speed limit | On | — | Adds scrolling-velocity control absent from Afterglow. |
| Disable sign in to TV popup | Disable sign in to TV popup | On | — | Adds TV sign-in popup suppression absent from Afterglow. |
| Disable video codecs | Disable video codecs | On | — | Adds codec exclusions absent from Afterglow. |
| Double tap to seek | Double tap to seek | On | player-gestures | Adds selectable seek intervals while Afterglow controls whether the gesture is enabled. |
| Download post images | Download post images | On | long-press-tools | Adds original post-image download actions; Afterglow profile/thumbnail viewing does not provide this feature. |
| Downloads | Afterglow-owned | Owned | downloads | Afterglow provides its own six-action download sheet, durable queue and Vault library. |
| Enable debugging | Enable debugging | On | — | Provides upstream diagnostics needed for imported features; existing Afterglow logging covers a different runtime. |
| Exit fullscreen mode | Afterglow-owned | Owned | fullscreen | Afterglow already controls leaving fullscreen at playback completion. |
| Feed card layout | Feed card layout | On | — | Adds feed-card presentation choices absent from Afterglow. |
| Feed video actions | Feed video actions | On | feed-menus | Adds direct feed-video actions beyond Afterglow flyout-menu item visibility. |
| Feed view count | Feed view count | Off | comments-header, navigation-bar | Adds view-count presentation, but its Hide layout components dependency enables overlapping layout policies; keep optional. |
| Force animations | Force animations | On | startup | Adds app animation control beyond the existing startup-animation preference. |
| Force fullscreen landscape | Force fullscreen landscape | Off | fullscreen | Adds landscape orientation controls including tablet behavior; optional alongside Afterglow fullscreen orientation. |
| Force original audio | Force original audio | On | — | Adds original-language audio selection absent from Afterglow. |
| Fullscreen video scale | Fullscreen video scale | On | — | Adds explicit fullscreen fit/zoom/stretch scaling absent from Afterglow. |
| GmsCore support | GmsCore support | Existing | gmscore-support | The existing GmsCore support wrapper delegates to the original upstream graph; no second named export is created. |
| Hide Shorts components | Hide Shorts components | Off | shorts, shorts-layout | Adds further Shorts component filters; optional because many runtime defaults overlap Afterglow Shorts visibility controls. |
| Hide ads | Afterglow-owned | Owned | remove-ads | Afterglow already owns ad removal; do not export a duplicate ad-removal patch. |
| Hide autoplay preview | Hide autoplay preview | On | — | Adds end-of-video autoplay-preview visibility beyond Afterglow watch-page section filtering. |
| Hide end screen cards | Afterglow-owned | Owned | watch-page | Afterglow already owns end-screen card visibility. |
| Hide end screen suggested video | Afterglow-owned | Owned | watch-page | Afterglow already controls the end-screen suggested-video surface. |
| Hide info cards | Hide info cards | On | — | Adds information-card visibility control beyond the existing player overlay controls. |
| Hide layout components | Hide layout components | Off | comments-header, navigation-bar, tab-bar, watch-page | Adds broader layout and content filters; optional because several upstream enabled defaults overlap existing layout controls. |
| Hide player flyout menu components | Hide player flyout menu components | Off | player-buttons-menus, player-overlay | Adds additional player-menu filters; optional because overlapping visibility defaults are enabled upstream. |
| Hide player overlay buttons | Hide player overlay buttons | Off | player-overlay, navigation-bar, autoplay | Adds autoplay and other overlay-button controls; also installed transitively by GmsCore support, regardless of this wrapper selection. |
| Hide related video overlay | Hide related video overlay | Off | watch-page | Adds related-overlay controls during fullscreen playback; optional alongside Afterglow related-video suppression. |
| Hide related videos | Afterglow-owned | Owned | watch-page | Afterglow already filters the watch-next related-video section while preserving information and comments. |
| Hide status bar | Hide status bar | On | — | Adds system status-bar visibility control absent from Afterglow. |
| Hide timestamp | Hide timestamp | On | — | Adds native player timestamp visibility control absent from Afterglow. |
| Hide video action buttons | Hide video action buttons | Off | player-buttons-menus | Adds action-button options beyond the existing share/save/download/remix/clip filters; optional to avoid duplicate default filters. |
| Loop video | Loop video | Off | loop | Adds explicit looping controls and a button; optional alongside Afterglow remembered-loop policy. |
| Media notification controls | Media notification controls | On | — | Adds media-notification configuration absent from Afterglow. |
| Miniplayer | Miniplayer | Off | miniplayer | Adds miniplayer layout types and gestures; Afterglow Mini player controls restricted playback and playlist minibar style instead. |
| Mute button | Afterglow-owned | Owned | overlay-buttons | Afterglow already supplies an independently configurable mute button. |
| Navigation bar | Navigation options | Off | navigation-bar, tab-bar | Adds further navigation styling and tab controls; optional alongside existing Afterglow navigation controls. |
| Network proxy | Network proxy | Off | — | Retain upstream opt-in selection for user-supplied network proxy configuration. |
| Niconico comments | Niconico comments | On | — | Adds scrolling Niconico-style comments absent from Afterglow. |
| Open Shorts in regular player | Afterglow-owned | Owned | shorts | Afterglow already owns conversion of Shorts playback to the regular player. |
| Open channel of live avatar | Open channel of live avatar | On | — | Adds a live-avatar channel-opening action absent from Afterglow. |
| Open links externally | Open links externally | On | — | Adds external-link routing absent from Afterglow. |
| Open system share sheet | Afterglow-owned | Owned | native-share | The existing Native share sheet implementation already adapts this original upstream behavior with native lifecycle guards. |
| Open videos fullscreen | Afterglow-owned | Owned | fullscreen | Afterglow already owns automatic fullscreen entry and portrait fullscreen choices. |
| Override YouTube Music buttons | Override YouTube Music buttons | On | — | Adds destination overrides for music actions absent from Afterglow. |
| Picture-in-picture button | Picture-in-picture button | On | — | Adds an explicit picture-in-picture control absent from Afterglow. |
| Play all | Play all | On | — | Adds channel and feed Play all actions absent from Afterglow. |
| Playback buffer | Playback buffer | On | — | Adds playback-buffer configuration absent from Afterglow. |
| Playback in feeds | Playback in feeds | On | — | Adds feed-preview playback policy absent from Afterglow. |
| Playback speed | Playback speed options | Off | playback-speed | Adds custom speed lists, controls and per-channel behavior; optional alongside the existing automatic speed policy. |
| Player icon style | Player icon style | On | — | Adds player-control icon styling absent from Afterglow. |
| PoToken provider | PoToken provider | On | — | Adds the original optional proof-of-origin token provider integration needed by supported streaming clients. |
| Reload video | Reload video | On | — | Adds a video reload action absent from Afterglow. |
| Remember live stream playback position | Remember live stream playback position | On | — | Adds live-stream resume positions absent from Afterglow. |
| Remove background playback restrictions | Remove background playback restrictions | Off | background-playback, miniplayer | Adds lock-screen and Shorts background options beyond restriction removal; optional because the main playback gates are already owned by Afterglow. |
| Remove viewer discretion dialog | Afterglow-owned | Owned | content-warning | Afterglow already bypasses the viewer discretion confirmation. |
| Restore original titles | Restore original titles | On | — | Adds original-language title restoration absent from Afterglow. |
| Return YouTube Dislike | Return YouTube Dislike | On | — | Adds the complete original dislike-fetching, display and vote integration absent from Afterglow. |
| Sanitize sharing links | Afterglow-owned | Owned | privacy | Afterglow already removes tracking parameters from shared links. |
| Save to Watch later | Save to Watch later | On | — | Adds direct Watch later actions beyond existing flyout-menu visibility. |
| Search comments | Search comments | On | — | Adds comment searching absent from Afterglow. |
| Seekbar | Seekbar | Off | seek-bar, player-gestures | Adds live DVR, seek thumbnails and gesture choices beyond Afterglow seekbar appearance; optional because tapping-to-seek overlaps. |
| Series tracking | Series tracking | On | — | Adds series progress tracking absent from Afterglow. |
| Settings menu filter | Settings menu filter | On | — | Adds native settings-menu filtering absent from Afterglow. |
| Shorts autoplay | Shorts autoplay | On | — | Adds automatic Shorts advancement absent from Afterglow auto-skip and routing controls. |
| Shorts icon style | Shorts icon style | On | — | Adds Shorts icon styling absent from Afterglow visibility controls. |
| Skip live Shorts | Skip live Shorts | On | — | Adds live-Shorts skipping absent from Afterglow. |
| Skip silence | Skip silence | On | — | Adds silence detection and skipping absent from Afterglow. |
| SponsorBlock | Afterglow-owned | Owned | sponsorblock | Keep Afterglow as the sole playback skip engine; imported Downloads retains its original offline segment cache requests. |
| Spoof app version | Spoof app version | On | — | Adds optional app-version presentation controls absent from Afterglow; retain original runtime settings and compatibility constraints. |
| Spoof device dimensions | Spoof device dimensions | On | — | Adds device-dimension overrides absent from Afterglow. |
| Spoof video streams | Spoof video streams | Existing | spoof-video-streams | The existing Spoof video streams wrapper delegates to the original upstream graph; no second named export is created. |
| Swipe controls | Swipe controls | On | player-gestures | Adds volume and brightness swipes beyond Afterglow tap, chapter and zoom gestures; retain upstream zone defaults. |
| Theme | Afterglow-owned | Owned | theme-studio, seek-bar | Afterglow already owns native theme and seekbar colors; do not install a competing resource-theme policy. |
| Translate posts | Translate posts | On | — | Adds community-post translation absent from Afterglow. |
| Video delay | Video delay | On | — | Adds audio/video delay adjustment absent from Afterglow. |
| Video quality | Video quality options | Off | video-quality | Adds separate Shorts quality, premium-resolution filtering and a quality button; optional alongside Afterglow network-based quality selection. |
| Voice over translation | Voice over translation | On | — | Adds voice-over translation absent from Afterglow. |
| Wide search bar | Wide search bar | On | — | Adds wide search-field presentation absent from Afterglow search-button visibility controls. |

## Runtime fixtures and expected controls

These are source-derived test steps for the emulator owner. They do not record a new emulator result. Use the settings bridge inside Afterglow settings to reach the original categories; the bridge label itself is owned by the integration.

| Feature | Original category and labels | Defaults and meaningful observation |
| --- | --- | --- |
| Return YouTube Dislike | `Return YouTube Dislike` → `Enable Return YouTube Dislike`, `Show dislikes as percentage`, `Show estimated likes` | Enabled=true; percentage=false; estimated likes=true. Cold-open a normal video and confirm the dislike count appears without pressing Like or Dislike. Toggle percentage and verify the displayed format. Disable, restart, reopen and verify the injected count is removed. |
| Copy text | Copy text | On | long-press-tools | Preserves original title/comment copying alongside separate Afterglow Description-header and image actions. |
| Downloads | Afterglow-owned | Owned | downloads | Afterglow provides its own six-action download sheet, durable queue and Vault library. |
| External downloads | `Player` → `Downloads` → `Downloader package name` | Default package `com.deniscerri.ytdl` (YTDLnis). With no handler installed, the expected dialog is `App not installed`, not a completed download. Do not install or open another app just to turn a missing-handler result into success. |
| Download post images | `Feed` → `Download post images` | True. On an actual image/GIF post, expect a button beside Share and a menu item `Download image` or `Download images`. Verify the saved file and success message; a text-only post is not a valid fixture. |
| DeArrow | `DeArrow` → title scopes `Home tab`, `Subscriptions tab`, `You tab`, `Player playlists & recommendations`, `Search results`; `Casual mode` | All five title scopes false; all five thumbnail scopes `Original thumbnails`; casual mode false. Enable an applicable title scope and restart. Compare original and replacement text. A title result does not prove thumbnail replacement. |

The long-form fixture `rfscVS0vtbw` is already used by the existing watch helper. A read-only API preflight during this work returned HTTP 200 from both Return YouTube Dislike and DeArrow. The dislike response contained counts; the DeArrow response contained the title `Basic python functions (for beginners)` and no community thumbnail. Counts and titles are live service data and must be refreshed before asserting exact values. Use that video for dislike display and DeArrow title checks. Use `Still captures` for a deterministic thumbnail-mode exercise, or find a separate video with a current community thumbnail before claiming DeArrow thumbnail coverage.

The public `jNQXAC9IVRw` short normal-video fixture can limit download size; first verify it currently opens as an ordinary watch video. Prefer a low quality for an actual completion check. The current 4-hour Python fixture is useful for playback and title checks but is unnecessarily large for download validation. For downloads, distinguish saved-video playback after a cold open from playback of an already buffered stream. Do not change account state or submit votes during these read-only feature checks.

Copy text retains inherited upstream limits: its prefix matcher treats any common prefix of at least 20 characters with no more than 40 remaining displayed characters as truncation; it does not require an ellipsis marker. A stale cached title/comment with a shared prefix can therefore be selected incorrectly. It checks `isLongClickable()` before attaching its listener, rather than directly inspecting every native listener. Test video A → video B recycling and existing native comment selection, and do not apply the excluded Afterglow text-policy regression guarantees to the imported implementation. Its copy flags are cached statically; cold-restart after changing the two switches for reliable disabled-path testing.

## Source audit for the main additions

Return YouTube Dislike retains eight direct dependencies: settings, shared extension, text components, Litho spannable strings, video IDs, player type, restored action-bar support and feed-card hooks. It preloads IDs, updates when videos load, modifies native count text/content descriptions and sizes the associated count overlay. The native vote endpoint hook reports explicit user votes. The original code deliberately excludes Shorts counts. On YouTube 21.36 and newer, restored-old-action-bar mode defaults false; selecting Return YouTube Dislike must not force that mode on for 21.43.523.

DeArrow retains shared extension, settings, navigation, Cronet image URL, Litho relayout and video-title dependencies. Its title helpers cover feed cards, native compact/playlist/history/end-screen/miniplayer views and media metadata. Share one imported hook graph when multiple features use these surfaces. Metadata comes from `https://sponsor.ajay.app/api/branding/{first-four-hex-characters-of-SHA256(videoId)}`; thumbnail service defaults to `https://dearrow-thumb.ajay.app/api/v1/getThumbnail`. Read-only fetches need no voting action.

Downloads retains its resource patch, authentication hook, video-information, legacy-player-control, protobuf fix, element-parser and flyout dependencies. In-app mode replaces download commands and declined offline responses while preserving native offline storage, qualities and playback handling. Its fallback client order is visionOS 1.03, visionOS 1.02, Android VR DASH, TV DASH, Android Creator and TV Simply. External mode delegates to the selected downloader; it does not constitute an Afterglow Vault implementation.

Copy text retains shared extension, settings, resources, Litho spannable strings and video-information dependencies. It recognizes video metadata/comment component paths and hooks `ComponentHost.dispatchTouchEvent`. Download post images additionally uses element parsing, flyouts and feed-card hooks to recognize a post's images and its exact host. Verify the shared touch path with both features installed.

## Validation records and reusable tooling

The catalog validation checked exact equality with all 109 original names, all 109 source symbols and hashes, unique IDs and exported names, known Afterglow ownership IDs, no new displayed-name collisions, required feature defaults and branding/SponsorBlock exclusions. Recursive original graph inspection confirmed only the three named dependency relationships listed above. These checks do not replace strict patch application or runtime testing of the integrated artifact.

Local evidence is under `/home/corey/.cache/ytafterglow-android/team-106/mini-player/`: `upstream-youtube-catalog.json`, `upstream-youtube-graph.json`, `UpstreamCatalogDump.java`, `UpstreamGraphAudit.java` and `morphe-catalog-validation.json`. The first two inspect the immutable official bundle. Root owns current build and runtime reports; do not reinterpret build110 checks as validation of new imports.

Existing runtime helpers are in `/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`: `qa_team.py` exposes `Run(build, phase)`, `open_watch()`, `page()`, `setting()`, `moving()`, `paste_clipboard()`, `logs()` and `finish()`; `qa.py` handles captures and the fixed emulator transport; `qa_nav.py` handles navigation. Use a new phase directory for every run. Screenshot capture alone is not visual verification. Canonical artifact tooling remains `tools/local_build.sh` and `tools/verify_bundle.py`.

## Build118 package preflight

Build118 passed strict application and APK rebuilding for three selections: all 99 defaults, 8 isolated features, and all 122 public patches. Each result reports success with no failed patches. Independent read-only review of the default APK passed all 55 package, resource, manifest and DEX checks. The bundle passed 11 export/visibility checks and 19 resource/archive checks. It exposes exactly 122 unique YouTube patches with 99 defaults; those default names exactly match the applied selection.

All 924 retained upstream resource files match their vendored inputs. The three original extension inputs (`shared.mpe`, `youtube.mpe`, `shared-youtube.mpe`) match the pinned official bundle byte for byte. Launcher/header branding asset directories are excluded. Namespaced provenance, adaptation notes, upstream notices and the three JavaScript license inputs are present.

The default APK contains 15 DEX files, 65,462 unique class descriptors and exactly 99 installed ownership IDs. Afterglow base-context and MainActivity initialization each occur once; the original extension context is initialized before GmsCore/client setup. The Additional features bridge is enabled. Native settings contains one Afterglow entry and no additional Morphe root shortcut. AfterglowActivity and the private GoogleApiActivity are correctly declared; package and original Gms spoof-signature metadata are preserved. Required settings layouts, startup IDs, RYD/Downloads/Copy text/DeArrow preferences and their referenced resources resolve.

The Afterglow experimental `LongPressTextPatch` is absent from every public dependency closure, and its native touch/listener interfaces and calls are absent from the affected native classes. The original upstream Copy text hooks are present. The compiled settings catalog keeps `copyVideoInfo` hidden and timestamp copying available. Comparison with the recorded build110 source confirms the existing visibility policy is unchanged.

The packaged JavaScript license files match their pinned sources: `ASTRING_LICENSE.TXT`, `MERIYAH_LICENSE.TXT`, and `YT_DLP_EJS_LICENSE.TXT`. Afterglow and upstream notices also match their source files. The default APK SHA-256 is `18115ea3101b8b655e15480959fee4aee72a046d6ab02583f996e62ca99d7872`; the MPP SHA-256 is `1a024b624c0a23706c8ea88cc69c42d456af83790e7c1fed4af21707631f586f`.

Evidence is in `team-106/mini-player/review/catalog-118-package-audit.json`, `catalog-118-export-audit.json`, `catalog-118-bundle-resources-audit.json`, `catalog-118-dex-audit.txt`, and associated XML/resource dumps under the local cache described above. Strict selection results are under `catalog-integration-20261116/verify-118-{default,isolated,all}/result.json`. These checks establish package and selection proof; final signing and device behavior are recorded separately by the integration owner.
