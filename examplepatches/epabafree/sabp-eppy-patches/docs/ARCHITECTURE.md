# eppy architecture notes

## Morphe patch comparative analysis

### 1. What was reviewed

- **Repository:** [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) (GPL-3.0 + Morphe NOTICE). It contains Morphe's YouTube and YouTube Music patches.
- **How:** shallow clone on 2026-10-23, reading the source files themselves.
- **Files actually read:**
  - `patches/src/main/kotlin/app/morphe/patches/youtube/misc/extension/SharedExtensionPatch.kt`
  - `patches/src/main/kotlin/app/morphe/patches/youtube/misc/settings/SettingsPatch.kt` (`modifyActivityForSettingsInjection`, manifest changes for the host activity)
  - `extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/settings/BaseActivityHook.java`
  - Repository layout: `extensions/shared`, `extensions/shared-youtube`, `extensions/youtube`, `extensions/music`, `patches/.../{youtube,music,shared}/{ad,interaction,layout,misc,video}`, `extensions/shared/library/.../checks/`
- **Not read:** files I only saw listed in the tree. Nothing below is claimed about their contents.

### 2. Techniques found (verified in source)

| Technique | Where | What it does |
|---|---|---|
| Shared extension + app-start init hook | `SharedExtensionPatch.kt` (`sharedExtensionPatch(listOf("youtube","shared-youtube"), applicationInitHook, applicationInitOnCreateHook)`) | One shared extension module is merged into every app. A hook at application start gives the extension its context before any feature runs. |
| Taking over an existing activity | `SettingsPatch.kt` → `modifyActivityForSettingsInjection` | At index 0 of a host activity's `onCreate`: `invoke-super onCreate` → extension `initialize(activity)` → `return-void`. Other methods of that class are removed. The comment notes they reuse an existing activity because adding a new manifest activity "fails for root installations". |
| Manifest tuning of the host activity | same file | Sets `configChanges` so rotation doesn't recreate the hijacked screen, and sets an AppCompat DayNight theme. |
| Defensive extension code | `BaseActivityHook.initialize` | Everything sits in `try/catch` with `Logger.printException(...)`. It checks an intent marker (`morphe_settings_intent`) before doing anything, and handles predictive back explicitly. |
| Layered feature folders | repo layout | Patches are grouped by `ad / interaction / layout / misc / video`. Cross-app code lives in `shared` modules. |
| Environment checks | `extensions/shared/library/.../checks/Check.java`, `CheckEnvironmentPatch.java` (only seen in the tree) | Separate code exists for checking the runtime environment. Contents not reviewed. |

### 3. eppy compared

