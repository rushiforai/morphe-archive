# The "App name unavailable" card (Horizon OS)

*Quest 3, Horizon OS with `com.oculus.panelapp.library` 1046.0.0.296.430; YouTube VR 1.88.10,
cloned to a new package. Established 2026-10-10, read-only, from the system APKs on the device plus
the device's own logs.*

While a **cloned** (re-signed, renamed) build runs, its card in the dock / library shows
`App name unavailable` plus **Quit**. It is Horizon OS's own UI, and this file records what it
actually reads, so nobody spends another cycle trying to fix it from inside the APK.

## TL;DR for the next agent

- **Verdict: there is no in-APK fix.** The card's name is an app-manager/OCMS record keyed by
  **package name**; sideloaded packages never get one, and every API that writes it -- or that the
  card consults -- is signature-guarded (`prot=signature|preinstalled|knownSigner`, read with
  `dumpsys package permissions`). Manifest metadata, application/activity labels, branding resources
  and task labels are all **measured** failures; the `com.oculus.app_id` variant was implemented and
  tested on this headset and changed nothing.
- The routes that *would* name it are outside this repo's constraints, and each is understood well
  enough to say why: **Meta-hosted distribution** (that is what creates the record),
  **installing under the store's package name** (the record already exists; the cost is the store's
  tamper/"restore" prompt, and the owner has ruled it out), or **root/LSPatch** (nothing about the
  installed app changes, so the record stays valid). All three are excluded by owner decision.
- **The one thing that works without any of that**: launch the app through its 2D **panel** entry
  (same activity, `com.oculus.intent.category.2D` + `OVERLAY_LAUNCHER`), because Horizon names
  *panel* apps from the APK label -- a named window instead of the placeholder, at the price of flat
  YouTube rather than the immersive player.
- Below is the evidence in the order it was established: mechanism, the two dead theories, what other
  projects tried, the `app_id` experiment, then the guard table.

The store-package-name route was **tried for real** after all, at the owner's request: the clone
and the store app were uninstalled, and the patched build was installed as
`com.google.android.apps.youtube.vr.oculus`. Results, all measured on the headset:

- **The OCMS record resolves for the original package name** -- the launch log shows
  `AppManagerInternal: ... entitlement settings data changed: old data: null, new data:
  EntitlementPackageSettingsData(id=..., trustedBinaryStatus=UNTRUSTED, isUpdateRequired=false,
  launchRuleFailure=0)` instead of the clone's `Entitlement ... not found`. The record either
  survived the uninstall or is re-created from the store's cached listing metadata.
- **The dock card is expected to be named** on this state (the record lookup succeeds) -- to be
  confirmed visually by the owner when minimizing.
- **Meta detects the unofficial binary**: `trustedBinaryStatus=UNTRUSTED`, and at launch a
  **"Restore App"** dialog appears ("Our Platform Abuse Policy prohibits piracy, illicit modding...
  please restore the app to the Meta Horizon Store version now") with **Restore** (deletes the mod,
  reinstalls the store version) and **Close** (dismissible today; `isUpdateRequired=false` means it
  is not currently enforced -- this is server-side and can change).
- The owner accepts the trade: the store copy is gone while the mod is installed, a store
  update/restore overwrites the mod, and re-modding = re-run the script with
  `-PackageName com.google.android.apps.youtube.vr.oculus` after uninstalling whatever is present.

## Artifacts and how to reproduce`
  at the end has the pull/decompile commands.

## Two name sources, which is why 2D apps are unaffected

| surface | where the name comes from | found in |
|---|---|---|
| library tile, and 2D panel apps | the APK's own label: `PackageManager.getApplicationLabel(ApplicationInfo)` / `PackageItemInfo.loadLabel(PackageManager)` | `com.oculus.vrshell`'s `ShellApplication.getPanelAppConfiguration(...)` |
| **the running / active immersive card** | the app-manager record's label field: `com.meta.libraries.appmanager.aidl.PackageInfo` | `com.oculus.panelapp.library`'s `com/oculus/userdata/activeimmersive/impl/ActiveImmersiveRepositoryImpl` |
| the placeholder text itself | the panel's own string resource, id `0x7f0f0045` (`App name unavailable`) | `com.oculus.panelapp.library` `resources.arsc`, drawn by `com.oculus.navigator.systembar` (`KondoWayfinderMenu`) when the name in its view-model state has length 0 |

