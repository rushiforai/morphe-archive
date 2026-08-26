# Repository rules

- Treat `NuvioTV-upstream` as read-only reference. Do not copy Nuvio APKs or proprietary release contents into Git.
- Never commit, release, cache in Actions artifacts, or attach original/patched/modified NuvioTV APKs.
- One user-visible patch equals one compartment under patcher, extension, `testing/patches/<id>`, and gitignored `local/patches/<id>`.
- Patch-specific settings keys, state, labels, actions, UI content, tests, and manifest registration must live inside that patch's compartment. Shared settings code may expose only generic registration and rendering APIs and must not name optional patches.
- Run `scripts/new-patch.ps1`; do not hand-create an incomplete compartment.
- Keep compatibility exact. A later Nuvio version is unsupported until fingerprints match once and all application/runtime gates pass.
- Fingerprint behavior and structure, not an R8/obfuscated class or method name. A failed fingerprint must stop the patch; never widen it to “make it work.”
- Configurable patches depend on the shared settings hub and register categories through manifest metadata. They must not independently edit Nuvio's main Settings screen.
- Patch preferences live in private `morphe_patches` SharedPreferences and must not enter Nuvio sync, analytics, DTOs, or backend reports.
- Add unit, isolated application, post-patch inspection, TV AVD, and real-TV acceptance coverage for every behavior change.
- Before publishing any `.mpp`, build the Android bundle path and fail the release unless the archive contains at least one non-empty `classes*.dex` entry. A JVM-only bundle can work in Morphe Desktop while Morphe Manager reports zero patches.
- Validate the exact `.mpp` downloaded from the public release URL in Morphe Manager on Android and confirm the expected patch count. Desktop CLI listing or patch application alone is not sufficient release validation.
- For emulator playback validation, explicitly select an H.264/AVC source; do not use an HEVC source to judge playback because the TV AVD may not decode it.
- Use conventional commits. Work on `dev`; merge to protected `main` without squashing.
- A stable release requires a committed real-TV validation report. Never mark unchecked manual tests as passed.
- Perform every GitHub mutation as the `liongalahad` account; never use `gm-hera`. Before committing or pushing, verify the repository-local Git identity is `liongalahad <145302945+liongalahad@users.noreply.github.com>` and the authenticated GitHub account is `liongalahad`.
