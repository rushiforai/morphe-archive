# NuvioTV metadata add-on selection

Current target: **com.nuvio.tv 1.1.1 / 1081** only. Original:
`../OriginalApps/NuvioTV-1.1.1.apk`, SHA-256
`1ac8aa80ad9fff7b4c21cfe4bfdfed61b4de44a120ff4b1b5743149ccb00928d`.
See [Nuvio111.md](Nuvio111.md) for migration and delivery checks. Native metadata
repositories and saved enrichment constructors retain their 1.1.0 contracts.
The library image helper moved from `z0.c.e` to `z0.d.e`; the guarded library-card
fingerprint and image-request anchor now use the reviewed 1.1.1 binding.

Enable **NuvioTV - Metadata add-on selection** when patching. Open
**Settings > Layout > Santodan-Patches** and choose **Metadata add-on**.
The picker includes enabled installed providers advertising the `meta` resource.
**Nuvio default** restores native selection. Preferences are per profile and
included in Santodan settings export/import. Installation URLs identify providers;
duplicate display names do not merge installations. Stream-only providers are excluded.

This is a manifest-capability filter, not a live reliability test or a list of
exclusively metadata-focused add-ons. An add-on can provide metadata alongside
streams/catalogs, and several installed add-ons may successfully resolve the
same title. A success-only test can therefore still include several providers.
A title failure does not prove an add-on lacks metadata support. Choose the
provider whose metadata and artwork you want to use. The patch
does not probe every installed add-on when opening the picker or hide providers
based on one failed request. Configured URLs and raw device logs are not published.

Keep Nuvio's **Prefer external meta addon** enabled for external detail metadata.
The patch selects the provider for the shared external metadata lookup. Catalog
responses and TMDB enrichment preferences remain native. An unavailable provider,
unsupported title or failed request falls back to the original lookup.

**Use metadata add-on in Continue Watching** is independently off by default.
Enabling it uses the selected provider's metadata and gives its artwork precedence
over saved progress posters and episode thumbnails. Poster layouts use its poster;
landscape layouts prefer its landscape poster, background, then poster. Missing
artwork retains native images. Resume and Next Up entries are covered in modern
and Classic/Grid layouts. Only presentation objects change; saved watch progress
is never rewritten.

**Use metadata add-on for library posters** is a separate, off-by-default switch
in the same settings section. It changes only library card artwork. Each composed
library card uses the selected provider's poster, or its landscape artwork for a
landscape card. The existing poster stays visible while loading and remains the
fallback when metadata or artwork is unavailable. Library entries, titles, sorting,
filters, provider membership and saved poster URLs are not rewritten.

Library lookups run on IO through the same native metadata repositories. Native
Compose LaunchedEffect owns each card's request and cancels its consumer when the
card leaves composition. Requests are limited to two concurrent lookups and 64
pending/running consumers, with an eight-second lookup timeout, a bounded state
cache and the existing provider/title failure cooldown. The library switch works
with Continue Watching disabled, and is included in per-profile settings backups.

Restart Nuvio after changing settings so existing metadata/presentation caches
can rebuild. Selected-provider posters, backgrounds and logos are written into
Nuvio's existing per-profile Continue Watching enrichment records. Its normal
save/restore path retains these images across app restarts; no additional artwork
file or preference cache is created. Existing installations need one successful
enrichment/save after updating. Saved watch progress remains unchanged.
Restored enrichment overlays allow a fresh
selected-provider lookup when needed. Failed title/provider lookups have a
60-second retry cooldown. Native eligibility, timeouts, lifecycle jobs,
cancellation and HTTP cache lifetimes are retained. No custom HTTP client or
background observer is added.

## Native evidence

The following feature evidence describes the original 1.1.0 implementation; its
five retained DEX fixtures match that original byte-for-byte. Focused evidence is
under `../Skills/inspection-evidence/.inspect-nuvio-110/metadata-*`. The 1.1.1
comparison and separate fixtures are under `.inspect-nuvio-111` in the same directory.
Original DEX governs bindings; the local source checkout only helped locate them.

- `fa.c.a(fa.c,String,String):Flow` delegates to native metadata repository
  `ba.x2.k(type,id,source):Flow`. The selected lookup uses a private instance of
  `ba.x2(Context,AddonApi,fa.a,v9.s)` with independent caches/in-flight maps.
- `ba.x2.n(ContinuationImpl):Object` filters only private instances' completed
  add-on lists. Its suspension-marker return and the original installed list remain intact.
