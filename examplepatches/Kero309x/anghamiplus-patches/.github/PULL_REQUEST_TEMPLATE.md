## Description

Describe what this pull request changes and why. Link the issue it closes, for example `Closes #42`.

## Type of change

- [ ] `feat` — a new patch or a new user-facing option
- [ ] `fix` — a bug fix or a fingerprint correction
- [ ] `docs` — documentation only
- [ ] `refactor` — internal cleanup with no behaviour change
- [ ] `chore` — build, dependency or tooling maintenance

## Target

- App: Anghami `8.0.28` (`com.anghami`)
- Branch: `dev`

## Verification checklist

- [ ] `./gradlew build` completes without errors on my machine.
- [ ] I applied the affected patch to Anghami `8.0.28` with Morphe Manager and verified the behaviour described above.
- [ ] Fingerprints were checked against the target APK and still fail loudly if the bytecode changes.
- [ ] The pull request title follows Conventional Commits, for example `fix: correct the lyrics gate fingerprint`.
- [ ] Documentation was updated where needed, including the generated patch catalogue (`./gradlew generatePatchesList`).
- [ ] The change stays client-side and contains nothing unrelated to the description above.
