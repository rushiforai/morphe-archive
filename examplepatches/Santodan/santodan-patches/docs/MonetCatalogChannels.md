# Monet individual Nuvio catalog rows

Select **Monet - Individual Nuvio catalog rows** for original Monet
`com.klevico.monet` **1.0.97** (version code 131). The patch is independent of the
premium and displayed-card patches and can be combined with them. Select only
one premium alternative.

The user confirmed on **2026-10-26** that the signed catalog-content-v2 update
now appears to work correctly on their Android TV setup. This is user-reported
device confirmation; the local checks below separately cover build and APK
integrity. Extended profile-switching and long-running lifecycle checks remain
useful follow-up coverage rather than prerequisites for the reported fix.

## Use

1. Enable the desired channels in NuvioTV under **Settings > Layout >
   Santodan-Patches > Android TV launcher**. Let Nuvio publish them.
2. In Monet, create a custom media row and select the real **NuvioTV** app.
3. In that row's **Content** picker, choose a catalog alongside the original
   **Continue Watching**, **Recommendations**, and combined choices.
4. Repeat for each catalog. Monet's usual rename, ordering, layout, card limit,
   hide-title and focus controls remain native.

Catalogs now belong inside their publishing app's content choices. They no longer
appear as artificial apps in Recommendations' source list. Package/icon lookups
use the real publishing package (including `com.nuvio.santodan`), so the native
app icon renderer can use Nuvio's installed icon. Existing saved catalog rows keep
their stable source IDs and work with the new picker without manual recreation.
The content label shows the selected catalog name. Selecting one of the original
three content modes restores the ordinary app source.

Library, Upcoming and tracking-list channels published by the Nuvio patch also
appear. Choices use the publishing package plus stable internal channel key,
so renaming or recreating an Android numeric channel ID preserves selection.
An unpublished channel becomes unavailable; its saved row selection is retained.
A successfully read empty channel remains selectable. A title shared by two
catalogs can appear in both rows. Tiles retain their original Nuvio intents.

## Independent refresh and recovery

The previous adapter relied on Recommendations' bounded preview scan and its
refresh-triggered membership snapshot. This could omit sources or empty saved
rows until Recommendations was toggled. The supplied device log contained no
`SantodanMonet` errors, so it did not identify the exact triggering refresh.

The current adapter observes TvProvider's channel and preview-program tables
while Monet's main activity is resumed, with a 400 ms debounce. It reads each
published catalog separately using Monet's original reader and native item
conversion: at most 256 channels and 100 titles per channel. Data access stays on
a single worker; row rendering and content-picker callbacks perform no provider
queries. Channel data and metadata are published as one snapshot. Duplicate
provider notifications coalesce. Failed/null reads retain the previous snapshot
and retry three times at 2/4/6 seconds. Successful deletions and empty data are
authoritative. Pause unregisters both observers, cancels pending work and discards
late results; resume starts a fresh scan. There is no background service or disk
history cache.

A separate native StateFlow revision is combined with Monet's existing preview
flow. Revision-bearing lists keep the original Recommendations elements intact,
while invalidating native equal-item/projection caches when only catalog
membership or names change. This does not write to Monet's aggregate state or
require Recommendations to be visible/enabled. Custom catalog rows read their
own channel items, bypassing Recommendations' global scan cap, disabled source
switches and hidden-title settings. A row's own hidden titles remain respected.
Native aggregate filtering and ordinary app rows retain their original behavior.

## Original and hook contracts

Input: `../OriginalApps/monet-1.0.97.apk`, package `com.klevico.monet`, version
`1.0.97` / `131`, minimum SDK 26. SHA-256:
`58bcdaeb7de6109434e013e796e367df6bdfcea3b9b17a01c15431c51d5556cf`.
The original manifest and hash were checked again for this change. No older
version was added or extended.

All native mutation targets are validated with exact complete DEX fingerprints
before changing any method. Extension-facing public constructors, methods and
fields are independently checked. The ten changed methods are:

- `fi5.k(Context,Uri,int,Long):ec5` and `fi5.e(List):List`: preserve the existing
  reader integration, but ignore legacy snapshot writes after independent refresh
  takes ownership, including late callbacks after pause.
- `zg2.i(Object,Object,Object,Object,Object):Object`: retain the saved catalog
  identity at original index 547; supply independent items before index 675's
  row filter; match membership at 686/687; keep only the custom row's own hidden
  keys at 699; preserve real app source options at 965.
- `rx3.u(List,Set,Set,Set,LinkedHashMap,List,int):ii4`: preserve the existing
  catalog-aware disabled-source adapter for aggregate/legacy choices.
- `mx3.<init>(Context,ym,iz2,mm,xk,ne1,gh7,m20,v47,io0,e87,ch2)`: original index
  215 places Recommendations' `ie6` at index 1 of the five-input preview-flow
  array. Wrap just this input with `yg2.o(nj1,nj1,nj1,ar1):lm` and a native
  `sx.a(Object):ie6` revision flow. Receiver register v20 stays intact for its
  later native use; v15 is dead from the preceding combine until original index
  249, so it holds the wrapped `nj1` for this array store. Register count stays 59.
  `lm.b` and `jk1.s` confirm the transform invokes `ar1.o` directly.
- `MainActivity.onResume()` / `onPause()`: entry callbacks with the original
  receiver at v14 / v7. Foreground subscription ownership follows these callbacks.
- `cs0.j():String`: resolve only synthetic catalog IDs to the real app package
  before its original return, preserving package-backed native icons.
