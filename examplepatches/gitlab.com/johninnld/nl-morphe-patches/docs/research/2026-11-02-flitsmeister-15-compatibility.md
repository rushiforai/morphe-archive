# Flitsmeister 15.0 compatibility assessment

All eight existing controls need a version-specific port before advertising
15.0/1289 support. A compatibility-list change alone fails the current input
preflight and, after that is updated, the startup restoration and numerous
bytecode guards. This assessment establishes those incompatibilities; it does
not establish that a complete port is impossible, or deliver patched APKs.

## Publisher packages

Inspected both supplied APKMirror APKM files locally:

| Variant | APKM SHA-256 | Base APK SHA-256 | Manifest min SDK |
|---|---|---|---|
| 4 architectures / 6 densities | `407507012a279bd96fb250f89809fc1db0e7996a2fec9a9301ce2c3234ca34c7` | `7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0` | 32 |
| arm64 / 2 densities | `c44572f8a575449e53512226d5866813c85ec254679c5a07110cf941e2ba3498` | `09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea` | 29 |

Both base manifests declare `nl.flitsmeister`, version `15.0`, code `1289`,
target SDK 37. `apksigner verify --print-certs` verifies both bases against the
existing trusted publisher certificate:
`ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6`.

The base files are not byte-identical: `AndroidManifest.xml` and
`resources.arsc` differ. All other 4,661 base members match, including all seven
DEX files and all assets. The common arm64 MapLibre native library also matches
between the supplied split sets. It has SHA-256
`a16f4ce832821685d0e68196e7981f513659885b173ccfe8bcb4c895725f64f3`.
The universal package additionally contains other ABIs. One bytecode port can
serve both SDK variants, with separate manifest/resource/split validation.

## Every existing control

All eight controls depend on `Fix PairIP startup`, directly or through their
dependency chain. None can currently be offered as a validated 15.0 control.

| Control | Additional 15.0 work beyond shared startup repair |
|---|---|
| Fix PairIP startup | Recover new startup data and protected functional bodies; replace the old asset/native bindings and callback profile. |
| Unlock Pro | Rebind 54 settings plans, 93 feature/UI plans, and Android Auto eligibility/notice plans. Preserve genuine account and backend requirements. |
| Hide Pro notices | Rebind notice-rendering and Android Auto plans. `MainActivity.onCreate`, previously directly editable, is now VM-protected. Native banner layout names still exist. |
| Broadcast navigation data | Rebind lifecycle/location/road/average-speed hooks and extension reflection. Country, Unit and average-speed geometry mappings need further tracing. |
| Disable partner services | All seven plans have missing methods or changed shapes. Recover protected activity behavior before reproducing those edits. |
| Hide ads | Six of nine plans already have missing identities or changed references; the remaining three are unproven shape candidates. Revalidate informative traffic LBA preservation. |
| Disable tracking | 26 of 46 SDK plans already mismatch; first-party telemetry has nine mismatches among eleven plans. Preserve nontracking service contracts. |
| Guest mode | All three exact method identities are missing. Retrace onboarding/menu routing and resource references. |

### Complete method-plan census

The audit enumerated all 245 `MethodPlan` declarations, including interpolated
descriptors and the ads reader's two accepted instruction counts:

| Observation | Plans |
|---|---:|
| Exact method descriptor missing in an existing class | 130 |
| Class missing | 6 |
| Register/instruction shape differs | 13 |
| Shape matches, but a required opcode/reference guard differs | 71 |
| Shape candidate without a detected mismatch in this limited audit | 25 |

Thus **220/245 existing plans demonstrably cannot apply unchanged**. The other
25 are not approved: this audit does not implement every production register,
branch, reference-cardinality, dynamic-guard or cross-patch interaction check.
Some checks stop at missing identities or changed shapes, so these counts are
not a complete accounting of all differences.

As a sanity check, the same audit was run against the retained original 14.17
base. It found no missing identities, shape mismatches or checked guard
mismatches across all 245 plans; 173 also matched independent frozen
whole-method hashes. This is evidence about the audit, not a new full 14.17
patch-selection validation.

For example, settings methods retain their familiar layout but now invoke
`Laqe;->b(Landroid/content/Context;)Z` where the current plans require `Lsle`.
Matching a class name or instruction count does not establish semantic identity.

