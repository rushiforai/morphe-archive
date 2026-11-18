# Disable certificate pinning

- **Id:** `vodafone.network.certificate-pinning`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Network and security

## Observable behaviour

The stock build pins the certificate of `mobile.vodafone.com.eg` to two public
keys. A request whose certificate is neither of them fails, whatever the
reason is: a proxy in the way, a certificate the operator renewed, or a
debugging tool. After patching, the application accepts the certificate the
device trusts, like any other application does.

## Preconditions

None. The pins are part of the application and are applied to every request it
makes to its own server.

## Acceptance criteria

- [ ] The application talks to its server without refusing the certificate.
- [ ] A request through a proxy that presents its own certificate succeeds.
- [ ] The pins themselves are still in the build; only the host they are
      applied to is gone.
- [ ] The rest of the network layer is unchanged: the same requests are made
      with the same headers and the same certificate checks the platform does.
- [ ] Turning the patch off restores the pins.

## Out of scope

The trust store of the device and the checks the platform does. The patch only
removes the pins the application adds itself; a certificate the device does not
trust is still refused.

## Limitations

- The connection is no longer checked against the two keys the operator ships
  with the application, so a server that presents a certificate the device
  trusts but the operator did not sign is accepted. That is what every
  application without pins does.
- The authentication stack and the application's own stack pin the same host
  separately, so both are changed. A third stack, if one is added later, would
  need the same change.

## Open questions

- Does anything else in the build pin a certificate? Answered for this build:
  the two pin builders found are the only ones; every other use of the
  certificate API is a library that builds a client without pins.

## Verification

1. Install the patched build and sign in.
2. Confirm the application reaches its server and the screens load.
3. Confirm through a proxy that presents its own certificate that the requests
   still succeed.
4. Disable the patch, rebuild and install, and confirm the pins return.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.network.certificate-pinning`.
