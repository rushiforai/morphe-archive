# Allow screenshots

- **Id:** `vodafone.system.screenshots`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** low
- **Category:** Interface

## Observable behaviour

The stock build hides every screen it opens from screenshots and from screen
recordings: the system takes a black picture instead of the screen. After
patching, a screenshot or a recording shows the screen as it is.

## Preconditions

None. The protection belongs to a library the application embeds, and it is
applied to the screens of the application without asking the server.

## Acceptance criteria

- [ ] A screenshot of any screen shows the screen.
- [ ] A screen recording shows the screen.
- [ ] The screens themselves do not change: the same content is shown and the
      same gestures work.
- [ ] Turning the patch off restores the protection.

## Out of scope

The other checks of the security library the application embeds. They are
bundled but never started in this build, so there is nothing to change.

## Limitations

- The protection is applied by a library the application embeds, not by the
  application itself. The library stays in the build and keeps watching the
  screens; only the flag it sets on their windows is gone.
- **In this build the library never turns the protection on**, so the patch
  changes nothing today. It is a guarantee, not a repair: the library is
  registered as a startup component and registers its callbacks on every
  launch, so a later build that starts it would hide the screens again without
  this patch.
- Nothing else about the library changes: the checks it is able to run, such as
  the device checks, are left exactly as they are.

## Open questions

- Are the device checks of the library ever run? Answered for this build: the
  library is initialised with two callbacks that watch the screens, and nothing
  calls its entry point that starts the checks, builds its own pinner or turns
  the screen protection on. The device checks are not performed, and the screen
  protection is not applied. The window of the running application was checked
  on a device and carries no secure flag.

## Verification

1. Install the patched build and open a screen.
2. Take a screenshot and confirm the screen is in it.
3. Start a screen recording and confirm the screen is in it.
4. Disable the patch, rebuild and install, and confirm the screens are hidden
   again.

## Provenance

- Spec author and date: Kero309x, 2026-11-11
- Derived: 2026-11-11 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.system.screenshots`.
