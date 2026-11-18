# Contributing

## Before you start

This project is built clean-room. Read `docs/provenance/CLEAN_ROOM.md` first;
contributions that are not derived from the stock application will be rejected
regardless of quality.

In short:

- Do not copy code, comments, identifiers, fingerprints or helper functions from
  any other patch collection, including ones under the same licence.
- Do not add another patch project as a dependency.
- Describe the behaviour in a spec before writing the patch.

## Workflow

1. Open an issue describing the behaviour, or pick an existing spec.
2. If the behaviour has no spec, add one under `docs/specs/<application>/` using
   `docs/specs/TEMPLATE.md`.
3. Derive the code points from the stock build and add a row to
   `docs/provenance/LOG.md`.
4. Implement the patch. Split it into `Spec`, `Fingerprints` and `Patch` files.
5. Add match assertions. A patch that can match zero or several candidates is
   incomplete.
6. Verify on a device with a patched build and update the spec status to
   `verified`.
7. Open a pull request against `main`.

## Commit messages

Use a conventional prefix so the history is readable:

- `feat(anghami): ...` for a new behaviour
- `fix(anghami): ...` for a correction
- `docs: ...`, `build: ...`, `chore: ...` otherwise

## What will not be merged

- Code copied from another project, even partially.
- A patch without a spec or without a provenance entry.
- A new dependency without a written justification in the pull request.
- Edits to build outputs such as `patches/build/libs/*.mpp` by hand.
- Behaviour that is described as server-side when it is client-side, or the
  reverse.

## Making a release

Releases are made from `main` by the maintainer. The version in
`gradle.properties` is bumped in its own commit, and the release workflow
publishes the bundle. See `docs/architecture/release.md`.
