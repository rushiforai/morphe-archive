# Shared Morphe skills

The five `morphe-*` folders contain standard Agent Skills (`SKILL.md`) for Codex,
OpenCode, Kilo, and other compatible coding agents. They use the same local Morphe
workspace and require real filesystem/tool access; copying instructions alone does
not give a remote model access to the apps or repository.

| Skill | Use |
| --- | --- |
| morphe-inspection-evidence | Locate retained evidence and restore archived dumps. |
| morphe-inspect-app | Select original app inputs and prove native hook contracts. |
| morphe-create-patch | Implement bytecode/resource patches. |
| morphe-runtime-extension | Implement injected runtime modules and native UI hooks. |
| morphe-verify-patch | Build and verify patches against real app inputs. |

OpenCode v2's user configuration has `"skills": ["E:/Morphe/Skills"]`.
Kilo's user configuration has `"skills": {"paths": ["E:/Morphe/Skills"]}`.
These user-level registrations allow both CLIs to load the shared skills from
inside repositories. Original configuration backups are beside each config in
`%USERPROFILE%\.config\opencode` and `%USERPROFILE%\.config\kilo`.

No per-project skill links are needed. Both CLIs read `E:\Morphe\Skills` directly
through their user configuration. Restart OpenCode or reload/start Kilo after
changes. No model API request or patch build is necessary for skill discovery.
Discovery was checked with the installed CLIs using private temporary state;
all five shared skills were listed by both CLIs.

The skill definitions are version-controlled in `santodan-patches/Skills/`
(the five `morphe-*` folders and this `documentation/`). Each matching folder in
`E:\Morphe\Skills` is a directory junction to that repo copy, so the user-level
`E:/Morphe/Skills` registrations above keep working. Edit the repo copy and commit
it with the related change. `E:\Morphe\Skills\inspection-evidence` and
`E:\Morphe\Skills\maintenance` stay outside the repository: they hold original
apps, DEX files and local manifests and must never be committed. Claude Code also
lists these skills. The former `santodan-patches/lmstudio/skills` copies no longer exist.
`morphe-inspect-app/scripts/DexQuery.java` is the shared read-only DEX query tool.

`inspection-evidence` holds app artifacts, not skills. Scripts and documentation
use this location directly. `maintenance` contains the before inventory,
move map, deletion manifest, archived-dump checksums, and retained rebuild reports.
Only disposable build/decompiler output and obsolete temporary APK snapshots were
deleted. Large comparison dumps were compressed and verified before removal of
their uncompressed copies. OriginalApps and deliverables in Apps were preserved.

To share with another machine, copy the five skill folders and adjust the workspace
paths in their instructions. Transfer only needed inspection evidence and original
inputs separately. Configure the other CLI's supported skill-source setting to
point directly at the copied Skills folder. For this setup see:

- https://dev.opencode.ai/v2/docs/skills/
- https://kilo.ai/docs/customize/skills

`E:\Morphe\AGENTS.md` directs future agents to the shared Skills and inspection
locations. Root `.inspect-*` links and per-project CLI skill links were removed.

Upstream reference repositories are in `E:\Morphe\References` (`morphe-patches`,
`morphe-template`, `rushiranpise`). Historical workspace backups are under
`E:\Morphe\backups\workspaces`. The Reddit startup investigation is under
`Skills\inspection-evidence\reddit-startup`; its helpers locate the workspace by
the main repository marker. Original log paths inside archived reports are historical.

The shared Skills directory is outside the `santodan-patches` repository. Both the
workspace `.gitignore` and the repository `.gitignore` also exclude `Skills/`.
