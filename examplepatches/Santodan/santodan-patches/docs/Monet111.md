# Monet 1.1.1

## Target and behavior

Original: `../OriginalApps/monet-1.1.1.apk`; manifest package `com.klevico.monet`,
version 1.1.1, code 135, minimum SDK 26, 9,351 original DEX classes.
SHA-256: `dd742a4eb7a4cdc0f9315d25d799e9a8aca51c942160e94f8b298d1e68c501f6`.

The regular premium, unlimited displayed cards and individual Nuvio catalog rows
patches now accept 1.1.1. Select only one premium alternative. The experimental
premium evaluator still matches; the user reports it works on 1.1.1. This report
is distinct from local DEX/runtime checks. Existing older support is preserved;
no older mappings or hooks were added or expanded. No release version was bumped.

Cards retain -10/+10/Max, native focus, persisted limits and the themed picker.
Catalog rows retain the real app icon, native channel filtering, saved synthetic
IDs, Content choices and independent foreground refresh, including empty catalogs,
provider failures and lifecycle cancellation. The empty secondary-label crash fix
remains in place. Startup behavior is unchanged by these patches.

## Reviewed native changes

Inspection artifacts are in `../Skills/inspection-evidence/.inspect-monet-1.1.1/`: `manifest.txt`,
`mapped-contracts.txt`, `hashes.tsv`, `native.txt`, `old-native.txt`,
`alignment.txt`, `card-open.txt`, `state.txt`, `filter.txt` and `lifecycle.txt`.
Candidate discovery used opcode shapes and reference correspondence; acceptance
uses full exact fingerprints, access flags and public runtime symbols from the
original 1.1.1 DEX, rather than approximate shapes.

- Premium: unique public instance `La/ov5;->a()Z`, owned by the billing constructor
  `La/u60;`. The same reducer truth table is proven for all 16 inputs. Only the
  false-return literal changes. Billing, license storage and startup code remain native.
- Cards: separate `MonetDisplayedCards111` validates 22 native contracts. The clamp
  is `j63.j(I)I`, schema `ht6.w`, picker `b33.v0`, native Apply renderer `b33.E0`
  and label `x22.a`. Picker register count is now 71; min/max are v63/v64.
  Original button/number/button/footer sites are 316/323/442/540. Scratch v42-v55
  is redefined by native style construction; saved state and focus registers survive.
  Summaries are `u40.f` at 128, `bv3.f` at 187, and `b33.x0` at 456. The card
  callers `uu3`, `t34`, `qu2` still supply 4..20 with decorative preview disabled.
- Catalogs: separate `MonetCatalogChannels111` validates 23 native contracts.
  Processing moved out of the coroutine into static `b42.k(...):x84`; hooks are
  selection 382, row items 533, owner match 546/547, channel match 550, hidden 563,
  and source lists 900/911, all in original instruction coordinates. The filter
  `b42.C` gained two booleans; disabled-source membership is at 118 (v2/v9).
  The revision wrapper now replaces the view-model flow array store at `qc4`
  constructor index 225, reading v54 and using dead v15 before its native reset.
  Reader/converter are `s46.l/m`; source options are `b42.n`; content picker is
  `b84.X`/`b84.E1`; owner is `nx0.i`; shared header is `bv3.f`. Preserve its
  original `vq6` allocation when adding the content-label call.
- Both extensions select reviewed `modern` and `v111` fields explicitly at patch
  time. Class and renamed method bindings are fixed tables, with no runtime probing.
  Older selections leave `v111` false. Modern 1.1.0 host-runtime regressions pass.

## Startup app: cold boot versus standby

The user reports that the **selected startup app** fails to open after power-on,
with both startup selection and standby enabled, but opens after standby.
Whether the affected power-on follows a full Android shutdown is not established.
**Native 1.1.1 intends to support both triggers together.**

Evidence from the original manifest and DEX:

- `BootReceiver` is enabled, direct-boot-aware and subscribes to `BOOT_COMPLETED`.
  Its worker `ac0.run` resolves `yo8.G(context):t00`, then
  `yo8.N(context, settings):String`, and invokes `gt2.H(context)` when a target
  package exists. `yo8.G` reads `autostart_settings`: `mode`, `package`,
  `after_standby` and `delay_seconds`. `yo8.N` resolves the selected/last app and
  excludes Monet itself; it does not require `after_standby`.
- `gt2.H` creates a boot request through `gt2.n`, checks the persisted per-boot
  handled gate, and schedules request 1101 through `s00.i`. The alarm uses a
  `HomeActivity` PendingIntent carrying `AUTOSTART_LAUNCH`, target package,
  origin token, boot signature/count/epoch and scheduling time. Native delivery
  validates the origin and freshness and runs boot-specific handling in
  `MainActivity.k0` before launching the target.
