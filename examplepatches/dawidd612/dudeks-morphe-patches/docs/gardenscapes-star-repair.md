# Gardenscapes negative-star repair (experimental)

Target: original Gardenscapes 9.9.0, com.playrix.gardenscapes, ARM64.
The native library must have SHA-256
`3a15c3c170c21a12b5f0253a9421b6bc41707f4e34285acbbcae8afde4851c5c`.
Other builds, other CPU architectures and previously modified libraries are unsupported.

## Garden balance hook

The supplied XAPK contains libgame.so and PLXE-encrypted Lua/XML assets. The Lua
`GetStars` binding at 0x3c0f930 registers the function at 0x3c15ad8. Disassembly
shows that it gets the current player via 0x386bd78, reads the saved earned/spent
properties at offsets 912/1016 via 0x387151c, and returns their difference. That
reader also refreshes the property's UI cache. The notifying, save-backed property
setter is 0x3871490. These are real properties, not just HUD text.

The patch redirects this specific garden balance getter into an added read/execute
ELF segment. Original mappings stay intact and the program-header table is relocated.
The hook gets the same player, reads the same properties and, only for a negative
balance, performs one repair before returning the actual reread balance. For earned
values of at least 2, it sets spent to `earned - 2`, preserving earned stars and level
progress. If the earned counter itself is below 2, it instead sets earned to
`spent + 2`, with an overflow guard. The original setter updates saved properties,
caches and notifications. A rejected setter does not produce a fake UI value or a
completion marker. Null player and unavailable storage leave recovery inactive.

The former AddEarnedStars entry at 0x38bd6e4 is no longer patched. A level completion
is no longer required, and normal rewards are not inflated into a large award.
Positive and zero balances are never topped up, including after spending a repaired
star. Existing normal reward/spending code stays intact.

## Why the previous version was insufficient

On the user's phone, the unofficial-install dialog fix worked, but a completed level
changed -1401 to -1400. The v1 tests covered an isolated reward function with mocked
engine calls and mocked file syscalls; they did not prove that the repair ran at the
garden's loaded-save read or remained effective after loading/synchronizing a save.
The exact runtime reason cannot be established without device diagnostics. In v1,
any I/O failure or nonempty completion marker silently preserved a normal +1 reward.

V2 moves repair to the garden's confirmed GetStars binding, changes the saved spent
counter rather than issuing an oversized reward event, and uses a separate
files/.dudek-stars-repaired-v2 marker. A stale v1 marker cannot suppress this retry.
A completed v2 marker still prevents another correction even if a later balance is
negative. Empty files from an interrupted attempt are retryable. flock prevents
concurrent or reentrant repairs. Clearing app data/uninstalling removes the marker.
No account identifiers or message content are stored.

The ARM64 O_NOFOLLOW constant is also corrected to 0100000. The old x86-style
0x20000 value meant O_LARGEFILE on ARM64 and did not provide the intended symlink
protection. This was a separate verified ABI bug, not proof of the user's +1 cause.
Reference: Linux v6.6 arch/arm64/include/uapi/asm/fcntl.h.

Marker persistence and game autosave are not one atomic transaction. A later cloud
rollback is not bypassed, and actual restart/cloud persistence needs device testing.

## Local installation dialog

The repaired APK has a different signing certificate. The local installation check
at 0x3c254fc reads `EnableGameBlockedWindow`, calls the device-property check at
0x3c1f164 and, for a false result, dispatches
`AndroidUtils::ShowInvalidCertificateMessage()` at 0x3c25470. Its identity is retained
in the lambda RTTI (`ZN12AndroidUtils29ShowInvalidCertificateMessageEvE3$_0`), whose
vtable is constructed in that function. Its only direct caller is the BL at
0x3c25570. The patch replaces that BL with NOP, under the same full-library hash
guard. Certificate results and account/server restrictions are not changed.
The user confirmed on-device that this removes the local dialog and allows play.

The patch remains experimental and selected by default in Morphe. It needs no
in-game activation. The user confirmed that the v2 star repair works on their save.

## Play Games diagnostics

