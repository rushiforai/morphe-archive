# Validation for v1.0.1

- Five unit tests pass: both checks, shifted instructions/later date, changed date logic, missing warning, and already-patched input.
- Morphe Desktop 2.2.0 (Patcher 2.4.0) loads the built `.mpp`, discovers exactly one patch, and patches the supplied original regional 10.8 ARM64 APK with fingerprint validation enabled.
- Independent dexlib2 disassembly confirms exactly two opcode changes in `ActivityMain.onCreate`: `if-nez` to `goto/16` at method code-unit 0x4c, and `if-eqz` to `goto/16` at 0x87. These offsets describe the tested input, not the matching algorithm.
- Morphe STRIP_FAST mode moves the modified class into a new DEX. The original DEX has that class stripped. Other retained code/resources/native libraries are unchanged at the archive-entry level.
- The bundle contains JVM patch classes and Android `classes.dex`, so it is packaged for both Desktop and Manager.
- No APKs, reader content, app signing keys, or access tokens are distributed.
- On-device import and application launch have not been tested.
