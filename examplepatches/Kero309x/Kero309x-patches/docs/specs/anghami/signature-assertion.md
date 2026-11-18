# Stock application signature assertion

- **Id:** `anghami.integrity.signature-assertion`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** high
- **Category:** Account and entitlements

## Observable behaviour

Requests carry a value derived from the signature of the installed application,
so a repackaged build can be distinguished from the store build. The derivation
asks the package manager for the application's first signer, hashes the
certificate bytes, appends a per-request salt and hashes the request body on top
of that.

After patching, that certificate read answers with the store build's certificate
instead of the installed one. The salt, the body and the rest of the derivation
are unchanged, so for the same request the patched build produces the same value
the store build produces.

## Preconditions

The patched application is installed under a different signing key than the
stock build. The behaviour changes what the client claims, not what the store
signed.

## Acceptance criteria

- [ ] The value sent matches the stock build's value for the same request.
- [ ] The value is produced locally, without a network round trip.
- [ ] No other request field is altered.
- [ ] The salt and the request body still contribute to the value.
- [ ] Nothing else in the application sees a different signing certificate.

## Out of scope

Server-side verification, and anything that requires knowing a server secret.
This behaviour affects a server-facing identity claim and is documented as such:
it is not local UI work, and it must never be described as harmless.

## What is deliberately not changed

- The installed application's real signature is not rewritten. Only the one read
  that feeds the request value answers differently, so anything else that asks
  the package manager still gets the truth.
- The salt and the request body are still hashed. The patch does not return a
  fixed string; it reproduces the derivation with the stock certificate.
- The certificate used is the store build's, taken from the stock APK. Its digest
  is checked against the value the bundle already uses to recognise the stock
  build.

## Limitations

- This closes the client-side half only. A server that also checks Play Integrity,
  certificate pinning or an attestation token sees the repackaged application and
  can still refuse it. Enabling this behaviour does not guarantee a trusted
  session.
- The value is the store build's for the same request body. A request the store
  build never makes has no known expected value; the patch does not invent one.
- The certificate is embedded as data. A future store build with a different
  certificate needs a new derivation and a new literal, and the unit test that
  compares its digest will fail until both are updated.

## Open questions

- Which account-level restrictions depend on the same identity claim, so that
  enabling it does not produce a partially trusted session? Not observed from the
  client; the server's answer is the only source, and the client cannot be tested
  against the production server from here.

## Verification

1. Capture a signed request from the stock build and the same request from the
   patched build.
2. Compare the two signature headers and confirm they are equal, and that every
   other header is unchanged.
3. Confirm the session works normally for at least one full app restart.
4. Confirm a build signed with the stock key produces the same value as before
   patching, so the patch does not change the stock case.

## Provenance

- Spec author and date: Kero309x, 2026-11-04
- Derived: 2026-11-07 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `anghami.integrity.signature-assertion`.
