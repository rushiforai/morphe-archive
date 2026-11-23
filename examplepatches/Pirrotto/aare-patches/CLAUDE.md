# Rules for working on AARE Patches

Talk to the owner in **Italian**.

## Before proposing a patch

- **Check that AARE doesn't already do it.** Read AARE's README and sources (github.com/prototux/AARE) and the
  navigation/messaging apps' own features. Don't duplicate: only improve or extend what AARE has (for example,
  doing by voice while driving what AARE only allows by touch when parked).
- Changes must work for every car, not only the owner's Skoda.

## Security and privacy (never relax these)

- No internet connections added by the patches.
- No personal data (messages, dictated text, contacts, location, voice notes) in logs, the clipboard, or files
  other apps can read. Diagnostics hold technical state only.
- No new permission without a stated reason; prefer Shizuku over broad permissions (never all-files access).
- No exported components unless required, and then protected.
- File access limited to the minimum (voice notes: only `PTT-` files in WhatsApp's received voice-note folders,
  canonical paths checked).
- The integrated Shizuku server serves AARE's uid only; wireless debugging is switched off after the start.
- Sending a message or placing a call always needs the user's confirmation.
- Patches accept only official AARE releases (signature check).

## Never break what works

- Every change must keep the existing features working exactly as before, unless the owner asked to change them.
- Small steps: one feature or fix per pull request, touching only the code it needs.
- New behaviour is optional (its own switch or setting) and the old behaviour stays the default until tested.
- Every fix and feature gets automatic tests where possible; the whole suite runs on every pull request
  (regression tests), and all patches are applied together to the official APK.
- Before merging, list in the pull request what could be affected and how it was checked.
- After a release, the owner tests the existing features in the car too, not only the new ones.
- Previous releases stay on GitHub, so the owner can go back to the last working version at any time.

## Before publishing

- Work on a branch and open a pull request; merge to `main` (which releases) only when CI is green:
  the patches build, apply to the official AARE APK, tests pass, security checks pass.
- Review every change against the security list above.
- `feat:` for new features, `fix:` for fixes, `chore:` for anything that must not release.
- Update the README (patch description and "What's new / Novità") with every feature.
- Things CI can't test (car audio, microphone, tunnels) are tested by the owner in the car before being
  recommended to others.
