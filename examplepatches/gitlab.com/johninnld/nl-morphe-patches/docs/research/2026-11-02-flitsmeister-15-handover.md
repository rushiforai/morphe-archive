# Flitsmeister 15 full port engineering handover

State captured on 2 November 2026, approximately 16:47 Europe/Amsterdam.
Session continuation appended on 2 November 2026, evening — see
"Session 2 continuation" near the end of this document for decisive new
results that supersede parts of the strategy below.

## Read this first

The user asked to port **every existing Flitsmeister feature** to version
15.0/1289, preserving version 14.17/1287. The user explicitly authorized an
emulator and either rooted Frida or Shizuku/rish with Frida Gadget for the
PairIP investigation. The current request is to document the work so a new
agent can take over. The port goal remains incomplete.

There is substantial implementation and useful verification, but **there is no
working, fully patched version 15 APK yet**. Do not publish or advertise version
15 support from this state. Compatibility metadata still accepts only 14.17;
this is intentional. Several new operation tables exist but are not dispatched
until the protected application/service behavior is recovered.

The main prerequisite is the changed PairIP protection. Version 15 puts real
application, activity and background-service bodies behind the native VM. The
old startup repair cannot be reused. A global null-return VM replacement would
discard essential behavior and would not complete this port.

### The first five actions for the incoming agent

1. Work in the isolated worktree below; inspect its dirty state before changing
   anything. Almost all port files are still uncommitted.
2. Read this handover, `AGENTS.md`, and the three cohort ledgers listed below.
3. Revalidate emulator/process state. Two dedicated emulators and Frida server
   processes were live at this snapshot; no target app process was returned by
   `pidof nl.flitsmeister` on either emulator.
4. Continue the protected-body/string-initialization investigation using the
   retained results. Do not restart the already completed symbol mapping work.
5. After genuine protected bodies exist, integrate the four remaining scoped
   edits, enable the remaining dispatchers, add the version 15 input profile,
   then run the full individual/combined APK and runtime acceptance matrix.

## Workspace and repository boundaries

| Item | Current value |
|---|---|
| Implementation worktree | `~/.codex/worktrees/b1c3/nl-morphe-patches` |
| Branch | `feat/flitsmeister-15` |
| Base HEAD | `198e813392389555a97a1377ee1c07784a43da61` |
| Base subject | `docs(Google Maps): record verified stable publication` |
| Primary checkout | `~/Scripts/nl-morphe-patches` |
| New commits | None |
| Published bundle/release for this work | None |
| Project version at base | `1.25.0`; do not manually bump it |

The primary checkout already had unrelated Maps/Waze source and documentation
changes, research documents and test files. Those were not copied into the
worktree or modified by this port. Preserve them. The isolated worktree contains
only this port's changes plus local tool/evidence links.

Important local links:

- Worktree `.analysis/flitsmeister-15` is a symlink to
  `~/Scripts/nl-morphe-patches/.analysis/flitsmeister-15`.
- Worktree `.tools` is a symlink to the primary checkout's `.tools`.
- **`.tools` currently appears as an untracked symlink in `git status`. Do not
  stage it.** A directory ignore does not necessarily ignore a symlink with the
  same name. Stage actual implementation/doc/test paths explicitly.
- Most evidence is Git-ignored and will not travel with a branch push. The
  implementation and test fixtures are in the worktree, but a remote successor
  also needs a deliberate evidence transfer or regenerated publisher decoding.
- `git diff --stat` excludes the many new untracked files. Its small output does
  not represent the full amount of implementation.

### Mandatory identity and release rules

Use exactly `johninnl <349981574+johninnl@users.noreply.github.com>` for author
and committer. No co-author trailers. Before every commit or push:

```sh
gh api --hostname github.com user --jq .login
git var GIT_AUTHOR_IDENT
git var GIT_COMMITTER_IDENT
node .github/scripts/verify_identity.cjs --local
```

The login must be `johninnl`; do not bypass a failed identity/history check.
Stable promotion to `main` needs user confirmation. `dev` is the prerelease
branch. Semantic-release owns versions and generated catalogues. Do not manually
edit generated release metadata to announce support before validation.

Read the source-based release-note/app-scope rules in `AGENTS.md` before
committing. In particular, shared patch changes may need `Release-Apps` and
app-folder changes must be classified accurately. No release automation was
changed during this work.

The repository's code-review graph was queried and was empty; its database
predated HEAD. No useful graph index was available. Ordinary source/DEX searches
were used after checking that boundary.

## Inputs and verified identity

Both user-supplied files remain in `~/Downloads`:

```text
nl.flitsmeister_15.0-1289_4arch_6dpi_24lang_b0d62bb5e51903f18883a9edaa759f0e_apkmirror.com.apkm
nl.flitsmeister_15.0-1289_1arch_2dpi_24lang_409d929521b307125a96983faa0b25d9_apkmirror.com.apkm
```

| Variant | APKM SHA-256 | Base APK SHA-256 | Minimum SDK |
|---|---|---|---:|
| Universal / 4 ABIs | `407507012a279bd96fb250f89809fc1db0e7996a2fec9a9301ce2c3234ca34c7` | `7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0` | 32 |
| arm64 | `c44572f8a575449e53512226d5866813c85ec254679c5a07110cf941e2ba3498` | `09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea` | 29 |

Both bases declare `nl.flitsmeister`, version `15.0`, code `1289`, target SDK
37. Both base signatures were verified with `apksigner`, and match the existing
publisher SHA-256 certificate:

```text
ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6
```

All seven DEX files and all assets are identical between the two bases. Exactly
4,661 base members match; `AndroidManifest.xml` and `resources.arsc` differ.
The common arm64 MapLibre library also matches between split sets, SHA-256
`a16f4ce832821685d0e68196e7981f513659885b173ccfe8bcb4c895725f64f3`.
The universal set contains additional ABIs. One bytecode profile can serve both
variants; this does not remove the need to validate each complete split input.

Local decoded inputs, relative to the worktree:

```text
.analysis/flitsmeister-15/sdk29/base.apk
.analysis/flitsmeister-15/sdk29/splits/*.apk
.analysis/flitsmeister-15/sdk29/decoded/
.analysis/flitsmeister-15/sdk32/base.apk
.analysis/flitsmeister-15/baseline-14.17/
```

`baseline-14.17` is the decoded retained original 14.17 base from
`~/Scripts/nl-morphe-patches/.analysis/flitsmeister-broadcasts/base.apk`.
The original complete old split archive is also at
`~/Scripts/flitsmeister.apks`; verify its identity before using it.

Do not confuse a decoded base with a complete installable split set. The base
does not contain the ABI libraries. Use the supplied APKM for final patching.

## Feature scope and implementation state

There are **eight** controls, not the six recorded in older release history.
All depend on `Fix PairIP startup`, directly or through dependencies.

