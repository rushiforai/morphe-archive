# Icon Pack Studio 2.5 build 003 patch validation

Source update: 2026-11-03.

## Input

- APKPure universal XAPK, `ginlemon.iconpackstudio`, version `2.5 build 003`,
  version code `250030`, min SDK 29, target SDK 36.
  XAPK SHA-256: `bfa365371c89079ae3b3a91ec05dd38bad0fb8de3b28ca8d4fa416c8514c797a`.
- Base APK inside the XAPK, SHA-256:
  `8fdcd7e0df9134dbadc7b7a6910309a8f89334780a84aa7c26280eb7fe8253c3`.
- Google Play, APKPure, and Uptodown all listed `2.5 build 003` as the current release
  when this patch was written.

## Upstream change

The De-Vanced patch matched `IPSPurchaseRepository` by class name. In 2.5 build 003 R8
renames the class to `ginlemon/flower/ipsLicense/billing/a`; only its Kotlin inner
classes keep the `IPSPurchaseRepository$…` names. A name-based fingerprint therefore
no longer matches.

The updated patch finds the purchase-item holder by the three products initialized in
its static constructor (`lifetime`, `subscription`, `iconstudio.fx.pack1`) and selects
its public static no-argument `Z` method. That `b()Z` method ORs the three persisted
purchase flags and is called from 12 Pro gates (library, setup details, welcome,
app info, preferences, export, Drive backup, and others).

The patch prepends `const/4 v0, 0x1` / `return v0`, matching De-Vanced's behavior of
forcing the paid state without altering the stored purchase data or Play Billing.

## Verification performed

- Every patch source in the bundle compiles against the Morphe 2.1.0 patcher API
  (24 class files, including fingerprints and both bundled extensions).
- The bundle (`patches-1.1.2.mpp`) loads in Morphe Desktop 1.20.0 and lists five patches:
  Unlock Pro (Icon Pack Studio), Enable Pro and Fix Galaxy Buds3 Pro widget
  (Smart Launcher), and both OpenBubbles patches.
- Applying only Unlock Pro to the base APK passes the bundle's version check for
  `2.5 build 003`; Morphe reports 1 of 18,423 classes changed.
- Decoding the patched APK shows the moved class in `classes3.dex` with the forced
  return at the start of `b()Z`; the remainder of the method and the version metadata
  are unchanged. No other class, resource, or manifest diff was found.
- The OpenBubbles extension source/checksum audit still passes.

## Not verified

- The patched APK was not installed or launched on a device or emulator, so the Pro UI
  and purchase flow were not exercised at runtime.
- Purchases are not simulated: Play Billing remains untouched, and a real subscription
  is not expected to be affected.
- The patch was applied to the base APK, not a merged split APK. Install the patched
  base with the matching splits (or a merged XAPK) and a consistent signing key.
- The repository's Gradle build could not run in this environment because the Morphe
  plugin is served from GitHub Packages, which requires credentials. The bundle used
  for the checks above was compiled from the same sources with the Kotlin compiler
  against Morphe Desktop 1.20.0's patcher classes. CI runs the official Gradle build.
