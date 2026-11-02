# Gearslip music compatibility through Morphe patches

User-selected approach: ship app-specific patches in nl-morphe-patches; do not modify or publish a Gearslip fork. Use the supplied official Gearslip-release.apk (0.3.12-alpha, SHA256 4707eb8afbb77adda31d57a3c338760a0fe82ddae528bc0a584f670dd5cb49bd), and validate 0.3.31-alpha as well. Existing Gearslip DockedPlayer provides the requested map-plus-player appearance.

## Required changes

1. Gearslip player discovery: preserve a music player alongside an app's SETTINGS-only car template. Retain the settings tile with a distinct Settings label. Leave navigation/POI precedence and ordinary media/messaging behavior unchanged. Fingerprint actual shipped DEX; fail on incompatible layouts.
2. YT Music Gearslip support: validate 9.30.53 and 9.44.52. Add a narrow caller check using Binder calling UID and PackageManager ownership before server-flag or Android Auto-presence rejection; preserve checks for unrelated callers. Trace remaining browser eligibility gates and patch only those demonstrably blocking Gearslip. This is compatibility with an installed host, not unrestricted trust for any caller-supplied package string.
3. Separate Hide apps from drawer patch for Gearslip: comma-separated validated Android package names, default empty; extend built-in exclusions for discovered app tiles. Do not uninstall/disable apps or change account data. Keep built-in Settings reachable. Package-level filtering intentionally covers all tiles from that package.

## Validation and delivery

Build the bundle, apply patches with strict fingerprint validation to both Gearslip APKs and both available YT Music APKs. Verify behavior through actual patched DEX probes, including no-player cases, navigation precedence, unrelated-caller rejection and configured/empty hide lists. Phone preview must demonstrate artwork/metadata, play/pause and docking alongside a map for both music providers. A separate test APK may use a validation-only package rename to preserve official Gearslip and installed Morphe YT Music; retain evidence of any manifest-only test adaptations. Matching signing key is required before an in-place update; never uninstall account-bearing apps without explicit approval. After deleting the requested AVDs, the user explicitly authorized a fresh disposable emulator for further tests. No further phone interaction is permitted without a new request. Vehicle projection/audio remain unverified until a vehicle test.

Other approaches considered: Gearslip source changes (user declined maintaining/publishing a fork), modifying Waze's phone player (does not control host panel), and device component disabling (denied by Android; not a portable patch). All product changes stay in this bundle. No manual release-version changes. The user subsequently approved a dev prerelease followed by main; promote only these patch changes.