| Control | Implemented version 15 work | Remaining requirement |
|---|---|---|
| Fix PairIP startup | Native format research, runtime capture tools, complete protected-string-holder inventory | Actual version 15 startup/string initialization and functional protected-body recovery; production startup code is still the old profile |
| Unlock Pro | 54 settings plans, 87 feature/UI plans, 3 Android Auto feature plans plus shared notice plans | Service `onDestroy` preference-preservation edit; enable UI dispatch after recovery; full APK/runtime validation |
| Hide Pro notices | 16 version 15 notice plans and 2 shared Android Auto notice plans; old native layout names remain | MainActivity `onCreate` automatic-promotion edit; enable notice dispatch; output/body/runtime validation |
| Broadcast navigation data | Separate producer/reflection profile, consolidated native lookahead hook, extension profile, tests and independent APK oracle | Real recovered service lifecycle behavior; actual patched APK and live broadcast delivery |
| Disable partner services | Six direct version 15 plans and native footer resource checks | Protected MainActivity parking visibility/listener edit; dispatcher remains unwired |
| Hide ads | Both readers, six LBA boundaries, Settings row, deferred finalizer behavior | Shared startup; actual individual/combined patching, informative-traffic retention and runtime validation |
| Disable tracking | All 46 SDK plans and ten direct first-party telemetry plans | Protected service automatic-upload/statistics-reset continuation; telemetry dispatcher remains unwired |
| Guest mode | Three paths, including the changed native Compose button signature and preflight | Shared startup and actual onboarding/reopen/runtime behavior |

The existing 14.17 operation tables and frozen fixture values were preserved.
Small dispatcher changes select new tables for version 15. The helper is:

```kotlin
context(context: BytecodePatchContext)
internal fun isFlitsmeister15(): Boolean = context.packageMetadata.versionName == "15.0"
```

No mutable global version flag was introduced.

### What is wired and what is intentionally not wired

Already wired behind `isFlitsmeister15()`:

- `FeatureSettingsPatch.kt` → `featureSettings15Plans()`.
- `AndroidAutoPatch.kt` → `androidAutoFeatures15Plans()` and
  `androidAutoNotices15Plans()`.
- `AdsPatch.kt` → `adsPlans15()` and `adsReaderPlan15()` in the finalizer.
- `GuestModePatch.kt` → `guestModePlans15(guestLabelId)`.
- `TrackingPatch.kt` → `trackingPlans15()` for SDK boundaries.
- `NavigationBroadcastPatch.kt` finalizer → `installNavigation15()`.

Intentionally not wired:

- `FeatureUiPatch.kt` still executes its 14.17 table. It now explicitly depends
  on startup so the eventual protected service body exists before mutation.
- `PremiumPatch.kt`'s `noticeRendering` still executes its 14.17 table and now
  explicitly depends on startup.
- `PartnerServicesPatch.kt` still executes its 14.17 plans.
- `TelemetryPatch.kt` still executes its 14.17 plans.

`Compatibility.kt` still advertises only `14.17/1287`, minimum SDK 29 with the
existing additional minimum SDK 32 acceptance. Merely adding 15 now would expose
an incomplete execution path and fail the old startup guards.

## Source and validator map

### Feature and notice cohort

New production files under `patches/src/main/kotlin/patches/flitsmeister/`:

```text
FeatureSettings15.kt       54 plans
AndroidAuto15.kt            3 plans
AndroidAutoNotices15.kt     2 plans
FeatureUi15.kt             82 plans
FeatureUi15Additional.kt    5 plans for changed flows
ProNotices15.kt            14 plans
ProNotices15Additional.kt   2 plans for changed flows
```

These total 162 separately guarded literal plans. The guard audit checks actual
publisher identities, register/instruction counts, opcodes, registers,
references, branch destinations and reference cardinality. It found no failures.

Independent tests:

- `tests/flitsmeister15_features_contracts.py`: original method hashes/headers,
  48 non-Pro defaults, 34 retained genuine provider/category/factory/closure
  contracts and 135 migrated semantic probes.
- `tests/verify_flitsmeister15_features.py`: API
  `verify(root, unlock, notices, hide_ads=False)`.

The original publisher input passes 840 checks. Requesting `--unlock` against
the original input correctly fails. Expected values for the 135 semantic probes
were traced independently through actual state/Boolean moves/default joins;
they were not taken from production inserted register names.

Enabled output whole-body hashes are **not complete yet**. Freeze them only
after actual patched output has been independently inspected and accepted by the
semantic probes. Passing a production-plan guard is not an enabled-output oracle.

Read `.analysis/flitsmeister-15/features/PORT_STATUS.md`. Useful supporting
artifacts are `strict-guards.log`, `semantic-plan-cross-check.txt`,
`symbol-map-relaxed.json`, `aligned-map.json` and the `*.ledger.json` files.

### Controls cohort

New production files and exported entrypoints:

| File | Entrypoint / purpose |
|---|---|
| `Tracking15.kt` | `trackingPlans15()`, 46 SDK boundaries |
| `Ads15.kt` | `adsPlans15()`, dynamic `adsReaderPlan15(replace)` and six LBA paths |
| `GuestMode15.kt` | `guestModePlans15(guestLabelId)`, three paths and native button preflight |
| `PartnerServices15.kt` | `partnerServiceLeafPlans15()`, six direct leaves |
| `Telemetry15.kt` | `telemetryLeafPlans15()`, ten direct leaves |

The new independent validators are:

```text
tests/verify_flitsmeister15_tracking.py
tests/verify_flitsmeister15_ads.py
tests/verify_flitsmeister15_guest.py
tests/verify_flitsmeister15_partner_leaves.py
tests/verify_flitsmeister15_telemetry_leaves.py
tests/flitsmeister15_settings_contracts.py
```

The partner/telemetry leaf validators explicitly exclude the missing protected
activity/service edits. They must not be used to claim those complete controls
work. The Settings fixture contains four partner/ads combinations.

Important implementation corrections already made:

- Version 15's native guest button `Lv98;->b` has **two Modifier parameters**,
  requiring 12 arguments rather than the old 11. The new insertion uses default
  mask `0xe3`; the native button's 31-register/276-instruction layout, exact
  descriptor and default-mask slots `1`, `2`, `0x40`, `0x80` are checked.
- The guest landing method is now 32 registers/219 instructions; its insertion
  moved from old index 208 to 209.
- Ads still replaces the general reader in `finalize`, after other execute
  blocks have validated their expected layout. Preserve this interaction with
  Unlock Pro.

Read `.analysis/flitsmeister-15/controls/progress.md`. The independently checked
literal leaf census is 73 plans; the dynamic ads reader is an additional plan.
`pending-partner-activity-plan.txt` and `pending-telemetry-service-plan.txt` are
translated **candidates only**, not accepted version 15 bodies or production
edits. Do not blindly rerun historical `generate_tracking.py`; it was written
before dispatcher markers changed.

### Navigation cohort

Production:

- `NavigationBindings15.kt`: exact reflected declaration checks and eight
  producer/value method layouts, followed by closed hook installation.
- `NavigationBroadcastPatch.kt`: finalizer dispatch.
- `extensions/flitsmeister/src/main/java/nl/johninnl/flitsmeister/NavigationBroadcasts.java`:
  explicit `init15(Context)` / `zone15(task)` profile alongside the legacy profile.

Static mappings:

| 14.17 contract | Version 15 counterpart |
|---|---|
| Location producer `ab0` | `bb0` |
| Road producer `omf.z` | `irf.z` |
| Final road limit `hmf.f` | `brf.f` |
| Country `r65.b:I` | `m65.b:I` |
| Event stream `fs7` | `as7` |
| Subscription `fs7.b(b49):is7` | `as7.b(u39):ds7` |
| Kotlin Function1 `b49` | `u39` |
| Kotlin Unit `tvj` | `l1k` |

Old names often still exist with unrelated meanings. Update/check the extension
reflection as well as the patch descriptor; patch application alone would not
catch every stale reflective binding.

