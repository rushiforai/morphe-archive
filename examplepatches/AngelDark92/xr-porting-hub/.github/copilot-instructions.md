# XR Porting Hub - Copilot context

Read repository-root `AGENTS.md` first. It owns the app registry, compatibility,
isolation, evidence, release and cleanup rules.

This repository patches Android apps for the Samsung Galaxy XR with Morphe. Every
app keeps its own package, exact bases, sources, resources and extension payload.

- Patch procedure: `.opencode/skills/morphe-patches/SKILL.md`.
- Delegation: `.opencode/skills/cavecrew/SKILL.md`.
- Build layout and cleanup: `WORKSPACE_CLEANUP.md`.
- Evidence: `diagnostics/`.

```powershell
.\gradlew.bat build
.\gradlew.bat :patches:test
.\Verify-Build.ps1 -Tasks ':patches:test',':patches:buildAndroid'
```

`:patches:test` does not run in CI. Run it locally and report executed/skipped
counts. Do not add a supported-build table here.