- `ya.d5.invokeSuspend(Object):Object` owns both CW timeout branches: two all-add-on
  and two primary lookups. Disabled behavior invokes the exact original route.
- `ya.p4.invokeSuspend(Object):Object` reuses `v3.g1` InProgress and `v3.f1` NextUp
  overlays. Wrapping their two completed reads permits the existing semaphore/lifecycle
  job to enrich restored entries. No overlay is removed or overwritten by the hook.
- Native `com.nuvio.tv.data.local.s0` and `t0` constructors hold Resume and
  Next Up enrichment records. Their `d`, `e` and `f` artwork fields receive the
  selected poster, landscape/background and logo before native serialization.
  Constructor registers v3/v4 hold content ID/type; v6/v7/v8 hold artwork.
  All other constructor instructions remain unchanged. When the process artwork
  map is empty, deserialization retains the images already stored in the record.
- `ya.p7.a(f0,boolean,DetailImdbRatingsVisibility,String,String,Context):m6`
  constructs modern CW presentation. The boolean at v40 selects landscape. Its
  sole return holds the result in v11; v2/v3 are dead. The wrapper copies `m6`
  and its `q1` hero using validated full constructor references and field order.
  Payload `i9` holds its CW item in `g`.
- `na.p1.g(f0,boolean,boolean):String` selects Classic/Grid images; its final
  boolean selects poster art. An entry guard returns selected artwork if present,
  otherwise runs the complete original method.
- `na.b2.invoke(Object,Object,Object):Object` selects the library poster URL into
  v7, with its card receiver in v0, composer in v13 and landscape flag in v9.
  The new hook runs immediately before `z0.c.e(String,Composer):int`, so the
  original image request retains its size, cache key, effects and error handling.
  The card's preview is the shared validated `REF_METADATA_LIBRARY_PREVIEW` field.
- `ba.x2`'s constructor registers the original metadata repository before any
  private selected-provider copy is created. Full `REF_METADATA_LIBRARY_EFFECT`
  binds static `g1.e0.d(Composer,Object,Function2):void`; original `g1.w0` launch
  and cancellation methods establish its native composition lifecycle. Each
  library callback balances a separate replaceable group using `d0`/`p(false)`.

Eleven native methods change, including component registration; eighteen behavior hooks
are injected. Hook bodies have exact descriptor/register/instruction fingerprints.
Runtime reflection shares full `REF_METADATA_*` contracts with patch validation.
Private repository cache entries are bounded to four; artwork and failure records
are each bounded to 256 profile/provider/type/ID keys. Profile/provider switches
cancel stale selected results before publication.

Library renderer validation removes only the two known date-badge extensions'
post-image callbacks from a copy before comparing the complete original fingerprint.
Other changes and duplicate metadata hooks still fail. This permits independent
and combined selection with finale/movie-date badges without weakening the native
library image contract.

## Verification

