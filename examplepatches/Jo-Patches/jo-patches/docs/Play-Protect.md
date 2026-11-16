# Play Protect and sideloaded patched builds

Play Protect can stay **fully enabled**. The strict "App blocked to protect your
device" dialog is avoided by choosing the right install route, not by changing
the patch.

## Two different protections

Play Protect has a normal app scan and a second, much stricter rule. The strict
one shows a dialog with **only an OK button**:

> App blocked to protect your device
> This app can request access to sensitive data. This can increase the risk of
> identity theft or financial fraud.

This is not a malware verdict and it is not about the signature. Google's rule
([developer guidance](https://developers.google.com/android/play-protect/warning-dev-guidance))
is purely mechanical: an APK that is **downloaded from an internet-sideloading
source** - a web browser, a messaging app or a file manager - is blocked
automatically when it declares any of

- `RECEIVE_SMS` / `READ_SMS`
- `BIND_NOTIFICATION_LISTENER_SERVICE`
- `BIND_ACCESSIBILITY_SERVICE`

Material Capsule declares the notification listener *and* the accessibility
service; they are the app's core features (island notifications, gesture
actions). So opening the patched APK from Chrome, Downloads or Files always gets
the hard block. Memorize Pi declares neither of them, which is why the same
install route only shows the normal warning there.

## The fix: let Morphe install it

Morphe's built-in installer stages the APK as a locally generated file
(`PackageInstaller.PACKAGE_SOURCE_LOCAL_FILE`), not as an internet download, so
the rule above never applies.

1. Morphe → **Settings → Installation** → default installer on the system
   installer, "After patching" on *Install automatically* (or *Ask*).
2. Patch the XAPK inside Morphe and tap **Install** in Morphe.
3. Do not open the finished APK from Chrome, Downloads or a file manager - that
   is exactly the route Google blocks.

## If the APK is already on the device

1. `adb install -r -d <file>.apk` - adb is not an internet-sideloading source.
2. Play Store → profile → Play Protect → gear icon → disable "Scan apps with
   Play Protect" for the install, then enable it again.
3. Root / mount installer over the Play Store version (original signature stays
   intact, nothing to block, no data loss).

Neither a different signing key nor renaming the package changes this - both are
irrelevant to the rule above, and a rename would break widgets, the
accessibility service and app links.

Do **not** install the re-signed APK over the Play Store version: the installer
rejects it with "App not installed" because of the signature mismatch.
