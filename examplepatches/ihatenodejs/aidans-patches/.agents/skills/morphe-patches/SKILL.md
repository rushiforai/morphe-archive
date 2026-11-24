---
name: morphe-patches
description: Authoring, modifying, and debugging Morphe patches (bytecode, resource, raw asset, composite) in Kotlin, Java extension runtime bridges, Hermes bytecode, ARM64 assembly, and target app version upgrade workflows. Use when creating or editing patches under patches/, implementing runtime bridges under extensions/, manipulating Dalvik/Smali with dexlib2, editing Hermes HBC bundles or ARM64 ELF libraries, or upgrading supported target app versions.
---

# Morphe Patches: Authoring, Runtime Bridges & Target App Maintenance

This skill provides comprehensive instructions for authoring, modifying, and verifying Morphe patches under `patches/` and Java extension runtime bridges under `extensions/`. Morphe applies modular bytecode, resource, and asset transformations to third-party Android APKs and split bundles (`.apkm`, `.xapk`, `.apks`).

---

## 1. Core Principles & Hard Invariants

1. **Fail-Fast at Patch Time; Fail Safe at Runtime**:
   - **Patch time:** every required class, method, XML node, or binary sequence must abort the patch with a descriptive exception. Prefer `PatchException` naming the exact signature, offset, or path. A shared utility may throw its documented validation exception (for example `IllegalArgumentException` from `HermesBundleEditor`); let that abort instead of swallowing it. Never silently ignore a missing target or turn a required check into an optional one to get a passing build.
   - A target may be skipped only when the feature is explicitly documented as version-optional, with a narrow guard at the missing symbol (not a blanket `runCatching` around the whole patch).
   - **Runtime:** extension bridges are called from arbitrary app threads. Do not let an unexpected reflection/API failure escape and crash the host. Catch at the bridge boundary, log with context, and return a safe fallback.
   - Security gates must **fail closed** (deny on error), never permissive. An indispensable runtime dependency must log an error and disable the feature visibly; it must not pretend success. Avoid blanket `catch (Throwable ignored)` except for provably cosmetic, best-effort operations.

2. **Register & Dalvik Instruction Safety**:
   - Register width is **instruction-format-specific**, not opcode-family-wide:
     - Format `22c` (`instance-of`, `iget*`, `iput*`) has two 4-bit register operands: `v0..v15`.
     - Format `21c` (`check-cast`, `new-instance`, `const-string`, `sget*`, `sput*`) has one 8-bit register operand: `v0..v255`.
     - Format `11n` (`const/4`) and `35c` (`invoke-*`) use 4-bit registers; `3rc` uses 16-bit start/range registers.
   - A register that is illegal for a format is normally rejected by the Smali assembler/encoder or by `apk-lab validate-smali` **before** the bundle is built. A runtime `VerifyError` is a later, separate failure mode and is not a reliable way to detect a width mistake.
   - Distinguish parameter registers from local registers: in instance methods `p0` is `this`; in static methods `p0` is the first parameter. `pN` is an alias that may resolve above `v15`, so it cannot be used directly in `22c`/`35c` when the absolute index is too large; move it to a low register or use a `/range` form where applicable.
   - Never clobber existing registers without establishing that the value is dead. Pre-validate unfamiliar Smali with `apk-lab validate-smali` and re-read surrounding control flow before injecting.

3. **ABI Parity Between Smali and Java Extensions**:
   - Java classes in `extensions/extension/` are compiled into `extensions/extension.mpe` and merged into target DEX.
   - Public class names, method names, parameter types, and return types form a rigid binary interface (ABI).
   - Any modification to Java bridge signatures requires a synchronized change to the injected Smali descriptor (e.g. `invoke-static {p0}, Lapp/aidan/extension/sezzle/ConsentGate;->maybeShow(Landroid/app/Activity;)V`).
   - Never import proprietary/obfuscated target classes in Java source; all target app reflection must occur dynamically at runtime.

