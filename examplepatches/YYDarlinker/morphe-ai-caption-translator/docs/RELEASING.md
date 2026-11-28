# Release process

The [validation workflow](../.github/workflows/validate.yml) checks changes before release. The [PR helper](../.github/workflows/open_pull_request.yml) runs manually on `dev` and opens a PR to `main`. For an authorized release, manually run [Release](../.github/workflows/release.yml) on `main` after the changes land.

1. Complete [local verification](DEVELOPMENT.md) and the intended [compatibility checks](COMPATIBILITY.md). Review the exact source, public documentation and version decision.
2. Use the rules in [`.releaserc`](../.releaserc). Check breaking commits with the locked analyzer and a `BREAKING CHANGE:` footer. Custom type rules can take precedence over the default breaking-change rule.
3. The release workflow uses semantic-release to set the release identity, regenerate metadata, verify the package and publish the MPP. The MPE is embedded. Keep the changelog, manifests and generated README patch table under the release workflow's control.
4. Verify the published tag, asset hash, provenance and anonymous Manager source metadata. Keep past release assets and signing material available for rollback.

Candidate verification checks published metadata while building a local package. Release verification requires matching generated metadata and an exact release identity.
