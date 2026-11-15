# Bitwarden 2026.10.1 implementation notes

Qualified input: `com.x8bit.bitwarden` 2026.10.1 (21986), single APK, signer SHA-1
`754185cd4cdfde598748b043048bfe59a17264c2`. Class pins cover `vde` (validator), `hya`
(not-allowed result), `iya` (signature-not-found result) and `x47` (allow-list walker).

## Why
Passkey requests from a browser go through Bitwarden's privileged-browser validation. A browser
that is on an allow list but fails the signature check (every Morphe re-signed browser) gets the
signature-not-found result and a dead-end error.

## Verified path (static, original APK)
`x47.b` asks the Google list, then the community list, then the user-trusted list; it moves on only
when a list returns not-allowed. The not-allowed result opens the "browser X is not trusted" dialog
(`browser_x_is_not_trusted`); any other error only shows a failure message.

## Edit
In `vde.f(...)` the signature-not-found result is read once, in the handler for the illegal-state
exception thrown when no signature matches. That single read becomes the not-allowed result, so
the lookup continues to the user-trusted list and the trust dialog. The method must contain exactly
one such read; any other count, owner or shape is rejected before mutation. Nothing else changes.

## Validation
Unit tests cover target pins, class-pin set, the exact edit and rejection cases. The official MPP is
applied to the original APK and compared by disassembly. Whether the trust prompt appears on a phone
and remembers the browser is a phone acceptance check.

## Not covered
Other community patches for Bitwarden (no-screen-lock passkey, password generator changes) are not
implemented. Re-signing changes the app signature: Firebase push, Google sign-in/SSO and similar
signer-bound services are not claimed to work.