Version 15 removed the old separate average-speed task. The native pipeline is
`wd6$a$a` → `paf` → `xd6` → `wd6.B`. It updates `wd6.v1` with the measured
Location, updates native relevant-report sets `p1/q1`, selects the first native
`AvgSpeedCheck`, and writes it to `hff.b` at instruction 37 of `wd6.B`.
The export hook is at **38**, immediately after that write while `p0` still
names the task. A hook at the method return would be wrong: later code reuses
`p0` for `q1`. The stop hook clears exported zone state. Geometry points remain
public `a/b` coordinates in the current geometry class.

Tests include the 15 profile subclass and fixtures `as7`, `u39`, `brf`, `m65`,
`l1k`, `hff`. `NavigationBroadcasts15Test` reuses the shared behavior suite and
adds current lookahead/stale/missing/inaccurate-location cases. The independent
`tests/verify_flitsmeister_navigation15.py` pins eight original whole bodies,
eight exact hook sites, `init15` selection and candidate-write adjacency.

Read `.analysis/flitsmeister-15/navigation/REPORT.md` and `bindings.json`.

## Changed report-task semantics already resolved

Do not try to recreate removed 14.17 report-task classes. Version 15 consolidated
them in `DefaultReportEventService` (`wd6`). The feature worker traced this:

- `xd6.invokeSuspend` calls `ka1.k(Collection, Context)`.
- The new guarded `ka1.k` edit changes the **local eligibility scalar**, while
  retaining the genuine provider call and saved preference reads.
- Named report types route to predicates using `suh` preferences:
  SpeedTrap → `ba1` / `suh.a`; TrafficJam → `ca1` / `suh.z`;
  AvgSpeedCheck → `da1` / `suh.A`; SpeedCam → `ea1` / `suh.x`;
  PoliceHotspot → `fa1` / `suh.P`.
- Additional categories retain their separately traced predicates; genuine
  SlowVehicle and independent traffic-camera settings remain.
- `wd6$b$a` has an additional local eligibility gate before the real
  `gz0.a(report, Location, speed)` calculation. This has a fresh guarded edit.
- The changed speed-camera map repository is `efi.q`, preserving its awaited
  preference StateFlow and real geohash repository access.

This is a semantic replacement for removed task gates, not a reduction in feature
scope. Details and independent probes are in the feature ledger/fixtures.

## PairIP recovery status and exact remaining protected edits

### Why the old startup repair fails

`StartupCompatibility.kt` remains the 14.17 implementation. It expects:

- Asset `bsnPCDnBLcHWJvVO`, size 456,927, SHA-256
  `2a5f48741f795034142e3691996c62b2f1378f7d4812ee0359533168226ecf09`.
- Plain embedded DEX at offset 253,917, size 41,244, SHA-256
  `3a085520d50a954afefeb4db02ec02bcf8523d4babb6f8e4817398aced2ae7cc`.
- Captured initialization of 32 String holders / 1,442 values and 17 reflective
  Method fields.
- A specific protected MapLibre arm64 input hash and restoration to a bundled
  stock library.
- Thirteen old protected callback program IDs and exact original layouts.

The old asset is absent in 15. Twelve of the thirteen callback descriptors now
have direct implementations with no VMRunner invocation; the old `Lhza`
`onReceive` descriptor is absent. Preserve the direct bodies. Earlier partial
decode observations reported missing classes; the **completed-tree and
independent final inventory supersede those observations**.

Direct DEX inventories now establish:

| Inventory | 14.17 | 15.0 |
|---|---:|---:|
| Methodless protected String holders | 32 | 32 |
| String fields requiring initialization | 1,442 | 1,421 |
| Old-style methodless reflective Method holders | 17 fields in 4 classes | 0 |

The 15 strategy is therefore different. Do not assume an old-style helper DEX
exists just because 14 had one. The complete current holder inventory is
`navigation/dex-protected-string-holders.json`; the initial root
`startup-static-fields.json` used an incomplete regex and is **not** the
authoritative holder census. A protected example needed by a checked settings
plan is the key for `Lsuh;->V:Ltuh;`, read through
`Landroidx/media3/extractor/text/ssa/sR/KYOPUVpCnzYR;->GgScKptoFIHODKe:String`.
The old semantic key was `pref_signal_traffic_jam_beginning`; capture/verify the
actual 15 value rather than inferring it from the old name.

### Current protected programs

There are 22 literal DEX callers of `VMRunner.invoke`: 20 constant program names
and two dispatchers. This does not count native/reflection entrypoints.
Full descriptors/programs/paths are in `runtime-navigation-audit.json` and `.md`.

Essential programs include:

| Method | Program |
|---|---|
| Startup launcher | `3P8cG9xE91JB7Xss` |
| `FlitsmeisterApplication.onCreate()` | `LBsZjgwAdSdCGW1e` |
| `MainActivity.onCreate(Bundle)` | `mq2oLwBmLnxLU6o1` |
| `FlitsmeisterBaseService.onStartCommand(Intent,int,int)` | `Fxz6YV9Xh1xFSXmr` |
| `FlitsmeisterBaseService.onDestroy()` | `1UkEu2lRMiAKdriN` |

There are four scoped patch operations blocked on these actual current bodies:

1. **Hide automatic Pro promotion in MainActivity.onCreate.** The old body was
   22 registers/757 instructions; the old provider call was at 581 and branch
   583 joined 596. Those numbers describe 14 only. Recover the 15 flow and
   suppress only automatic promotion, preserving real activity setup.
2. **Hide partner parking footer/listener behavior in MainActivity.onCreate.**
   The old edits were around indices 83/87/90 of the same old body. Preserve
   unrelated initialization, resources, account and lifecycle behavior.
3. **Preserve saved feature preferences in service.onDestroy.** The old body
   was 13 registers/572 instructions; the old local eligibility gate at 402
   joined 410 before a preference reset. The intent is to skip the non-Pro
   preference reset while retaining service cleanup.
4. **Disable automatic trajectory upload and retain statistics-reset
   continuation in service.onStartCommand.** The old body was 41 registers/
   794 instructions; edits around 627/633/634 joined 688. Recover the current
   continuation; do not replace the whole service with a no-op.

Recovering only these edit points is not enough for a startup repair: preserve
the functional application/service/other required protected programs, typed
returns, exception behavior and current initialization as a whole.

## Runtime investigation and known failed approaches

### Live setup at handover

| Emulator | AVD | API | Root | Host Frida endpoint |
|---|---|---:|---|---|
| `emulator-5570` | `flitsmeister15_port` | 36 | Enabled | `127.0.0.1:27070` → guest 27042 |
| `emulator-5572` | `flitsmeister15_api34` | 34 | Enabled | `127.0.0.1:27072` → guest 27042 |

Both had boot-completed property `1` at the handover read. Both contain the
pristine arm64 15 split input. Guest Frida server:
`/data/local/tmp/flits-frida-server`, version 17.23.3.
Host Python's Frida module is also 17.23.3. The generic PATH `frida` CLI was
17.9.11; use the task venv to avoid version confusion:

```text
.analysis/flitsmeister-15/frida-venv/bin/python
```

The venv contains `frida-tools 14.11.0` and its bundled Java bridge.
The original server archive is in Downloads as
`frida-server-17.23.3-android-arm64.xz`; the extracted host server is retained in
the evidence directory.

Host processes at the snapshot were emulator PIDs 96520/99037 and foreground
ADB Frida-server shell processes 96969/99851. These are **snapshots, not stable
identifiers**. Requery them and never signal an unrelated PID from this list.
Both target apps were stopped/dead by the final `pidof` check; capture attempts
are not presently running. An unrelated physical phone appeared in `adb
devices` during the session; do not silently switch testing to it. User
authorization for this investigation explicitly named an emulator.

