# Validation

Only Boost 1.14.3 is supported. The application validator requires the original APK with SHA-256 `a273eca565f5f6e811db4bfbe63e5c9d5ece6d0cc2e1c38ac1a3a50b411ffe5c`.

`BOOST_APK=/path/to/original.apk ./build.sh` compiles Kotlin/Java, builds the Android extension and `.mpp`, checks all 25 exact public names, validates native mappings and 36 register-safe bytecode hooks, applies the patches, checks runtime references, validates HTTP/2 configuration and exercises both emoji-wrapper regressions. Thirty host checks cover thread-boundary projection. Without an original APK, only compilation, patch metadata generation and host checks run.

For mixed-source preservation checks, invoke `:patches:validateMixed` with `-PmixedInput=/path/to/your-mixed.apk -PmixedOutput=/path/to/output.apk`, using the same pinned source-composite properties shown in `build.sh`. This verifies other-source class/method/field sets remain present, not arbitrary future patch-source combinations.

Optional isolated Android checks:

```bash
python3 tools/test-media-on-phone.py --version 1.0.0 \
  --check ArtVerify --check SurfaceChecks --check StyleChecks \
  --check ThreadCardChecks --check RuntimeUiChecks --check OverlayBackChecks
```

The phone harness reads the local unsigned test APK and uses `app_process` fixtures. It does not install Boost, navigate the installed app or send Reddit actions. Several fixtures replace service-dependent containers, WebView and hidden spinner widgets; the reply fixture creates an empty process-local account service for the native FormattingBar. These are test-only substitutions. Native widgets, the runtime extension and GPU glass renderer are otherwise exercised directly.

To check that every selection works, run `:patches:validateSubsets`. It applies each patch alone and leaves each one out.

To check Shikify and Patcheddit together, run `:patches:validateCombined` with `-Ppatcheddit=/path/to/patcheddit.mpp`. It applies both bundles in both orders.
