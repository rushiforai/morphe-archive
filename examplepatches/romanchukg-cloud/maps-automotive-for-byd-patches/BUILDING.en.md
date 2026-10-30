# Build the Morphe TEST preview 10 bundle

The self-contained source tree has **19 patch Java files** (15 Maps +4 Google), **102 owned runtime Java files** (93 Maps +9 Google), seven car icon images in `assets/vehicle-icon/` (our own rendering of a CC0 model) and the 3D car in `assets/navatars/` (an adapted CC BY-NC-SA 4.0 model with our own rig; its licence file is next to it). See NOTICE. It builds one `.mpp` containing two app-specific patches without an original APK, account, signing key or device. It neither installs anything nor contacts a server.

Requirements: Python3, JDK17+ on PATH (**JDK 21** reproduces the published SHA-256 byte for byte; other javac versions produce different bytes), Android SDK platform35 and build-tools36.0.0, and Morphe Desktop1.18.1 all-JAR, SHA-256 `1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b`.

```sh
python3 build.py \
  --sdk /path/to/android-sdk \
  --cli /path/to/morphe-desktop-1.18.1-all.jar \
  --out /path/to/new-output-directory
```

The output directory must not exist. Outputs include `maps-automotive-for-byd-morphe-preview.10.mpp`, SHA256SUMS, BUILD.json and a build log. The builder runs the 71 recovery,25 stalled-recovery,301 Google provider/routing,17 Live-state,21 voice-state,86 focus-lifecycle,45 short-link and 27 Send to car checks before packaging. The bundle includes their test source, patch/runtime Java source and GPL/upstream notices. `extensions/aaos.mpe` uses minAPI29; the independent `extensions/gsa.mpe` uses minAPI32. These runtime modules are byte-identical to the tested Maps55J and Google20 modules when built with the verified toolchain. ZIP metadata and member order are fixed; exact reproduction needs the same JDK/build tools.

The bundle carries only our implementation. No Google APK, Google implementation classes, keys or account material are supplied. The app targets and input hashes are in [GEMINI-BUILD.en.md](GEMINI-BUILD.en.md). Apply only the patch for the selected app; retain original-input/version/signature checks. Sign resulting apps with your own consistent **same key**, separately from this bundle build.

`known_bev` stays OFF by default. Enable it only for a confirmed battery electric vehicle/CCS2 test setup; it does not choose capacity, enable the reader or invent charge/range. PHEV profiles do not enable a combined fuel/energy model.

Maps preserves `patch-lab.54-maps2610`; Google preserves `GSA-LAB.20` metadata for traceability. The public release identifier is preview 10; these internal markers do not imply a newer app version or enable diagnostics uploads/legacy APK OTA. [BYD/Gemini setup](GEMINI-SETUP.en.md).