## PairIP is the principal prerequisite

The current repair expects `assets/bsnPCDnBLcHWJvVO`, a fixed embedded DEX at
offset 253917, captured string/reflection holders and a specific protected
arm64 MapLibre library. That asset is absent from both 15.0 bases. The arm64
library hash also differs from the current protected-input expectation
`38a576f0f34ea5d2d8aaa06eb8c0796ce85985ada000eb034d5ff3c2c2a9f282`.

The final decoded tree shows that twelve of the thirteen old callback
descriptors now have direct bodies with no VMRunner call. The old `Lhza`
`onReceive` method is absent. None of the old protected-program guards can be
reused unchanged. Preserve direct implementations rather than overwriting
them with old-version restoration data.

The current DEX contains 22 methods invoking `VMRunner.invoke`: twenty contain
constant program names and two are dispatchers. Newly protected essential
operations include:

- `FlitsmeisterApplication.onCreate`: `LBsZjgwAdSdCGW1e`.
- `MainActivity.onCreate`: `mq2oLwBmLnxLU6o1`.
- `FlitsmeisterBaseService.onStartCommand`: `Fxz6YV9Xh1xFSXmr`.
- `FlitsmeisterBaseService.onDestroy`: `1UkEu2lRMiAKdriN`.

A null-returning VM bypass would suppress essential application/service
behavior. Their functional bodies need recovery and independent verification.
The inventory covers literal incoming DEX invokes, not reflection/native
entrypoints or execution inside protected programs.

## Navigation requires an extension port too

Verified static counterparts include location owner `ab0` → `bb0`, road producer
`omf.z` → `irf.z`, road limit `hmf.f` → `brf.f`, event stream `fs7` → `as7`, and
Function1 `b49` → `u39`. The subscription changes from
`fs7.b(b49):is7` to `as7.b(u39):ds7`.

Several old obfuscated names still resolve to unrelated classes. Updating only
patch hooks would leave stale reflective names in `NavigationBroadcasts.java`.
Country, Kotlin Unit and average-speed task/geometry mappings remain unresolved.
These observations do not prove broadcast behavior on a device.

## Port and acceptance requirements

1. Add a separate 15.0 startup/protected-method profile after recovering current
   behavior. Retain the inspected 14.17 profile and its fixtures.
2. Rebind every control's guarded operations from semantic flow evidence,
   including extension reflection and newly protected methods. Do not weaken
   guards merely to accept changed instructions.
3. Add independent 15.0 method/resource/native and runtime expectations. Existing
   validators deliberately freeze 14.17 contracts and cannot certify 15.0 by
   changing only an input version string.
4. Run all eight individual selections plus the combined selection on both
   supplied split sets, with rebuilt bundle, signature/DEX/resource checks and
   preservation checks. Validate startup, guest flow, navigation broadcasts,
   background service and Android Auto behavior on devices before claiming
   those runtime results.

The existing complete selection entrypoint is:

```sh
python3 scripts/validate_targets.py flitsmeister INPUT --bundle BUNDLE --sdk ~/Library/Android/sdk --output OUTPUT
```

Omitting `--selection` runs every individual control and the combined set.
Version-aware independent oracles must exist before this can certify 15.0.
No patch source, compatibility declaration, published catalogue or release was
changed during this assessment. No patched 15.0 installation or runtime test
was performed.

## Retained local evidence

Generated investigation artifacts are under `.analysis/flitsmeister-15/`
(ignored by Git): `package-comparison.json`, `publisher-verification.json`,
`anchor-audit.json`, `baseline-anchor-audit.json`, `audit.py`,
`callback-independent-check.json`, `runtime-navigation-audit.md` and `.json`,
decoded publisher trees, and `rea-evidence.json`.

REA package identity evidence:
`ev_1ff7ad61ad4eafa8d3a0d41609bf9efb21459946a6ec370eeb46b985e8f1dd05`.
Focused Android Auto `CarConnectionTypeLiveData.onActive` decompilation:
`ev_2cc70601cdc058ba66d0c16104bfd87c0344c40f58fa892d32a942adc9ea57c6`.
The byte comparisons and anchor census are ordinary local Python/APKTool
observations, not REA runtime evidence. All conclusions are static.
