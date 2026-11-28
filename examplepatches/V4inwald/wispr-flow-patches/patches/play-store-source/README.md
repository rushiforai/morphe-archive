# Play Store install source

Makes the app report that it was installed from the Play Store, which is what its bundled
Play licensing check accepts.

* **Package**: `com.wispr.flowapp`
* **Target version**: 2.8.7
* **Evidence**: [`WHY.md`](../../WHY.md), [`analysis/wispr-flow-2.6.2.md`](../../analysis/wispr-flow-2.6.2.md) §4.4,
  [`analysis/wispr-flow-2.8.7.md`](../../analysis/wispr-flow-2.8.7.md) §2

## Why it is needed

A patched build is re-signed with a local key. `com.pairip.licensecheck.LicenseClient` calls
the Play licensing service on every start, and that service answers against the Play signing
certificate — a local signature fails it by construction. The local fallback then decides the
outcome from the installer package name, and a side-loaded build reports something other than
`com.android.vending`, so the app ends on its licensing error dialog and does not run.

[`WHY.md`](../../WHY.md) covers the full chain and the argument for restoring the installer
rather than anything else.

## What the patch changes

Four signatures, ten call sites, answered across the whole tree. The call is kept; only the
value it returns is replaced. Three of them answer `com.android.vending`; `getPackageSource`
returns the integer `2` instead, because it is a number.

| Signature | Sites | Role |
|---|---|---|
| `InstallSourceInfo.getInstallingPackageName()` | 4 | the licence gate that decides whether the app runs, plus review, telemetry and attribution |
| `PackageManager.getInstallerPackageName(String)` | 4 | the pre-API-30 form of the same question, read by Sentry, AppsFlyer and obfuscated SDK code |
| `InstallSourceInfo.getInitiatingPackageName()` | 1 | the neighbouring attribution field |
| `InstallSourceInfo.getPackageSource()` | 1 | the numeric source, read by the install-source telemetry |

**Why tree-wide and not per class.** From 2.8.7 the readers sit in classes whose names carry
nothing (`n0`, `ln0`, `j65`) and change with every release. The hooks match the platform
signature instead, and state how many sites the version had: a release that adds or drops one
fails the patch rather than being half-applied. All ten sites were checked to query *this*
package, which is what makes the wide answer safe.

## Applying it

```bash
python3 scripts/apply_patches.py --decoded build/decoded --only play-store-source --dry-run
python3 scripts/apply_patches.py --decoded build/decoded --only play-store-source
python3 scripts/apply_patches.py --decoded build/decoded --only play-store-source --revert
```

## What it does not change

* the signing certificate: the build stays locally signed, and the app is told so;
* `RevenueCat` / the `flow_pro` entitlement: a purchase still governs what the account owns;
* the quota logic, which is the [other patch](../unlimited-words/).

Unlike the quota patch, this one cannot be dropped from a build: without it a re-signed APK
stops at the licensing dialog.

## Limits

* **Client-side claim only.** Play Integrity API verdicts are untouched; the app does not gate
  on one.
* **Version-specific.** The seven sites are pinned by class and method and by an exact count.
  A new version that adds, moves or removes a site fails the patch instead of applying a
  partial spoof.
* **The claim is only as good as the check.** If a future version verifies the signature on
  the client as well as the installer, this patch stops being sufficient — it does not become
  wrong, it becomes outgrown.
* **The count is the guard.** A site count that no longer matches is a failure, not a partial
  spoof. A new site reading another package would still be answered with the Play name.
