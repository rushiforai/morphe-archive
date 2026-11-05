# v1.10.1 payload source

The smali directories are the editable source for the helper and native-method payloads in the published v1.10.1 MPP. They were recovered from the release DEX and checked by assembling and disassembling both payloads. The Java revision snapshots elsewhere in this repository record earlier versions.

Run the regular Gradle build with JDK 21 and the configured Android SDK and Morphe dependencies. The payload build uses Maven to resolve the pinned smali assembler. To build just the payloads, run `bash build-payloads.sh OUTPUT_DIR`. The original nicoid APK is needed only to apply the patch.
