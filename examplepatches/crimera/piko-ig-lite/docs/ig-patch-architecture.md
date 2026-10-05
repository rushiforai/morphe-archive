# Resilient Instagram patch architecture

How this bundle resolves obfuscated Instagram bytecode so a version bump is a resolver diff,
not an archaeology session. Grounded in the 448.0.0.52.84 port and the Twitter/NewX lessons
that already live in `piko-patches-library`.

## The failure modes this replaces

The legacy piko entity layer (since removed; the download path now reads `Media` through typed
`MediaBridge` stubs) worked, but every release bump cost days because of four patterns. They are all fixable at the shared resolution layer without rewriting feature
patches.

1. **Placeholder strings rewritten by position.** Extension classes contain sentinel names
   (`"methodName"`, `"A0T"`) and decoder patches replace the *n-th* `const-string` in a
   method. Reordering or adding a string shifts the replacement silently.
2. **Silent optional resolution.** `fingerprint.matchOrNull()?.let { ... }` skips a mutation
   when a release changes, so the patch reports `Applied` while the extension keeps a
   sentinel name and dies later ("Invoke failed: A0T" was exactly this).
3. **Mutable patch-time globals.** `Decoder.kt` stores `MEDIA_CLASS_NAME`, `CURRENT_MEDIA_FIELD`,
   … as `Delegates.notNull()` vars. Resolution order becomes load-bearing and cannot be
   re-run or cached per target.
4. **Runtime reflection over release classes.** `Entity.getMethod` calls
   `getDeclaredMethod(name, params[i].getClass())`. Exact runtime classes, no supertype
   search, and parameter polymorphism breaks it without a compile error.

## Target architecture

```
extensions (runtime)            compileOnly stable stubs only
        ▲
        │  exact descriptors injected at patch time
        │
InstagramModels (patch-time)    typed Resolved* data classes, cached per BytecodePatchContext
        ▲
        │  shape / data-flow / semantic anchors
        │
target APK bytecode             the only source of truth
```

### 1. One resolution layer, no globals

Mirror NewX's `models/` package: a single `InstagramModels` object that resolves every
obfuscated owner/member once and returns typed data classes
(`ResolvedInstagramMediaModels`, `ResolvedInstagramUserModels`, `ResolvedInstagramDialogModels`,
…). Resolution is cached per `BytecodePatchContext` and re-runnable; feature patches depend
on the model objects, never on an order of `changeFirstString` calls.

### 2. Resolution strategies, in order of preference

| Known at patch time | Strategy | Example from 448 |
|---|---|---|
| Stable owner + shape | `classDefByOrNull` + signature scan | `MediaExtKt` + return `User` + `(UserSession, Media)` → `A0t` |
| Derivable owner + shape | walk from a stable anchor | `IgReactDialogModule.showDialogHelper` → builder `LX/0Akg` → `(OnClickListener, CharSequence[])` → `A0a` |
| Call-site relationship | data-flow (`resolveConstantOnCurrentPath`, instruction tracing) | `Media.A8h` has 135 `List` no-arg candidates; the edit-media call site picks it |
| Pando key | map literal → field read | `"video_versions"` → `AAM`; `"image_versions2"` → `A2w` |
| Anchor string only | fingerprint `stringMatches` | mapper class discovery |
| Opcode/literal shapes | last resort, verified across every target | never alone |

Obfuscated names are reconnaissance only. A preserved package does not make a short name
stable: `MediaExtKt` is stable, `A0t` is not.

### 3. Typed emission instead of sentinel rewriting

New code emits through `crimera:morphe-bytecode`:

- `insertHook(index) { ... }` with `Block` emitters and `Target.Local` / `Target.Original`.
- State `relocateBranchTargets` whenever the insertion point carries labels.
- Zero raw smali templates and zero `findFreeRegister` in new IG code.

