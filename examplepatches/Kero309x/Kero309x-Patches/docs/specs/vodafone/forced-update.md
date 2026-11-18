# Disable the forced update requirement

- **Id:** `vodafone.system.forced-update`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Store and upsells

## Observable behaviour

When the server decides that the installed build is too old and that updating is
mandatory, the application shows a blocking dialog whose only action opens the
store. A feature marked as forced does the same: the client opens the store and
refuses to continue. After patching, neither happens and the application proceeds
as it does when the server does not require an update.

## Preconditions

The server configuration marks the application, or one of its features, as
outdated. Without that server answer the client behaves exactly as before.

## Acceptance criteria

- [ ] A build the server marks as outdated reaches the main screen instead of the
      blocking dialog.
- [ ] A feature the server marks as forced opens normally instead of sending the
      user to the store.
- [ ] The voluntary soft-update prompt still appears when the server offers one.
- [ ] No other screen changes: the update entry points the application offers
      voluntarily are untouched.
- [ ] Turning the patch off restores both refusals.

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
- The update type computed from the server configuration is not rewritten, so any
  other consumer of that value sees the same answer the stock build would see.

## Open questions

- Does the client read the update type anywhere else? Answered for this build: the
  application type is consumed by the blocking check and by the soft-update
  prompt; the feature type is consumed by the two feature gates. Only the
  refusals are changed.

## Verification

1. Install the patched build and sign in.
2. Make the server mark the installed version as outdated, or use a build the
   server already refuses.
3. Confirm the main screen opens and no blocking update dialog or store redirect
   appears.
4. Confirm the voluntary soft-update prompt still works when the server offers a
   non-forced update.
5. Disable the patch and confirm both refusals return.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.system.forced-update`.
