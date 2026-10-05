---
name: morphe-resolver-anchors
description: Choose and repair patch-time resolver anchors for obfuscated Android apps (Instagram/Morphe). Use when writing, porting, or reviewing fingerprints and semantic resolvers, or when a patch applies but breaks on a new app version.
---

# Resolver anchors

R8 and product refactors change class identity, synthetic signatures, and call sites
without changing behavior. An anchor must survive that churn or fail closed with a
useful diagnostic.

## Version-bump failure taxonomy

| Symptom | Cause | Fix |
| --- | --- | --- |
| Exact constructor/class candidate finds 0 | R8 lambda merging, type erasure, class relocation | Match behavior (calls/resolves the same target) plus a shape family, not identity |
| Fingerprint anchor gone | Getter/method inlined or elided | Resolve the producer (field read, caller, callee) and accept both shapes over one mutation |
| Parameter list matched 0 (or 2) | Compose lowering: added/removed auxiliary params, range vs 35c | First/trailing parameter invariants and an object-only middle; never fixed arity |
| Exact return type rejects a real candidate | Interface elided, subtype return | Assignability (interface/superclass walk plus platform-implementation set); pick the invoke opcode from the owner's access flags |
| Register check passes on one version, fails on the next | Value moved through `move-object/from16` or an invoke-range | Propagate moves / resolve the producer, not single-hop containment |
| Patch applies but the feature stays broken | Hooked one call site of a shared helper | Hook the shared consumption point once, or enumerate every caller with asserted cardinality |
| Hook point disappeared | Bundled library upgrade (Haze, Coil, Compose) | Capability adapter: detect the new contract, keep one downstream mutation, keep the old path |

## Rules

1. **Anchor on behavior, not R8 output.** Tie a candidate to what it does: calls the
   resolved renderer, reads the resolved field, feeds the resolved request. An exact
   constructor or class identity is reconnaissance, not evidence.
2. **Shape families, not exact lists.** For Compose signatures: first parameter type,
   required parameters, trailing `Composer`/flags, object-only middle. Prefer cardinality
   ranges (`1..2`) over exact counts.
3. **One deep resolver, adapters at the same mutation.** When identity moved, widen
   semantic discovery. Only when the contract changed, add a validated shape adapter and
   share the downstream mutation.
4. **Follow the value.** "Register X is used by instruction Y" is one hop. Propagate
   object moves and range registers, or resolve the producer instruction.
5. **Mutate the invariant boundary.** Prefer the shared helper/consumer over every
   producer call site. If call sites are unavoidable, assert the full set and hook in
   descending index order.
6. **Fail closed with candidates.** Zero or ambiguous matches must raise
   `PatchException` with the candidate descriptors (`requireExactlyOne`/`requireAtMostOne`).
7. **Preserve old targets.** Keep the old path unchanged and re-patch at least one older
   declared APK after every resolver change.

## Validation matrix

1. `./gradlew :patches:lintResolvers :patches:checkExtensionDescriptors` — mechanically detectable drift and
   stale extension descriptors.
2. `./gradlew :patches:build --no-daemon` — real MPP.
3. `./patch-ig-cli.sh <new.apk>` and one older declared target; confirm `Applied` and
   `Saved to`.
4. Inspect the emitted bytecode of the mutated method in the output APK (dexscope) before
   handing off.
5. Ask the user to exercise the runtime path; log the incident (including the exact APK,
   MPP hash, error, and cause classification) under `docs/resolver-incidents/`.

## Mechanical checks

Linter rules live in
`piko-patches-library` (`app.crimera.tools.lint.ResolverLinter`), run on this repo through `:patches:lintResolvers`:

- `rigid-signature` — exact fingerprint parameter lists (4+ entries or Compose descriptors).
- `exact-interface-type` — `returnType`/`type` equality against `Set`/`List`/`Map` descriptors.
- `single-hop-register` — `registersUsed.contains(<identifier>)` / `any { it == <identifier> }`.

Fixtures are in the library's `ResolverLinterTest.kt`; the incident files are the long-form case
corpus. A rule is promoted from advisory to gating only after its backlog is zero.