The extension source must contain no fake obfuscated names. Entity patches rewrite the call
site with the exact resolved descriptor; when a member cannot be emitted directly, cache the
resolved signature and pass it explicitly. This is what removes the entire "sentinel leaked to
device" class of bug. A placeholder-completeness gate (collision-proof markers scanned after
patch execution) belongs in the library as the backstop for whatever migration remains.

### 4. Runtime boundary

Keep only verified stable models as `compileOnly` stubs. When a stable owner exposes an
unstable method, inject a direct invoke from the patch instead of reflecting at runtime.
The download path follows this: `MediaBridge` stubs are filled with direct calls resolved by Pando key
or stable anchor, with owner and return types asserted. No `Entity` reflection remains.

### 5. Fail closed, always

- `requireExactlyOne(label, candidates)` / `requireAtMostOne(label, candidates)` for every
  resolution; failure messages list every candidate.
- `scopedMatchAll` for owner-scoped fingerprint matching; never a global first match.
- Explicit shape variants when the contract changed, with the cardinality asserted across
  all shapes.
- `distinct()` any reference list before an at-most-one check: `ImageInfo.Bc4()` is
  referenced twice in `Media` on 448, and a raw candidate list reports a false ambiguity.
- `// resolver-lint: allow instruction-order raw-first because …` only where bytecode order
  is the contract, placed on the line above the finding.

## Version-bump workflow

1. Freeze the target: package, version, APK, MPP, output. Reuse stored decomps.
2. `./gradlew :patches:build --no-daemon` (extension build + animalsniffer floor).
3. `./gradlew :patches:lintResolvers --no-daemon`.
4. `./gradlew :patches:checkExtensionDescriptors --no-daemon`.
5. `./patch-ig-cli.sh <apk>`; confirm `Applied:` and `Saved to:`.
6. On failure, read the first `PatchException` candidate list. The fix belongs in the
   resolver, never in an `if (version == …)` branch and never in extension source.
7. Cross-check the candidate resolvers against the older supported APK
   (`dexscope dry-run` / `check-stability`) before adding a compatibility entry.
8. Deep validation (final DEX reachability, old/new runtime matrix) only after a reported
   failure or an explicit request.

Compatibility stays in one place: `COMPATIBILITY_INSTAGRAM`. Capabilities are resolved from
the APK at patch time — class presence plus shape — not from the version string.

## What is already in place

- `piko-patches-library` provides `requireExactlyOne` / `requireAtMostOne`,
  `scopedMatchAll`, instruction data-flow, semantic emitters, the resolver linter and the
  extension-descriptor gate.
- `piko-ig-lite` wires the animalsniffer API floor, `lintResolvers` and
  `checkExtensionDescriptors` as verification tasks.
- The Downloads patch and its decoder closure are fail-closed: binder/selector lookups
  assert exactly one match, the image-variant accessor asserts at most one after `distinct()`,
  and order-contractual anchor scans carry directives explaining the contract.
- Download sheet thumbnails ride emitted bridges resolved by the `SaveAsStickerHelper` /
  `Error getting bitmap from cache` log anchors plus the static `(String) -> Bitmap` shape
  (`LX/0PoN.A00` on 448, `LX/0jhc.A00` on 449). `ThumbnailLoader.cachedBitmap(String)` keeps
  Instagram's own helper as the fallback tier and `cachedBitmap(Object, String)` replays the same
  cache chain for the real `ExtendedImageUrl`, whose `ImageCacheKey` carries the width/height that a
  `SimpleImageUrl` built from a bare URL always reports as -1. The app ships no
  Coil/Glide/Fresco, so the loader probes each variant object and then its URL string against the
  host cache and falls back to its own memory, disk and bounded-network tiers; a cache miss
  returns null and never starts a load.
