# Contributing

Thanks for taking a look.

- Open an issue for a bug or a feature request; the templates ask for what is needed.
- Keep pull requests small and about one app version.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):
  `feat:` adds a patch or a capability, `fix:` corrects an existing one, `chore:` changes
  nothing user-facing.
- `feat:` and `fix:` commits on `main` publish a release on their own. Anything else, and every
  pull request, only has to compile.
- Every patch declares the app versions it was verified against. When you add a version, say in
  the pull request which APK you tested and what the result was.
- Patch code anchors on data that survives obfuscation (a preferences file name, an
  unobfuscated class). Avoid matching obfuscated class or method names: they change every release.

## Releases

`feat:` and `fix:` commits on `main` publish a release through `.github/workflows/release.yml`,
which builds `patches-<version>.mpp` and attaches it to the GitHub release. Keep `dev` equal to
`main` unless you are cutting prereleases, or the release job's backmerge step conflicts.
