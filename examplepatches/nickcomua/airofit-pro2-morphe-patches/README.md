# Airofit Pro 2 compatibility patch for Morphe

Unofficial, experimental Morphe patch for **Airofit Elite 1.9.0** (`com.airofit.elite`), built specifically for the legacy Airofit Pro 2 BLE device.

## Add this source to Morphe

Open this link on an Android device with Morphe Manager installed:

https://morphe.software/add-source?github=nickcomua/airofit-pro2-morphe-patches&name=Airofit%20Pro%202%20Experimental

Or add this repository manually as a remote source:

https://github.com/nickcomua/airofit-pro2-morphe-patches

The patch is marked experimental. Enable Morphe's experimental app versions when needed.

## Exact target

- Package: `com.airofit.elite`
- Version: `1.9.0` (version code 89)
- Input bundle SHA-256: `32058e5c3813a8d3a7690a7ed7a40968e1d667b995ef12996205c75e8f7861b4`
- ABI tested for the patching package: `arm64-v8a`

The patch refuses any other app version, modified input bundle, already patched input, bad payload, or mismatched output.

## What changes

- Allows only the lowercased Bluetooth name `airofit pro 2`; Elite hardware is deliberately rejected.
- Uses Pro 2-specific directional flow constants rather than Elite curves.
- Keeps the existing Elite pressure calculation, 10-sample stationary baseline, drift check, failure paths, and disconnect handling.
- Treats the Pro 2 gyro orientation capability as unavailable because the tested unit returned zero gyro data and did not notify during probing.

No firmware, hardware setting, account, paid feature, server behavior, licensing/integrity check, serial value, volume integration, or pressure compensation is changed.

## Limits

This patch **does not bypass** the app's Play Store installer/license verification. A locally patched and signed APK was observed exiting with `LicenseClient: Local install check failed due to wrong installer`. That verification is outside this patch.

Sensor accuracy is unvalidated. Packet structure and factory coefficients were observed on hardware, and bytecode/formula tests run, but no calibrated external pressure or flow reference was available. Do not treat displayed measurements as medically or physically validated.

## Verification

- Exact source guards, output guard, SHA-1 HBC footer and Morphe application were verified.
- Official Hermes compiler accepts the original and patched bundles.
- 11 bytecode-level tests pass, including 576 flow/dial boundary cases.
- 28,418 unaffected function bodies and headers plus all 60,339 strings remain unchanged.

See `manifest.json` and `verification.json` for machine-readable evidence.

## Build locally

The published release contains the `.mpp` that Morphe Manager downloads. To rebuild it:

```sh
mkdir -p tooling/lib
curl -fL https://github.com/MorpheApp/morphe-desktop/releases/download/v1.16.0/morphe-desktop-1.16.0-all.jar \
  -o tooling/lib/morphe-desktop-1.16.0-all.jar
./gradlew buildAndroid --no-daemon
```

The resulting bundle is under `patches/build/libs/`. The source does not include Airofit APKs, personal credentials, or signing material.

## License

GPL-3.0-only. See `LICENSE` and `NOTICE`.