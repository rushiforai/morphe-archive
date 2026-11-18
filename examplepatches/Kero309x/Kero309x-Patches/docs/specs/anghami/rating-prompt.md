# Disable in-app rating prompt

- **Id:** `anghami.system.rating-prompt`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Interface

## Observable behaviour

After a number of sessions or plays, the application asks the user to rate it.
After patching, the prompt never appears.

## Preconditions

A usage pattern that would normally trigger the prompt.

## Acceptance criteria

- [ ] The prompt does not appear after heavy usage.
- [ ] The review flow is not triggered indirectly by another surface.
- [ ] Nothing else about the session changes.

## Out of scope

Store-level rating reminders, which are outside the application.

## Open questions

- None.

## Verification

1. Use the patched build for several sessions with repeated playback.
2. Confirm the prompt never appears.
3. Confirm no dialog state is left pending.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-04 from the stock build. Derivation record:
  `docs/provenance/LOG.md` → `anghami.system.rating-prompt`.