The app-manager record is keyed by **package name** and comes from the **local OCMS library
provider**. The device says so once per launch, for every cloned package it has seen here:

```
W/AppManagerInternal: Entitlement for packageName=<clone> not found, channels=[Store, Q4B, PcStore]
W/OVRLibrary: null cursor received for query content://com.oculus.ocms.library/apps/<clone>
```

A cloned package has no such row, so the name is empty and the panel draws its placeholder. For the
stock package the row exists and the card is named. Note this is a *local* provider lookup plus an
entitlement check -- not a cloud store request.

## Two theories that are dead, and the evidence

1. **"It falls back to the task label."** It does not, and not merely in practice:
   `TaskDescription.getLabel()` is read only for
   `packageName.equals("com.oculus.xrstreamingclient")` (Horizon Link), in that same repository
   class, with its own log lines (`Found task for com.oculus.xrstreamingclient with label: ` /
   `No task label found for ...`). Measured on the device with the `TaskLabel` extension applied:
   `dumpsys activity activities` reports `taskDescription: label="YouTube VR (patched)"` for the
   running task, and the card is unchanged. The extension still sets the label because it is correct
   task metadata and costs two instructions -- it cannot fix the card.
   Corollary: the panel's `Could not resolve app name for package: ` string is an **AppWidget
   provider** log, not this path, so it is not evidence about the card.
