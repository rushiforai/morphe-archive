# Project rules: X Feed Cleanup Patches

These instructions apply whenever implementing, editing, building, or publishing Morphe patches from this repository.

1. **Read `docs/MORPHE_PATCH_RELEASE_RUNBOOK.md` before patch/release work.** When available, consult the learning hub Active Skill `verify-morphe-patch-release` (v1+). Do not skip its verification gate.
2. **Before publishing:** run `python scripts/test-morphe-metadata.py`; validate `created_at` as offset-free Morphe `LocalDateTime`; check version/package/expected patch count and matching existing `.mpp` release asset. Run available compilation/regression/APK tests, and verify CI output. Inspect the actual artifact.
3. **After publishing:** retrieve the public `main/patches-bundle.json` again; verify downloadable `.mpp` and correct version/patch count. Obtain Morphe device source-import confirmation; separately verify patched X UI behavior. Do not claim either stage complete without its evidence.
4. **GitHub 403:** ChatGPT GitHub connector write permissions and normal Windows GitHub CLI authentication are separate. DevSpace portable sandbox deliberately changes `HOME`, `USERPROFILE` and `APPDATA`, so `gh auth status` there can fail while normal user PowerShell `gh.exe` remains authenticated. Do not transfer/print secrets or weaken isolation. **Verified on 2026-10-12: DevSpace's ordinary `git` commands can `git push` using the existing Windows Git Credential Manager (`credential.helper=manager`) even when sandboxed `gh auth status` reports unauthenticated.** Prefer `git push --dry-run`, then `git push` to a CI-checked branch/main/tag, letting a GitHub Action publish the Release. No token or credential directory should be copied. For GitHub API-only write recovery, supply minimal normal-session PowerShell `gh api` commands with read-back.
5. **Keep scope tight:** do not reset unrelated working-tree changes, alter global authentication settings, or accidentally change other Morphe sources.

Incident evidence: X v1.12.0-legacy.2 CI run 38197098250; GitHub source manifest repair commit 73391da; user confirmed source update on 2026-10-12. This does not constitute final UI behavior verification.
