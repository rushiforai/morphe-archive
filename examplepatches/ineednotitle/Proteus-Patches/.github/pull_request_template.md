## Summary

Describe the problem and the change.

## Type of change

- [ ] Bug fix
- [ ] New patch or app support
- [ ] Patch improvement
- [ ] Documentation or tooling

## Verification

- [ ] `./gradlew :extensions:extension:testDebugUnitTest :patches:generatePatchesList`
- [ ] `.github/scripts` unit tests pass
- [ ] Bundle verification passes for the built `.mpp`
- [ ] Patch application tested with Morphe Desktop `--validate`
- [ ] Device behavior verified, or explicitly noted as unverified

Describe any app/version and device testing here.

## Checklist

- [ ] New heuristic or disruptive patches default to off.
- [ ] Compatibility and target versions are scoped correctly.
- [ ] Extension classes are registered in the bundle verifier when needed.
- [ ] Documentation is updated for behavior or limitation changes.
- [ ] No credentials, personal data or generated build artifacts are included.

## Related issues

Closes #
