# 0004 — All behaviours enabled by default

- **Status:** accepted
- **Date:** 2026-11-04

## Context

Three behaviours are invasive: they change server-facing identity or entitlement
state, or they remove diagnostics. The initial scaffolding proposed disabling
them by default.

The project owner decided that the bundle must preserve the behaviour set of the
collection it replaces, where every behaviour is on by default.

## Decision

All behaviours ship with `default = true`, including:

- `anghami.entitlement.plus`
- `anghami.integrity.signature-assertion`
- `anghami.privacy.analytics`

Each of these keeps a high risk rating in its spec, and the README warns about
them.

## Consequences

- A user who applies the bundle gets the full behaviour set without selecting
  anything, which matches user expectation from the previous collection.
- The bundle must be especially careful with match assertions for these three:
  a wrong match is more damaging when the behaviour is on by default.
- Users can still turn any behaviour off in the manager.
- Changing this later is a product decision, not a technical one, and needs a new
  record.