Useful read-only revalidation:

```sh
adb devices -l
adb -s emulator-5570 shell getprop sys.boot_completed
adb -s emulator-5572 shell getprop sys.boot_completed
adb forward --list
adb -s emulator-5570 shell pidof nl.flitsmeister
adb -s emulator-5572 shell pidof nl.flitsmeister
```

The emulator was initially attempted at port 5700 with data on the mounted NAS
because host free space was only about 2 GB. An external cleanup removed the
running emulators/AVDs and freed space; the task then recreated its two local
AVDs. **Port 5700, its former process handles and its NAS data directory are
obsolete.** Current setup is local. Do not recreate or clean up old unrelated
AVDs based on this history.

### What the live tests actually established

- An explicit uninstrumented launch on API 36 reached onboarding. This is a
  narrow startup observation, not sustained stability or completed navigation.
- A later state was `com.pairip.licensecheck.LicenseActivity`; a license screen
  must not be misreported as a functional patched app.
- Frida root attachment worked on an already running app. A simple native
  script reported the correct process ID, and a boot-class Java wrapper such
  as `java.lang.String` worked.
- Java wrapping of `com.pairip.VMRunner` initially failed with access violation
  at address zero. A separate reflection experiment set the class factory's
  loader explicitly from `ActivityThread.currentApplication().getClassLoader()`;
  it successfully enumerated VMRunner methods and wrapped the class once.
  This was **not** a reliable final fix: the later full explicit-loader capture
  again reported access violation and eventually a SuspendAll/HeapTaskDaemon
  timeout abort. Keep the successes and failures separate.
- Spawn-time injection crashed startup on both API 36 and API 34. This occurred
  even in the hookless/observer-only experiment. Do not conclude that the
  inline native hook alone caused it.
- An inline native entry hook observed the correct 578,271-byte startup asset
  length, then the process crashed. A recurring PC was core offset `0x5d770`.
  A native-only API 36 run also had a `strlen(0x8)`-style failure. Exact crash
  records are retained.
- Late memory scanning retained 85 candidate DEX dumps, including framework
  and original application DEX. They are **not** proof of recovered protected
  methods or a recovered startup helper DEX. Some were valid checksum/signature
  DEX; at least one failed the declaration reader. Classify/deduplicate and
  compare with publisher bytes before claiming new recovered code.
- Another late scan ended in a native background-thread failure at core
  offset `0x51ba4`. There is no established complete causal diagnosis yet.

The recurrent `0x5d770` instruction is an FNV-like signed-byte hashing load,
not a direct abort/trap instruction. Bad decoded state, a poisoned branch,
context/timing or an integrity response are hypotheses; none has been proved as
the sole live failure cause.

### Capture tools and limitations

At `.analysis/flitsmeister-15/`:

- `capture.py`: process-bound spawn/attach runner with `--endpoint`, `--attach`,
  `--seconds`, `--native` and `--script`. Writes timestamped JSONL and dump files.
- `capture.js`: Java VM/in-memory-loader hooks. Still unreliable for the reasons
  above; do not present it as a working recovery pipeline.
- `capture-native.js`: native entry observation plus DEX scanning.
- `scan-native.js`: scanning/observer variant without the entry hook.
- `reflect.js` / `reflect-bundled.js`: the successful limited explicit-loader
  reflection experiment.
- `jni-slots.json`: JDK-derived JNI table slot reference.

Logs to inspect before repeating experiments:

```text
capture-first.log
capture-attached2.log
capture-modern.log
capture-native.log
capture-api34-native.log
hookless-spawn.log
scan-late.log
scan-all.log
reflection.log
capture-explicit-loader.log
capture-*.jsonl
```

`capture.py`'s generated filenames all end in `.dex` whenever a message carries
binary data. Check each message's event and validate the payload; the suffix
alone does not establish its format. It sleeps for its configured duration even
after a target detaches, and its final session detach may raise after a crash.
Improve lifecycle handling if continuing this tooling, and avoid overlapping
captures on one process while diagnosing ART suspend behavior.

Any explicit tool-policy denial must be handled at that boundary; a new capture
mechanism is not authorization to evade it. The worker's native research note
also records an interruption of the root investigation. That tooling history is
not evidence about Android behavior or a completed recovery.

## Native static and offline research

Read `.analysis/flitsmeister-15/navigation/NATIVE-RECOVERY.md` before doing more
native work. This section summarizes the useful facts, not a completed solution.

Native target:

```text
libpairipcore.so
size 640064
SHA-256 a4a80aceffcebfa6d469366d6248c5126ffa16bfa7a7e48dca52d18bb0790269
```

Ghidra image base was `0x100000`; ELF-relative offsets below must be increased
by that base when querying the retained Ghidra view. REA sessions appeared
agent-specific. A successor must inspect its own session instead of assuming
the old native database is open.

- `JNI_OnLoad` registers native `executeVM` at ELF offset `0x74bf4` / Ghidra
  `0x174bf4`. Ghidra did not discover a function at that label automatically.
- **`native-vm-entry.json` is the preceding short JNI variadic wrapper at
  `0x174b5c`, not executeVM.** Do not build on its misleading filename.
- `ExecuteProgram` is an exported entry at `0x75674`, size `0x634`.
- Group `0x69548` handles arithmetic/string operations; group `0x43b00` contains
  numerous JNI, array, OS and integrity operations.
- `executeVM` copies the Java byte array through JNI `GetArrayLength` and
  `GetByteArrayRegion`, then interprets the scattered/encoded program.

Verified format facts across startup/application/main/start-command programs:

```text
Header: 00 49 41 50 02 00 00 00 08 08
entryPC = ((u32(asset + 118) ^ ~assetLength) & 0xffffffff) % assetLength
registerCount = u16(asset + 112) ^ 112 ^ 0xffff
negativeOpcode = ((raw16 ^ 0x1574153e) & 0x7fff) % 186
positiveOpcode = ((raw16 ^ 0x7f45) >> 1) % 186
operandAddress = (raw32 ^ 0xeffebe3b) % assetLength
```

Register counts from that header were startup 56, Main 30, StartCommand 51 and
Application 29. Header and operand address decoding use different masks.

Every inspected program starts with opcode 101. It copies the same 256-byte
block into VM state; SHA-256:

```text
576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1
```

Its source offsets are startup `0x89ed5`, Main `0xb2f6`, StartCommand `0x2026c`,
Application `0x29aa`. Testing that block as ordinary repeated XOR under every
phase against all 34 assets (7,359,581 bytes) found zero valid DEX headers. That
rules out that representation/key only; it does not prove that no DEX or other
serialized code can exist.

Opcode 101 has its own custom field order, documented and FNV-validated in
`NATIVE-RECOVERY.md` and `opcode101.asm`. An older generic fixed-packet parser
does not directly fit version 15. Its startup first hash matched independently,
including signed-byte extension, and the success PC was `0x38850`.

### Offline Unicorn replay

`navigation/emulate_vm.py` plus `navigation/emulation-venv` is a diagnostic
native instruction replay. It loads ELF relocations and constructors, executes
the real JNI_OnLoad (return `0x10006`), models JNI/libc/OS calls, native
`pthread_once`, TLS and cooperative worker scheduling.

It decoded real JNI operations/strings, including file/map/status inspection
and telemetry Intent creation, and progressed thousands of handlers. It did
**not** finish startup, recover the real protected method bodies, or produce a
validated replacement DEX. Main executed without completed startup encountered
null array state, confirming a startup dependency. Current replay ultimately
hits invalid/very long FNV paths after modeled environment checks.

