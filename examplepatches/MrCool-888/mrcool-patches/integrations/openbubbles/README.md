# OpenBubbles bridge build

This isolated build owns the phone transport, protocol, Java patch helpers, and host-linkage audit.
It uses the tested Android Gradle Plugin 8.9.2 / Kotlin 2.1.20 toolchain with JDK 17, Android SDK 35,
build tools 35.0.0, and Python 3. The top-level patches template uses JDK 21 independently.

Supply your own native OpenBubbles **2.0.0, version code 20002293, ARM64** base APK for the current patches. The version name alone is insufficient; build 20002289 is an earlier target and is not supported by the current source. Verify the base APK SHA-256 is
`340e8a7ecc6e8bfe07e3c563c4212e9dc481f1dad9e8ad5188e24066bb128253` before deriving the fixture.
Use dex-tools 2.4 `d2j-dex2jar` against that base APK to generate a class JAR, then
`d2j-class-version-switch 8 input.jar work/openbubbles-classes-v52.jar` to produce `work/openbubbles-classes-v52.jar`.
The verified local fixture SHA-256 is `188711da1d45c04cb5fb9d15b58f8cdcb8ca60a38cca299e3e92caa66a17511a`.
Archive byte hashes can differ if a converter embeds different ZIP timestamps; validate the original APK
and use the same converter/options when reproducing the recorded fixture.
These files are compile-only, ignored developer inputs. Do not commit or upload them with this project.

Run the tests and build commands in the repository README. `prepare-embedded.py` chooses only missing
dependency classes and rejects host/platform class overlap, unresolved members, conflicting definitions,
and unsupported resource integration. The stock classes are never merged into the MPE.
The template build uses the checked-in MPE and checks its source digest and checksum.
After any bridge/protocol/build-source change, rebuild and run `python verify-extension.py --refresh`.
The full Android helper tests require the local host fixture; ordinary CI runs the patch-structure tests,
earbuds harness, source-lock check, and Python audit tests without that fixture.

The `protocol` module is the same v4 contract as OB-wearos. Synchronize both copies on wire changes.
