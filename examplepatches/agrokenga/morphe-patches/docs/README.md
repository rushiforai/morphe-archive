# Project Notes

This directory records the state of the project, the Morphe Patcher API findings, the KoPP2
reverse-engineering work, and the CI/release setup. It is meant to keep the research and the
implementation decisions in one place.

> These notes document failed and partial attempts as well as working code. They are not a
> turnkey IAP bypass and should not be treated as one.

## Documents

| Document | Contents |
|---|---|
| [project-status.md](project-status.md) | Current branch, commits, working-tree state, build status, and immediate next steps. |
| [code-review.md](code-review.md) | Review findings, fixes already applied, and remaining problems. |
| [morphe-patcher.md](morphe-patcher.md) | How Morphe Patcher handles bytecode, resources, native libraries, and APKM bundles. |
| [kopp2-analysis.md](kopp2-analysis.md) | KoPP2 2.21.4 package layout, Unity IL2CPP structure, purchase classes, and method offsets. |
| [catalog-inventory.md](catalog-inventory.md) | Shipped IAP catalog, runtime PlayFab bundle IDs, DLC, and in-game (non-IAP) purchases. |
| [receipt-gated-restore.md](receipt-gated-restore.md) | Design for a per-user receipt/entitlement record that re-enables only purchased content. |
| [probe-results.md](probe-results.md) | Results of the native probe for both ABIs, including hashes and write-back verification. |
| [native-static-patching.md](native-static-patching.md) | Generic static method-patching notes for ELF/ARM64/ARMv7. |
| [iap-attempts.md](iap-attempts.md) | History of the IAP patch attempts and why the current files fail. |
| [ci-release.md](ci-release.md) | Semaphore pipeline, GitHub Packages authentication, Android SDK install, caching, and release flow. |

## Current snapshot

- Branch: `dev`
- `dev` and local `main`: `d39d9aa`
- `origin/dev`: `d39d9aa`
- `origin/main`: `113429b` (release `v1.0.0`)
- The working tree currently has uncommitted changes in the two IAP patch files and
  `.semaphore/semaphore.yml`, plus an untracked `STATIC_PATCH_PLAN.md`.
- `./gradlew :patches:compileKotlin` currently fails because the working-tree versions of
  `IAPBypassPatch.kt` and `IAPNativeProbePatch.kt` are incomplete/invalid. The last
  known-good versions are in commit `d39d9aa`.
- The generated `patches-list.json` is stale relative to the current working tree.

## Useful commands

```bash
./gradlew :patches:compileKotlin --offline --no-daemon
./gradlew clean :patches:buildAndroid :patches:generatePatchesList --offline --no-daemon
./gradlew :patches:build --offline --no-daemon
```

The built bundle is `patches/build/libs/patches-*.mpp`.

## Research environment

- Java 21, Gradle wrapper 9.8.2.
- APKM: `projects/com.paradoxplaza.kopp2_2.21.4-243_2arch_..._apkmirror.com.apkm`
- Extracted probe workspace: `/tmp/opencode/kopp2-probe/`
- ARMv7 Il2CppDumper output: `/tmp/opencode/kopp2-probe/dump-armv7/`
- Existing ARM64 dump: `projects/com.paradoxplaza.kopp2/il2cppdump/dump.cs`
- Ghidra notes: `projects/com.paradoxplaza.kopp2/ghidra/analysis.md`
- Ghidra decompilation excerpts: `projects/com.paradoxplaza.kopp2/ghidra/commerce_decompilation.txt`
