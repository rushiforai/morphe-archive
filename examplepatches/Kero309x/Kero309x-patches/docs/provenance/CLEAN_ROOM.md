# Clean-room protocol

This document records how this project is kept independent. It is a process
document, not a legal opinion.

## Sources policy

Allowed:

- The published documentation, public API and licence notices of the Morphe
  framework.
- The stock application builds the user supplies, studied with decompilation.
- Public documentation of the application's own behaviour.

Not allowed:

- Source, comments, identifiers, helper utilities, fingerprint definitions,
  folder structure or instruction sequences from any other patch collection.
- Any other patch collection as a build dependency or as an "upstream".
- Copying a build file from another project and renaming it.

## Per-behaviour workflow

1. **Spec first.** Write `docs/specs/<app>/<behaviour>.md` from observable
   behaviour only. The spec must not name classes or methods, because those are
   facts to be discovered, not assumptions to be carried over.
2. **Derive from the stock build.** Locate candidate code points in the stock
   application, record how each was found, and write fingerprints that describe
   them. Record the evidence in `docs/provenance/LOG.md`.
3. **Implement.** Write the patch from the spec and the derived fingerprints.
4. **Assert.** Every fingerprint must assert its match count. A patch that can
   match zero or several candidates is not finished.
5. **Verify on the device build.** Apply the bundle to a copy of the stock build
   and confirm the behaviour described by the spec.
6. **Originality review.** Compare against the legacy implementation if access
   is needed for review only, and reject anything that reproduces structure,
   naming or instruction blocks beyond what the target application forces.

## Residual risk

A single implementer cannot be a true clean room, because the same person may
have read earlier implementations. This project mitigates that by deriving every
code point from the stock build and recording the derivation, and by keeping the
spec free of implementation details. It does not claim that this is equivalent to
an independent second implementer; if stronger assurance is required, a separate
reviewer must perform the originality review.

## Evidence to keep

For each behaviour, the provenance log records:

- the behaviour id,
- what was consulted,
- the derived code points and how they were found,
- the date,
- who performed the derivation,
- what verification was run.