Run through `build-local.ps1` with Java 21 and Android SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioMetadataAddon :patches:verifyNuvioMetadataRuntime :patches:verifyNuvioMetadataSettingsRuntime :patches:verifyNuvio110Bundle '-Pnuvio110Selections=metadata,combined' --offline
.\build-local.ps1 :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.1.1-all.jar' --offline
```

DEX checks cover changed/missing/already-patched rejection, mutation scope and
write/reload. Production runtime tests cover routing, native/default and CW opt-in
paths, failures/cooldown, profile/stale-flow isolation, cancellation, bounded
repositories, restored-cache decisions and immutable poster/landscape/hero changes.
Production settings callbacks cover metadata eligibility, duplicate names,
removed/disabled providers, profile isolation, stale callbacks and persistence.
Latest packaged checks include metadata-only and combined selections with no new
cross-DEX hierarchy findings.

Device checks remain for remote focus, configured add-on responses, cold/warm CW
refresh, both layouts, profile switches, image-load fallback, TMDB interactions,
and settings import/restart. Diagnostics use `SantodanMetadata`. Host/APK checks
do not establish device behavior; no installation or device testing was performed.


## Local validation on 2026-11-15

Android bundle build, metadata generation, complete `verifyNuvioLatest`,
standalone/combined metadata selections, production runtime/settings checks,
Android bundle validation and Desktop 2.1.1 import passed. Cross-DEX validation
retains the original's 36 optional-library findings and adds none. Logs are
`metadata-final-regression.log` and `metadata-delivery-validation.log` in the
canonical evidence directory.

Bundle: `patches/build/libs/patches-0.18.1.mpp`.
SHA-256: `d679fb4d943e708f7855b845f69350910478ba75cdaea3fe7dfdabe33b1ba694`.

All seventeen NuvioTV patches were rebuilt from the original into
`../Apps/NuvioTV/NuvioTV-1.1.0-metadata-addon-all-unsigned.apk`.
SHA-256: `fa8fd8345c1a53dd8e35cf799c2a29b2f051ec2d5b043c82cf9666b663e65932`.
All original native libraries are byte-identical and 16-KB alignment passes.
This output is unsigned and was not installed. The delivered reflection/hook audit
is `verifyNuvioMetadataApk` (optional `nuvioMetadataApk` property to select an APK).


## Library-poster follow-up validation on 2026-11-15

The updated build passes `verifyNuvioMetadataAddon`, `verifyNuvioMetadataRuntime`,
`verifyNuvioMetadataSettingsRuntime`, `verifyNuvio110Bundle` with
`-Pnuvio110Selections=metadata,combined`, `verifyAndroidBundle`,
`verifyMorpheDesktopImport`, `verifyNuvioMetadataApk`, `verifyNuvioSettingsBackup`
and `verifyNuvioSettingsTransferRuntime`. The Desktop JAR was 2.1.1. Focused,
packaged and actual-APK logs are `metadata-library-validation.log`,
`metadata-library-bundle.log` and `metadata-library-apk-audit.log`.
The earlier full-suite results above belong to the initial metadata/CW delivery.
The follow-up runtime checks include independent library/CW switches, per-profile
persistence/export, initial/failure fallback, snapshot state updates and disposal
cancellation. Standalone and combined DEX add no hierarchy findings.

Local verification bundle before publication: `patches/build/libs/patches-0.18.1.mpp`.
Local verification bundle SHA-256: `83a5582a53bc79cbd015743c0ec4a0b681f53f4286f8abbadbbc96bb7cd04413`.
The new combined APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-metadata-library-all-unsigned.apk`.
APK SHA-256: `f69517a3f8fcd1b2a481a302c195f9dc4b103a0f3bafe4a3f8e0d5dc87ad23da`.
It retains all original native libraries and passes 16-KB alignment. The delivered
APK audit resolves all twelve hooks and the native effect reflection reference.
This local APK is unsigned, was not installed and has not been device-tested.
Published release versions and assets are assigned separately by the Release workflow.

## Native artwork persistence validation on 2026-11-20

Replaced the proposed extra preference cache with hooks in NuvioTV's existing
Resume and Next Up enrichment-record constructors. The DEX regression verifies
the ID/type/artwork registers and proves that removing the three hooks restores
each constructor's complete original fingerprint. Runtime checks cover selected,
disabled, unresolved, profile/provider isolation and restoration without requests.

Passed `buildAndroid`, `verifyNuvioMetadataAddon`, `verifyNuvioMetadataRuntime`,
`verifyNuvioMetadataSettingsRuntime`, `verifyNuvio110Bundle` with
`-Pnuvio110Selections=metadata,combined`, `verifyAndroidBundle`,
`verifyMorpheDesktopImport` using Desktop 2.2.0 and `verifyNuvioMetadataApk`.
Standalone and combined DEX checks add no hierarchy findings beyond the original
36 optional-library findings.

Local bundle: `patches/build/libs/patches-0.20.0.mpp`, SHA-256
`21995409deb457e12932340edf10a494ebbb44146f1e240b32be88bfe9176de8`.
The metadata-only verification APK rebuilt from the original is
`../Apps/NuvioTV/NuvioTV-1.1.0-metadata-native-save-unsigned.apk`, SHA-256
`95a81ffb406fcd31cbe744a1b618b9fc3965b81d1d509ea69bd6bcd7f205d82f`.
All eighteen delivered hooks resolve, all 108 native libraries are unchanged,
and 16-KB alignment passes. This APK is unsigned and was not installed.
Cold/warm startup and visible poster retention still need device confirmation.


## Pre-publication review

The complete `verifyNuvioLatest` suite was rerun for the final library-capable
implementation, including all eleven latest packaged selections. Android bundle
verification, Desktop 2.1.1 import and `verifyNuvioMetadataApk` passed after rebuilding
the unsigned app from the original. The rebuilt APK retains the hash recorded above.
The final README and patch list are generated from the compiled bundle; release
versioning and published asset generation belong to the Release workflow.