All modeled OS/JNI outcomes are assumptions. An offline replay with invented
returns cannot certify genuine application behavior. Inspect its explicit
models, logs and stopping condition before using an observation to reconstruct
production behavior. Work from actual interpreter semantics and captured facts,
not merely a noncrashing replay.

Research files include `execute-vm.asm`, `crash-site.asm`, `opcode101.asm`,
`vm-generic-opcodes.c`, `vm-arithmetic-opcodes.c`, `emulation*.json`, the program
asset copies and key blocks. A generic-format source checkout was pinned at
`38c823cc` under `pairipcore-vm-source`; it is a reference for mechanics, not a
version-matched decoder. Full native tool evidence is in `native-evidence.json`
and root `native-jni-onload.json/.c`, `rea-evidence.json`.

## Build environment and commands

Use the isolated worktree as the working directory for all commands below.

```sh
cd ~/.codex/worktrees/b1c3/nl-morphe-patches
```

Required local environment:

```text
ANDROID_HOME=~/Library/Android/sdk
JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
GITHUB_ACTOR=johninnl
GITHUB_TOKEN=<read into process environment from gh auth token>
SHARED_MAPS_API_KEY=<read from the existing ignored primary-checkout key file>
```

Do not print or commit secrets. The worktree does not contain `.pat` or
`.community-maps-api-key`. A bare Gradle call initially failed applying
`app.morphe.patches 2.1.0-dev.1` with `IllegalArgumentException` because the GitHub
credential providers were null. After credentials, an unrelated generated Maps
key task also required the existing key. The key file is:

```text
~/Scripts/nl-morphe-patches/.community-maps-api-key
```

This process-environment wrapper avoids writing or displaying credentials:

```python
import os
from pathlib import Path
import subprocess

worktree = Path('~/.codex/worktrees/b1c3/nl-morphe-patches')
login = subprocess.check_output(
    ['gh', 'api', '--hostname', 'github.com', 'user', '--jq', '.login'],
    text=True,
).strip()
assert login == 'johninnl', login
env = os.environ.copy()
env.update({
    'ANDROID_HOME': '~/Library/Android/sdk',
    'JAVA_HOME': '/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home',
    'GITHUB_ACTOR': login,
    'GITHUB_TOKEN': subprocess.check_output(
        ['gh', 'auth', 'token', '--hostname', 'github.com'], text=True,
    ).strip(),
    'SHARED_MAPS_API_KEY': Path(
        '~/Scripts/nl-morphe-patches/.community-maps-api-key'
    ).read_text().strip(),
})
subprocess.run([
    './gradlew', ':patches:compileKotlin',
    ':extensions:flitsmeister:testDebugUnitTest',
    '--no-daemon', '--max-workers=2', '-Dorg.gradle.jvmargs=-Xmx2g',
], cwd=worktree, env=env, check=True)
```

`scripts/build.py` is the normal wrapper for builds; it searches a local `.pat`
when no token is in the environment. Do not assume it finds the primary
checkout's ignored file from this worktree. No `.pat` was found in the primary
checkout during this session either.

### Fresh baseline verifier commands

```sh
python3 -m unittest discover -s tests
python3 tests/verify_flitsmeister15_features.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister15_tracking.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister15_guest.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister15_ads.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister15_partner_leaves.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister15_telemetry_leaves.py .analysis/flitsmeister-15/sdk29/decoded
python3 tests/verify_flitsmeister_navigation15.py .analysis/flitsmeister-15/sdk29/decoded
git diff --check
```

The disabled/original defaults above should pass against the publisher input.
Enabled flags must be used only for corresponding actual patched output:
`--unlock`, `--notices`, `--hide-ads`, `--enabled`, `--disabled`,
`--partners-disabled`, `--hide-pro`, `--selected`, according to each script's
`--help`. Do not simply enable every flag in each verifier; pass the exact
effective dependency selection.

### Full integration validation after recovery

The standard entrypoint is:

```sh
python3 scripts/validate_targets.py flitsmeister INPUT --bundle BUNDLE --sdk ~/Library/Android/sdk --output OUTPUT --compact
```

With no `--selection`, this runs all eight individual selections and the combined
selection. It already knows the eight control names. However, its current
`verify_flitsmeister.py` routing is still the old 14.17 profile. **Add version
15 independent verifier routing/startup/whole-artifact contracts before treating
this entrypoint as a valid 15 acceptance test.** Preserve the 14.17 route.

Run it for both complete supplied APKM inputs with separate output directories.
Use the freshly rebuilt worktree bundle, not one of the older bundles under the
primary checkout. `:patches:compileKotlin` does not build an Android distributable.
The release build uses `:patches:buildAndroid` plus relevant unit checks. Run
`:patches:test` and the extension tests as well, following `.github/workflows/release.yml`.
Do not commit generated release catalogue/version output from local inspection.

## Verification evidence and its limits

| Check | Current observed result | What it does not prove |
|---|---|---|
| Full Python suite, rerun for handover | 414 tests, 45 skipped, pass | Full Android behavior or new standalone verifier execution |
| Seven new 15 original-input verifiers, rerun for handover | All seven pass; feature verifier reports 840 checks; details in `handover-verifier-results.json` | Enabled patched output or complete protected operations |
| Feature guards | 162 plans, zero failures | Runtime/state/semantic identity by shape alone |
| Independent semantic cross-check | 135 probes, zero mismatches | Complete enabled whole-body output hashes |
| Controls literal guards | 73 plans, zero failures; dynamic reader separate | Protected Main/service operations |
| Navigation extension tests | 27 tests: 14 current-profile, 11 legacy, 2 geometry; zero failures/errors | Real on-device broadcasts/Android Auto |
| Kotlin compilation | `:patches:compileKotlin` passed repeatedly; final controls guard addition included | Android bundle assembly or APK installation |
| Publisher base signatures | Both bases verify, expected signer | Final patched APK signature/installation |
| Plain original app launch | API 36 reached onboarding | Sustained stability, license passage, or any patched feature |

Test XML is under
`extensions/flitsmeister/build/test-results/testDebugUnitTest/`.
Build logs include `navigation-gradle.log`, `controls/compile-final.log`.
The handover refresh of the full Python suite is recorded in
`handover-python-tests.log`. Repository Markdown checking also passed at the
handover snapshot: 266 Markdown files, 1,237 file/anchor links. `git diff --check`
passed. These documentation checks do not expand the patch acceptance scope.

Initial assessment censused all 245 old MethodPlan declarations: 130 missing
methods, 6 missing classes, 13 changed shapes, 71 changed guards and 25 unproven
shape candidates. The same audit had no checked mismatch against the retained
14.17 baseline, with 173 independent original whole-body hash matches. The
assessment is useful provenance, not the current port completion metric:
consolidated 15 semantics mean the correct new plan count need not be 245.

## Completion requirements and recommended sequence

### 1. Reestablish reliable current native/runtime evidence

Use existing dedicated devices, exact pristine input identity and retained
capture records. Determine why early injection and later captures fail without
calling every failure an anti-Frida check. Separate app/license state,
class-loader initialization, ART suspend behavior, native decoded state and
instrumentation effects. Keep captures scoped to the selected emulator/app.

Use the authoritative 32-class/1,421-field inventory as the completeness
denominator for current String initialization. A handful of captured strings is
not a complete startup profile. Any recovered method must have independently
checked descriptor, flags, registers, control flow, exception tables, helpers,
types and effects. A remapped 14 body is a candidate until matched against 15
behavior. Static VM format facts and synthetic replay can guide recovery but
do not substitute for that evidence.