- The instant tier is the extension-owned decode mirror. A typed return hook on every image cache
  decode facade (anchored by `ImageInfraMemoryCache::decodeAndMaybeAdd`; one or two facades per
  release) copies the decoded bitmap into `ThumbnailMirror` under the `ImageCacheKey` identity string
  (the field `hashCode` reads) held by the facade's `String` key parameter. The key parameter is
  resolved from data flow at every external call site of the facade, the postprocessor slot from
  the cache interface signature, and the bitmap field from the resolved cache chain; the hook
  fails closed when any of those are ambiguous. The mirror stores RGB_565 copies capped at 256px
  and 10MB, and falls back to Instagram's in-memory cache when it has no copy.
- Behind the mirror, the loader also reads Instagram's own disk cache through
  `igDiskKey`/`igDiskCaches`/`igDiskOpen`, emitted from the singleton/facade and the reader
  anchored by `ERROR_CONTENT_ID_NULL_ON_DISK_CACHE_LOOKUP`. The reader's `Du2(String, Map)` call
  resolves the holder, entry and `InputStream` field chain, and the facade's no-arg `List`
  accessor enumerates every disk cache; a release that routes disk reads differently fails closed
  instead of reading the wrong stream. Load order is mirror -> host -> Instagram disk -> own
  memory/disk -> bounded network, with a per-item `tier=` log line under `PikoIgThumb`.
- The feed download button covers both UFI renderers. The view row binder hook serves the main
  feed; Litho surfaces (e.g. the contextual profile feed) get a second icon component built
  into the UFI builder. The node, component, wrapper and factory shapes are derived from the
  save-icon instructions, not from obfuscated names. The live carousel index is read through
  `DownloadUtils.currentMediaIndex`, whose body the patch emits from the resolved row-state fields.

### Sheet UI ownership

The bottom sheet is shared UI, not Instagram code: `BottomSheetView`, `ListItem`, `IconView` and
`ButtonView` now ship in `piko-patches-library` as `app.morphe.extension.crimera.ui` and draw only
through the `SettingsTheme` installed with `PikoTheme.install`. This repo supplies
`InstagramSheetTheme` (in `extensions/instagram/.../utils`), which resolves the same `igds_*`
attributes the retired local `SheetTheme` did, against the activity context, so the sheet keeps
Instagram's light/dark/Prism palette and its monochrome accent. `DownloadSheet` installs the theme
before it builds the sheet; the components carry the motion, gesture and window-inset behaviour
unchanged. `extensions/proguard-rules.pro` keeps only the extension packages this bundle calls.

### Settings

The settings screen is the shared one from `piko-patches-library`; this repo owns no settings UI code
beyond its binding. A feature patch declares its toggles with `instagramToggle` (a thin wrapper over the
library's `settingsToggle`), which makes the patch depend on `instagramSettingsPatch`. That base patch
adds the `InstagramSettingsActivity` manifest entry, the Piko icon and the strings, installs the host and
loads `SettingsRegistry` right after `Utils.setContext`, and hooks the profile action bar so the signed-in
user's own profile shows the Piko icon. Extension code reads values through `settings/Settings`; each ID
and default there has a twin in the patch that declares it. A new feature patch adds its toggle in its own
`bytecodePatch` block and its strings to `values/instagram/strings.xml`, and nothing else.

The profile action bar hook resolves by shape (the static builder `ProfileActionBar` calls, the two
consecutive `removeAllViews` calls, the single `User` field behind the profile state), so it carries no
obfuscated names. The strings file holds only strings the bundle uses; add translations next to a string
when it exists in the default file.

## What is next

1. Delete the remaining `Decoder.kt` globals (`CURRENT_MEDIA_FIELD`, `MEDIA_ADD_INFO_CLASS_NAME`).
2. Add the placeholder-completeness gate to `piko-patches-library` and run it for every
   bundle build.
3. Split the resolver-linter fixture corpus per app: generic rules in the library, IG
   fixtures (like `ImageInfo.Bc4` duplicates and the `A8h` 135-candidate case) in this repo.
4. Keep the 448 + 449 APKs in the validation matrix and gate `dry-run` cardinality per resolver.
