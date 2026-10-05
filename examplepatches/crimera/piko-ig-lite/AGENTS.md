# Repository Agent Rules

Workspace-level rules (search safety, patch performance, build and dependency integrity) also apply when they are present. Project skills live in `.agents/skills/`.

## Device safety

- Installing a build on the user's device is allowed when needed for the requested validation.
- Never launch, interact with, navigate, or otherwise control the user's device through adb or any other device-control mechanism without explicit permission. This includes reading logs, clearing logcat, and pulling files.
- For runtime reproduction, ask the user to use the app normally and report the failure or send a screenshot/logs.

## Build and patch testing

- Build the patch bundle from the current checkout before patch testing: `./gradlew :patches:build --no-daemon`.
- Run patch tests through `./patch-ig-cli.sh`, not a direct Morphe CLI invocation. It needs the local patcher runner (`(cd ../morphe-patcher && ./gradlew :cli:installDist)`). Pass the exact APK explicitly, for example `./patch-ig-cli.sh apks/449.0.0.52.84.apk` (the script's default is an older target); the output goes to `~/Downloads/piko-ig-lite-patched-cli.apk` unless `OUTPUT_APK` is set.
- Do not patch with a stale MPP or mix artifacts from different source revisions. Confirm the script's output path and `Patched APK:` line before testing.
- Do not pass `--install` or otherwise control a device unless the user explicitly requests it; ask the user to launch and exercise the patched app.
- Before handing off a resolver change run `./gradlew :patches:lintResolvers :patches:checkExtensionDescriptors --no-daemon`.

## Supported targets

`COMPATIBILITY_INSTAGRAM` in `patches/src/main/kotlin/app/crimera/patches/instagram/utils/Constants.kt` is the only list of supported versions. Do not duplicate it or branch on a version number.

- Every resolver change must be patched against the newest declared target and at least one older declared target, and the resolved names compared before and after.
- Older APKs that are no longer declared (for example 439) are resilience cross-checks only. Do not add version-specific paths for them; report anchors that only hold on one release.
- A successful patch is not proof the feature works. The patch can apply with the wrong member resolved; check what was resolved, not only that `Applied` was printed.

## Patch philosophy and methodology

Instagram is an obfuscated app under active refactoring. A patch must survive ordinary R8 churn where possible, but must never guess when the app's behavior or contract has changed. The architecture is documented in `docs/ig-patch-architecture.md`; the skills `morphe-resolver-anchors`, `morphe-patch-development-workflow` and `morphe-runtime-boundaries` are the detailed rules.

### Philosophy

- Treat the exact target APK's smali as bytecode truth. Use readable builds to understand intent, not to choose production instructions.
- Match semantic invariants, not obfuscated identity. Short class names, method names, field names, and numeric instruction positions are reconnaissance evidence only.
- Resolve capabilities from the APK, not versions. If genuinely different contracts exist (for example a value read before or after its key), select an explicitly validated shape at patch time and share the common mutation afterward.
- Prefer one deep semantic resolver over a growing list of release-specific fingerprints.
- Fail closed. Zero matches, ambiguous matches, an unexpected signature, or an unproven control-flow path must raise a useful `PatchException`; never silently skip required behavior.
- Validate what a resolver returns, not only that it returned something. A resolved field or method must have its type and signature asserted (for example "a `List` field"), because "the first `iget-object` after the key" is not proof.
- An optional resolver (`matchOrNull`) must not leave a live extension placeholder behind. A placeholder that survives patching turns into a runtime failure on a path the patcher reported as `Applied`.
- Patch the smallest value at the latest safe point that controls the behavior. Avoid modifying shared helpers when the same helper serves unrelated features.
- Keep compile-time model contracts separate from release bytecode. Stable models may be `compileOnly`; unstable owners, methods, and descriptors belong in patch-time resolution and direct smali injection. Do not add new runtime reflection over release classes.
- Preserve old targets. A resilience improvement must keep the old path's behavior unchanged.

### Typed bytecode emission

Hooks are emitted through the [`crimera:morphe-bytecode`](https://github.com/crimera/morphe-bytecode) library, never by assembling smali strings:

- `method.insertHook(index, relocateBranchTargets = …) { … }` with `Block` emitters and `Target.Local` / `Target.Original` as branch targets.
- State the branch policy whenever the insertion point carries labels. Scratch registers are bounded by `RegisterLimit` and fail closed.
- A layer fix belongs in the library repository, followed by a version bump in `patches/build.gradle.kts`. Do not add new smali string templates.

### Runtime API compatibility

Patch code runs inside Morphe Manager (bundle dexed with D8 `--min-api 26`), and the `animalsnifferMain` gate checks API 26. Avoid platform APIs introduced after API 26, including Java 21 `List` methods such as `removeLast()` and `removeFirst()`; use `removeAt(lastIndex)`. Inspect generated bytecode when using newer Kotlin collection APIs.

### Resolver helpers

Shared helpers live in `piko-patches-library` (`../piko-patches-library`, consumed as an included build when present), package `app.crimera.patches.common`:

- `requireExactlyOne(label, candidates)` / `requireAtMostOne(label, candidates)` for candidate collections. They fail with a `PatchException` listing the label, cardinality and candidates. Omit the optional `describe` argument unless the default `toString()` is not useful.
- `isAssignableTo` for interface-typed descriptors (`List`, `Set`, `Map`); never compare them by exact equality.
- `hasComposeShape` and friends for Compose signatures; never match an exact fixed-length parameter list.
- `classDefFlatMap` for read-only whole-APK scans.

Generic helpers belong in the library, not here; the library's boundary test forbids app-specific imports. App-specific resolvers stay in this repository.

`./gradlew :patches:lintResolvers` enforces the selection, rigid-signature, interface-type and single-hop-register rules. If instruction order is intentionally contractual, document the exception beside the selection, for example `// resolver-lint: allow instruction-order raw-first because bytecode order is the contract`.

### Incident log

Log every real patch failure or reported runtime bug in `docs/resolver-incidents/`: exact APK version, source commit, command, complete error, failing patch, and whether the cause was resolver logic, APK contract drift, tooling/artifact setup, or runtime behavior. If a bug is reported in a later session, search the incident log before changing resolver code.

### Method

1. **Freeze the target.** Record the exact package, version, APK, MPP, and output. Reuse stored decompilations and keep analysis scoped to the relevant package/file.
2. **Trace intent.** Follow the user-visible operation from UI/event through policy gates to the final consumed value. Identify parallel implementations, shared helpers, and downstream gates.
3. **Map exact smali.** Verify the semantic path, registers, result representation, branches, and callsite in the target APK. JADX is navigation; smali is proof.
4. **Choose anchors.** Prefer preserved framework/public types, stable signatures, ordered calls, field relationships, semantic strings, and only then opcode/literal shapes.
5. **Resolve dynamically.** Derive owners, fields, constructors, method references, argument registers, and exact descriptors from matched target instructions. Do not hardcode an obfuscated descriptor in extension code.
6. **Assert cardinality and type.** State whether the target must have zero, one, or many matches, and what type the resolved member must have. Validate combined old/new shape counts when variants are necessary.
7. **Mutate minimally.** Preserve register widths, invoke/result pairing, labels, reachability, value representation, and unrelated callers.
8. **Build and patch.** Build the real MPP, patch the exact APKs, and confirm `Patched APK:`.
9. **Validate proportionally.** After a failure or explicit deep-validation request, inspect final DEX reachability and run focused old/new runtime tests. Include negative/control paths.
10. **Document evidence.** Record the target anchors, discarded anchors, cardinality, supported versions, and known limits so the next agent can improve the resolver instead of rediscovering it.

### Test policy

A test must guard a real failure mode. Keep tests that do one of these:

- Aggregate integration over real contributions, resources, and extension reads.
- Emitted-bytecode assertions: opcodes, invoke/result pairing, register allocation, branch direction. Smali bugs are silent until runtime on device.
- Fail-fast validation: duplicate IDs, bad defaults, malformed descriptors.
- A resolver fixture for every real resolver failure, run through its real entry point.

Do not write tests for trivial getters, builders, literal resource names, or test-only scaffolding, and do not duplicate what the aggregate test or a patch-time `PatchException` already covers. No new test file without naming the failure it would have caught.

### R8 and refactor policy

Assume both kinds of change are possible. R8 may rename, inline, merge, repackage, remove, or reassign obfuscated classes and methods. Product or generated-code refactors may change parameters, fields, ordering, and helper ownership. Identical behavior is not proof of identical implementation, and an identical descriptor is not proof of identical class identity.

When only identity moved, broaden semantic discovery. When the contract changed, create a shape adapter with a common downstream mutation. The compatibility list is safety metadata for tested releases, not a behavior-routing branch.
