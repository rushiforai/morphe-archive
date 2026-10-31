# Flitsmeister 14.17 Android 10 input support

The current source supports the publisher-signed Android 10+ APKMirror APKM
provided by the user. All six existing controls apply without changes to their
bytecode or startup restoration. This change extends the existing patches to the lower-SDK publisher variant.
It preserves the input's minSDK 29 and target SDK 37. The API 32 input remains
accepted; no manifest SDK is lowered or raised by the compatibility guard.

## Input evidence

- File: `nl.flitsmeister_14.17-1287_1arch_2dpi_24lang_125752d5485c86cb167e817ed1fc4c52_apkmirror.com.apkm`.
- APKM SHA-256: `9fe7805e69e89b809d182a511a7b344b9e9a2c260bec0a240a6a217d62064f71`.
- Base APK SHA-256: `17f622c8072c9fd8bd121b872a3733a9a22aaff041d57560f6f3dd59a33ce1b7`.
- Package/version/code: `nl.flitsmeister`, `14.17`, `1287`; minSDK 29,
  target SDK 37; ARM64, two density splits and 24 language splits.
- SDK `apksigner verify --print-certs` confirms the existing pinned publisher:
  `ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6`.
- Compared with the previously audited API 32 Play split set, all seven DEX
  files, all assets and all native libraries are byte-identical. Base differences
  are confined to binary manifest/resource packaging; decoded manifests differ
  only in derived APK ID after apktool extracts SDK values to `apktool.yml`.
  SDK inspection confirms the differing minimum SDKs. Additional language/density
  resources in the supplied bundle are retained through normal split merging.

## Change and verification

The catalogue minimum becomes 29. Flitsmeister's resource preflight uses the
shared `additionalMinSdks` facility to accept the inspected API 32 variant as
well. Acceptance remains scoped to this app, version, code and publisher signer;
unknown SDK variants are rejected. Exact instruction guards remain unchanged.

The published v1.19.2 bundle fails on the supplied input with
`Unsupported Flitsmeister manifest minSdk`. The new guard regression fails on
that bundle for the same reason and passes against the rebuilt bundle.

Validation on 30 October 2026, rebuilt on stable baseline v1.24.0
(`9232485`) to retain the existing Insider driving-crash repair:

- `:patches:buildAndroid` succeeds with JDK 21 and the existing build credentials.
- Desktop FULL mode, `--exclusive --validate`, applies all six controls directly
  to the supplied APKM, with `success=true` and no failed patches.
- SDK `apksigner verify --verbose` verifies the resulting signed APK. The
  original API 32 Play split set also passes an all-six FULL patch run and
  signature verification, retaining minSDK 32 and target SDK 37.
- SDK `aapt2 dump badging` confirms output minSDK 29 and target SDK 37.
- Independent apktool decoding and `tests/verify_flitsmeister.py` pass: 395
  entire app-method contracts, 66 startup class contracts, all thirteen restored
  functional callbacks, assets/native hashes, layouts, manifest/host rules,
  partner controls, ads, 46 SDK tracking and 11 first-party telemetry contracts.
  The no-selection publisher baseline passes the same verifier, reusing the
  byte-identical publisher DEX disassembly with the supplied base resources.
- `tests/verify_flitsmeister_input.py` passes 31 assertions against the real
  input metadata and signed output: API 29/32 acceptance without rewriting,
  other SDK rejection, missing/duplicate SDK rejection, wrong package/version/
  code, missing/untrusted/mixed signer rejection, and SDK preservation.
- Host unit suite: 259 tests, four skipped, no failures.
- All 58 app pages pass the documentation template check against generated
  candidate metadata and the published prerelease catalogue. Release integration
  tests pass all 11 cases.
- All 49 synthetic callback behavior cases pass against the emitted API 29 APK
  on the Android 14 ARM64 emulator. These isolated shell DEX fixtures do not
  install Flitsmeister or simulate a real journey. Three emitted Insider
  regression cases also pass, including 100 stopped/driving/stopped cycles.
  The SDK remains uninitialized and app logging/state callbacks are preserved.

The APK, local patch bundle, reports and validation logs are staged under
`build/validation/flitsmeister-api29/`. Patched APK SHA-256:
`3a141ed5ae94b2ccd6c6c76440e6d91bd891c6eae604b4dfc38f6bb3fc2e9186`.

To repeat the guard check after building and patching:

```sh
python3 tests/verify_flitsmeister_input.py --bundle PATH_TO_MPP --original PATH_TO_API29_BASE_APK --patched PATH_TO_SIGNED_API29_OUTPUT_APK
```

## Limits

No Android 10 device installation, map/routing session or Android Auto session
was performed for this variant. Existing user-reported phone/car acceptance
belongs to the earlier API 32 input and tested setup. Successful compilation,
signature and emitted-code checks establish patch applicability and preservation,
not exhaustive runtime behavior on older Android versions. ARM64 and the
publisher's Vulkan hardware requirement remain. The patch source must include
this change; updating an installed app still requires rebuilding and installing
the patched APK with its existing signing key.
