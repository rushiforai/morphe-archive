# Teams Integrity PoC — patch source

Trimmed, single-purpose fork of the Teams-related patches from
[rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches)
(GPLv3). Contains only:

- `teams/integrity/TeamsIntegrityBypassPatch.kt` — bypasses Teams' CodeTransparency
  DEX-hash check, the native OneAuth signing-certificate check, and MSAL's
  redirect-URI signature check. Unmodified from the upstream source.
- `teams/privacy/` — "Privacy Enhancements" patch (suppresses outbound read
  receipts / quiet-hours override). Pulls in the integrity bypass as a
  dependency. Unmodified from the upstream source.
- `shared/Constants.kt` — trimmed to just the Teams app-compatibility entry.
- `shared/BytecodeUtils.kt` — trimmed to just the `returnEarly()` overloads
  these two patches call, plus their direct dependencies.

Deliberately excluded: the "Unlock Teams" premium-unlock patch, and every
other app's patches from the upstream bundle (100+ unrelated apps).

Built with the same `app.morphe.patches` Gradle plugin / toolchain as
upstream — see `build.gradle.kts`. Output is a `.mpp` bundle, published as a
GitHub Release asset and referenced by the repo-root `patches-bundle.json`.

For internal lab/demo use only — see the parent repo's purpose.
