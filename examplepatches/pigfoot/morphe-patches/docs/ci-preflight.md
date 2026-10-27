# CI/CD gate for pushes and pull requests

## Before a push or PR creation/update

1. Inspect the intended diff, branch, target repository and current remote head.
   Record the validation scope before making changes. Run `git diff --check`.
2. For patch source, tests, Gradle, dependencies, compatibility metadata, scripts
   or workflow changes, pass the corresponding CI-equivalent checks before push:
   - Java 21 and Android SDK 36;
   - `npm ci --include=dev` and `npm test`;
   - `./gradlew :patches:test :patches:buildAndroid :patches:generatePatchesList --no-daemon`;
   - applicable clean-input APK applications, preservation checks and fail-closed
     rejection cases when app bytecode or manifest policy changes.
3. A documentation-only diff may use documentation validation: review the diff,
   check referenced files/links and ensure no executable, dependency, generated
   metadata or workflow file changed. Record why a new code test run is not needed.
   This exception does not waive post-push CI/CD verification.
4. Fix failures and repeat affected checks. Do not push known-failing code, open a
   knowingly failing PR or weaken checks just to obtain a green result. If local
   tooling/dependency access prevents preflight, report the exact missing check
   and use an explicitly agreed validation route; do not silently claim a pass.

## After every push

- Read back the remote/PR head SHA. Await both Verify and Release/build for that
  exact SHA; pending, cancelled, skipped-required and failed checks are not success.
- Inspect failures, fix their root cause, and repeat preflight before another push.
- Check test results and expected bundle/catalog artifacts, not just workflow names.
  A successful semantic-release step that publishes nothing on a feature branch
  is not itself proof that the bundle was built.
- Bind APK qualification to the official tested bundle hash. If a documentation-only
  head produces another bundle, establish exact artifact or all-entry content
  equivalence before carrying forward bytecode/APK results; record both source
  SHAs and hashes rather than relabelling old evidence as a new execution.
- Do not declare the PR complete/merge-ready until the new-head checks and required
  qualification pass. Device verification remains a separate acceptance boundary.

## Merge and publication

Merge only within explicit user authorization, without bypassing required checks.
After merge, verify the resulting main-branch workflow, expected release/catalog
and artifacts. Do not infer successful publication merely from a merge or tag.
