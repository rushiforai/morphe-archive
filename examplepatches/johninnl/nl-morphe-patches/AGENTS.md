# Repository instructions

## HARD REQUIREMENT: johninnl identity only

- Use exactly `johninnl <349981574+johninnl@users.noreply.github.com>` for **every Git author and committer**, on every branch and tag history, including generated release commits, merges, cherry-picks, and amended commits. Never create or retain commits under another person, automation account, or bot identity.
- Do not add `Co-authored-by` trailers or commit-message attribution identifying another author. Do not introduce the previous personal identity into repository files, commit metadata, or release metadata.
- Before each commit or push, verify the active GitHub login with `gh api --hostname github.com user --jq .login`; it must be `johninnl`. Verify the effective author and committer with `git var GIT_AUTHOR_IDENT` and `git var GIT_COMMITTER_IDENT`, including environment overrides. Run `node .github/scripts/verify_identity.cjs --local` to check authentication, effective Git identity, and all reachable commit history.
- Authenticate every push and release as `johninnl`. Use the account's HTTPS Git credential for local pushes. Configure `JOHNINNL_RELEASE_TOKEN` as a repository Actions secret holding a token owned by `johninnl` with the repository permissions needed to push release commits/tags and publish releases. Release checkout and semantic-release both use this token; do not substitute a bot token or deploy key.
- Keep Dependabot version-update configuration disabled. Update dependencies under the required identity; security alerts may remain enabled.
- Treat these as mandatory requirements, not optional preferences. Preserve existing work when repairing identity history; do not silently bypass a failed identity check.

## Project workflow

- Publish stable releases only from `main`; `dev` publishes development prereleases. Promote unapproved app changes to `main` only after user confirmation. `.releaserc` owns release version selection and generated release files. Do not manually bump release versions.
- Preserve the source-based release-note and Morphe app-scope guards. Declare affected apps with `Release-Apps` when shared patch changes require it.
- Run `node --test tests/test_release_branding.cjs tests/test_preview_release.cjs tests/test_identity.cjs` after release automation changes. Run `python3 -m unittest discover -s tests` for Python regression checks; use the release workflow's Gradle checks for Android changes.
- CI audits checked-out history; release automation also verifies the token owner and effective Git identities before publishing. These checks do not enforce local operations unless run, and cannot stop an already-authorized direct push before it reaches GitHub. Follow the identity requirements for every operation.
