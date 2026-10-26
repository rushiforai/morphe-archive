# Project skill guidance

Repository-root `AGENTS.md` is authoritative. The parent workspace `AGENTS.md` also
applies. This repository patches several apps for the Galaxy XR headset; every app
keeps its own package, exact bases, sources and extension payload.

- Patch procedure: `.opencode/skills/morphe-patches/SKILL.md`.
- Delegation: `.opencode/skills/cavecrew/SKILL.md`.
- Build layout and retained inputs: `diagnostics/build-layout/README.md`.
- Cleanup policy: `WORKSPACE_CLEANUP.md`.

Do not add a supported-build table to this file. Read `AGENTS.md` for the output
and cleanup contract.
