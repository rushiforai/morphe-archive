# Paid-offer visibility and Google Play restriction

## Accepted alternative: Hide paid offers

The user accepted hiding broken paid offers and cancelling checkout, while
preserving in-game exchanges, rewards and saved data. The optional, default-on
`Hide paid offers` patch targets only ARM64 Pizza 5.57.3 (2277).

- StoreLayer uses its existing FUNDS view (`0x40`), preserving gem-to-cash
  exchanges while excluding paid storefront sections.
- The separate starter-offer visibility predicate returns false. This hides
  its popup/icon without marking the starter bundle purchased.
- The Java purchase entry queues the game's original cancellation callback on
  the GL thread. Old or event-specific entry points therefore cannot open
  Google Billing through that entry. No purchase-success event is synthesized.
- Purchase result handling, verification, restoration, acknowledgement,
  consumption, inventory, balances, subscription benefits and all assets remain
  unchanged. This is not a paid-purchase implementation or a grant of paid goods.

The two native edits and exact input/output hashes are recorded in
[the visibility manifest](pizza-store-visibility.json). The resource patch
requires the restored native library's exact input hash; other builds are not
silently patched. The manifest lets the split verifier permit this exact output
while continuing to compare every other library and asset. The integration
verifier's `hide-paid` option permits only the public checkout entry to differ
among billing methods; on-device tests must separately establish cancellation.

The global paid storefront and starter promotion are covered. Future or
server-driven event artwork may still advertise products; checkout is cancelled.
Previously owned paid items must remain usable. Do not change offer ownership or
subscription tables to suppress advertisements.

## Previous genuine-checkout investigation (v1.31.1)

On 2026-09-28 the user confirmed working Google Play Games, TapBlaze, restored
progress and gameplay, then requested normal real-money purchases. Purchases
remain blocked in the re-signed APK. This release does **not** fix or claim to
support paid checkout.

## Evidence

Tested Pizza 5.57.3 (2277), candidate APK SHA-256
`21c0e913150194d710152fc16db807893fed099fa062a11e2ff0eb99a1bf7b63`,
on the existing account AVD, Android API 35, stock Play Store
`53.2.23-34 [0] [PR] 980945147`.

- The game connects to the stock Play Store and receives real product IDs and
  PLN prices. Billing is not redirected to MicroG.
- The game's purchase button launches `com.android.billingclient.api.ProxyBillingActivity`,
  followed by the stock Play Store's billing UI. UIAutomator identifies the error
  as a `com.android.vending` window: this version is not configured for billing
  through Google Play. Both 10-gem and 30-gem offers reproduce the refusal.
- 2166 executable methods in PurchasesManager, BillingClient and its internal
  billing library match the original APK after canonical DEX comparison.
  Real purchase results, acknowledgement/consumption and callbacks are preserved.
- The verified original APK certificate SHA-1 is
  `828d99f1d85e52eb473af06d690f84ee72904330`. The local test APK certificate is
  `a49df28b7eded7c4271a4541e27ebd7152e691f0`; the install has no Play installer.
- No purchase was completed, no payment method was submitted and no purchase
  result was substituted. Failure logs and UI dumps are retained locally under
  ignored `artifacts/billing-20260928`.
- Dismissing both errors returns to the game in the same process. A subsequent
  force-stop/relaunch preserves pixel-identical progress, cash and gem regions:
  Chapter 2 / Day 43, cash 361.24, gems 36. Eight asset regressions, native
  reconstruction checks, reward checks and the expanded integration verifier
  pass; the source build succeeds. No application code changed in this billing
  investigation, only verification and documentation.

The different signer and Google's documented distribution requirements explain
the observed rejection. The UI does not expose Google's private server-side
decision, so this is a diagnosis from the observed app identity, real checkout
failure and documented requirements, not an invented internal error code.

## Required external configuration

[Google's billing test documentation](https://developer.android.com/google/play/billing/test?hl=en)
states that ordinary billing is blocked for apps not signed and uploaded to Play.
Its sideloaded/debug-signature exception requires the same package and a license
tester registered in the **publisher's** Play Console. Ordinary paid testing
uses an authorized Play test-track distribution. An unrelated developer account,
GitHub release, installer label or MicroG metadata cannot grant that authority.

Normal purchases therefore require TapBlaze's authorized signing/distribution
and Play Console configuration. Without publisher cooperation, use the official
Play-distributed game for paid purchases. Moving a save between installations
requires verified TapBlaze synchronization first; never uninstall the user's only
copy or assume every purchase entitlement transfers between installations.

## Emulator rendering observation

The host GPU backend twice produced a black game store while the process kept
running. Evidence is retained as `billing-open-shop`, `store-repeat-logcat` and
the corresponding local images. Restarting the same AVD with `-gpu swiftshader`
opened the store and the real checkout without changing the APK or data. This
isolates a renderer-dependent symptom in this environment; it is not a proven
application-code fix or a claim that every GPU/device is covered.
