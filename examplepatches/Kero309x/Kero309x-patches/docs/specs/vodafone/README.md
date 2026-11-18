# Ana Vodafone behaviour specs

Target application: `com.emeint.android.myservices`, version 2026.11.1 (version
code 1246), distributed as an APKM bundle.

| # | Behaviour | Spec | Default | Risk |
|---|---|---|---|---|
| 1 | Skip the store licence check | [license-check.md](license-check.md) | yes | high |
| 2 | Disable the forced update requirement | [forced-update.md](forced-update.md) | yes | medium |
| 3 | Disable usage tracking | [tracking.md](tracking.md) | yes | low |
| 4 | Ignore the server's remote wipe and forced logout | [remote-actions.md](remote-actions.md) | yes | medium |
| 5 | Hide the promotional card | [ad-space.md](ad-space.md) | yes | low |
| 6 | Use the current connection for Vodafone Cash | [cash-network.md](cash-network.md) | yes | low |
| 7 | Remove the saved account limit | [account-limit.md](account-limit.md) | yes | low |
| 8 | Disable certificate pinning | [certificate-pinning.md](certificate-pinning.md) | yes | medium |
| 9 | Keep the password of each account | [stored-password.md](stored-password.md) | yes | medium |
| 10 | Allow screenshots | [screenshots.md](screenshots.md) | yes | low |

## Status

All ten specs are implemented. Eight are `derived` and two, the account limit
and the stored password, are `verified` on a device. The first release for this
application stopped at the two behaviours that decide whether a repackaged build
runs at all. The later ones cover what the application reports, what a push
message can make it do to the installation, the promotional card it draws, the
connection the cash service uses, how many accounts it keeps, the certificate
it pins, the password it remembers and the screens it hides from screenshots.

`derived` means the behaviour has a spec, a record of how it was derived and an
implementation that builds and applies to the stock APK. It does not mean it has
been checked on a device. `verified` means the acceptance criteria of that spec
were checked on a device as well. The bundle was run on a device, and what that
run showed is recorded below; the behaviours that have not been checked
individually stay `derived`, because a run of the whole bundle cannot tell for
every behaviour whether the behaviour it changes is the one that changed.

## Scope of this release

The stock build was examined for the behaviours users usually ask about, and the
examination found nothing to patch behind them:

- no advertising SDK is bundled, so there is no ad surface to remove;
- the application hides its screens from screenshots through a security library
  it embeds, which is what the screenshot behaviour changes;
- the device checks that library carries, for root, for a developer build, for
  an emulator and for a hooking framework, are never started in this build;
- there is no Play Integrity attestation; the `IntegrityManager` in the build is
  the application's own device-integrity helper, not a store gate.

No patch is shipped for a behaviour the stock application does not have. The
promotional card is the only advertisement the application draws itself: it is
offered by the server and belongs to the operator, so it is filed as promotion
rather than as advertising.

## What a device run showed

The bundle was run on a device with the stock application installed, with the
patched build mounted over it.

- The patched build starts and runs without a crash.
- The licence check of the stock build runs at startup; the patched build does
  not run it.
- The push of the stock build works and the push of the patched build works too:
  the mount leaves the signature of the stock build in place, so the services
  that are bound to it keep working.
- Started the way the launcher starts it, the patched build opens the screen
  with the accounts, and the network calls it makes afterwards succeed. Started
  by naming the splash activity on its own, it waits on a blank screen; the
  stock build does the same, so this is a matter of how the application is
  started and not of the patches.
- The window of the running application carries no secure flag, with and
  without the patches, which is what the screenshot behaviour records.

## Not included

Behaviours that exist in other collections but are absent from this project are
not listed here on purpose. If they are wanted, they are new work: a new spec,
new derivation, new implementation.