- `kq3.f(Object,Object):Object`: substitute the selected catalog's content label
  after the original label computation (index 79).
- `zs3.u2(...)`: at original index 1465, delegate the existing generic `L1` content
  picker to the adapter. Its existing row v44 is captured immediately before the
  call. The adapter adds this owner's channels to the three native options and
  delegates rendering/focus to the same native picker. Native `q03` and `xr2.L`
  actions persist content mode and stable package/source selection.

Evidence is under `../.inspect-monet-1.0.97/`, including the original
`channel-*-contracts.txt`, `catalog-selection-dex.txt`,
`catalog-model-constructor.txt`, `catalog-native-combine.txt` and lifecycle dumps.

## Verification

Run with Java 21:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ./build-local.ps1 :patches:buildAndroid :patches:verifyMonetCatalog :patches:verifyMonetCatalogRuntime :patches:verifyMonetCatalogBundle :patches:verifyMonetDisplayedCardsBundle :patches:generatePatchesList :patches:verifyMorpheDesktopImport -PmorpheDesktopJar=E:/Morphe/morphe-desktop-1.19.1-all.jar --offline
```

DEX checks cover exact original matching, missing/duplicate/already-patched
rejection, registers, original-instruction restoration, exception coverage and
DEX write/reload. Runtime fixtures execute the production subscription and
adapter with native-model/provider fixtures: independent scans and revisions,
nested picker/callback persistence, real app ownership, shared titles,
empty/disabled Recommendations, hidden-title isolation, read failures/recovery,
channel ID recreation, removal, and observer/callback cancellation on pause.
Packaged checks apply the actual bundle alone, with either premium variant, and
with the displayed-card patch, checking every native method and class ownership.

Bundle: `patches/build/libs/patches-0.14.0.mpp`. Desktop 1.19.1 is the current local
JAR; 1.19.0 is no longer present. Use the explicit verifier property above rather
than its older default path. Device checks still required: native picker focus,
Nuvio icon appearance, multiple rows with Recommendations hidden/disabled,
cold/warm launch, returning from Nuvio, and source/profile changes. No device
installation is performed by these checks.

Validation on 2026-10-26 passed: buildAndroid, original DEX contracts/write-reload,
runtime fixtures, all three catalog bundle selections, all four displayed-card
bundle selections, metadata generation, and Desktop 1.19.1 import (33 patches,
eight apps). The standalone Desktop rebuild is
`../Apps/Monet/monet-1.0.97-independent-catalogs-unsigned.apk`.
`verifyMonetCatalogApk -PmonetCatalogApk=E:/Morphe/Apps/Monet/monet-1.0.97-independent-catalogs-unsigned.apk`
confirmed all 8,514 original classes, ten hooks, 18 adapter classes, unchanged
unrelated methods, and all 673 original non-DEX/non-signature files.
`zipalign -c 4` passed; the output retains package/version/code and is deliberately
unsigned. It has not been installed or device-tested. Logs are
`catalog-independent-final.log`, `catalog-independent-final-dex.log`,
`catalog-independent-final-apk.log` and `independent-catalogs-desktop-final.*`
in the inspection directory.

## Installable delivery and stale-APK diagnosis

The subsequent screenshot report still showed catalog titles as fake app choices
and only three native Content modes. The installable
`../Apps/Monet/Monet-1.0.97-patches-0.14.0.apk` had not been rebuilt with the
integration above: its original `MainActivity.onResume` lacked CatalogRefresh,
and its adapter still appended synthetic catalog source options. A read-only
pull from connected `emulator-5554` proved the installed APK was byte-identical
to that old local output (SHA-256
`6b208f05e3ffe7b29f9782cbfdefc8740ce925e9227374dd23c168a3bc3d123d`).
The report therefore did not exercise the new nested Content picker.

The replacement installable delivery is
`../Apps/Monet/Monet-1.0.97-patches-0.14.0-catalog-content-v2.apk`, rebuilt from
the original 1.0.97 with catalog rows, unlimited displayed cards and premium,
preserving the existing feature selection. The usual versioned output path now
contains the same verified replacement. The previous output is retained under
`../backups/Monet/Monet-1.0.97-patches-0.14.0-before-catalog-content-v2.apk`.
No bundle/app version was bumped.

Morphe Desktop 1.19.1 rebuilt and signed the replacement successfully.
`verifyMonetCatalogApk -PmonetCatalogCombined=true` validates all ten catalog
hooks, the five displayed-card hooks and the premium evaluator in this exact
signed APK, retaining all 8,514 native classes, 26 extension classes and the 673
original non-DEX/non-signature contents. The verifier must inspect the actual
delivery path rather than only a standalone unsigned fixture. Runtime fixtures,
original DEX checks and all four combined bundle selections also passed.
APK signature verification and zip alignment passed. Its signing certificate
SHA-256 is `c6f46fdf215e35e421ce61153b7fa671a485c3e266ccf03eabfe1d59c900a0d5`,
matching the old installed APK, so it can update the installation in place.
It was not installed or device-tested during this investigation.

New logs identify the actual integration with `SantodanMonet` messages beginning
`Catalog content v2`: foreground subscription start and changed-snapshot counts.
Only counts are logged, not catalog names, titles or playback history. Reports
are `catalog-content-v2-delivery-build.log`, `catalog-content-v2-signed.json`,
`catalog-content-v2-signed.log` and `catalog-content-v2-signed-verification.log`
in the inspection directory.
