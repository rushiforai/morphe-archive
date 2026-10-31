# Current candidate - 0.3.0-beta.1

This revision implements independently selectable Shaders and Download playlist, durable best-lyric storage, scheduled source recovery, native settings/storage cards and app-wide transparent navigation. The exact target remains original YouTube Music 9.42.52 / 94252240 arm64-v8a with official Morphe 1.48.0. Use Full Collection alone OR deselect every Full patch and use Lyrics-only Add-on with official Third-party lyrics disabled. Shaders and Download playlist are optional; either can be used with official patches and official lyrics. Download playlist requires Downloads. One root source has four native categories.

Settings: Morphe > Lyrics, Morphe > Shaders, Morphe > Playlist downloads. The playlist patch reads the existing Downloads mode/app at click time. Global transparent navigation is shared infrastructure, installed once with a personal feature. Existing private preferences and credentials are retained. Lyrics never expire automatically; cover media uses an adjustable 512 MiB LRU cache and only downloads new loops on unmetered Wi-Fi.

Read [the implementation report](../Research/FEATURES-0.3.0-2026-10-26.md), `dist/0.3.0-beta.1/verification.json` and the compatibility report for exact checks and limitations. Publication is complete only when `Verification/publication/v0.3.0-beta.1/publication-result.json` says published. Never rerun completed staging/publication generators or push the private checkout. Shared Toolkit stays in place. No MuMu/device/sign/install operations. Real phone smoothness, native presentation, Samsung navigation and Android graphics/download acceptance remain separate from compiled/simulated checks.

## Earlier records (historical)

# Architecture

Shared personal source is extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics plus web/src and bundled web assets. Both editions use the same private preferences and exact generated provider catalog. The full MPE uses the normal R8 pipeline; add-on prepareRuntime D8-compiles only the personal class files against compile-only native contracts.

Full changes Morphe's native panel installer, fallback coordinator and Music settings entry directly. The add-on declares its own scoped MediaSession/engagement fingerprints and local resource dependency, then validates/bridges the existing official payload in finalize: personal panel construction, clock getters, fallback restriction, inline settings and filter-array extension. It adds no second branding dependency or upstream class definition. Filter integration wraps the stable array store rather than a generated helper method name, allowing both source load orders.

BetterLyricsPanelView keeps a local-origin WebView and a constrained native interface. Remote verification uses a separate WebView without that interface. Native I/O owns cancellation, caches and HTTP failures; broker metadata can initiate corrected direct lookups. JWT expiry is a renewal hint only; server authentication remains authoritative. Cancellation/generation guards reject old callbacks.

Braccato owns timing/layout/highlights. Dock UI uses the exact provider catalog/SVGs plus host-native drawable snapshots. A transparent page leaves the native panel palette intact; suppressed native sibling visibility is restored on fallback, track change or detach. Overlay acknowledgements never call applySettings. Native switches/list preferences bind private values explicitly; provider ordering has drag/drop, edge scrolling and accessibility move actions.

Source, SDK and browser checks are recorded in COMPATIBILITY; actual device behavior remains unverified for this revision.

## Revision 0.2.1

Dock is a transparent floating overlay; its body-portal source menu samples lyric paint independently of pill blur. Numeric settings use a native inline SeekBar. Seek invokes core resumeAutoscroll; actual scroll events drive manual pause. The wall-clock sample is extrapolated once by core. web/patch_braccato.py applies one hash-bounded suppression-counter correction to prepared core input only. Unison tries exact recording identity before metadata fallback.

## Native entry correction 0.2.2-beta.3

LyricsEntryCoordinator starts one shared repository from existing metadata/playback wrappers. LyricsEntryButton enables the actual native action and preserves Litho listener/state. NativeLyricsHost uses patch-generated typed controller/protobuf/model APIs; six native schema hashes protect the wire protocol. Attachment requires the active lyrics model and its returned FrameLayout, never a global title/decor search. The old installer is disconnected. Both editions compile the same NativeLyricsHooks; only personal classes enter the add-on MPE. No Dialog or extra button is created. Native phone acceptance remains pending.

## Native model correction 0.2.3-beta.1

Supersedes beta.3 view-level listener/enabled/alpha interception and direct generic panel opening. NativeActionModel transforms the real Music action data before Elements rendering; app native enable styling/command dispatch remain in control. It positions Lyrics after Like/Dislike, removes DISABLED/unavailable toast and supplies normal Music endpoint only when missing. NativeLyricsHost prepares existing Lyrics or current Related Music palette/header/snap contracts, then attaches only to the current native body. Typed native presenter refresh uses committed watch-response identity. Both editions compile shared NativeLyricsHooks; isolated add-on remains personal classes only. Exact evidence: Research/NATIVE-MODEL-FIX-2026-10-22.md, revision6-model reports. Native phone geometry/color remain unverified and may depend on app experiments/palette.

## Native model correction 0.2.3-beta.3

Supersedes beta.3 view-level listener/enabled/alpha interception and direct generic panel opening. NativeActionModel transforms the real Music action data before Elements rendering; app native enable styling/command dispatch remain in control. It positions Lyrics after Like/Dislike, removes DISABLED/unavailable toast and supplies normal Music endpoint only when missing. NativeLyricsHost prepares existing Lyrics or current Related Music palette/header/snap contracts, then attaches only to the current native body. Typed native presenter refresh uses committed watch-response identity. Both editions compile shared NativeLyricsHooks; isolated add-on remains personal classes only. Exact evidence: Research/NATIVE-MODEL-FIX-2026-10-22.md, revision6-model reports. Native phone geometry/color remain unverified and may depend on app experiments/palette.