The user reports that tapping the Play Games connection button does nothing.
In the original 9.9.0 DEX, GoogleGameCenter.signIn(J,Z) chooses isAuthenticated()
for silent requests and GamesSignInClient.signIn() for interactive requests.
Its completion callback (identified by "signIn complete ") discards Task exceptions
and forwards only result 3 with null error details. This can conceal the cause of
an unsuccessful connection. It does not prove which error occurs on the phone.

The repair now includes a bytecode dependency showing a short "connecting..."
toast at interactive sign-in entry and a diagnostic toast on authentication failure.
ApiException reports its numeric status; other exceptions report only their class
name. A cancelled task/no exception and an unauthenticated successful task have
distinct messages. Successful SDK authentication reports "authenticated", which
does not confirm cloud synchronization. Silent startup checks have no toasts.
Original callbacks, results, token requests and SDK configuration
remain intact. The hook stores nothing and shows no account IDs or token contents.
UI reporting runs on the main looper using application context and tolerates a
missing context or UI failure. It is not a cloud-sync or certificate-validation fix.

On a device, update the patched installation using the same Morphe signing key,
without uninstalling or clearing data, then tap the Play Games button. Report the
toast's status, whether only "connecting..." appears, or whether neither appears.
Those distinguish an SDK error, a request without a completion, and a path that
never reaches interactive GoogleGameCenter.signIn. Cloud sync remains unverified.

## Building and validation

- `python3 scripts/build_gardenscapes_payload.py` tests the production C helper and
  builds the freestanding ARM64 payload with Clang/LLD. A changed payload is rejected
  unless `--update` is supplied. CI publishes a candidate and separately fails if
  it differs from the committed payload, so generated bytes must be reviewed.
- `python3 scripts/test_gardenscapes_arm64.py` executes the compiled getter at two
  ASLR addresses. It checks the returned balance against the modified properties,
  normal spending/rewards, marker behavior, stack and callee-saved registers.
- `native/gardenscapes/test_filesystem.c` runs with target ARM64 libc headers under
  qemu-aarch64. It uses real open/read/write/flock/fsync/close calls. Only Android
  UID, app-directory prefix and engine property access are substituted. It tests
  the exact target ABI flags, legacy-marker migration, actual completion-file
  persistence, process restart, lock contention, empty-file retry and symlink refusal.
- `python3 scripts/verify_gardenscapes_apk.py original.xapk patched.apk` checks the
  actual Morphe output: preserved game method bodies plus the two sign-in diagnostic prefixes, exact garden getter branch, original reward
  path untouched, isolated certificate-dialog call, RX payload and ELF mappings.
- Full Kotlin/Java build and the existing DM add-on regressions must pass before release.

## Test na telefonie

1. Odśwież źródło patchy i ponownie spatchuj oryginalne 9.9.0 ARM64 w Morphe,
   wybierając Repair negative stars once (domyślnie zaznaczony).
2. Zainstaluj jako aktualizację z tym samym kluczem Morphe. Nie usuwaj gry ani jej
   danych. Nie trzeba usuwać znacznika pozostawionego przez starszą wersję patcha.
3. Otwórz ogród z ujemnym saldem. Oczekiwany wynik to dokładnie 2 gwiazdki przy
   odczycie licznika, bez kończenia kolejnego levelu.
4. Wydaj jedną gwiazdkę na zadanie: zadanie ma zostać wykonane, a saldo wynosić 1.
   Ponowne otwarcie ogrodu nie powinno uzupełniać salda do 2.
5. Uruchom grę ponownie i sprawdź saldo. Zdobądź następną gwiazdkę: ma przybyć
   normalnie jedna. Osobno sprawdź zachowanie po synchronizacji zapisu.
6. Jeśli saldo pozostanie ujemne albo wróci do ujemnego po restarcie/synchronizacji,
   zapisz, na którym etapie to nastąpiło. Nie oznacza to potwierdzonego odzyskania
   postępu mimo poprawnego wyniku testów kodu.

DEX verification requires `python3 -m pip install androguard==4.1.4`.
