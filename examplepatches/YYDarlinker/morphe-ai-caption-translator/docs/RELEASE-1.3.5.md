# Release 1.3.5 source recovery

This release is based on the supplied `morphe-caption-rebuild-1.4.0-local.2.12.mpp`. After the initial binary recovery, a nearby R2.12 Java source snapshot was found on the user's E: drive and restored into the extension source tree. A build of that snapshot matched 1,382 of the bundle's 1,399 extension classes after debug directives were ignored. The remaining 17 classes are concentrated in the rebuild engine. The released MPP uses the supplied bundle's code for those classes; the complete, assembleable Smali source is in [`recovered/1.3.5`](../recovered/1.3.5).

The recovered tree contains 1,399 extension classes and 47 patch classes. `tools/rebuild_recovered_135.ps1` downloads pinned Smali 2.5.2 dependencies, assembles both DEX files, disassembles them again, compares every Smali file, and packages an MPP using the checked-in release bundle for its manifest and localization entries. The verified round trip preserves the instructions and metadata represented by Smali; ZIP and DEX byte hashes can differ after rebuilding.

Run from the repository root with PowerShell 7:

```powershell
pwsh -File tools/rebuild_recovered_135.ps1
```

The output is `build/recovered-1.3.5/patches-1.3.5.mpp`. The released template is `recovered/1.3.5/patches-1.3.5.mpp` (SHA-256 `20E4F160BDC67A38F01CF45A63625A87880F8210D7B4785F08D44FC33E4DB2A5`). The untouched attachment is stored as `recovered/1.3.5/original-local-2.12.mpp`.

The caption size control and stored size clamp now use 8–15 sp; 13 sp remains the default. The export manifest and saved report filename show 1.3.5, while `event-rebuild-r2.12` remains the engine identifier. Locale hints also show 8–15. The Java source reads the release number from Gradle-generated `BuildConfig`; for the exact supplied engine, the Smali source and verified MPP are authoritative. A future release using the recovered Smali must update its embedded release version.

Against the untouched attachment, the published MPP has the same 72 ZIP entries. Seventeen entry contents differ: the manifest, 14 locale XML files, the root DEX, and the extension DEX. Disassembly changes exactly five extension classes (size bounds and diagnostic/export labels) and one patch class (size hint). Every other Smali class is byte-for-byte identical after disassembly. The locale XML differences only replace `12–18` or `12～18` with `8–15` or `8～15`.

The MPP and source round trip were verified structurally. Device playback and translation were not tested here.
