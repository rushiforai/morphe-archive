# Ignore the server's remote wipe and forced logout

- **Id:** `vodafone.account.remote-actions`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Account and entitlements

## Observable behaviour

The stock build accepts actions from the server through its push messages. Two
of those actions destroy local state: one clears the application's data through
the system service, which removes the account, the settings and everything the
application has stored, and one logs the account out and sends the user back to
the login screen. Both happen without the user doing anything. After patching,
neither happens: the application ignores those two actions.

## Preconditions

The server sends a push message carrying the matching key. Without that message
the client behaves exactly as before.

## Acceptance criteria

- [ ] A push that would clear the application data leaves the installation
      untouched: the account stays signed in and the stored data survives.
- [ ] A push that would log the account out does not log it out; the session
      continues.
- [ ] The actions the application handles itself keep working: the access token
      is still refreshed when the server asks for it, the user token is still
      reset when the server asks for that, and the shopping-cart count is still
      updated.
- [ ] The rest of the push handling is untouched: a message that carries a deep
      link still opens the screen it names.
- [ ] Turning the patch off restores both actions.

## Out of scope

The push messages themselves. They are still received, still read and still
logged, and the application still answers the keys it handles itself. The patch
removes the two actions that destroy local state; it does not stop the server
from sending the messages.

## Limitations

- The server still believes it may wipe the installation or end the session.
  It will keep sending the messages; the client just does not act on those two
  keys.
- A session the server has already ended, for example by refusing the access
  token, still ends. The patch removes the client's own response to the
  request, not the server's decision.

## Open questions

- Does the same key reach the application anywhere else? Answered for this
  build: the destructive handler is reached only from the silent-push path, and
  the three keys the application handles itself are matched before it.

## Verification

1. Install the patched build and sign in.
2. Have the server send the push that clears the application data, then confirm
   the application is still signed in and its stored data is intact.
3. Have the server send the push that logs the account out, then confirm the
   session continues.
4. Confirm the token refresh and the shopping-cart update still happen.
5. Disable the patch, rebuild and install, and confirm both actions return.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-10 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.account.remote-actions`.
