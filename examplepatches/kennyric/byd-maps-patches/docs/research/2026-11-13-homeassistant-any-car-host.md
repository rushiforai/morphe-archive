# Home Assistant 2026.10.1 car host allow-list

## Input

Original publisher archive supplied by the user:

- `Home-Assistant_2026.10.1-full_apkcube.apks` — package `io.homeassistant.companion.android`,
  version 2026.10.1-full (24906), minSdk 29, ARM64 split set.
  Base APK SHA-256: `0a5912bf8abffbbc3fc692fee65c8cf93838606d01b50deb72ba5b704324c4f2`.
  Publisher certificate SHA-256: `11194ba809b42ddf0e1a7dec6842a59c7ff1119c5482e95febffd5c6014daa5a`
  (DN `O=Home Assistant`).

## Structural findings (jadx decompilation of base.apk)

Home Assistant is a real Android for Cars app: `AndroidManifest.xml` exports
`io.homeassistant.companion.android.vehicle.HaCarAppService` with the
`androidx.car.app.CarAppService` intent action and the `androidx.car.app.category.IOT`
category, and bundles the androidx.car.app validation runtime.

`HaCarAppService.createHostValidator()` already contains the unrestricted branch the app
itself uses for debuggable builds:

- `FLAG_DEBUGGABLE` set → `HostValidator.ALLOW_ALL_HOSTS_VALIDATOR`;
- otherwise → `new HostValidator.Builder(applicationContext).addAllowedHosts(R.array.hosts_allowlist).build()`.

`R.array.hosts_allowlist` (resource `0x7f030006`) pins seven `<sha256>, <package>` pairs:
three Google projection hosts (`com.google.android.projection.gearhead`), three AAOS
template hosts (`com.google.android.apps.automotive.templates.host`) and
`com.harman.ignite.car.app.host.tml`. Every other host fails `isAllowListed` inside
`HostValidator.validateHost` and the car screen shows "App not available on the car
screen — your phone could not open the app on this car screen".

`HostValidator.isValidHost` returns immediately for the allow-all validator, before any
package lookup, signature read or UID comparison, so no package-visibility change is
needed for unrestricted admission.

## Change

**Allow any Android Auto host** (default on) replaces the body of
`HaCarAppService.createHostValidator()` with the app's own debug-path result:

```smali
sget-object v0, Landroidx/car/app/validation/HostValidator;->ALLOW_ALL_HOSTS_VALIDATOR:Landroidx/car/app/validation/HostValidator;
return-object v0
```

The patch verifies the original method's shape first: exact class/name/signature, exactly
one `Builder->addAllowedHosts(I)`, one `Builder->build()` and one
`ALLOW_ALL_HOSTS_VALIDATOR` field reference, so a changed upstream build or a second
application stops patching instead of silently corrupting the validator. The library's
session handshake, templates and the IOT car screens are untouched; the
`hosts_allowlist` resource stays in the APK but is no longer consulted.

Effect: every Android Auto compatible host — DriveDeck, Gearslip, MyCar, Flywheel,
BetterAuto, AndroidAuto, AARE — connects to Home Assistant's car screens whatever its
package name or signing key, and Google's Android Auto keeps working.
