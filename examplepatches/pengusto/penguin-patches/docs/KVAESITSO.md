# Kvaesitso: restore access to widget editing (#1504)

Morphe patch for [MM2-0/Kvaesitso #1504](https://github.com/MM2-0/Kvaesitso/issues/1504), included in [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7). Kvaesitso is an open-source Android launcher built around search, apps and widgets. This patch restores access to its widget editor after hiding the Edit button.

**Morphe name:** Restore widget editing from the search menu.
**Compatibility:** `de.mm20.launcher2.release`, original official **1.41.0 only**.
The combined release contains **12 patches for nine apps**. A native PR remains conditional on maintainer greenlight, requested in the [issue comment](https://github.com/MM2-0/Kvaesitso/issues/1504#issuecomment-6377133898).

## Pinned inputs

- Source: [v1.41.0](https://github.com/MM2-0/Kvaesitso/releases/tag/v1.41.0),
  commit `328073f38f8472118a377f69cce34a2c86372ab9`.
- Original APK: `de.mm20.launcher2.release-v1.41.0.apk` from that release.
  SHA-256: `55e4a287f1198be22f040c2ad1443f5861b58b1d1394d7377221f1ad4448b810`.
- Original signing certificate SHA-256:
  `bf65bbd617997397800d02e0ac2e45cee153151518545c23ef66b3cb2cfdf7bc`.
## Behavior

When the Edit button preference is explicitly disabled, the search bar menu
offers Edit widgets. It opens the existing editor on the current widget page,
the combined home page, or another configured widget page. A visible Edit
button keeps the existing menu without a duplicate entry. Missing widget
destinations do not produce a dead menu action. Existing localized labels and
icons are reused.

The Morphe patch uses existing navigation, edit, Back and unlock behavior. It
adds a per-widget-page Compose edit request and small accessors rather than
rewriting preferences or widget records. The combined home page uses its
existing edit setter. Home-button widget destinations are included in the
existing secondary-page component set so that they can render.

## Morphe implementation and local build

- Patch: [`WidgetEditingPatch.kt`](../patches/src/main/kotlin/io/github/pengusto/patches/kvaesitso/WidgetEditingPatch.kt).
  Before modifying the app, canonical DEX hashes of all seven touched original
  classes must match. Changed or already patched bytecode fails explicitly.
- Runtime: [`WidgetEditing.kt`](../extensions/extension/src/main/java/io/github/pengusto/patches/extension/kvaesitso/WidgetEditing.kt),
  built as the separate `extensions/kvaesitso.mpe`. Compile-only signatures in
  `stubs/kvaesitso/` are never injected. Kotlin, Compose and coroutines come
  from the target app; no new runtime library is bundled in this extension.
- The app uses R8-shrunk Kotlin/Compose APIs. The extension matches its compiler
  and dependency versions, disables assertion/source-information calls absent
  from the APK, and binds one retained coroutine intrinsic implementation.
  `VerifyPatchedApk.java` validates actual shipped APIs, beyond compile stubs.
- Release bundle: `patches-1.0.0-dev.7.mpp`, from [v1.0.0-dev.7](https://github.com/pengusto/penguin-patches/releases/tag/v1.0.0-dev.7). The generated catalogue and Morphe inventory include this patch for 1.41.0.
- Java 21 `:patches:buildAndroid` succeeds through the documented local fallback:
  official Morphe Gradle plugin **v1.3.4**, clean source commit
  `a230c33f7eca1e18b07bf1114ca850421520f98d`; verified public Morphe Desktop
  **1.18.1** with Patcher **1.15.1**. Desktop SHA-256:
  `1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b`.
  This uses an ignored local Maven repository/init script because this machine
  has no GitHub Packages `read:packages` credentials. The normal authenticated
  build configuration is retained.

Commands and acceptance scripts:
[`tests/kvaesitso/README.md`](../tests/kvaesitso/README.md).

## Morphe validation

The official APK is patched with Morphe Desktop and the local MPP. Tests run
on the dedicated Android 15/API 35 ARM64 AOSP emulator with synthetic data.
The unchanged official APK is re-signed only to create a same-key test baseline;
its code/resources are checked byte for byte against the official download.

- Baseline reproduces the precise #1504 failure with the Edit button verified
  hidden and no Edit widgets action in the search menu.
- Same-package, same-key update to the Morphe-patched official APK preserves
  every Widget column/row and every stored setting exactly.
- Five real-UI scenarios pass: hidden button from home, widgets or search;
  visible button without a duplicate menu entry; widgets on the combined home
  page. The editor, Add widget control, Done/Back navigation and preference
  retention are checked.
- Three alternate destinations pass with only a right swipe, long press or
  Home-button widget destination configured. No widget destination yields no
  dead action. The current second widget page takes priority over the first;
  its distinct note is verified before and after editing, and its editor
  contains only that page's widget. Navigation leaves all Widget rows intact.
- Real editor operations pass: drag the existing note to the first position,
  remove only the selected Media widget and add a built-in Note through the
  actual widget picker. Widget identities, decoded configuration contents and
  parent pages are retained for all other widgets. Settings remain unchanged;
  stored rows and existing note content survive a process restart. The native
  editor normalizes default `NULL` configs to `{}` and compacts JSON during
  user-requested saves; the update check before editing remains byte-exact.
- No fatal exception or fatal signal appears in the final acceptance crash
  buffer. The second-page and editing checks were rerun after correcting UI
  readiness, overflow selection, IME handling and JSON comparisons in the test
  harness; the tested Morphe patch payload did not change during those reruns.
- Linkage check passes: 14 new extension classes, 150 method/field references,
  no unresolved shipped APIs or duplicate classes.
- Already patched and rebuilt native release bytecode are rejected. The debug
  package is excluded by compatibility, with zero patches applied and its DEX
  unchanged.
- New runtime and compile-stub lint: zero errors. Remaining warnings concern
  pinned dependency versions, version-catalog suggestions and the injected
  composable naming convention. The shared Fossify MPE is byte-identical to
  v1.0.0-dev.5.
- A File Manager application control using the local MPP produces byte-identical
  patched DEX to the published MPP. This is a packaging/application check, not
  a repeat of all seven Fossify device acceptance suites.

Final local artifacts (not published):

- MPP SHA-256:
  `503a96a33f8afe67866fd2fd0fb316d16fc9186b63c56934569facbe57ddf546`.
- Disposable-signed patched APK SHA-256:
  `b839eadef569a74181ef6714030cf58454ffcff0e91d147ab755fa6fd5f541b8`.
- Logs, screenshots, Room fixtures and acceptance summaries remain under
  ignored `.scratch/kvaesitso/morphe/`. The installed emulator fixture is left
  available for local review.

## Public comparison evidence

The [matched evidence](https://github.com/pengusto/penguin-patches/tree/c390b892ae23e5fd511bfa5f99b3dcd7689b3d39/kvaesitso-1504/2026-10-24/)
was captured separately on 2026-10-24 using the same accepted APKs and existing
synthetic widget data. The hidden Edit button preference is checked in the real
settings UI. The original menu lacks Edit widgets; the Morphe-patched menu has
the action and opens the usable native editor with Add widget. Done/Back and
reopening pass, with the hidden-button preference retained. Every Widget
column/row and setting survives the same-key update and editor navigation;
initial fixture settings are restored. No widget is added, removed or reordered
by this capture. The patched APK SHA-256 remains the value above.

Only three unedited native PNGs, a provenance README and a curated verification
JSON were published on `pr-assets`, commit
[`c390b89`](https://github.com/pengusto/penguin-patches/commit/c390b892ae23e5fd511bfa5f99b3dcd7689b3d39).
The comment pins the images to that commit, identifies the unpublished Morphe
prototype and asks whether a native PR would be welcome. Public `dev`/`main`
heads and release records were unchanged at the time of that evidence-only post. Raw XML, logs, settings, Room data,
APKs and signing keys remain ignored. These are screenshots of the
Morphe-patched official APK. A separate native source candidate remains local.
See the [repeatable capture command](../tests/kvaesitso/README.md).

## Remaining limits

Physical devices, OEM variants, Android versions other than API 35 and
rotation/process death during editing have not been validated. The picker test
covers a built-in Note; it does not establish support for third-party widget
providers. No Morphe Manager device UI test has been
performed; patch loading/application uses official Morphe Desktop.

Both Morphe and native test APKs use a disposable certificate, **not** the
upstream certificate. They cannot update an upstream-signed installation in
place. The data regression uses baseline and fixed APKs with the same test
key/package; it does not claim that changing signing certificates preserves
an existing official installation. No uninstall is part of Morphe acceptance.

## Attribution

Kvaesitso and the reused UI/navigation code are by MM2-0 and contributors,
licensed under GPL-3.0-or-later. The source candidate builds on their existing
editor, labels, icons and gesture model and addresses the behavior reported in
issue #1504. Keep upstream copyright and license notices when applying it.
