# 0003 — Dependency boundary

- **Status:** accepted
- **Date:** 2026-11-04

## Context

The patch ecosystem offers shared helper libraries that make a bundle shorter to
write. Using one would also make this bundle a derivative of another project.

## Decision

Allowed dependencies:

- The framework's Gradle plugin (build only).
- The framework's patcher API (compile only, supplied by the plugin).
- The Gradle wrapper and the Kotlin standard library that the plugin applies.

Not allowed, at any scope:

- Any patch collection, helper library or template published by another patch
  project.
- Copy-pasted helper files even when the licence would permit it.

Any new dependency requires a written justification, a licence check, and an
explicit approval before it is added.

## Consequences

- Some helpers must be written and tested here. That cost is accepted.
- Build errors caused by framework API changes are ours to fix, not inherited.
- The dependency list stays small and auditable.
