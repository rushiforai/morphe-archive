# Tutto Enhancements source

## Architecture

The source publishes one MPP containing desktop JVM patch classes, Android patch DEX, and a small runtime extension DEX. Existing Java feature source under src/ is reused unchanged. Compile-only SavedStore/SavedPlaces stubs and test classes are excluded from the runtime DEX. The upstream implementation is never bundled a second time.

`morphe/TuttoEnhancements.kt` defines two named patches, Home and Work shortcuts and Label search suggestions, each adding its helper's lifecycle hooks; an unnamed patch they both depend on merges the helper DEX once. (1.3.x also hooked map markers and label editors; bearinmind's Offline saved places now does that.) It uses a finalize block, which runs after all selected patches' execute blocks, then validates the upstream Local saved fields and methods the shortcuts use, a real native Save hook, and the microG flag before editing. It does not try to import a Kotlin dependsOn reference from a separately loaded bundle. This avoids duplicated upstream dependencies and makes the source independent of tab order for the tested upstream version.

Version compatibility is restricted to original Google Maps 26.44.06.1006895251 (Tutto 1.6.0 and later; 1.5.1 and earlier targeted 26.36.04.973607363). Start from the original APK/APKM, select bearinmind's Offline saved places and the other desired Ungoogled Maps patches, then select our patch. Do not feed an already enhanced APK back into the patcher. microG is intentionally rejected until separately ported/tested.

## Build the MPP

Requires Windows x64, the existing private recovery-kit tools, and the official [Kotlin compiler 2.4.20 ZIP](https://github.com/JetBrains/kotlin/releases/download/v2.4.20/kotlin-compiler-2.4.20.zip). Its SHA-256 is pinned in build-bundle.py and config/morphe-source-lock.json. The build performs no downloads and does not read signing keys or personal data.

```powershell
& 'D:\MapsRecovery\recovery-kit\python\python.exe' .\build-bundle.py `
  --recovery-root 'D:\MapsRecovery\recovery-kit' `
  --kotlin-zip 'D:\Tools\kotlin-compiler-2.4.20.zip'
```

The compiler reads the patch API from the checksum-pinned Morphe Desktop JAR; those classes are compile-only and are not redistributed inside our MPP. Kotlin language/metadata 2.2 and Java 11 bytecode are used for the patch, while the runtime helpers target Java 8 / Android API 32. This avoids a Gradle/GitHub Packages dependency during this small bundle build. The script runs the route-ownership and label matching tests, generates patches-list.json from the compiled patch, and outputs a deterministic MPP plus a source hash manifest to dist/.

## Release/update procedure

1. Update version in build-bundle.py, patch description and metadata; compile the MPP.
2. Test fresh stock Maps with both MPPs in Morphe Desktop and Manager. Verify required/unsupported selections fail; exercise Home/Work, Back cleanup, markers and native/local label editing. Use an emulator before updating the phone.
3. Copy the MPP and its .sources.json to vendor/artifacts, update config/morphe-source-lock.json and combined options, and run the full PC build. If changing filenames/version, update build-all.py's pinned artifact paths too.
4. Preserve the corresponding upstream source archive and MPP. Review new upstream versions instead of following latest automatically.
5. Audit the staged files. Publish a GitHub release with the MPP and checksums, and commit patches-bundle.json pointing to its public asset. That JSON plus patches-list.json lets Morphe discover/update this source from the existing repository.

The original upstream v1.3.0 source remains under vendor/morphe-patches for the historical recovery path. Current v2.10.0 source is preserved in vendor/artifacts/morphe-patches-2.10.0-source.tar.gz at commit 1df254204b2ce5c1ac1c6ac73ee94c5ed5defb44 (v2.9.10, commit 6e703cef2e0bea751052da7f610829c38ff6a251, is kept for 1.6.0); the earlier v2.5.5 (commit de89b2084387a3e69f259b5ac1c3ddae433eccec) and v1.7.4 source (commit c7bd4c2630b257f695f59a5cf08b98b0b46e85d4) is kept beside it. The source archive contains upstream LICENSE/NOTICE; do not publish this fork as if it were the author's official project.

## Signing and data

Public releases contain patches only, never Google APKs, signing keys, passwords, or Local saved exports. Signing an output APK is Manager's job (or the private PC build's final step). Import/reuse the original key locally if Manager's key differs. A matching package and certificate permit an in-place update; uninstalling is not part of this workflow. Export Local saved before a phone update.

Ad and clutter hiding comes from bearinmind's source, not a duplicate implementation here. Its independent switches remain on the app's Customization screen. Our overlays and labels retain their existing limitations documented in README.
