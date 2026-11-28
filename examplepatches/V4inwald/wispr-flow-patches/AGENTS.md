# AGENTS.md — working contract for this repository

Read this before changing anything. If a request conflicts with a rule here, say so instead of
quietly picking a side.

## What this repository is

Source-only tooling and patches for one Android app: Python, Bash, and a small Java smali driver.
The application is never committed. Patches are declared as manifests and are checked on the
built artefact, not on the sources they were applied to.

## Non-negotiables

1. **No application artefact in Git.** No APK, DEX, jar, keystore, decoded tree. If a file is
   needed to build, it is fetched by `scripts/bootstrap.sh` and ignored.
2. **Every hook carries evidence.** The class, the method, the constant, the document that
   justifies them. A hook without a `why` is a guess.
3. **Anchors stay literal.** When a new version moves the code, re-derive the anchor; do not
   widen it or turn it into a pattern so it "still matches".
4. **Count what you inject.** A `callsite` hook states its exact `expect`; a mismatch fails the
   patch. Never lower the count to make a build pass.
5. **Verify the artefact, not the intent.** `scripts/verify_apk.py` reads the dex inside the
   built APK; a green pipeline that skips it proves nothing.
6. **Never weaken a test to make a build pass.** Say in the commit body why a test changed.
7. **No secrets, tokens, credentials or personal data** in code, docs, or commits.

## Layout and ownership

| Path | Layer |
|---|---|
| `README.md`, `WHY.md`, `DISCLAIMER.md` | what the project is, why the spoof is honest, what it does not do |
| `analysis/` | evidence; append, and correct in place rather than re-narrating history |
| `patches/<name>/` | manifest + README; both move together |
| `patches/src/` | the Kotlin patch the Morphe bundle is built from — same hooks, same `compatibleWith` |
| `scripts/` | pipeline; each stage fails closed |
| `tests/` | synthetic fixtures only — must run with no APK and no toolchain |

## Workflow

```bash
python3 -m unittest discover -s tests          # before every commit
scripts/build.sh /path/to/app.xapk             # before claiming a patch works
./gradlew buildAndroid                         # before claiming the bundle builds
```

A hook exists in two places by design: the JSON manifest drives the scripted pipeline, the Kotlin
patch drives the bundle. Change both in the same commit, and keep the `expect` counts and the
fingerprints equally strict.

Branches: `dev` is the working branch and publishes pre-releases; `main` only receives merged pull
requests and publishes stable releases. Never commit directly to `main`, never squash the merge.

Commits: Conventional Commits, imperative, ≤72-character summary, body explains why. `feat:` and
`fix:` cut a release; `chore:` and `docs:` do not.

## Reporting

Distinguish three states and never let one stand for another: **proposed** (written down),
**executed** (the command ran), **verified** (the result was read back). Device behaviour is the
one thing this container cannot observe — do not claim it.
