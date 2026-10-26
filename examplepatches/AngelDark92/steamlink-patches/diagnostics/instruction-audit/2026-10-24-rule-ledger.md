# Instruction rewrite rule ledger - 2026-10-24

Purpose: prove that the shortened instruction set kept every unique rule. Each row
names the old owner, the new owner and the action. Duplicates were removed, not
rules.

| Old owner | Rule group | New owner | Action |
|---|---|---|---|
| Root `AGENTS.md` | Parent workspace applies | `AGENTS.md` intro | Kept. |
| Root `AGENTS.md` | Repository purpose | `AGENTS.md` intro | Kept, shortened. |
| Root `AGENTS.md` | App registry: packages, exact bases, Kotlin, resources, extension tasks | `AGENTS.md` Apps table | Kept as the single app table. |
| Root `AGENTS.md` | Registries in `shared/Constants.kt`, categories in `shared/PatchCategories.kt` | `AGENTS.md` Apps | Kept. |
| Root `AGENTS.md` | Exact pair, no cross-app/base inference | `AGENTS.md` Apps | Kept. |
| Root `AGENTS.md` | App isolation, shared helper parameters, `extendWith` isolation, new-app isolation | `AGENTS.md` rule 1 | Kept, merged. |
| Root `AGENTS.md` | Preserve every adaptation, add not widen | `AGENTS.md` rule 2 | Kept. |
| Root `AGENTS.md` | `AppTarget` primary constructor, duplicate version names, `versionCodes = null` | `AGENTS.md` rule 3 | Kept. |
| Root `AGENTS.md` | `Patch.default`, per-build defaults, one patch per feature, exception comment | `AGENTS.md` rule 4 | Kept. |
| Root `AGENTS.md` | Recursive dependency execution, independent guards, inert on other apps | `AGENTS.md` rule 5 | Kept. |
| Root `AGENTS.md` | Description sentence, `Builds:`, `Needs:`, `buildLabel`, test contract, base update | `AGENTS.md` rule 6 | Kept. |
| Root `AGENTS.md` | Base adaptation = real mutation, inspect each APK, exercise helpers, trace callers, record evidence | `AGENTS.md` rule 7 | Kept, compressed. |
| Root `AGENTS.md` | Pin size/hash/targets/preconditions, fail closed, no global counts, atomic/idempotent | `AGENTS.md` rule 8 | Kept. |
| Root `AGENTS.md` | Separate evidence classes, reconstructed APKs, pristine source requirement | `AGENTS.md` rule 9 | Kept. |
| Root `AGENTS.md` | Local `:patches:test`, testImplementation, tracked inputs, assume only absent, fresh checkout, `.gitattributes` | `AGENTS.md` rule 10 | Kept. |
| Root `AGENTS.md` | Release graph, no tests in graph, isolated graph+test validation, fallback classpaths, failed-run identity, attestation path, Packages token | `AGENTS.md` rule 11 | Kept, compressed. |
| Root `AGENTS.md` | External output, local-tree ban, `python -B`, cleanup, `patches/bin` ban, native payload preservation | `AGENTS.md` rule 12 | Kept. |
| Root `AGENTS.md` | Four retired hitch experiments and no re-add | `AGENTS.md` rule 13 + tried ledger link | Kept; implementation detail moved to diagnostics. |
| Root `AGENTS.md` | 4XVR exact base, stock hash, launch-critical decoupling, premium experimental, headset gates | `AGENTS.md` rule 14 | Kept; run history moved to diagnostics. |
| Root `AGENTS.md` | Official Morphe links | Morphe skill | Moved; no rule changed. |
| Morphe skill | Patch types and template | Morphe skill | Kept. |
| Morphe skill | Adding an app, nine steps | Morphe skill | Kept. |
| Morphe skill | Categories and readme generator counts | Morphe skill | Kept. |
| Morphe skill | Extension task per app | Morphe skill | Kept. |
| Morphe skill | Per-app payload loader | Morphe skill | Kept. |
| Morphe skill | Native edit tuple and idempotent applier | Morphe skill | Kept. |
| Morphe skill | Test matrix and assumed real-base audit | Morphe skill | Kept. |
| Morphe skill | Native OpenXR `getInstanceProcAddr` pitfall | Morphe skill | Kept. |
| Morphe skill | Description pinned phrases and text-pass procedure | Morphe skill | Kept; build IDs replaced by "grep the tests" so the skill cannot drift. |
| Morphe skill | Option text left/right keys | Morphe skill | Kept. |
| Morphe skill | Typed dexlib2, wide parameter words, branch targets, `Opcode.name`, scratch registers, VerifyError, index-0, `MutableMethod` | Morphe skill | Kept. |
| Morphe skill | `.gitattributes` for byte-hashed payloads | Morphe skill + AGENTS rule 10 | Kept; pointer in AGENTS. |
| Morphe skill | Diagnostics gitignore whitelist | Morphe skill | Kept. |
| Morphe skill | Lowercase-drive `d/` trap | Morphe skill + AGENTS rule 12 | Kept. |
| Morphe skill | Smali/DEX 040, API 33, cache delete | Morphe skill | Kept; historical 1.7.0 detail retained as a warning. |
| Morphe skill | On-device original/patched pulls | Morphe skill | Kept. |
| Morphe skill | Manager tile icon | Morphe skill | Kept. |
| Morphe skill | Output location and dependency scopes | Morphe skill + AGENTS rule 12 | Kept; no absolute machine path. |
| Morphe skill | Test/release graph, attestation, Packages token | Morphe skill + AGENTS rule 11 | Kept; AGENTS owns the gate. |
| Morphe skill | Real apply audits, classpath refresh, dexdump, STRIP_FAST | Morphe skill | Kept. |
| Morphe skill | Isolated worktree test | Morphe skill | Kept. |
| Morphe skill | Credits | Morphe skill | Kept. |
| Cavecrew skill | Call contract, roles, refusals, outputs, chaining, Hermes | Cavecrew skill | Kept; "why this exists" removed. |
| Cavecrew agents | Permissions and role boundaries | Three agent files | Kept; project-skill list moved to AGENTS. |
| Copilot file | Patch-authoring constraints | Copilot adapter | Kept; base table removed to prevent drift. |
| Cursor file | Build/test pointers | Cursor adapter | Kept; stale base table removed. |
| `.agents/AGENTS.md` | External output requirement | `.agents/AGENTS.md` | Kept; duplicate rules removed. |
| `.hermes.md` | Generic assistant specification | Archived | Not repository rule; archived at `diagnostics/build-layout/hermes-operating-spec-archived-2026-10-24.md`. |
| `WORKSPACE_CLEANUP.md` | Completion rule, ownership, retained exceptions, history | New `WORKSPACE_CLEANUP.md` + archive | Kept policy; retained exceptions re-scoped to current decoded/tool/evidence rules; dated history archived verbatim. |
| `.github/workflows/release.yml` | Non-release branch build gate | Workflow | Kept the gate; removed the non-`main`/`dev` branch artifact upload because build outputs are not consumed from CI. |

## Explicit removals

- Duplicate supported-build tables in Copilot and Cursor files. `AGENTS.md` and
  `README.md` remain the checked copies.
- Repeated cleanup paragraphs and superseded run narrative in
  `WORKSPACE_CLEANUP.md`; the original is archived verbatim.
- Historical CI run IDs that no longer identify an actionable failure.
- Absolute machine path in the Morphe skill; relative output path used instead.
- Generic assistant policy in `.hermes.md`; archived, with a project pointer kept.
- Generated APKs named by active diagnostic records were retired per the owner's
  2026-10-24 decision; those records now cite the cleanup receipt and rebuild path.

## New checks

- `.github/scripts/check_agent_docs.py` enforces word budgets, ASCII, app-table
  parity with `shared/Constants.kt`, no build pairs in adapters, and mirrored
  `.agents` skills.
- `tools/Clean-BuildResidue.ps1` + `diagnostics/build-layout/Test-CleanBuildResidue.ps1`
  enforce the cleanup policy with 55 assertions.