| Area | Morphe YouTube/Music | eppy v0.3.0 | eppy v0.4.0 |
|---|---|---|---|
| Entry into the new UI | Hooks the activity the app already opens | **Added a new launcher activity and left the classic `PlayerActivity` reachable from the notification, widgets, the library and task restore. This caused the unexpected returns.** | **One central hook** in `PlayerActivity.onCreate` (same `invoke-super → extension → return-void` pattern) sends every route to the chosen player |
| App-start init | `applicationInitHook` | none | `SABPApplication.onCreate` → `EppyDiag.install` (crash recorder, log) |
| Error handling | `try/catch` + `Logger.printException` everywhere | partial | Diagnostics log, crash recorder, job markers, runtime bridge self-check |
| Settings | In-app preference screens in a hijacked activity | Own settings page | Unchanged (eppy's own screen), now with Player interface, Book information sources and Diagnostics |
| Version targeting | Fingerprints per app version | Stable-name resolution (Android Auto service, SeekBar callbacks, serializers) + `PatchException` on mismatch | Unchanged, plus runtime self-check |
| Root installs | Avoid adding manifest activities | Adds `EppyActivity` | Still adds it. **Known limitation:** mount-style root installs may not support a new activity (see Deferred) |

### 4. Lessons applied

1. **Route centrally at the destination, not at every caller.** Hooking `PlayerActivity.onCreate` covers callers I can't see, including Android restoring the back stack. Implemented.
2. **Initialise at app start.** Diagnostics now exist before any screen runs. Implemented.
3. **Fail soft, log, keep the host app working.** Every bridge call and read-along stage is wrapped, and crashes are recorded with the operation that was running. Implemented.
4. **Use an intent marker for intentional exceptions:** `eppy_classic=true` lets eppy open the classic player on purpose without the router bouncing it. Implemented.
5. **Keep layout code in shared components.** The v0.3.0 icon offsets came from per-widget styling and a global line-spacing multiplier. Labels, chips and buttons now come from shared builders (`Ui.label/chip/filledButton/textButton`). Implemented.

### 5. Licensing

- **No Morphe YouTube/Music code was copied.** eppy re-implements the same pattern in its own code.
- **Template-derived code** (Gradle setup, `PatchListGenerator.kt`) stays under GPL-3.0 with Morphe's [NOTICE](../NOTICE). eppy uses its own name, as §7c requires.

### 6. Deferred

- **Reusing an existing SABP activity instead of adding `EppyActivity`,** for root/mount installs. This needs a host activity that SABP can lose without harm, and a test on a rooted device.
- **Hosting eppy's settings inside SABP's own settings screen.**
- **A shared extension module,** if more than one app is ever targeted.

---

## Navigation audit (SABP 11.7.8)

The audit searched the decompiled app for `PlayerActivity.class`, intent targets, notification and widget PendingIntents, and the manifest.

| # | Entry point | Code (decompiled) | Before (v0.3.0) | v0.4.0 with Player interface = eppy |
|---|---|---|---|---|
| 1 | Notification tap | `PlayerService` → `a.a(Context)` → `PendingIntent.getActivity(PlayerActivity, MAIN/LAUNCHER, CLEAR_TOP)`, used for `.h(...)` and `contentIntent` | Classic player | Router → eppy, player open |
| 2 | Widgets (large/small) | `PlayerAppWidget{Large,Small}Provider` → `a.a(context)` | Classic player | Router → eppy, player open |
| 3 | Library "open book" | `b2.java:103` and `p2.java:110`: `new Intent(LibraryActivity, PlayerActivity)` with `bookData` extra, then `finish()`. The book switch itself already happened in `PlayerService`; `PlayerActivity.B3()` only fills its own labels | Classic player | Router → eppy, player open |
| 4 | Voice search | `PlayerActivity` intent-filter `MEDIA_PLAY_FROM_SEARCH` | Classic player | Router forwards the query to `PlayerService` (`AutoActionPlayFromSearch`) and opens eppy |
| 5 | App icon | `MAIN/LAUNCHER` moved to `EppyActivity` | eppy | eppy, or the classic player if Classic is chosen |
| 6 | Task restored by Android | Recreates whichever activity was on top | Classic if it was on top | Classic `PlayerActivity` is never left on top, and if recreated it routes again |
| 7 | eppy → "Classic player", "Set up in classic player" | `EppyRoute.classicIntent` (`eppy_classic=true`) | Classic | Classic (explicit, the only way in) |
| 8 | Chapters / Bookmarks / Details / Up next / Read along | eppy player sheet | Native since 0.3.0 | Native |
| 9 | Settings, Statistics, History, Characters, Book queue | SABP's own screens, opened on top of eppy; Back returns to eppy | Classic screens | Unchanged (labelled "Classic screen"). They don't open the classic player |
| 10 | Android Auto, Cast, Wear, headset, lock screen | `MyMediaBrowserService` / media session, no activity | Unaffected | Unaffected (same `PlayerService` session) |
| 11 | Media-button resume / playback resumption | Service-level | Unaffected | Unaffected |

**Untested:** any classic screen that internally starts `PlayerActivity` in a way not found by the search. It would still go through the router, because the hook is in `PlayerActivity` itself.
