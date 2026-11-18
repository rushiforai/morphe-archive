# 0007 — Root Gradle project named Kero309xPatches

- **Status:** accepted
- **Date:** 2026-11-09

## Context

Decision 0006 aligned the repository with `Kero309x/Kero309x-Patches`, and the
display name is "Kero309x Patches". The root Gradle project still used the older
name `KeroPatches` in `settings.gradle.kts`, so the project name did not match the
repository or the display name.

## Decision

The root Gradle project is `Kero309xPatches`. The `patches` module, the Maven
group `app.keropatches`, the package root and the bundle artefact names are
unchanged.

## Consequences

- A local checkout may keep any directory name; the Gradle project name is
  independent of the checkout path.
- The repository name (`Kero309x-Patches`) and the display name ("Kero309x
  Patches") stay as recorded in 0006 and 0002.
