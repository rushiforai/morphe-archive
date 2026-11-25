# M1zir's SwiftKey Clipboard Patches v0.4.0 (experimental)

Maintained by **Abubakr Ahmed (M1zir)**. Targets **Microsoft SwiftKey 9.13.19.3**
(`com.touchtype.swiftkey`).

## New: Mac clipboard sync

The optional **Mac clipboard sync** patch connects SwiftKey to
[SyncClipboard](https://github.com/Jeric-X/SyncClipboard) on a Mac. It is off by default.

- Text you copy on the phone reaches the Mac in about a second. SwiftKey only has
  to be the default keyboard. No app, overlay, Accessibility service or root is needed.
- Text you copy on the Mac reaches the phone's clipboard when the keyboard opens,
  and every 2 seconds while it stays open.
- It works on the same Wi-Fi or through Tailscale, and switches between them by itself.
- Clips Android marks as sensitive stay on the phone. Images, files and text over
  10,240 characters are not synced.
- HTTPS to the Mac's own certificate, pinned by its public key, plus a random password.
  The phone keeps the pairing encrypted with an Android Keystore key and out of backups.

Set up the Mac and pair the phone once, as described in the README's
**Mac clipboard sync** section. The Mac scripts are in `scripts/mac`.

## Included patches

- Mac clipboard sync (off by default)
- Restore Arabic 123 legacy layout
- Keep clipboard history forever
- Customise toolbar
- Disable cloud sign-in prompt
- Disable telemetry

## Install or update

[Add source to Morphe](https://morphe.software/add-source?github=M1zir/swiftkey-clipboard-patches)

Enable pre-releases for this experimental source if needed, then refresh it.
Alternatively download `swiftkey-clipboard-patches-0.4.0.mpp` below and import it
through **Sources → Add → Local**. Apply all desired patches in one pass to an
**original, unpatched SwiftKey 9.13.19.3 APK**.

Use the same Morphe signing key as your previous patched installation to permit
an in-place update. The official Microsoft installation has a different signature,
and Android may refuse to install over it. Save important data before any uninstall.

## Validation

All six patches applied together to Microsoft's original ARM64 APK with Morphe
Desktop 2.1.1. The emitted DEX passed the clipboard, Arabic layout and toolbar
verifiers, and a new check that each keyboard service hook is in place. The sync
client ran against a real SyncClipboard 3.3.4 server: it sent and fetched text,
moved from an unreachable address to a working one, and refused a wrong key and a
wrong password.

**The keyboard hooks and the pairing screen still need testing on a phone.**

## Attribution

Independent GPL-3.0 fork of murilosimao/swiftkey-patch v0.1.1, preserving credit
to Murilo and arandomhooman. Not an official Microsoft, Morphe, SyncClipboard or
upstream release. No SwiftKey APKs, original layout assets, decompiled app code or
signing keys are distributed.
