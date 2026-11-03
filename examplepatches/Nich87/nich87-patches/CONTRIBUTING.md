# Contributing

Develop on `dev` and target that branch with patch changes. Read
[DEVELOPMENT.md](DEVELOPMENT.md) for setup and the release process.

- Use `feat:` for features, `fix:` for fixes, and `chore:` for maintenance.
- Include the target app package, exact original app version, file type and
  reproduction steps in bug reports. Include relevant logs with secrets and
  personal information removed.
- Build the Android `.mpp` and load it with Morphe Desktop. Changes to actual
  app behavior also need testing against the declared target APK; report
  patching, installation and runtime results separately.
- Keep APKs, credentials, private signing keys and generated release metadata
  out of contributions. Preserve `LICENSE` and `NOTICE`.
- The `dev` to `main` release merge preserves commits; do not squash it.
