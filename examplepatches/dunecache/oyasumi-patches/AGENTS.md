# AGENTS.md — Morphe patch template

Instructions for AI coding agents working in this repository. Read fully before acting.

## Goal

Maintain a reusable Morphe patch project. The repository starts with no app targets or patch implementations; add them only when explicitly requested. Add one small, tested, and reversible patch at a time.

## Ground rules

1. Never invent obfuscated names, class paths, method signatures, or opcodes. Every fingerprint must come from real decompiled or smali output for the exact target version in `reference/`.
2. Never assume Morphe or ReVanced APIs from memory. Check the current template code and the current Morphe documentation or source for the DSL in use.
3. Keep one patch per change. Do not refactor unrelated patches while adding a feature.
4. Prefer the smallest safe edit, such as a return-early path, a constant replacement, or skipping a check.
5. Make fingerprints as specific as necessary. Use stable strings, access flags, return and parameter types, and distinctive instructions rather than obfuscated names when possible.
6. State uncertainty instead of guessing. A confident but incorrect fingerprint causes a full build and device-test cycle.
7. Never add an app target, version, or patch unless the task explicitly requests it.

## Target declarations

Every patch must declare compatibility with the exact package and versions that have been verified. Record the package name, app version, file type, and relevant version codes in `reference/NOTES.md` before writing the declaration. Do not claim support for untested versions.

## Environment constraints

Development happens in Termux on Android. Avoid heavy builds. Do not run a full Gradle build unless asked; prefer static reasoning and a targeted check such as `./gradlew :patches:compileKotlin`. Use CI or a device for full bundle application tests. Do not download large toolchains or APKs without approval, and keep file reads targeted.

## Repository layout

```text
patches/       Kotlin patch definitions and fingerprints
extensions/    Optional Java/Kotlin code injected into patched apps
reference/     Small, non-sensitive reverse-engineering notes
AGENTS.md      These maintenance instructions
```

Keep the structure of the template. Do not commit APKs, extracted binaries, signing material, secrets, or other large artifacts.

## Workflow for adding a patch

1. Define the behavior in one sentence.
2. Select a clean target build and pin the exact supported package and version.
3. Locate the code using user-visible strings, resource IDs, class usage, and instruction patterns. Record the class, method, and reason in `reference/NOTES.md`.
4. Write the narrowest fingerprint that uniquely identifies the target.
5. Implement the smallest instruction or resource change. Use an extension only when inline logic is not maintainable.
6. Add a clear user-facing name, description, category, and intentional default state.
7. Compile the patch project, apply it to the pinned build, and test the changed flow.
8. Keep one patch per commit when commits are requested.

## Code style

- Use Kotlin and follow the formatting of the surrounding template.
- Keep patch and fingerprint files small and feature-focused.
- Explain why a fingerprint is stable, not merely what the code says.
- Do not leave dead code or commented-out experiments.

## Debugging patch failures

- Fingerprint not found: re-check the reference smali or resource output, then adjust the filters. Never substitute a guessed name.
- Patch applies but the app crashes: inspect register allocation, type widths, instruction insertion order, and the path leading to the edited return.
- Resource replacement fails: verify the exact path, encoding, and occurrence count.
- Report the exact error and the relevant reference output when asking for help.

## Completion checklist

Before considering work complete:

- Confirm no unsupported app target was added.
- Confirm the patch is narrowly scoped and documented.
- Run the available compile or validation command.
- Inspect the final diff and report what was and was not verified.
