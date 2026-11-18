# Keep the password of each account

- **Id:** `vodafone.account.stored-password`
- **Status:** verified
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Account and entitlements

## Observable behaviour

The stock build stores the password of every account, encrypted, in its own
databases, and forgets it as soon as the account is signed out of: a write
that carries no password empties the stored one, so the next time that account
is opened the application asks for the password again.

After patching, a write that carries no password keeps the password that is
already stored. The password the user typed is stored as it always was, it
survives a sign out and a restart of the application, and the application logs
the account in with it without asking for it again.

## Preconditions

None. The password is part of the account record the application keeps for
itself.

## Acceptance criteria

- [x] The password of an account is still in the database after the account is
      signed out of.
- [x] The password of an account is still in the database after the
      application is restarted.
- [x] Opening an account that was signed out of logs it in without asking for
      the password.
- [x] The stored password is still encrypted; nothing about the storage
      changes.
- [x] A password the user types is still used for the login it belongs to, and
      is still stored for the next time.
- [ ] Turning the patch off restores the stock behaviour. Not checked on a
      device: the stock behaviour of the writes was observed before the patch,
      where the stored password was emptied by both of them.

## Out of scope

The login request itself and anything the server decides about the account.
The patch changes what is kept in the databases; it does not change the way
the application logs in.

## Limitations

- The application keeps two copies of the account, in two databases, and both
  of them hold the password. Both writes are changed, so the password stays in
  both of them.
- The password is kept in the application's own encrypted database, with the
  application's own encryption. This patch does not change where that is or how
  it is encrypted.
- The write that replaces the whole account record reads the password that is
  already stored from the row it replaces. If the application had no row for
  that account yet, there is nothing to keep and the password is empty, as it
  is in the stock build.

## Open questions

- Where does the empty password come from? Answered for this build: the
  statements that write the password are run with the password of the login
  that is being performed, and that password is empty for every login that does
  not ask for one, such as the silent login that follows a token refresh. The
  encryption keeps an empty password as it is, so the stored password really is
  emptied.
- Does the application read the stored password back? Answered for this build:
  the list of accounts is built from the stored records and the credential
  login reads the password of the account it is asked to open and uses it when
  it is there, and asks for one when it is not.

## Verification

1. Install the patched build and sign in with a password.
2. Confirm the password is in the databases, in encrypted form.
3. Sign out of the account and confirm the password is still there.
4. Restart the application and confirm the password is still there.
5. Open the account again and confirm the application logs it in without
   asking for the password.

Verified on a device on 2026-11-11: the stored password was 158 and 159
characters in the two databases after the sign in, the same after the sign out,
and the same after the restart. Opening the account after the sign out logged
it in and showed the home screen, with no prompt for the password. Before the
patch the stored password was 0 characters in both databases after the sign
out and after the restart, and the account asked for the password again.

## Provenance

- Spec author and date: Kero309x, 2026-11-10
- Derived: 2026-11-11 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.account.stored-password`.