### 2. Implement a separate startup profile and independent contracts

Add version 15 behavior alongside the existing 14.17 implementation. Decide the
profile structure only after current requirements are established. Preserve
direct current callbacks. Do not reuse the old reflective-helper loader without
evidence. Verify current native-library requirements rather than assuming the
old stock MapLibre replacement is valid.

Create strict publisher version/code/signer/SDK checks and protected-program
identity guards. Recover application/service behavior before their downstream
edits. Add independent current initialization/body/runtime fixtures and retain
all old fixture values.

### 3. Complete the four protected scoped edits and wiring

Once recovered bodies are available, bind the four operations listed above with
exact 15 guards. Then wire:

```text
featureUi15Plans() + featureUi15AdditionalPlans() + recovered-service-preservation plan
proNotices15Plans() + proNotices15AdditionalPlans() + recovered-main-promotion plan
partnerServiceLeafPlans15() + recovered-main-parking plan
telemetryLeafPlans15() + recovered-service-upload/reset plan
```

Extend leaf validators into complete control contracts for those operations.
Check dependency ordering and guard interactions when multiple controls touch
the same recovered method. Preserve labelled joins and deferred finalizers.

Only then add `AppTarget(version="15.0", versionCode=1289, minSdk=29)` or the
appropriate explicit current variant structure and accepted SDK 32 handling.
Keep 14.17 metadata unchanged. Ensure a malformed or uninspected input still
fails closed.

### 4. Complete independent 15 whole-artifact verification

Add current startup, manifest, native, resource and preservation contracts;
finish enabled method-output oracles after independent semantic acceptance.
Route `verify_flitsmeister.py` / `validate_targets.py` by actual input version.
Keep genuine account/backend/permissions/provider behavior intact.

Run every individual patch and the all-patches combination on both SDK variants.
Check emitted DEX resolution/verification, resources, signatures, dependency
application reports and untouched contracts. A successful compiler or patch
report is not enough.

### 5. Exercise runtime features and old-version regression

Run startup, guest first-run/reopen/optional-login, saved feature preferences,
Pro notice suppression, partner surfaces, advertising/informative-traffic paths,
tracking/telemetry boundaries, background service lifecycle, actual navigation
broadcast delivery and average-speed transitions. Verify receiver-package
configuration and operation without an overlay. Run the existing synthetic ART
callback fixtures as appropriate, and preserve 14.17 individual/combined output
regression evidence after startup dependency changes.

Android Auto callback correctness and host admission are separate. If no actual
car/host is tested, say so. Genuine account activation and server-enforced
services are likewise separate from local feature eligibility.

### 6. Review, commit and promotion

Run a fresh independent review across the complete dirty branch, including new
files, fixtures and final dependency graph. Resolve findings, rerun only checks
affected by subsequent changes, and perform the repository identity gates.
Stage implementation/docs/tests explicitly; exclude local tool links and
credential/evidence artifacts unless deliberately packaged. Do not announce
completion while any of the eight controls or either variant lacks its required
evidence. Stable publication remains subject to the repository's user-confirmed
promotion rule.

## Local evidence index

Start with these files rather than broad scans of every decoded file:

```text
docs/superpowers/plans/2026-11-02-flitsmeister-15.md
docs/research/2026-11-02-flitsmeister-15-compatibility.md
.analysis/flitsmeister-15/features/PORT_STATUS.md
.analysis/flitsmeister-15/controls/progress.md
.analysis/flitsmeister-15/navigation/REPORT.md
.analysis/flitsmeister-15/navigation/NATIVE-RECOVERY.md
.analysis/flitsmeister-15/navigation/dex-protected-string-holders.json
.analysis/flitsmeister-15/navigation/dex-empty-method-holders.json
.analysis/flitsmeister-15/package-comparison.json
.analysis/flitsmeister-15/publisher-verification.json
.analysis/flitsmeister-15/runtime-navigation-audit.json
.analysis/flitsmeister-15/callback-independent-check.json
.analysis/flitsmeister-15/anchor-audit.json
.analysis/flitsmeister-15/baseline-anchor-audit.json
.analysis/flitsmeister-15/handover-verifier-results.json
.analysis/flitsmeister-15/handover-python-tests.log
```

The initial assessment document's unresolved navigation mappings were resolved
by the subsequent navigation port. Its negative assessment of a compatibility-
only update remains valid, but use this handover/cohort ledgers for current
implementation status. No claim in this handover turns the partial port into a
released, installed or runtime-validated result.

## Session 2 continuation (2 November 2026, evening)

This section records the continuation session. Where it conflicts with the
original text above, this section wins.

### Decisive architecture validation (supersedes the native-first framing)

The two prior shipped PairIP ports (Flitsmeister 14.17 and NPO Start TV)
documented in `docs/PAIRIP_FLITSMEISTER_NPO_HANDOVER.md` and
`docs/NPO_START_TV_PAIRIP_HANDOVER.md` define the proven production
architecture: skip the startup program, inject captured startup data,
suppress `VMRunner.invoke`, and reconstruct genuinely-needed protected bodies
in DEX. This session validated every FM 15 building block on emulator-5570:

| Building block | Result | Evidence |
|---|---|---|
| Re-signed pristine-content APK (zipaligned, test cert) | native crash at `0x5d770` in the startup program | build A, tombstones |
| Startup program skipped + 1,421 captured strings injected via `<clinit>` | application program loads and executes on the re-signed APK, then hits its own integrity check (`0x5bdd4`) | build E |
| Same + `VMRunner.invoke` → null (full suppression) | **zero native crashes**; app boots to LauncherActivity | build H |
| Surgical DEX swap into pristine APK (pristine resources kept byte-identical) | no resource crashes; app reaches the first genuine missing-init crash (`lp0.b` / `configurationManager` lateinit) | build I |

Conclusions:

- The native VM integrity checks execute per-program; with suppression they
  never run. The whole-VM-replacement warning in the original handover still
  applies: the app then misses the functional protected bodies, which must be
  reconstructed per-method (NPO style), not left null.
- Apktool full-resource rebuild corrupts resource resolution for this app
  (`splashpage_bg_new` NotFoundException with a rebuilt `resources.arsc` of a
  different size). Diagnostic and production patching must swap only
  `classes*.dex` into the pristine base, never rebuild resources.
- The on-device crash registers of build A match the emulator's failing
  integrity check exactly (`x0=0x5981e1203f4ac4af`,
  `x25=0x3500ae7dc3852a32`), proving the Unicorn replay reproduces the real
  check chain. Byte flips inside the installed pristine APK's signing block
  and around its certificates do **not** crash the app, so the runtime check
  is not a hash of those regions; leave native-check research parked since
  suppression does not need it.

### Captured assets (git-ignored, under `.analysis/flitsmeister-15`)

- `navigation/holder-values-15.json`: **all 1,421 protected string values in
  the 32 holder classes, dumped from the running pristine app via
  attach-mode Frida with framework-only wrappers** (0 field errors). The
  known example `pref_signal_traffic_jam_beginning` matches. This is the
  complete v15 startup data set — the 14.17 analog of
  `StartupRestoreData.strings` (1,442 values). v15 has **zero** Method
  holders, so no reflection restoration is needed.
