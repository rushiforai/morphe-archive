# Codeberg migration

Canonical repository: https://codeberg.org/JohninNL/nl-morphe-patches

Preserve all original remote branches and tags, the exact Git author/committer identity, existing Morphe signing key and the stable/main and prerelease/dev channels. Leave existing local app edits untouched.

Delivery checklist:
- [x] Copy original remote refs and tags over authenticated SSH.
- [x] Enable Forgejo Actions, packages and releases; recover local signing/API secrets.
- [x] Mirror exact cached Morphe Maven dependencies to remove the GitHub Packages credential requirement.
- [x] Port CI, semantic releases, signed bundle discovery and documentation publishing.
- [ ] Run regression tests, build, independent review and Codeberg CI.
- [ ] Publish and verify the Codeberg source manifest, release asset and documentation.

The files under `.github/` preserve the original GitHub integration. Codeberg uses `.forgejo/workflows/` and `.forgejo/release.config.cjs`. App-scope and release-note checks stay shared.

Local verification: all 47 existing release/identity tests and seven Codeberg integration tests pass; all 426 Python checks pass (45 intentional skips); the Android bundle plus nine extension test suites build successfully; strict MkDocs/link checks validate 95 bilingual page pairs and 191 HTML files. The recovered raw Ed25519 seed matches the existing public source key.

GitGud is also authorized as a second independent destination. Codeberg is the release authority. Its mirror step uses a separately named GitGud token only at GitGud to replicate identical source heads/tags and trigger GitLab CI. GitGud copies the exact verified signed bytes into its own packages/releases and keeps channel metadata on a separate distribution branch; it does not create competing source release tags.
