# Behaviour spec template

Copy this file to `docs/specs/<app>/<behaviour>.md` and fill it in before writing
any code. Keep it free of class names, method names and instructions: those are
discovered later and recorded in the provenance log.

```markdown
# <Behaviour name>

- **Id:** `<app>.<area>.<behaviour>`
- **Status:** draft | derived | implemented | verified
- **Default enabled:** yes | no
- **Risk:** low | medium | high
- **Category:** <category label>

## Observable behaviour

What the user sees before and after. One paragraph, no implementation detail.

## Preconditions

What must be true for the behaviour to matter (signed in, a specific screen,
a specific network response, and so on).

## Acceptance criteria

- [ ] Concrete, checkable statement.
- [ ] Concrete, checkable statement.

## Out of scope

What this behaviour deliberately does not change, especially anything on the
server side.

## Open questions

Anything that must be answered before implementation. An empty list means the
spec is ready.

## Verification

How the result is confirmed on a real device with a patched build, step by step.

## Provenance

- Spec author and date:
- Derived code points: see `docs/provenance/LOG.md`
```
