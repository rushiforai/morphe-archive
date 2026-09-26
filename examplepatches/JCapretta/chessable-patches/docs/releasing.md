# Releases

Verification and releases run locally. GitHub Actions verification remains an
optional independent check; no Actions release job or permission to create PRs
is required. The local command uses the template's semantic-release generators.

Before the first release:

1. Pass the authenticated non-PRO acceptance procedure in [testing.md](testing.md).
2. Commit the sanitized results through a task worktree and `ship`. Remove the
   experimental warning and mark the compatibility target verified only after
   those results pass. Continue to state unavailable PRO testing honestly.
3. Create a dedicated `agent/release-<version>` worktree from `origin/main`.
   Validate the merged commit and record its full SHA in `E2E_VERIFIED_SHA` only
   after the acceptance checks pass. `task release` refuses a dirty worktree or
   any mismatch between HEAD, that SHA, and current `origin/main`.
4. With Java 21, Node 22.14 or newer, Python 3, jq, Task, and GitHub CLI available,
   run the commands below from that release worktree. The token needs access to
   Morphe's packages and permission to publish releases in this repository.
5. Inspect and commit the generated metadata on the release branch. Use `ship`
   to verify and merge its PR. No generated file is hand-edited.
6. Confirm
   `patches-bundle.json` refers to the published artifact and that Morphe can add
   `JCapretta/chessable-patches`, discover the patch, and apply it to the supported APK.

```sh
export GITHUB_ACTOR="$(gh api user --jq .login)"
export GITHUB_TOKEN="$(gh auth token)"
# Set JAVA_HOME to your installed JDK 21 if it is not already the default.
task verify
export E2E_VERIFIED_SHA='<full acceptance-tested main commit SHA>'
task release
unset GITHUB_TOKEN
```

The release command pushes only its dedicated branch and the release tag, then
uploads the versioned patch bundle. It never commits or pushes changes to main.
It leaves CHANGELOG.md, gradle.properties, patches-bundle.json, patches-list.json,
and README.md ready for the metadata PR. Local releases do not carry a GitHub
Actions build-provenance attestation. If publication fails, inspect the tag and
release assets before retrying; do not overwrite a partially published release.

Only source and patch bundles are published, never original or patched APKs.
Do not hand-edit generated metadata or CHANGELOG.md. Release automation owns those
files. Never force-push release tags or generated history. Address release issues
with a new release. Do not start another release before the metadata PR is merged.

Every new source commit requires updated acceptance evidence and its own verified
SHA before release. Development builds remain
downloadable as CI artifacts without representing a verified release.
