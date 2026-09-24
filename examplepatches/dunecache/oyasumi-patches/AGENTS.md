# AGENTS.md — Morphe patches for com.one.goodnight

Instructions for AI coding agents working in this repo. Read fully before acting.

## Goal

Build Morphe patches for **com.one.goodnight**, pinned to **version 1.345.0 only**. Patches are added one at a time, each small, tested, and reversible.

## Ground rules

1. **Never invent obfuscated names, class paths, method signatures, or opcodes.** Every fingerprint must come from real decompiled/smali output of the 1.345.0 APK in `reference/`. If it isn't in the reference, say so and ask.
2. **Never assume Morphe/ReVanced APIs from memory.** Check the template's existing patches and the Morphe docs/source for the current DSL (patch builders, fingerprints, `compatibleWith`, extensions). Copy patterns from what already compiles in this repo.
3. **One patch per change.** Don't refactor unrelated code or touch other patches while adding one.
4. **Prefer the smallest possible edit** (return-early, flip a boolean, skip a check) over rewriting methods.
5. **Fingerprints must be as specific as needed and no more**: use strings, access flags, return type, parameters, and opcodes. Don't depend on obfuscated class/method names.
6. **Say what you're unsure about.** A wrong confident guess costs a full build/test cycle.

## Target

| Field | Value |
|---|---|
| Package | `com.one.goodnight` |
| Version | `1.345.0` (only) |
| Compatibility declaration | Every patch declares compatibility with exactly this package + version |

Do not add support for other versions until explicitly asked.

## Environment constraints (important)

- Development happens in **Termux on Android**. Avoid heavy builds.
- Do **not** run full Gradle builds unless asked. Prefer:
  - static reasoning against smali/decompiled sources,
  - `./gradlew :patches:compileKotlin` style checks only when needed,
  - CI (e.g. GitHub Actions) for full builds and patch application tests.
- Don't download large toolchains or APKs without asking.
- Keep file reads targeted (grep smali, don't dump whole dirs).

## Repo layout

Initialized from the official Morphe patches template. Keep its structure:

```
patches/          # Patch definitions (Kotlin)
extensions/       # Java/Kotlin extension code injected into the app (if used)
reference/        # NOT committed if large: decompiled/smali output of 1.345.0, notes
AGENTS.md
```

Adjust to match what the template actually contains; don't restructure it.

## Workflow for adding a patch

1. **Define the behavior** in one sentence (what changes for the user).
2. **Locate the code** in the 1.345.0 reference: grep for user-visible strings, resource IDs, class/field usage. Record findings in `reference/NOTES.md` (class, method, why it matters).
3. **Write the fingerprint** from a stable anchor (string constants, unique opcode pattern, return/param types).
4. **Write the patch** with the minimal instruction change. Use extensions only when logic is too big for smali/patch DSL.
5. **Name and describe** it clearly (user-facing name, one-line description, default enabled or not).
6. **Verify**: compile check, then apply against the 1.345.0 APK (locally if cheap, otherwise CI).
7. **Commit** one patch per commit with a clear message.

## Code style

- Kotlin, following the template's conventions and formatting.
- Small files; one patch (plus its fingerprints) per file or per feature package.
- Comment *why* a fingerprint anchors where it does, not what the code says.
- No dead code, no commented-out experiments.

## Debugging patch failures

- Fingerprint not found → re-check against reference smali; loosen or tighten by opcodes/strings, don't guess names.
- Patch applies but app crashes → check register usage (`.locals`), type mismatches, and that inserted instructions are placed before the return/branch you targeted.
- Report the exact error and the smali around the injection point when asking for help.

## What not to do

- Don't touch signing keys, CI secrets, or release config.
- Don't bump dependencies or the template version unprompted.
- Don't add telemetry-removal, ad-blocking, or other features beyond what's asked in the current task.
- Don't claim something works without saying how it was verified.

## When you finish a task

Summarize: what changed, which files, how it was verified (or not), and any assumptions to double-check on device.

