# Ignore the forced update requirement

- **Id:** `anghami.system.forced-update`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Store and upsells

## Observable behaviour

When the server decides that the installed build is too old and that updating is
mandatory, the application shows a blocking dialog whose only action opens the
store. After patching, the dialog does not appear and the application continues
into its normal screens.

## Preconditions

The server configuration names a newer release version and marks the update as
forced. Without that server answer the client behaves exactly as before.

## Acceptance criteria

- [ ] A build the server marks as outdated reaches the main screen instead of the
      blocking dialog.
- [ ] No other screen changes: the update entry points the application offers
      voluntarily are untouched.
- [ ] The stored server answer is not rewritten; only the client's decision is.
- [ ] Turning the patch off restores the dialog.

## Out of scope

The Play in-app update prompt, which is a separate voluntary flow, and anything on
the server. The server still considers the build outdated and may refuse features
that it gates by version.

## Limitations

- The patched build stays on the version it was built for. Fixes published after
  that version, including security fixes, are not received until the bundle is
  rebuilt against a newer stock build.
- A feature the server refuses for an outdated client is still refused. The patch
  removes the local dead end, not the server's decision.

## Open questions

- Does the client read the same answer anywhere else? Answered for this build: one
  read decides the dialog and one read adjusts session bookkeeping; both take the
  same branch when the answer is false.

## Verification

1. Install the patched build and sign in.
2. Make the server mark the installed version as outdated, or use a build the
   server already refuses.
3. Confirm the main screen opens and no blocking update dialog appears.
4. Confirm the voluntary update entry points still work.
5. Disable the patch and confirm the dialog returns.

## Provenance

- Spec author and date: Kero309x, 2026-11-07
- Derived: 2026-11-07 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.system.forced-update`.
