# Allow screenshots

- **Id:** `anghami.system.screenshots`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Interface

## Observable behaviour

Three screens ask for a secure window in the stock build: the video player, the
fullscreen live radio screen, and the main screen. While such a window is marked
secure, screenshots and screen recording produce a black frame.

After patching, all three screens can be captured, and the application does not
crash when it is.

## Preconditions

A screen that is marked secure in the stock build. The base activity applies the
flag only while a playback service is connected and reports the state the base
treats as requiring protection; that condition is left as it is.

## Acceptance criteria

- [ ] A screenshot of the video player contains the video frame and the controls.
- [ ] A screenshot of the fullscreen live radio screen contains the content.
- [ ] A screenshot of the main screen while the player is open contains the
      content.
- [ ] Screen recording captures the same.
- [ ] The application does not crash when it is captured.
- [ ] Every other screen behaves exactly as before.

## Out of scope

Any other protection mechanism, and any change to what the application displays.

## What is deliberately not changed

The patch answers the question, not the consequence. The method that adds and
clears the window flag still runs and still acts on the answer, so a window that
was already marked secure in the same process is cleared rather than left in a
stale state. The condition that decides whether the flag matters is untouched.

## Open questions

- None for this build. The question is declared on the shared activity base and
  overridden in exactly three places, so the four declarations are the whole
  behaviour.

## Verification

1. Open the video player, the fullscreen live radio screen and the main screen
   with the player open.
2. Take a screenshot of each and record a few seconds of each.
3. Confirm the content appears instead of a black frame.
4. Confirm app switching, rotation and playback still work.
5. Open a screen that was never secure and confirm nothing changed.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-06 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.system.screenshots`.