2. **"The APK label / branding / manifest metadata will name it."** The APK label is present and
   correct on the clone (`dumpsys package` shows `labelRes=0x7f140bdb`, and the library *tile* shows
   the `App name` patch's name), and it is simply not consulted for the running card. A stock-APK
   clone with only a package rename shows the same card, which is what makes this a property of the
   cloning, not of these patches.

## What can and cannot be done

- **From inside the APK: nothing.** No `android:label`, branding resource, task description or
  `com.oculus.*` metadata is read on the running-card path.
- **The one route that would work, and why it is not taken.** The entitlement/library lookup
  (`com.oculus.ocms`'s `AppManagerInternal.getApp`) is a **DB lookup per channel, keyed by package
  name**, and that path contains no signature or certificate comparison at all: it fetches a
  `ChannelEntitlement` and, when there is none, records the package in `packageNamesNotInDB` and logs
  the line above. OCMS *does* carry signature-aware code (`com/oculus/ocms/file_util/VerifyUtil`,
  `com/oculus/library/security/TrustedApplications`, and an `AppIdentity` built from
  `PackageInfo.signatures` through `checkSignatures`), but it sits in install/file-verification
  helpers, not in the library-row path -- nothing there is referenced from the App/entitlement
  construction. So a re-signed build under the **original** package name would very likely find the
  entitlement row the user already owns and therefore resolve a name. What stays uncertain is the
  platform's *separate* tamper handling: the store-side "Restore app"/removal prompt is about
  signature mismatch on a store package, and whether the entitlement row survives that is policy,
  not something this static read can settle. That is why it is recorded as an experiment with a
  measured cost (replacing the store app, the restore prompt) rather than done unilaterally.
- **Not answerable from `adb shell`:** whether the provider rows carry a signing certificate.
  `content query --uri content://com.oculus.ocms.library/apps` answers
  `SecurityException: Component access not allowed`, so the pre-check needs root.
- **Workarounds that do work** (avoidance, not repair): launch from a third-party launcher; exit from
  the app's own UI; or use the card's **Quit**, which is harmless -- the app keeps running until
  stopped (`adb shell am force-stop <clone>` does the same). A reboot, or a clean
  uninstall/reinstall, clears a *stale* entry after repeated re-installs.

This matches what other Horizon OS users report for sideloaded apps generally -- a default icon and
no name in the taskbar, visible only under "Untrusted sources" -- rather than anything specific to
this clone: Meta Community Forums threads
[1372208](https://communityforums.atmeta.com/discussions/Questions_Discussions/new-navigator-update-no-app-icon-and-name/1372208),
[1372635](https://communityforums.atmeta.com/discussions/Questions_Discussions/app-name-and-icon-unavailable-in-nautilus/1372635),
[1373832](https://communityforums.atmeta.com/discussions/Questions_Discussions/quest-issues/1373832/replies/1373943).
Meta documents no name-resolution order for this card and exposes no API that writes the OCMS record.

## What other projects tried, so nobody repeats it

The obvious ideas have all been tried in public, on real headsets, and are documented as failures for
USB-sideloaded apps:

| idea | project | outcome |
|---|---|---|
| `com.oculus.app_id` meta-data (the App ID from the Meta Developer Dashboard) | [ReactVision/viro](https://github.com/ReactVision/viro/blob/develop/plugins/withViro.ts) ships it because it "eliminates the App Name Unavailable popup"; [RetroArch](https://github.com/libretro/RetroArch/blob/master/pkg/android/phoenix/src/quest/AndroidManifest.xml) declares it too | **did not fix the system-menu label.** [QuestVision](https://github.com/denizkarya1999/QuestVision/blob/main/AR-CUBE.md) registered an App ID, wrote `com.oculus.app_id` into the manifest (including the escaped-leading-space trick that keeps the 16-digit value a string), installed over USB, and the user confirmed the system menu *still* said `App name unavailable`; the headset logs reported **no library/entitlement record for a USB-installed package**. Their conclusion: the next route is a signed, non-development build in a Meta-hosted release channel -- i.e. distribution, not metadata |
| activity `android:label` + `android:icon` | [MrSco/goldeneye-vr](https://github.com/MrSco/goldeneye-vr) | **fixes the library list only.** `aapt2 dump badging` showed `launchable-activity: label=''`, i.e. the label was on `<application>` and the shell reads the *activity's*; setting both on the launcher activity (with a plain raster icon) named the library tile. The quit dialog was unchanged, and they close the topic: "the dialog does not resolve names for unknown-sources apps at all. Do not spend time on it" -- another sideloaded title, VirtualBoyGo, shows the same text |
| `com.samsung.android.vr.application.mode=vr_only` | same project | no effect on the dialog (kept only because a VR manifest should declare it) |
| replacing the library's data source | [Poket-Jony/open-pacific](https://github.com/Poket-Jony/open-pacific) | **works, but at system level.** They decompiled the path and state the mechanism: the library UI is backed by OCMS's `content://com.oculus.ocms.library/apps` provider and a local SQLite cache (`LibraryStorage`) that only `LibraryCacheRefresher.refreshCache()` fills, from `fetchEntitlements()`. "Sideloaded apps do not self-register: `ThirdPartyPackageStartedReceiver` only *reads* `LibraryStorage.get(pkg)` on launch; `EntitlementsInstallerEventListener` updates entries via `App.Editor` but early-returns when `getApp(pkg) == null`." Their fix was to patch the system provider, not an APK |

Two checks of ours support that reading. `ThirdPartyPackageStartedReceiver` really exists in this
headset's `com.oculus.ocms` (18 references in `OCMS.apk`), and the provider query is denied to shell
(`SecurityException: Component access not allowed`). And the metadata cannot be the mechanism at all:
**Virtual Desktop, a store app that shows its name correctly, carries no `com.oculus.app_id`**, and
neither does YouTube VR's stock manifest -- the name resolves from a record keyed by *package name*,
which the store creates.

### The `app_id` variant: tried on this headset, and it does not work

The one variation nobody had tried was YouTube VR's **own** store id on a clone -- every documented
`app_id` failure used an id with no entitlement behind it. So it was implemented and measured, on
2026-10-10:

- Patched the manifest to add, under `<application>`:
  `<meta-data android:name="com.oculus.app_id" android:value="2002317119880945"/>`
  (`2002317119880945` is YouTube VR's product id, from the store listing that quotes version
  1.88.10). The decoded manifest of the built APK was checked: the entry is there, attributes and
  all, and the package name is still the clone's.
- Installed it over the running clone, launched the app, and read the system's own log.

**The system behaved exactly as before**, same launch, same two lines:

```
W/AppManagerInternal( 3526): Entitlement for packageName=app.morphe.android.youtube not found, channels=[Store, Q4B, PcStore]
W/OVRLibrary(10805): null cursor received for query content://com.oculus.ocms.library/apps/app.morphe.android.youtube
```

So the metadata is not consulted for this card at all. The lookup is keyed by **package name**, and
nothing an APK declares creates the record -- which also explains why Virtual Desktop, a store app
that is named correctly, carries no `app_id` either. That closes the question for clones of apps you
own and apps you do not.

The patch was **not** shipped: a user-facing switch that provably does nothing, and that points a
clone at another product's store identity (which could make the store offer to restore or update it),
is not worth carrying. The three lines above are all anyone needs to reproduce the result. The device
was put back on the normal build afterwards.

## Why no APK-side patch can name this card (guards verified, not assumed)

After the `app_id` result the obvious next question is "can the app *register* itself, or set the name
some other way?". Every candidate was decompiled and its guard read out of the system itself:

| candidate | what the binary says | verdict |
|---|---|---|
| app-manager service, which *owns* the record (`com.oculus.ocms.am.service.AppManagerService`) | exported, but `dumpsys package permissions` reports `prot=signature\|preinstalled\|knownSigner` | a re-signed clone can never hold it |
| active task bar service (`com.oculus.common.activetaskbarservice.ActiveTaskBarBoundService`) - the one app-facing API that *does* carry a title (`ActiveTaskBarItemData.A02`, `ActiveTaskBarCollapsedData`) | exported, permission `com.oculus.systemux.permission.CONNECT_ACTIVE_TASK_BAR_SERVICE`, `prot=signature\|preinstalled\|knownSigner` | same |
| `com.oculus.ocms.library.provider.LibraryProvider` | extends `OculusFbPermissionsContentProvider`; the caller check is `Binder.getCallingUid() == 0 \|\| mTrustedApplications.get().A00()`, and `TrustedApplications` is a multimap keyed by **`Signature`** (`SignatureHelper`) | signature-keyed allowlist |
| `PublicLibraryProvider`, `TestProvider` | `OculusPublicReadContentProvider` (read-only), and the FB secure base throws `"Component access not allowed for <provider>. Called by: <pkg>"` | no write path |
| `ThirdPartyPackageStartedReceiver` (exported, **no** permission) | read-only: it fetches `getApp(pkg)`, logs telemetry, and only starts the "untrusted binary" warning service. Nothing is registered | not a registration hook |
| `settings`/`DeviceConfig` | no key carries an app display name (`oculus_library:*`, `oculus_integrity:hsr_app_ids`, `show_pc_vr_titles` are entitlement/integrity flags) | no lever |

And the data path itself, read at bytecode level, closes the loop:

- `ActiveImmersiveRepositoryImpl.A00` builds the card's record as
  `new C26661Dy(..., packageInfo != null ? packageInfo.A08 : null, ...)`: **the label is the
  app-manager `PackageInfo.A08`**, and the package-name override is `A09`. A null record means a null
  label, and the panel draws its placeholder.
- `X/AbstractC11991vy` is the projection into that AIDL: `aidlPackageInfo.A08 = model.A07`,
  `.A09 = model.A08` - i.e. the label is OCMS's **app model** label, which is entitlement-derived.
- `SystemBarViewModel` contains **no** `PackageManager` label fallback at all (no `getApplicationLabel`
  / `loadLabel` / unknown-sources reference), so nothing local is ever consulted.

One path in the whole system *does* take a running app's own text - the `WAYFINDER_TITLE` /
`WAYFINDER_ICON_URL` JSON that the app puts in its `TaskDescription`. It is gated on
`str5.equals("com.oculus.xrstreamingclient")`, i.e. Meta's Horizon Link client, which is why the
`TaskLabel` extension (which sets exactly such a task description) cannot reach it.

**Conclusion:** with no root/LSPatch, no Meta-hosted distribution and no install under the store's
package name, the running-app card cannot be named. The record that feeds it exists only for packages
the store has an entitlement for. The one practical consolation is that Horizon resolves **2D panel**
apps from the APK label (`ShellApplication.getPanelAppConfiguration`), so launching this app through
its panel entry (`com.oculus.intent.category.2D`, declared alongside the VR filter on the same
activity) shows a named window instead of the placeholder - flat YouTube, not the immersive app.

## Route 2, tested end to end (2026-10-10, later the same day)

The store-package-name route was **tried for real** after all, at the owner's request: the clone
and the store app were uninstalled, and the patched build was installed as
`com.google.android.apps.youtube.vr.oculus`. Results, all measured on the headset:

- **The OCMS record resolves for the original package name** -- the launch log shows
  `AppManagerInternal: ... entitlement settings data changed: old data: null, new data:
  EntitlementPackageSettingsData(id=..., trustedBinaryStatus=UNTRUSTED, isUpdateRequired=false,
  launchRuleFailure=0)` instead of the clone's `Entitlement ... not found`. The record either
  survived the uninstall or is re-created from the store's cached listing metadata.
- **The dock card is expected to be named** on this state (the record lookup succeeds) -- to be
  confirmed visually by the owner when minimizing.
- **Meta detects the unofficial binary**: `trustedBinaryStatus=UNTRUSTED`, and at launch a
  **"Restore App"** dialog appears ("Our Platform Abuse Policy prohibits piracy, illicit modding...
  please restore the app to the Meta Horizon Store version now") with **Restore** (deletes the mod,
  reinstalls the store version) and **Close** (dismissible today; `isUpdateRequired=false` means it
  is not currently enforced -- this is server-side and can change).
- The owner accepts the trade: the store copy is gone while the mod is installed, a store
  update/restore overwrites the mod, and re-modding = re-run the script with
  `-PackageName com.google.android.apps.youtube.vr.oculus` after uninstalling whatever is present.

## Artifacts and how to reproduce

None of this needs root: every conclusion came from the device's own system apps and logs.

```bash
adb shell pm path com.oculus.panelapp.library   # -> /system_ext/priv-app/LibraryPanelApp/LibraryPanelApp.apk
adb shell pm path com.oculus.ocms               # -> /system_ext/priv-app/OCMS/OCMS.apk
adb shell pm path com.oculus.vrshell            # -> /system_ext/priv-app/VrShell/VrShell.apk
adb shell pm path com.oculus.systemux           # -> /system_ext/priv-app/SystemUX/SystemUX.apk
adb pull <each path> apk/...                    # apk/ is gitignored

jadx --no-src -d <out> <apk>     # resources + AndroidManifest.xml  (NOT --no-res; that skips them)
jadx --no-res -d <out> <apk>     # sources; add --single-class <name> for one class
adb shell dumpsys package permissions | grep -A6 <permission>   # protection levels
adb shell dumpsys package <clone> | grep -i 'labelRes|installerPackageName'
```

If you only read three symbols, read these: **`ActiveImmersiveRepositoryImpl`** (the card's label is
`packageInfo.A08`), **`X/AbstractC11991vy`** (where `A08`/`A09` are projected from OCMS's app model),
and **`SystemBarViewModel`** (no `PackageManager` label fallback exists anywhere in it).

For dex-level questions -- registers, literals, references, which method holds a given string, how
many methods a predicate matches -- this repo's scratch harness in `apk/scratch/` is what produced the
"exactly one" counts and the guard evidence:

- `Measure.java` - evaluate fingerprint-style predicates over every method of an APK's dex files and
  print the matches (`javac` against `smali-dexlib2` + guava from the Gradle cache; see `cp.txt`).
- `Inspect.java` - `classes | injected | dump | findstring | findref | findint` over any APK's dexes,
  printing opcodes, registers, literals and references.

Tooling note: REA's Android provider (`rea inspect-android-package`, `inspect-android-class`, ...)
answers `capability_unavailable` without `REA_JADX_MCP_JAR` set to a caller-supplied
`jadx-headless-mcp` **0.7.1** JAR, which REA deliberately does not download. The analysis above was
done with jadx plus that harness, so it reproduces without REA.

## How this was established

Read-only. The panel was pulled from
`/system_ext/priv-app/LibraryPanelApp/LibraryPanelApp.apk` and decompiled (2 dex; `jadx`, plus a
`smali-dexlib2` dump of the classes jadx failed on); the placeholder's resource id was located, its
single user (`LX/1LK;->invoke`, the wayfinder menu) followed to the state that feeds it, and that
state followed to the app-manager repository. On-device checks: `dumpsys package` (label resources
present on the clone), `dumpsys activity activities` (task label set), the OCMS/OVRLibrary lines
above, and `content query` against the library provider (denied).
