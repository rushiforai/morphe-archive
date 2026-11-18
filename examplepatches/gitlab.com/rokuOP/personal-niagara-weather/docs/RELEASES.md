# Release workflow

This is a GitLab port of Morphe's existing patches-template release.yml and
.releaserc, based on template revision e721536ab19e30d16ce9d31ae1830ca299aad383.
The workflow file is .gitlab-ci.yml because GitLab cannot execute GitHub Actions.

## What is retained

- Main stable releases and dev pre-releases.
- Semantic commit analysis and release notes.
- The template's changelog plug-in, with its MIT license and a pinned upstream revision.
- Automatic generated-file commits through @semantic-release/git.
- The template README generator and patch-list generator.
- Stable-to-dev backmerge and compilation checks when no release is due.

## GitLab and toolchain adaptations

- @semantic-release/gitlab replaces @semantic-release/github. MPPs and checksums are
  uploaded to the generic package registry and linked as permanent release assets.
- The changelog plug-in's GitHub-only repository parser accepts GitLab too. Its
  original offset-free UTC metadata timestamp is retained for Morphe compatibility.
- The template's discontinued gradle-semantic-release-plugin does not support
  Gradle 9. Its build/version steps are expressed in the existing
  @semantic-release/exec prepare command, following that plug-in's migration guide.
- Node 24, SDK image, Gradle wrapper, and public Morphe source revisions are pinned.
- The public-source composite build avoids requiring GitHub Packages credentials.
- Generated metadata is checked using Morphe's kotlinx-datetime parser before it
  can be committed or published.

## Project settings

The release job uses GitLab's short-lived CI_JOB_TOKEN. Enable Settings → CI/CD →
Job token permissions → Allow Git push requests to the repository for this project.
Only jobs in this same project may push; no personal token is stored. Run release
pipelines from dev/main in the upstream project, never from untrusted forks.
GitLab-hosted runners must be enabled and available for the account.

For stable releases, merge dev into main using a merge commit, without squash.
Keep main/dev history intact and do not force-push or alter published release tags.
No history is rewritten by this migration.

## Existing version migration

Version 1.0.2 was already distributed before semantic-release was configured. A
baseline v1.0.2 tag marks its existing source commit, allowing semantic-release to
continue with a higher version. It does not fabricate a new historical release.
The old snapshot stays available while the source changes over to release assets.
New release artifacts and generated-file commits are produced only by CI.

## Local checks

Run npm ci --ignore-scripts, then npm test. Build with buildAndroid and the public
source paths described in PUBLIC-SOURCE-BUILD.md. verifySourceMetadata validates
current metadata; release CI additionally checks that the version and permanent
asset URL match the pending semantic-release version.

A full verifyBundle run needs the exact original APK locally. That copyrighted APK
is never committed or uploaded to CI. Historical on-device tests are documented in
VERIFICATION.md; this migration changes publication rather than weather behavior.
