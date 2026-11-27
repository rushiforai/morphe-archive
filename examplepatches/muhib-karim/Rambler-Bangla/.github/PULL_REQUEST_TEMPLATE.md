## Summary

<!-- What does this change and why? Link the issue if there is one. -->

## Type of change

- [ ] Patcher (`standalone-patcher/`, `fingerprints/`)
- [ ] Policy runtime (`extension-src/`)
- [ ] Tests or fixture (`tests/`, `fixtures/`)
- [ ] Tooling (`scripts/`, `rename/`, `tools-src/`)
- [ ] Documentation or site (`docs/`, `README.md`)

## Testing

- [ ] `python3 -m unittest discover -s tests/python -v` passes
- [ ] `bash tests/run_tests.sh` reports `0 failed` (after `scripts/bootstrap_tools.sh` and `source tools/tool-env.sh`)
- [ ] Conversion changes come with input/expected fixtures that lock the behavior

## Checklist

- [ ] The patch stays fail-closed: a fingerprint, anchor or dataflow mismatch still aborts with no output
- [ ] No APKs, DEX files, keystores, signing keys, Google content, tokens or personal data are included
- [ ] Docs and `CHANGELOG.md` are updated if behavior changed
- [ ] I agree my contribution is released under GPL-3.0