4. **Idempotency & Bounds Safety**:
   - Binary and asset modifications must check for prior application before mutating bytes. For in-place code patches, require `expected.size == replacement.size`.
   - Use overflow-safe bounds checks and allow a write that ends exactly at the buffer boundary:

     ```kotlin
     val end = offset.toLong() + expected.size
     if (offset < 0 || end > bytes.size.toLong()) {
         throw PatchException("Replacement at 0x${offset.toString(16)} exceeds ${bytes.size} bytes")
     }
     ```

     `bytes.size <= offset + replacement.size` is wrong: it rejects exact-end writes and can overflow.
   - Check the replacement first (already patched), then the expected original bytes; throw on mismatch. `HermesBundleEditor.patchBytesIfMatches` is **not** idempotent, although it is bounds-checked; call `matchesBytes` first. See [Binary Assets](references/binary-assets-hermes.md).
   - In Hermes bytecode (HBC) bundles, never shift section offsets or expand tables. Recycle existing donor strings, zero-pad remaining space, and always recalculate the SHA-1 checksum via `updateFooterHash()`.

5. **Metadata Synchronization**:
   - Patch declarations, names, descriptions, options, categories, and compatibility constants are public API consumed by `patches-list.json`, the Cloudflare Worker, and the Astro site.
   - Any change to patch declarations or options must be accompanied by `./gradlew generatePatchesList`. Never hand-edit `patches-list.json`.

---

## 2. Evidence-Based Modification Protocol

Before changing a patch, binary, or extension, establish all of the following. Label each item **VERIFIED** (observed in the exact artifact) or **ASSUMED**; never commit an ASSUMED offset, descriptor, signature, or compatibility range.

| Item | Minimum evidence |
|---|---|
| Target app and exact version | Artifact path plus `apk-lab inspect` package name/version code, or an explicit `Constants.kt` target. |
| Original symbol or location | `apk-lab inspect-code` / `apk-lab strings` / `apk-lab res`, a Hermes function header, or `llvm-objdump` output naming class/method/resource/offset. |
| Expected original state | Exact instruction sequence, attribute value, or byte sequence observed at that location. |
| Intended transformation | Operation and constraints: register widths, descriptor/ABI, binary ABI, HBC version, or XML namespace. |
| Expected patched state | Exact resulting instructions/bytes, including branch targets and padding. |
| Compatibility constraints | `Compatibility` target, min SDK, ABI splits, option invariants, extension ABI. |
| Verification | Commands run and their actual outcomes (see §7). |

Never infer a class rename, native offset, instruction encoding, or method signature from an older version or from a similar app. Re-resolve it against the exact artifact.

---

## 3. Progressive Disclosure: Reference Directory Map

To conserve context tokens, read only the specific reference file needed for your current task:

| Task / Domain | Key Topics & Modules | Reference Document |
|---|---|---|
| **DSL & Architecture** | `compositeFeaturePatch`, `bytecodePatch`, `resourcePatch`, `rawResourcePatch`, `dependsOn`, `extendWith`, options, categories | [DSL & Architecture](references/dsl-architecture.md)<br>`skill://morphe-patches/references/dsl-architecture.md` |
| **Bytecode & Dexlib2** | Dexlib2 AST navigation, `BytecodeNeutralizers`, Smali instruction injection, instruction formats (`21c`, `22c`, `35c`), `validate-smali` | [Bytecode & Dexlib2](references/bytecode-dexlib2.md)<br>`skill://morphe-patches/references/bytecode-dexlib2.md` |
| **Java Extension Bridges** | `extensions/extension.mpe`, reflection over obfuscated classes, lifecycle guards, main-thread UI dispatch, WebView security | [Java Extension Bridges](references/extension-bridges.md)<br>`skill://morphe-patches/references/extension-bridges.md` |
| **Binary Assets & Hermes** | `HermesBundleEditor` (HBC v96, v98+), ARM64 ELF patching, `apk-lab asm`, XML/Manifest DOM manipulation | [Binary Assets, Hermes & Resources](references/binary-assets-hermes.md)<br>`skill://morphe-patches/references/binary-assets-hermes.md` |
| **App Version Upgrades** | 6-phase upgrade playbook: baseline diff, targeted decompilation, symbol remapping, compatibility bump, matrix checks | [App Upgrade Playbook](references/app-upgrade-playbook.md)<br>`skill://morphe-patches/references/app-upgrade-playbook.md` |

