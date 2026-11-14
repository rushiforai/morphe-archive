# Amazon A to Z — Force dark mode & Clone package

Two universal Morphe patches for **Amazon A to Z** (`com.amazon.atozm`), both of which apply to **any
version** of the app: **Force dark mode** turns the interface dark regardless of the phone's theme,
and the opt-in **Clone package** installs the patched build beside the official app instead of over
it.

| | |
|---|---|
| Patches | `Force dark mode` (on by default) · `Clone package` (opt-in) |
| Package | `com.amazon.atozm` |
| Versions | any (no version list — the patches are offered for whatever build you supply) |
| Input | APK (`arm64-v8a` for a 64-bit-only phone such as the Galaxy S25 Ultra) |
| Bundle | [`patches.mpp`](patches.mpp) — A to Z-only, split from the release bundle by the release workflow |
| Checksum | [`patches.mpp.sha256`](patches.mpp.sha256) — written with the bundle, so it cannot go stale |
| Verified against | 6.0.5098.0 (60050982), and the same anchors exist in 6.0.3553.0, 6.0.2988.0 and 6.0.2065.0 |

## Why the app needs a patch for this

A to Z is React Native on Expo, and its UI is painted from a ~119 MB Hermes bundle that has no dark
palette — `colorScheme`, `useColorScheme` and `darkMode` do not occur in the bundle of any inspected
build. There is no source to recompile and no in-app appearance setting, so no theme can be selected
by hand either.

The only mechanism that reaches JS-painted pixels is Android's own automatic dark transform ("Force
Dark"), and AOSP gates it in `ViewRootImpl.updateForceDarkMode()` on three things:

1. `Theme_forceDarkAllowed` — defaults to `false` on retail builds unless the theme opts in.
2. `Theme_isLightTheme` — the transform is skipped when the theme reports a dark theme, which is
   exactly what `Theme.AppCompat.DayNight` reports once night mode is on.
3. `getConfiguration().uiMode & UI_MODE_NIGHT_MASK == NIGHT_YES` — the app's own night mode.

The patch satisfies all three.

## How the patch works

### Theme resources (hidden dependency)

Every `AppTheme*` style in the APK's decoded `res/values*/styles.xml` gets
`android:forceDarkAllowed=true`, and a `Theme.AppCompat.DayNight(.…)` parent is reparented to
`Theme.AppCompat.Light(.…)`. The reparenting looks backwards but is the point: a DayNight theme
switches the transform **off** in night mode, so the Light variant is what keeps it on.

The patch edits the values files the APK already has instead of writing a `values-night` overlay. A
style defined for a configuration replaces the whole style for that configuration rather than merging
into the base one, so a partial overlay would drop the parent theme and every other item.

If no `AppTheme*` style or no `res/values*/styles.xml` is present, the patch aborts with a message
saying so instead of shipping a build that looks patched and is not.

### Night mode (bytecode)

`AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` is injected at the top of
`com.amazon.atozm.MainApplication.onCreate()`:

```smali
const/4 v0, 0x2
invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V
```

`onCreate()` runs once per process, before any activity exists. `com.amazon.atozm.MainActivity` is a
`ReactActivity` extending `AppCompatActivity`, so AppCompat owns the activity's `Resources`
configuration — the object `ViewRootImpl.getConfiguration()` reads — and applies night mode at
`attachBaseContext2`, before the window is created.

`v0` is dead at entry: the method is a no-argument instance method, so `p0` is its only parameter
register. The patch checks the method's register count and refuses to inject if that ever stops being
true, rather than overwriting `this`.

## What stays untouched

Only two things change, and neither is code the app ships in its UI bundle:

- `res/values*/styles.xml`, where two style items are added;
- `MainApplication.onCreate()`, where three instructions are prepended.

In the 6.0.5098.0 run this came to **1 of 10,884 classes** made mutable and **1,325 values in 16
files** re-encoded. The manifest, the application id, the JS bundle, every other dex and every native
library are left as they were — so on its own this patch replaces the installed A to Z. To keep both,
enable **Clone package** as well.

## Clone package

Android identifies an installed app by the `package` attribute of its manifest, so installing beside
the official app means taking over that identifier and everything the manifest derives from it:

