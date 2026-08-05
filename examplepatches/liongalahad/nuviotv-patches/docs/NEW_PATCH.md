# New patch workflow

1. Run `scripts/new-patch.ps1 -Id <kebab-id> -Category <category> -Name '<Morphe name>'`.
2. Complete the generated patcher, extension, `patch.json`, README, test plan, and porting notes. Do not delete unused compartments; explain why they remain empty if no extension is needed.
3. Add exact official asset URLs and SHA-256 values. Never use mirrors or upload APKs.
4. Derive structural fingerprints from the declared target. Every fingerprint must match exactly once; record the rationale in `PORTING_NOTES.md`.
5. If configurable, depend on `settingsHubPatch`, add patch-specific metadata in its resource dependency, and store preferences under a stable namespaced key in `morphe_patches`.
6. Add unit tests for default/OFF behavior, positive/negative behavior, malformed inputs, immutability, persistence, and Android object preservation where relevant.
7. Run build, isolated application, post-patch inspection, TV AVD checks, and real-device validation.

A compartment is incomplete while any generated `TODO` remains. Do not declare a new Nuvio version compatible merely because the APK patches successfully.