---

## 4. Essential Build & Verification Commands

All commands run from the repository root:

```bash
# 1. Compile Kotlin patches and Java extension classes (fast compiler gate)
./gradlew :patches:compileKotlin :extensions:extension:compileReleaseJavaWithJavac --console=plain

# 2. Run patch helper/bounds regression tests
./gradlew :patches:test

# 3. Build complete Android patch bundle (.mpp) and extension bundle (.mpe)
./gradlew :patches:buildAndroid

# 4. Regenerate public metadata inventory (patches-list.json)
./gradlew generatePatchesList

# 5. Validate an unfamiliar Smali snippet before injecting it
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- validate-smali \
  --snippet $'const/4 v0, 0x1\nreturn v0' \
  --locals 1 --params 0

# 6. Validate patch compatibility across baseline and all boolean option permutations.
# --all selects every compatible patch, including patches declared with default = false,
# plus their transitive dependencies. Use --patch only for explicit selection.
# Deployment defaults differ: deploy --all selects only default = true patches.
cargo run --locked --quiet --manifest-path tools/apk-lab/Cargo.toml --bin apk-lab -- check path/to/app.apkm \
  --mpp patches/build/libs/patches-<version>.mpp \
  --package <package.name> \
  --all

# 7. Full repository audit gate (formatting, linting, typechecking, all tests)
bun run audit
```

