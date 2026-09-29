# Contributing

Keep changes scoped to the supported original Chrome artifact. Do not widen compatibility based only on a successful build: fingerprints, native method descriptors and resource IDs must be validated against each shipped APK.

Use conventional commit messages. Pull requests should explain the user-visible result, exact Chrome version/device, and what was actually tested. Keep hook code in `patches/` and Android runtime behavior in `extensions/extension/`.

Run `bash gradlew buildAndroid` and device acceptance for changed flows. For UI changes, check both orientations, keyboard transitions, disabled settings and Incognito authentication. Never weaken private screenshots or authentication to make automation easier.

Do not commit APKs, extracted Chrome source/resources, browsing data, access tokens, signing keys, local SDK configuration or raw device logs. Release only the patch bundle and its metadata/checksums. Keep original source under the MIT license and retain third-party attribution.