| What moves | Why |
|---|---|
| `package` → `app.xiondigital.atoz` (option) | The platform's app identity; two apps cannot share it. |
| Six provider authorities | Device-wide names: `androidx-startup`, `firebaseinitprovider`, `imagepickerprovider`, `rnshare.fileprovider`, `fileprovider`, and the identity SDK's `CrossAppContextProvider.com.amazon.atozm`, which embeds the package instead of prefixing it. |
| `com.amazon.atozm.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` | The app's own runtime permission; AndroidX derives the same name from `getPackageName()` at runtime, so the declaration and its `<uses-permission>` must match. |
| Launcher label → `A to Z (clone)` (option) | Two identical icons on one home screen is a usability bug. |

No dex literal carries an authority — the libraries build them from `getPackageName()` — so the dex is
untouched by this patch. The clone therefore composes cleanly with **Force dark mode**.

What it must *remove*: the manifest inherits six permission **declarations** from Amazon's SDK
manifests — `com.amazon.identity.permission.*`, `com.amazon.identity.auth.device.perm.*`,
`com.amazon.dcp.*`, `com.amazon.appmanager.preload.permission.*`. An Amazon-signed app already owns
those names, and Android refuses to install a build that redeclares one it cannot sign for
(`INSTALL_FAILED_DUPLICATE_PERMISSION`). The declarations are dropped; the matching
`<uses-permission>` entries stay and simply go ungranted. Every component that references those
permissions is `exported=false`, so nothing else depends on them being declared. A `<permission>`
that belongs to neither the app nor a known Amazon SDK aborts the patch rather than shipping a clone
that will not install.

### What a clone cannot carry over

A new application id is a new app to everything that checks identity:

- **Play services and FCM.** The clone gets its own registration, and the server's push targeting
  still addresses the official package — notifications may be delayed or missing.
- **Play Integrity / attestation.** Verdicts are bound to the package and signing certificate, so any
  flow that requires one will fail.
- **Verified App Links.** The manifest still claims `atozmobileauth`, `atozmobile` and
  `atozmobilelogout`, and the A to Z web flows still redirect to those schemes — but an App Link
  verified against the official package will open the official app when both are installed.
- **Amazon backend package checks.** Sign-in goes through the browser and returns by scheme, so it
  can work; a server-side comparison against `com.amazon.atozm` would not, and cannot be tested here.

Data does not migrate between the two installs: the clone starts from a clean state.

## Applying it

In Morphe Manager, add this repository as a source, or import
[`patches.mpp`](patches.mpp) from this folder (A to Z only) or the combined release bundle (every
app). Select your A to Z APK and keep **Force dark mode** enabled. Enable **Clone package** too if the patched build
should sit beside the official app; its two options set the application id and the launcher name.

From the CLI:

```bash
# dark mode only, replacing the installed app
java -jar morphe-desktop.jar patch \
  --patches=patches.mpp \
  --exclusive -e "Force dark mode" \
  your-atoz.apk

# dark mode plus a clone that installs beside it
java -jar morphe-desktop.jar patch \
  --patches=patches.mpp \
  --exclusive -e "Force dark mode" -e "Clone package" \
  -OpackageName=app.xiondigital.atoz -OappName="A to Z (clone)" \
  your-atoz.apk
```

## Testing status

**Experimental.** The patch has been applied with Morphe's own engine to the real
6.0.5098.0 `arm64-v8a` APK and the result was decompiled:

- the engine reported 1 class changed and the resource files re-encoded;
- `MainApplication.onCreate()` decompiles to the injected `const/4 v0, 0x2` +
  `AppCompatDelegate.setDefaultNightMode` **before** `invoke-super`, in a method with `.locals 13`;
- `res/values/styles.xml` decompiles to `android:forceDarkAllowed=true` on both `AppTheme` and
  `AppTheme.Launcher`, with the launcher parent reparented from `DayNight` to `Light`;
- the manifest still declares `com.amazon.atozm`.

With **Clone package** enabled as well, the same run produced a manifest that declares
`app.xiondigital.atoz`, carries all six authorities renamed (including the identity SDK's embedded
one), keeps the app's runtime permission under the new prefix, contains no foreign Amazon permission
declarations, and labels the launcher `A to Z (clone)`.

Neither patch has been run on a device. The rendered result is therefore unverified, and the usual Force
Dark caveats apply: images and avatars are transformed along with everything else, so photos may look
dimmed. If the app is ever updated to a build whose themes or `MainApplication` change shape, the
patch fails loudly instead of silently doing nothing.