- `navigation/vm-jni-trace.json`: **authoritative on-device JNI traces of
  VM-protected bodies**, captured by attaching to the pristine app and
  hooking the ART JNIEnv implementations (addresses taken from the live
  `JNIEnv` table passed to `executeVM`; no table writes). Contains complete
  event traces for `LauncherActivity.onResume` (including nested application
  init touching `FlitsmeisterBaseService`, `CustomerRepositoryEntryPoint`,
  `AppLaunchBusKt`), `StandOutWindow.onStartCommand` (full
  `getAction`/`SHOW`/`RESTORE` decision logic — upstream library logic),
  `MainActivity.onCreate` (functional body after its environment preamble,
  includes the real resource/Compositor calls), and a fourth program with the
  `/proc` scan preamble. Re-run with
  `frida-venv/bin/python trace_executevm.py <pid> <out.json> <seconds>` while
  driving the UI (HOME/relaunch triggers onResume; tapping through onboarding
  triggers MainActivity.onCreate; starting navigation triggers the service
  programs).
- Tools added this session (all in `.analysis/flitsmeister-15`):
  `dump_holders2.py`/`dump-holders2.js` (string dump),
  `trace_executevm.py`/`trace-executevm.js` (VM JNI tracer),
  `inject_holder_clinit.py` (string injection), `device_flip_bytes.py`
  (installed-APK byte-flip experiments), `patch_pairipcore.py` (csel
  condition patcher — validated as harmful, see below), plus
  `navigation/emulate_vm.py` upgrades (real `/proc` models, APK file model,
  `map_files`/`getdents64`/urandom models, csel/FNV instrumentation,
  multi-program chaining).

### Negative results (do not repeat)

- Forcing the 12/35 FNV-verify csel sites to `al` breaks opcode decoding —
  the sites are dual-use (decode constants selected by hash equality) and the
  same site serves both roles thousands of times per program. Site-level
  native patching is a dead end; per-instruction data (asset constants) would
  be the only correct level, and suppression makes it unnecessary.
- Frida spawn-time injection is detected (process dies before hooks settle);
  attach-after-startup works and is sufficient for all programs launched
  after the first screen.
- Chaining the application program after a derailed startup replay in
  Unicorn yields no usable body: the startup derailment (state-table check
  against expected `0x3500ae7dc3852a32`) poisons downstream state. Unicorn
  remains useful for check-mechanism analysis, not body recovery.

### Reconstruction map progress

The 14.17 embedded helper DEX was extracted
(`navigation/old-helper-dex.dex`, sha256 `3a085520…`, plus jadx/baksmali
sources under `old-helper-src/`, `old-helper-smali/`, and
`old-app-oncreate.smali`) and contains the genuine 14.17 bodies for
`FlitsmeisterApplication.onCreate`, `LauncherActivity.onCreate/onResume`,
`MainComponentActivity.onCreate/onResume`, `InsiderLoginActivity.onCreate`,
`FMOverlayService.onStartCommand`, `BaseCarAppService.onDestroy`. The v15
`FlitsmeisterApplication.smali` exposes the identical synthetic accessor set
(`onCreate$001`, `getInstance$002(Lig0;…)`, `e$005(Ltuh;…)`,
`A$032(Ll5a;)Llob`, `d$019(Lfb8;…)`, `a$018(Lu95;…)`, …), so the v15 bodies
are structurally the same with renamed types.

Resolved renames (from `features/aligned-map.json`, accessor signatures and
constructor-shape search): `lph→tuh`, `b38→t28`, `fs7→as7`, `r65→m65`,
`gg0→ig0`, `ye4→ff4`, `t25→lp0`, `gb8→fb8`, `qmb→lob`, `q4f→caf`,
`m5a→l5a`, `y95→u95`, `kx1→bx1`, `ese→hv0`, `u96→v96`, `p37→n37`,
`zp0→yig`, `e9b→aab`, `vi9→oi9`, `oe6→re6`, `z45→q45`, `p49→i49`,
`h45→b45`, `adi→yhi`, `tn4→sn4`, `h68→e68`, `kph→suh`, `fha→hha`,
`shi→hmi`, `zic→mlc`, `o9a→q9a`, `fwk→u2l`, `bb6→fb6`, `lm→og8`,
`km→ng8`, `jqh→wvh`, `ixc→ezc`, `q2e→j4e`. Still to resolve: `qg8`, `rg8`,
`bxf`, `c7k`, `vg8`/`wg8`/`xg8`/`pg8` (v15 2-arg ctor candidates `wg8`,
`tg8`, `ug8`; 3-arg `vg8(Lg45;…)`), `sf3`, `d1b`, `z08`, `u85`, `m85`,
`ca5`, `g01`, `uo$b`, `d55`, `m45`, `vm4`. The on-device JNI traces are the
authoritative source for these.

### Diagnostic build recipes (`.analysis/flitsmeister-15/vmtest/`)

Build D/E/H line: apktool-decoded tree (`decoded-e` = DEX no-ops for
`SignatureCheck.verifyIntegrity`, `LicenseClient.checkLicense`,
`isDebuggingEnabled→true`, and for E: `StartupLauncher.launch` no-op plus
1,421-string `<clinit>` injection via `inject_holder_clinit.py`; H: E plus
`VMRunner.invoke` → null). Assemble with apktool, then **surgically replace
only `classes*.dex` inside the pristine `sdk29/base.apk`** (see
`surgical/`), zipalign, and sign with the local test keystore
(`vmtest/test.keystore`, `androidtest`). Install with `install-multiple`
against the `buildA`-style re-signed splits.

### Immediate next steps (in order)

1. Capture the remaining program traces on-device with the tracer
   (`FlitsmeisterApplication.onCreate` — rerun the tracer and launch the app
   fresh, since it runs before the attach window; both service programs —
   start navigation; `CitsParkingActivity.onResume`, `CropImageActivity`,
   `HUDActivity`, the Insider and bluetooth receivers as reachable).
2. Resolve the remaining renames from the traces and finish the
   `FlitsmeisterApplication.onCreate` reconstruction (the
   `configurationManager`/`lp0.b` crash proves it is the first required
   body).
3. Implement the v15 startup profile in production Kotlin
   (a `StartupCompatibility15`-style patch alongside the 14.17 one):
   startup skip + string injection + signature/license no-ops + manifest
   license removal + reconstructed bodies replacing the VM-backed methods.
4. Wire the four scoped edits into the reconstructed MainActivity/service
   bodies (the pending candidate plans in `controls/pending-*.txt` are the
   semantic templates; the traces confirm the v15 call sites).
5. Only then: version-15 compatibility entry, verifier routing, and the full
   validation matrix from the original handover.

## Session 3 continuation (2 November 2026, night)

Supersedes the rename map and status in Session 2 where they conflict.

### Production startup profile landed

`patches/src/main/kotlin/patches/flitsmeister/StartupCompatibility15.kt` and
`StartupRestoreData15.kt` now exist and compile; the eight controls depend on
the new `startupCompatibility15` patch (version-gated, no-op on 14.17 input)
alongside the retained 14.17 `startupCompatibility`. The profile contains:

- The 1,421 captured string values in 32 holder classes (from
  `navigation/holder-values-15.json`) injected as generated `<clinit>` bodies.
- Version-15-guarded replacements with exact register/instruction counts:
  `SignatureCheck.verifyIntegrity` (3/52) → return-void,
  `StartupLauncher.launch` (3/27) → return-void,
  `LicenseClient.checkLicense` (3/25), `initializeLicenseCheck` (3/37),
  `startErrorDialogActivity` (3/9), `startPaywallActivity` (3/17) → return-void,
  `LicenseActivity.onStart` (3/26) → finish, `VMRunner.<clinit>` (1/3) →
  return-void, `VMRunner.invoke` (8/60) → null, `isDebuggingEnabled` (2/5) →
  true, and START_STICKY placeholders for the three int-returning VM wrappers
  (`FlitsmeisterBaseService.onStartCommand`, media3 `DownloadService`,
  `StandOutWindow`; each 9 registers / 21 instructions with a trailing Integer
  cast that cannot take null).
