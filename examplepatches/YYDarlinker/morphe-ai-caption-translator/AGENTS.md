# Project workspace rules

- The active repository for this project is `E:\Projects\morphe-caption-v2`.
- Run all subsequent project development, builds, reports, deliverables and project-specific temporary work on E:. Use `build/` for outputs, `.verification/` for evidence and `.tmp/` for scratch work.
- Do not recreate project workspaces or delivery copies under `C:\Users\14776\Documents\Codex`. If E: is unavailable, stop project writes and report the missing drive; do not silently fall back to C:.
- Shared installed tools, Codex application/session storage and operating-system-managed files may remain on C:. Do not move or delete them as project cleanup.
- Current state is `docs/PROJECT-STATE.md`; its local mirror is `E:\Projects\morphe-caption-v2\.verification\state-mirror\PROJECT-STATE.md`. Update both byte-identically when updating project state. The prior C: mirror has been migrated and is historical.
- Historical C: project directories were migrated, preserving original files, into `.verification/c-drive-migration-20261005/archive/`. See `docs/WORKSPACE-MIGRATION-20261005.md` for the path map. Historical scripts/manifests retain original paths as evidence; do not run them blindly or rewrite archived evidence.
- Preserve existing product anchors and historical delivery bytes. Workspace maintenance does not authorize new product development or publication.
- Before project test/build commands, set process-local TEMP and TMP to `E:\Projects\morphe-caption-v2\.tmp\project-temp`; preserve global Windows environment settings and shared tool caches.
