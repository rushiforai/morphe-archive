# Saiyan007

A growing collection of Android app patches for **Morphe**, maintained by
[AsrOfficialDev](https://github.com/AsrOfficialDev). Built for **Morphe Patcher 2.1.0**.

<a href="https://morphe.software/add-source?github=AsrOfficialDev/Saiyan007">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Open the button on Android with **Morphe Manager** installed, then tap
**Open in Morphe**. You can also add this repository URL manually as a source:

```text
https://github.com/AsrOfficialDev/Saiyan007
```

## Supported apps

| App | Package | Patch | Features | Versions |
| --- | --- | --- | --- | --- |
| Shima: Dynamic Island | `com.piyush.island` | **Saiyan007** | Pro features and Google Play installer-source fix | Any version with matching bytecode; verified on `0.4.0` |

Shima Pro features include alerts, gesture rules, swipe gestures, the secondary
pill, and backups. Its installer fix applies automatically with the patch.

More apps can be added to this collection and delivered through the same source.

## Use

1. Add the source using the button above.
2. Select a supported app's original APK or XAPK in Morphe.
3. Choose its patches from **Saiyan007** and patch. For Shima, select **Saiyan007**.

For manual import or Morphe Desktop, download the `.mpp` bundle from
[Releases](https://github.com/AsrOfficialDev/Saiyan007/releases/latest).
Morphe merges XAPK splits when necessary.

## Build on Windows

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build-local.ps1
```

Output: `patches/build/libs/Saiyan007-<version>.mpp`.

The build downloads checksum-verified public releases of Java, Kotlin, Morphe
Desktop, and D8. GitHub Packages credentials are not required. Build tools are
cached in `%LOCALAPPDATA%\Temp\Saiyan007\build-tools`.

The bundle contains both JVM classes and Android DEX. Its version is stored in
`gradle.properties`; the standalone script is the build entry point.

### Add another app

1. Add its Kotlin patch files under
   `patches/src/main/kotlin/app/custom/patches/<app>/`, following the existing
   `shima` folder.
2. Give each selectable patch a unique name and declare its Android package
   using `compatibleWith(Compatibility(...))`.
3. Build and verify the patch against the app versions you intend to support,
   then add the app to the table above.

The build discovers Kotlin files recursively, so new app folders are included
in the same bundle automatically.

### Publish an update

1. Increase `version` in `gradle.properties`, build, and verify the bundle.
2. Commit and push the source. Publish a GitHub release tagged `v<version>` with
   `Saiyan007-<version>.mpp` attached, and mark it as the latest release.
3. Refresh the Morphe source feed:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\update-source.ps1
   ```

4. Commit and push the updated `patches-bundle.json` to `main`.

The update script reads the latest public release and needs no credentials.
Morphe reads this feed when checking for source updates; users keep the same
**Add to Morphe** link as the collection grows.

## Verification

Build, patch application, APK signature, and bytecode checks passed using
**Shima 0.4.0 (version code 7)**. Other versions have not been verified, and an
incompatible bytecode layout will produce a patching error. The rebuilt APK has
not been tested on a device.

## License and attribution

See [LICENSE](LICENSE) and [NOTICE](NOTICE) for the GPLv3 license and additional terms.

The project originated from the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
The installer-source implementation is adapted from the
[Morphe patches library](https://github.com/MorpheApp/morphe-patches-library/blob/main/patch-library/src/main/kotlin/app/morphe/patches/all/misc/fix/changepackageinstaller/ChangePackageInstallerPatch.kt).
Saiyan007 is an independently named custom patch project.