- The idempotent license manifest cleanup as a version-neutral resource patch.

### FlitsmeisterApplication.onCreate reconstruction — WORKING

The core reconstruction (genuine body, not a stub) is implemented and validated
on emulator-5570: with the profile applied, the app passes application creation
for the first time on a re-signed 15.0 build (the previous blocker was the
`lp0.b`/`configurationManager` lateinit NPE). Four corrections were required
beyond the 14.17 template, all established empirically on-device:

1. **Parse initializes before the configuration manager.** The 15.0 DI provider
   for `ff4` (`ig0.getInstance` inside `y80`) resolves the current Parse user,
   so `j4e.b(app)` must run before the `y80.e` singleton request. The 14.17
   order is inverted.
2. **`z80 → y80`, not `gb`.** The configuration-manager singleton field is
   `Ly80;->e:Ly80$a;` (same field name `e` as 14.17's `Lz80;->e:Lz80$a;`);
   `gb.j:gb$a` is the app-component root and throws
   `ClassCastException: gb cannot be cast to ff4`.
3. **`ese.a → hv0.e`.** The scope-launch helper kept its class rename
   (`ese → hv0`) but changed the method letter: `a(Lh45;Lp49;)Ladi;` became
   `e(Lb45;Li49;)Lyhi;` (4 occurrences).
4. **`kph.a0 → suh.a0` (lowercase).** `suh.A0` is an unrelated TripData
   preference that fails the `a$024` Boolean cast; the trip-logging flag
   `config_trip_logging_enabled` is at the lowercase field.

Complete verified rename additions this session: `z80→y80`, `z80$a→y80$a`,
`ese→hv0` (method a→e), `kph→suh`, `qg8→ur4`, `rg8→mg8`, `bxf→v1g`,
`u85→q85`, `ca5→y95`, `d55→u45`, `m45→g45`, `vm4→wm4`, `iwk→x2l`,
`a55→r45`, `a7→zoi`, `bic→nkc`, `l6→k6`, `jia→cp0`, `ijf→hof`,
`wg8(14)→vg8(15)`, `vg8(14)→ug8(15)`, `xg8(14)→wg8(15)`, `pg8→kg8`,
`sf3→lg8`, `FlitsmeisterApplication$c→o7b`, `bxf→v1g`, `g01→fze`,
`d1b→t1b`, `z08→p08`, `c7k→ock`, `q2e→j4e`, `jqh→wvh`, `ixc→ezc`,
`u85→q85`, `ca5→y95`, plus the unchanged names `m85` (constructor now takes
`HashMap` for Insider custom attributes — the country upload is deliberately
omitted; see the KDoc), `fb8`, `hv0`, `wm4`.

### Current runtime frontier

With the full profile (surgical DEX-swap build `vmtest/surgical/testJ-signed-base.apk`,
pristine resources, test-signed splits), cold start shows **zero native PairIP
crashes** and application creation succeeds; the app now fails at
`LauncherActivity.onResume` with `SuperNotCalledException` — the next
VM-protected body to reconstruct. Its raw material is ready: the 14.17 helper
body (`old-helper-smali/.../LauncherActivity$c2020060318.smali`, 18 registers,
~200 instructions: splash-state publish, notification cancel, parking-method
check, deeplink/UTM analytics and next-activity dispatch) and the authoritative
v15 trace (`navigation/vm-jni-trace.json`, block 0, including
`onResume$001`, `a$002`, `NotificationManagerCompat`, `CustomerRepositoryEntryPoint`,
`FlitsmeisterBaseService$b`, `AppLaunchBusKt`, `AppLaunchState`). The same
template-plus-trace loop applies to each remaining body in launch order:
LauncherActivity.onResume → (onboarding completes) → MainActivity.onCreate
(trace block 2, 1,364 events) → service onStartCommand/onDestroy → remaining
activity and receiver programs.

### Fresh checks at this state

- `:patches:compileKotlin` passes.
- Full suite: `Ran 414 tests ... OK (skipped=45)`.
- All seven 15.0 verifiers pass (features 840 checks; navigation 15 bounded
  hook sites; tracking/guest/ads/partner/telemetry cohorts).

## Session 4 continuation (2 November 2026, late night)

### LauncherActivity.onResume reconstruction — WORKING

The second genuine body reconstruction is complete and on-device validated.
With it applied, the app now passes application creation, passes the launcher,
navigates onward, and fails at exactly the next body in launch order
(`MainActivity.onCreate`, SuperNotCalledException) — the reconstruction
pipeline is proven for two bodies. Current state on emulator-5570 with the
surgical build: zero native crashes, the process survives cold start.

Porting method (reusable for every remaining body): all 354 accessor call
sites are matched by signature between the 14.17 helper body and the v15
accessor set (`navigation/onresume-accmap.json`); remaining classes resolve
through structural fingerprints. Corrections discovered on-device this session:

- `z80 → y80` and the config-manager singleton field is `y80.e` (14.17 kept
  the field name `e`); `gb` is the app-component root, not the config manager.
- `kph.a0 → suh.a0` (lowercase; `A0` is an unrelated TripData preference).
- The scope launcher moved methods: `ese.a → hv0.e` (4 occurrences).
- Parse must initialize before the configuration-manager request.
- The CarConnection observer lambda is `lg8` with a **single** discriminator
  case (0); the 14.17 `sf3(app, 2)` became `lg8(app, 0)` — passing 2 lands on
  the smh/Boolean branch and crashes.
- `vz5 → xz5` (the 28-constant settings enum) with positional field renames
  `J1→X, K1→Y, L1→Z, M1→o1, N1→p1, X→q1, Y→r1, Z→s, s→s1` and the synthetic
  enum-values list `P1→K1` (`br7→sq7` enum-list holder, verified by the only
  synthetic field on both sides).
- `ku0 → y2e`, `c43.O(Iterable,Object)Z → s33.F(...)Z`, `Lib → gb`
  (account holder with `gb.j:gb$a` entrypoint and `gb.b:UserAccountFM`),
  `vn7 → on7` (empty-map singleton), `ko → ho` (analytics dispatcher),
  `uv → dja` with `c76` unchanged, LauncherActivity instance fields
  `t1/u1/v1 → o1/p1/q1`, `FlitsmeisterBaseService.H1 → C1`, `xu6 → tu6`
  (logging), `fe0 → ee0`, `b06 → d06`, `sle → aqe`, `czj → x4k`,
  `rga` is the Insider custom-attribute setter (v15 `m85` takes a HashMap).

The production patch now carries `launcherOnResume15` (1,356 instructions,
19 registers) with the same guard style. Fresh checks: compileKotlin passes,
414 tests OK (45 skipped), all seven v15 verifiers pass.

### Runtime frontier

`MainActivity.onCreate` (program `mq2oLwBmLnxLU6o1`): the 14.17 reference
body is 22 registers / 757 instructions and the full v15 trace is already
captured (`navigation/vm-jni-trace.json` block 2, 1,364 events). After it:
`FlitsmeisterBaseService.onStartCommand`/`onDestroy` (carrying the Unlock Pro
and tracking scoped edits), then the remaining activity and receiver programs.