- The accessibility service separately registers screen on/off, boot, user-unlock,
  user-present and dreaming events. `yo8.P` requires `after_standby` for the
  standby path. This is an additional trigger, not an alternative to cold boot.
- Boot attempts and standby attempts therefore have different scheduling and
  duplicate-suppression paths. The source alone does not identify which stage
  fails on the user's TV. No gate, token or freshness checks were disabled.

The updated `logs_patch.log` records a successful wake launch at **13:47:53**:
Monet schedules `com.alticelabs.meo.androidtv` in 250 ms, receives its
`AUTOSTART_LAUNCH` PendingIntent and starts the app at **13:47:54**. Later wake
signals have no corresponding startup-app scheduling. A log does not independently
prove which setting was enabled at each earlier point.

In `../logs_patch_nonStandby.log`, the user explicitly tested with the standby
toggle disabled. At **16:20:13.790** Android goes to sleep due to the power button;
at **16:20:23.434** it wakes from Asleep; Monet receives `wake_signal` at
**16:20:24.140** without scheduling the selected app. Monet's PID stays 29583 and
its uptime continues from 23868248 to 23876069 ms. This captured sequence is a
standby/suspend recovery, not a fresh Android boot, even if the TV's remote calls
it power-off. No new `BOOT_COMPLETED` appears in this test.

The intended settings are:

| Startup app selected | After standby | Full Android boot | Standby recovery |
| --- | --- | --- | --- |
| Yes | Off | Launch selected app | Do not launch |
| Yes | On | Launch selected app | Launch selected app |

The standby-disabled result agrees with the disabled wake trigger. It does not
explain the original report with both options enabled, prove cold boot works on
this TV, or establish that the options are mutually exclusive. The reported
power-on problem remains unresolved. No startup logic, gate, origin token or
freshness validation was changed; this release updates app-version support.

A log spanning an affected full Android boot with both options enabled is still
needed to distinguish boot delivery, a handled-gate skip, rejected/late alarm
delivery and selected-app launch failure. Useful tags are `AutostartLaunch` and
`MonetHomeRecovery`, alongside activity starts for Monet and the target. The earlier
read-only check of a connected MIBOX4 found Monet 1.1.0; that device check is not a
reproduction of the reported behavior on the latest 1.1.1 target. No reboot,
setting change, installation or device mutation was performed.

## Verification and outputs

Run through `build-local.ps1` using Java 21 (PowerShell execution-policy bypass
may be needed), with `--offline` and
`-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.0.0-all.jar`:

- `:patches:verifyMonet`, `:patches:verifyMonetBundle`.
- `:patches:verifyMonetDisplayedCards111`, `:patches:verifyMonetDisplayedCards111Runtime`,
  `:patches:verifyMonetDisplayedCards111Bundle`.
- `:patches:verifyMonetCatalog111`, `:patches:verifyMonetCatalog111Runtime`,
  `:patches:verifyMonetCatalog111Bundle`.
- `:patches:verifyMonetDisplayedCards111Apk`, `:patches:verifyMonetCatalog111Apk`.
  For the combined catalog audit pass `-PmonetCatalog111Cards=true
  -PmonetCatalog111Premium=true
  -PmonetCatalog111Apk=E:/Morphe/Apps/Monet/monet-1.1.1-catalog-cards-premium-unsigned.apk`.
- `:patches:buildAndroid`, `:patches:generatePatchesList`,
  `:patches:verifyMorpheDesktopImport`, `:patches:verifyAndroidBundle`.

Native tests check original matching, missing/ambiguous/changed/already-patched
rejection, exact argument registers, full restoration of native bodies, DEX
write/reload and the card/header overlap in both patch orders. Host-runtime tests
execute the production adapters. Bundle checks cover three card selections and
all six catalog/card/premium selections, retaining every original class without
cross-DEX duplicates or unrelated method changes. Desktop 2.0.0 imports 35 patches
across eight apps; the actual MPP contains Android DEX.

Bundle: `patches/build/libs/patches-0.16.3.mpp`.
Rebuilt outputs in `../Apps/Monet/`:

- `monet-1.1.1-displayed-cards-unsigned.apk`
- `monet-1.1.1-catalog-rows-unsigned.apk`
- `monet-1.1.1-catalog-cards-premium-unsigned.apk`

These are unsigned verification artifacts, not installed or device-tested.
The pre-existing signed `Monet-1.1.1-patches-0.16.3.apk` was not overwritten.
Device checks remain for actual Content-picker focus, Max persistence, independent
catalog refresh and the reported cold-boot startup-app issue.
