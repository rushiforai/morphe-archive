# Numeric warning pills implementation plan

> Execute inline in one coherent batch. The owner supplied the complete chosen mockup pack and previously opted out of additional design questions. Repository batching takes precedence over per-edit test runs. No delegation or maintained validation-tool changes.

**Goal:** Both Maps and Vela car pills match the supplied icon/number/unit/line design; active average zones use the same pill and a separate section-progress value.

**Architecture:** Change the existing shared CarWarningPills Canvas renderer. Keep Maps native speed/limit and Vela speed pair separate, keep AA safe-area positioning, preserve provider identity/geometry/expiry and native ANNOUNCE audio policy. Phone UI remains native/current.

**Spec:** `/Users/jneerdael/Downloads/DriveDeck-Warning-Mockup-Pack/README.txt`, source/states.json and supplied18 mocks. Fixed logical width180dp, using the mockup218:70 aspect ratio and normalized coordinates. The folder name does not create a DriveDeck dependency.

- [x] Add ordinary rendered-output regressions for number-only distance, unknown/stale distance, active average/unknown average, independent section bar, all-family shape and legacy car fallback. No new fixture/runner.
- [x] Replace warning prose with number/unit or unavailable placeholder; use average icon and number/unit for active zone, omit visible Average/percent/remaining captions. Keep full accessibility/native spoken message.
- [x] Use the existing fresh native geometry span for approach and independent telemetry section percent for active progress; never copy approach fill into the active bar or invent a clock/span. An unavailable section progress shows only its track.
- [x] Copy all19 supplied256px icons byte-for-byte; use the mockup pack's supplied repair for its empty emergency file. Record updated catalogue hashes/provenance.
- [x] Account for canonical verification using fresh Android/Python/docs and unchanged release/Medium receipts.
- [x] Patch the exact original Maps/Vela inputs and verify new packaged assets.
- [x] Produce a signed commit-derived engineering bundle; retain compact evidence and clean owned build/scratch. Broad emulator acceptance remains deferred by the owner; do not claim a new live-AA design capture from JVM rendering checks.

**Review focus:** No visible native warning-name fallback, no duplicate speedometer, no fake0distance/average, no stale span/progress, no per-frame speech, no historic icon-byte claims after this asset update. Existing Exit and entry-focus issues remain separate.

Result: executable source `5b03b286e6177675addac486955cf8f0e6ff68a5`, signed review bundle `~/Downloads/nl-morphe-navigation-5b03b286e617.mpp`. Original Maps28/Vela1 default patch sets succeeded with no failures and all19 new packaged asset hashes matched. Six rendered-output tests cover the revised shared pill. No new runtime or phone installation; live AA geometry of this revised shape remains deferred. Compact receipt and cleanup are in `.analysis/numeric-warning-pills-216/receipt.json`.
