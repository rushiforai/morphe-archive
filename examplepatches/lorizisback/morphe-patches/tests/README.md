# Curve patch checks

The release bundle supports Curve Pay (`com.imaginecurve.curve.prd`) only. The template test app, Example Patch and sample runner have been removed.

- [Bytecode regression probes](../docs/curve-hide-flex.md#test-the-actual-curve-bytecode) cover Flex filtering, telemetry, signing checks, atomic settings, tile selection and plain-language copy.
- [Native Patches screen instrumentation](curve-screen/README.md) covers the real Curve controls, state restoration, cancellation, saving, relaunch and all seven copy locales.
- `python3 tests/check_remove_cringe.py` checks the copy catalog against extracted Curve 5.63.0 resources.

Run Android checks only on the dedicated, signed-out `morphe_sample_api36` emulator. The AVD name remains unchanged. Keep original APKs, generated binaries, logs and signing keys out of Git.
