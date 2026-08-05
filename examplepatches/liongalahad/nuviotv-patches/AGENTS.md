# Repository rules

- Treat `NuvioTV-upstream` as read-only reference. Do not copy Nuvio APKs or proprietary release contents into Git.
- Never commit, release, cache in Actions artifacts, or attach original/patched/modified NuvioTV APKs.
- One user-visible patch equals one compartment under patcher, extension, `testing/patches/<id>`, and gitignored `local/patches/<id>`.
- Run `scripts/new-patch.ps1`; do not hand-create an incomplete compartment.
- Keep compatibility exact. A later Nuvio version is unsupported until fingerprints match once and all application/runtime gates pass.
- Fingerprint behavior and structure, not an R8/obfuscated class or method name. A failed fingerprint must stop the patch; never widen it to “make it work.”
- Configurable patches depend on the shared settings hub and register categories through manifest metadata. They must not independently edit Nuvio's main Settings screen.
- Patch preferences live in private `morphe_patches` SharedPreferences and must not enter Nuvio sync, analytics, DTOs, or backend reports.
- Add unit, isolated application, post-patch inspection, TV AVD, and real-TV acceptance coverage for every behavior change.
- Use conventional commits. Work on `dev`; merge to protected `main` without squashing.
- A stable release requires a committed real-TV validation report. Never mark unchecked manual tests as passed.