`apk-lab check` proves patch-time compatibility and structural output validity only. It does not prove runtime startup, feature behavior, reflection linkage, or native execution; see the [App Upgrade Playbook](references/app-upgrade-playbook.md#the-actual-apk-lab-check-gates).

---

## 5. Standard Operational Workflows

### Workflow A: Adding or Editing a Bytecode Patch

1. Read [Bytecode & Dexlib2](references/bytecode-dexlib2.md).
2. Determine if the patch requires companion XML/raw assets:
   - If yes and 1-to-1: use `compositeFeaturePatch`.
   - If purely Dalvik: use `bytecodePatch`.
3. Check `app.aidan.patches.shared.BytecodeNeutralizers` to see if existing neutralizers (`disableRequiredVoidMethods`, `returnRequiredBoolean`, etc.) suffice before writing custom Smali. Note their idempotency limits in the reference.
4. If writing custom Smali, check instruction formats and register live ranges, then validate the exact snippet with `apk-lab validate-smali --snippet ... --locals ... --params ...` (or `--descriptor`).
5. Run `./gradlew :patches:buildAndroid` then `./gradlew generatePatchesList` (the latter also depends on the bundle build).
6. Run `apk-lab check <artifact> --mpp <bundle> --package <pkg> --all`.

### Workflow B: Modifying Hermes or Native ARM64 Libraries

1. Read [Binary Assets, Hermes & Resources](references/binary-assets-hermes.md).
2. For Hermes (`index.android.bundle`): construct `HermesBundleEditor(bundleFile.readBytes())` (it rejects unsupported magic/version), resolve a **unique** function offset, check `matchesBytes(offset, replacement)` for idempotency, verify the expected prefix, then call `patchBytesIfMatches` and `updateFooterHash()`.
3. For ARM64 (`.so`): disassemble the exact library with the NDK `llvm-objdump`, derive and verify the offset for that version/ABI, validate encodings, check idempotency, then apply an overflow-safe bounded write.
4. Run `./gradlew :patches:buildAndroid` and verify via `apk-lab check`; runtime behavior still requires device smoke.

### Workflow C: Authoring a Java Extension Bridge

1. Read [Java Extension Bridges](references/extension-bridges.md).
2. Create or update `extensions/extension/src/main/java/app/aidan/extension/<app>/<BridgeName>.java`.
3. Keep class `public final` with a `private` constructor and narrow static methods.
4. In the corresponding Kotlin patch, declare `extendWith("extensions/extension.mpe")` and inject the matching `invoke-static` instruction with the exact descriptor.
5. Compile both targets: `./gradlew :patches:compileKotlin :extensions:extension:compileReleaseJavaWithJavac --console=plain`.
6. Run the matching real-artifact `apk-lab check`, then deploy and exercise the changed UI/runtime path.

### Workflow D: Upgrading a Supported Target App Version

1. Read [App Upgrade Playbook](references/app-upgrade-playbook.md).
2. Follow the 6-phase upgrade protocol:
   - Phase 1: Diff & Failure Baseline (`apk-lab compare`, `apk-lab check --force`).
   - Phase 2: Targeted Bytecode Analysis & De-obfuscation (`apk-lab strings`, `apk-lab analyze`, `apk-lab inspect-code`).
   - Phase 3: Patch Remapping (updating class descriptors and instruction anchors after evidence).
   - Phase 4: Compatibility Metadata Bump (`shared/Constants.kt`).
   - Phase 5: Build & Verification (`apk-lab check --all`, then device smoke).
   - Phase 6: Documentation (`docs/<app>/`) and Conventional Commit (`bump(<app>): ...`).

---

## 6. Failure Recovery & Stop Conditions

Use repository tools to investigate before stopping. Stop the affected operation and report the blocker when evidence remains insufficient; never weaken an assertion just to produce a passing build.

| Situation | Required action |
|---|---|
| Required target not found | Re-search with exact signature, string literal, interface/caller references, or resource lookup. If still absent, stop that patch; do not convert required to optional. |
| Multiple ambiguous candidates | Disambiguate with parameter types, return type, callers, or a distinctive surrounding sequence. If ambiguity remains, stop; never patch index 0 or the first match by habit. |
| Expected bytes differ | Re-derive from the exact artifact and version/ABI. Never replace `expected` with whatever bytes are present. Stop if the structure or semantics are unclear. |
| Hermes magic/version/header incompatible | Verify magic, HBC version, and function header; `redirectFunctionHeader` is v98+ only. Stop rather than forcing a layout change. |
| Register safety cannot be proven | Use `apk-lab validate-smali`; if live ranges or the absolute register mapping still cannot be established, redesign or stop. |
| `apk-lab check` inconclusive | Distinguish tool/workspace/artifact failure from patch failure; rerun the narrow failing case. Do not report a pass without a completed successful case. |
| Required validation cannot run | Report the missing tool/artifact and mark the change unverified. Do not bump compatibility or claim runtime success. |

---

## 7. Verification Reporting

Every completed change must report:

- Files changed.
- Technical reason for each change, tied to the observed target state.
- Commands executed and actual outcomes (compile, `generatePatchesList`, `apk-lab check`, device smoke).
- Validations not performed and why.
- Remaining uncertainties or risks (for example, an unverified native ABI split or an untested optional UI path).

Never claim a test, build, or runtime check passed unless it was executed successfully in this session. "Compilation succeeded" is not "the patch works"; `apk-lab check` success is not "the app runs".

---

## 8. Skill Regression Scenarios

These deterministic scenarios are exercised by the skill contract suite, `scripts/docs/skills.test.ts`, for the invariants it can assert from the documentation (command flags, instruction formats, bounds conditions, and Hermes constants). Run it with `bun test scripts/docs` (also part of `bun run audit`). Use the remaining scenarios as a manual self-check when editing this skill or its examples:

| Scenario | Expected behavior |
|---|---|
| Missing or ambiguous obfuscated method | Fail with `PatchException`; no edit or fallback. |
| `check-cast v16` vs `instance-of v16, ...` | `21c` passes; `22c` fails `validate-smali`. |
| Native write ending exactly at EOF | Accepted; one byte beyond or negative offset rejected. |
| Expected byte mismatch | `PatchException`; output bytes unchanged. |
| Patch applied twice | Documented guard yields a no-op; no duplicate instruction/interface. |
| Java bridge descriptor mismatch | Not caught by compilation; device smoke surfaces `NoSuchMethodError`/`NoClassDefFoundError`; descriptor must match exactly. |
| Unsupported Hermes version | Constructor rejects before mutation. |
| App upgrade without real-artifact check | Not marked supported; no compatibility bump. |
