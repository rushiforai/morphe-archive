# Skip the store licence check

- **Id:** `vodafone.integrity.license-check`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** high
- **Category:** Store and upsells

## Observable behaviour

The stock build validates at startup that it was installed from the store. On an
installation the licensing service does not recognise, it shows an error or
paywall screen and then exits. After patching, the application starts into its
normal screens and no licence screen appears.

## Preconditions

The startup path is the only place that runs the check. The build also contains a
content provider that could run it, but the manifest does not register that
provider, so it never runs.

## Acceptance criteria

- [ ] A repackaged build reaches the normal startup screens instead of the licence
      screen.
- [ ] The application stays open: the delayed shutdown that follows a failed check
      is not scheduled.
- [ ] Nothing else about startup changes; the first screen appears at the same
      point as on a store installation.
- [ ] Turning the patch off restores the stock behaviour on a repackaged build.

## Out of scope

The store purchase flow, subscriptions and anything the server decides. The patch
removes the local check that runs before the application starts; it does not make
an installation licensed, and it does not change what the server is told.

## Limitations

- Features the server gates by entitlement remain gated by the server. The patch
  only removes the local startup refusal.
- The licence client remains in the build and is still called by other code paths
  in principle. Only this one entry point is neutralised; anything the application
  itself decides to do with a licence answer is untouched.

## Open questions

- Does the client rely on the licensing service for anything other than the
  startup gate? Answered for this build: the static entry point is called from the
  application wrapper and from an unregistered provider, and the check itself only
  binds to the service, shows a dialog or exits. It initialises nothing the rest
  of the application reads.

## Verification

1. Install the patched build and launch it.
2. Confirm the main screen appears and no licence, paywall or error screen is
   shown.
3. Leave the application running past the point where the stock build would have
   exited, and confirm it is still open.
4. Disable the patch, rebuild and install, and confirm the licence refusal
   returns.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.integrity.license-check`.
