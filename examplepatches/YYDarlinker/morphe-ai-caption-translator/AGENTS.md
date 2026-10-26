# Project workspace rules

- The active repository for this project is `E:\Projects\DeepSeek morphe-ai-caption-translator`.
- Run project development, builds, reports and project-specific temporary work on E:. Use `build/` for build outputs, `validation/runs/` (or `.verification/`) for evidence, and `.tmp/` for scratch work. Do not recreate project workspaces or delivery copies under `C:\Users\14776\Documents\Codex`.
- If E: is unavailable, stop project writes and report the missing drive; do not silently fall back to C:.
- Shared installed tools, application/session storage and operating-system-managed files may remain on C:. Do not move or delete them as project cleanup.
- Current state is `docs/PROJECT-STATE.md`; its local mirror is `.verification/state-mirror/PROJECT-STATE.md`. Update both byte-identically when updating project state.
- The source-distributed development entry is `tools/workspace/`: prefer `.\tools\workspace\dev.cmd` for daily tests/builds and `verify-full.cmd` for full candidate checks. JDK 21, Python 3.12, Android SDK 35/36/build-tools36 and Robolectric default to `work/toolchain/`; explicit process inputs, Maven/Gradle cache provenance and setup are in `docs/DEVELOPMENT.md`. The ignored `.devenv/` files are compatibility aliases, not handoff prerequisites.
- Environment initialization is process-only: project temp/test temp/Python bytecode and default Gradle/Android homes stay on E:. Explicit shared tool/artifact inputs may remain on C:; writable Gradle/Android homes must be on E:. Never change global environment variables, import account credentials or silently fall back to another workspace. For ad-hoc Gradle use `tools/workspace/Enter-Dev.ps1` plus `--init-script tools/workspace/workspace.init.gradle`; preserve shared tool caches.
- Historical material under `docs/N*`, `docs/WORKSPACE-MIGRATION-20261005.md`, `.verification/` and `recovered/` preserves original paths and hashes as evidence. It is not a description of the active repository; do not rewrite or run archived scripts blindly.
- Preserve release artifacts and historical delivery bytes. Workspace maintenance does not authorize a publication or release; product changes require an explicit request and the current verification path.

# Maintenance task handoffs

- For an assigned maintenance task, read `docs/MAINTENANCE-ROADMAP.md`, `docs/maintenance/README.md` and the named task card under `docs/maintenance/tasks/`. Read current identity and the latest maintenance entries in `docs/PROJECT-STATE.md`; consult older history only when relevant.
- Work within the assigned card. Preserve pre-existing tracked and untracked changes, and compare against the task-entry state rather than treating the full diff from HEAD as your own work.
- Save the result to `docs/maintenance/results/<task-id>-RESULT.md` with actual commands, evidence paths, candidate identity, uncovered checks and rollback instructions. Keep run evidence on E: under `validation/runs/`.
- An execution chat may update its execution status and submit results for review. Acceptance and the next task are decided in the coordinating chat; do not advance to another maintenance stage automatically. New explicit user instructions take precedence and any scope change should be recorded.
