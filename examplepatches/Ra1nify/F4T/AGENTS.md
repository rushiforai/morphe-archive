# AGENTS

This repository is a [Morphe](https://morphe.software) patch bundle. Read these first, in order:

1. `docs/README.md` — documentation index
2. `docs/development/development.md` — build, toolchain, release
3. `docs/development/morphe-patch-authoring.md` — patch authoring rules
4. `docs/keyboard/realos-backport-handoff.md` — current task handoff (realOS → Morphe keyboard backport)

## Hard rules

- Code comments and log messages: **en-US only, concise**. Chinese is fine in docs and user-facing strings.
- Every patch must be **fail-closed**: if an anchor/class/method is missing or its count differs, throw a
  `PatchException` instead of shipping a half-applied patch.
- One feature per patch, explicit `dependsOn`; optional features default to `false`.
- Only host versions declared in `patches/src/main/kotlin/app/ra1nify/f4t/shared/Compatibilities.kt`
  are supported. New host versions are separate tasks.
- Extension code (`extensions/extension`) is **Java-only**: R8 minifies it and the Kotlin standard library
  is excluded on purpose.
- Do not push, publish, or control the test device unless the user explicitly asks for that action in the
  current request.

## Quick build

```powershell
$env:JAVA_HOME='D:\DevHub\.gradle\jdks\oracle_corporation-21-amd64-windows.2'
$env:GITHUB_ACTOR='<user>'; $env:GITHUB_TOKEN='<PAT with read:packages>'
cd F:\CODEX\F4T
.\gradlew.bat buildAndroid --console=plain --offline
# -> patches/build/libs/patches-<version>.mpp
```
