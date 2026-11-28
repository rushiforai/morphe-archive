# Contributing

Thanks for looking at this. The project is small, so the rules are short — but they are
enforced by the tooling, not by good will.

## Ground rules

* **Never commit application artefacts.** No APK, no DEX, no decoded resources, no decompiled
  app source. `.gitignore` blocks the usual extensions, but check `git status` before committing.
* **Never commit a signing key.** Keystores are generated locally by
  `scripts/bootstrap.sh --keystore`.
* **Patch what you can prove.** A hook must be justified by evidence under `analysis/`: the
  class, the method, the constant, and how it was found. "It looked right in jadx" is not
  evidence.
* **Never loosen a hook to make a new version pass.** An anchor that no longer matches is
  information: the target moved. Re-derive it, keep it literal, and bump `compatibility.version`.

## Commits

Commits are the unit of review, so they are expected to be atomic and self-contained: the
repository must build and its checks must pass at every commit, not only at the tip.

```
<type>(<scope>): <summary>

<body: what changed and why, in the imperative>

<footer: evidence, e.g. "Evidence: analysis/wispr-flow-2.6.2.md#44-the-licensing-chain">
```

Types: `feat`, `fix`, `docs`, `build`, `test`, `refactor`, `chore`, `ci`.

Examples:

* `feat(patch): spoof the install source so the app starts`
* `build: refuse a base APK whose splits are missing`
* `docs(analysis): reconstruct the gRPC transcription protocol`

## Pre-commit checklist

1. **Syntax** — `python3 -m compileall scripts analysis/tools tests`, `bash -n` over the scripts.
2. **Unit tests** — `python3 -m unittest discover -s tests`.
3. **Patch round trip** — the patch applies, refuses to apply twice, and `--revert` restores the
   original bytes.
4. **No stray artefacts** — `git status --short` shows only intended files.
5. **Documentation** — a new or changed patch updates its README and the `analysis/` section it
   rests on, in the same commit.

## Adding a patch

1. Write the evidence down in `analysis/`.
2. Add `patches/<name>/patch.json` and a README: what it changes, why, how to verify it.
3. Add a test that proves the hook applies, and one that proves it fails safely when the target
   is absent or the site count is wrong.
4. State in the README whether the patch can be left out of a build.
5. If it is meant to be shipped to users, port it to the Morphe bundle.
