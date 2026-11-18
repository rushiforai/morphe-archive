# Icon Pack Studio 2.5 build 005 patch validation

Source update: 2026-11-17. Replaces the previous build 003 target.

## Input

- APKPure XAPK, `ginlemon.iconpackstudio`, version `2.5 build 005`,
  version code `250050`, min SDK 32, target SDK 36.
  XAPK SHA-256: `8b51c09955393d39b40cf822344c8cdc6b4f126fd9781feefa33cd515218c6ca`.
- Base APK inside the XAPK, SHA-256:
  `700efebb368ec5d33444928031695059bdc2fef792a91bcff1a449c2de1958c4`.

## Patch target

The De-Vanced patch matched `IPSPurchaseRepository` by class name. R8 renames the class;
in builds 003 and 005 it is `ginlemon/flower/ipsLicense/billing/a`. The patch finds the
purchase-item holder by the three products initialized in its static constructor
(`lifetime`, `subscription`, `iconstudio.fx.pack1`) and selects its public static
no-argument `Z` method. In build 005 that method is `a()Z` (it was `b()Z` in 003) and it
ORs the three persisted purchase flags.

The patch prepends `const/4 v0, 0x1` / `return v0`, matching De-Vanced's behavior of
forcing the paid state without altering the stored purchase data or Play Billing.

The community header decides whether to show the `Get Pro` pill from a billing
`StateFlow`, which still reports no purchase. The patch also makes the header composable
(`ginlemon/iconpackstudio/features/community/b`, found by the `R.drawable.btn_get_pro`
resource id) read that flag as true, so the upsell is hidden while every other use of the
real billing state is left alone.

## Verification performed

- `:patches:test` and `:extensions:smartlauncher:widgetTest` pass with the new target.
- The bundle built from this commit loads in Morphe Desktop 1.20.0 and passes the version
  check for `2.5 build 005` with strict fingerprint validation and full DEX rebuilding.
  Morphe reports 2 of 18,965 classes changed.
- DEX comparison retains all 18,965 original classes; no classes were removed. One method
  changed: `Lginlemon/flower/ipsLicense/billing/a;->a()Z`, now returning true. One
  instruction changed in the community header: the `hasPremiumAccess` field read now
  yields `true`, which removes the `Get Pro` pill.
- Every non-DEX APK entry (resources, assets, manifest) is unchanged; only the DEX files
  differ (the patched APK is re-split into four DEX files).

## Install note for 64-bit-only devices

The APKPure XAPK ships only an `armeabi-v7a` ABI split. The 005 base declares
`requiredSplitTypes="base__abi,base__density"`, so a 64-bit-only device such as the
Galaxy S25 cannot install that XAPK as published. The native method surface of the 003
and 005 builds is identical, so the local install used an `arm64_v8a` config split built
from the 003 split's unchanged libraries with version code 250050 and the same release
certificate. Install the base with the `en`, `mdpi` and `arm64_v8a` splits.

## Not verified

- The Pro UI, export, Drive backup, sign-in and purchase flows were not exercised at runtime.
- Purchases are not simulated: Play Billing remains untouched, and a real subscription
  is not expected to be affected.
- The patched APK was installed in place on the connected Galaxy S25 with the existing
  release key; the app launched to the home screen with no fatal or linkage errors, and
  the community screen no longer shows the `Get Pro` pill.
