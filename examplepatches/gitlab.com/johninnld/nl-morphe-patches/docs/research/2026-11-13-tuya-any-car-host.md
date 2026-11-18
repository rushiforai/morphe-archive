# Tuya Smart Life 7.12.6 car host allow-list

## Input

Original publisher archive supplied by the user:

- `Tuya-Smart-Life-Smart-Living_7.12.6_apkcube.apks` — package `com.tuya.smart`, version 7.12.6
  (872), minSdk 24, ARM64 split set.
  Base APK SHA-256: `33bcd53a64f524160e13225d1361f00b48a4181c1cfcc648c5a8c6b3b55ffbe8`.
  Publisher certificate SHA-256: `93219fc273e2200f4adee5f7191dc656ba2a2d7b2ff5d24cd55c4b6155001e40`
  (DN `CN=Tuya`).

## Structural findings (jadx + baksmali of base.apk)

Tuya is a real Android for Cars app: `AndroidManifest.xml` exports
`com.thingclips.smart.scene.auto.car.SceneManualCarAppService` with the
`androidx.car.app.CarAppService` intent action and the `androidx.car.app.category.IOT`
category. The build renames the bundled androidx.car.app runtime: `ybk`/`androidx.car.app.o`
is CarAppService, `x0l` is HostValidator, `w0l` is HostInfo and `CarAppBinder` keeps its
name. `CarAppBinder.getHostValidator()` calls the service's abstract `a()`
(createHostValidator) and passes the caller's host info to `x0l.b(w0l)` (isValidHost).

`SceneManualCarAppService.a()` contains the unrestricted branch the app itself uses for
debuggable builds:

- `FLAG_DEBUGGABLE` set → `sget-object Lx0l;->e:Lx0l;` (`ALLOW_ALL_HOSTS_VALIDATOR`,
  constructed as `new x0l(null, new HashMap(), true)`, `public static final`);
- otherwise → parse `R.array.hosts_allowlist_sample` (resource `0x7f030011`,
  2130903057) into a package→digest map and return
  `new x0l(packageManager, map, false)`.

`hosts_allowlist_sample` pins six `<sha256>, <package>` pairs: three Google projection
hosts (`com.google.android.projection.gearhead`) and three AAOS template hosts
(`com.google.android.apps.automotive.templates.host`) — the same six entries as Home
Assistant's sample array. Every other host fails the digest match inside `x0l.b(w0l)`
and the car screen shows "App not available on the car screen — your phone could not
open the app on this car screen".

`x0l.b(w0l)` returns true immediately for its allow-all instance (`iget-boolean b:Z`
is the first check after logging), before any package lookup, signature read or UID
comparison, so no package-visibility change is needed for unrestricted admission.

## Change

**Allow any Android Auto host** (default on) replaces the body of
`SceneManualCarAppService.a()` with the app's own debug-path result:

```smali
sget-object v0, Lx0l;->e:Lx0l;
return-object v0
```

The patch verifies the original method's shape first: exact class/name/signature
(non-static `a()` returning `Lx0l;`), exactly one `Lx0l;->e:Lx0l;` field reference and
one `Lx0l;-><init>(Landroid/content/pm/PackageManager;Ljava/util/HashMap;Z)V`
constructor reference, plus the public static `e` field on `Lx0l;`, so a renamed
obfuscation, a changed upstream build or a second application stops patching instead of
silently corrupting the validator. The library's session handshake, templates and the
scene car screens are untouched; the `hosts_allowlist_sample` resource stays in the APK
but is no longer consulted.

Effect: every Android Auto compatible host — DriveDeck, Gearslip, MyCar, Flywheel,
BetterAuto, AndroidAuto, AARE — connects to Tuya Smart Life's car screens whatever its
package name or signing key, and Google's Android Auto keeps working.
