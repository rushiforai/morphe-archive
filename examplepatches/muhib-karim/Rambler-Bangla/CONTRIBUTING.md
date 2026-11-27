# Contributing

Thanks for helping. A few ground rules keep this project safe to use. Please
also read the [Code of Conduct](CODE_OF_CONDUCT.md).

## Where to start

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) explains the patcher
  pipeline, the policy runtime and the CI suite.
- [`docs/USER_GUIDE.md`](docs/USER_GUIDE.md) shows how the tools are run
  end to end.
- Bugs and ideas go in [issues](https://github.com/muhib-karim/Rambler-Bangla/issues/new/choose).
  Security problems go to the private form described in
  [`SECURITY.md`](SECURITY.md).

## Before you open a pull request

1. Run the fast unit tests (standard library only):

   ```bash
   python3 -m unittest discover -s tests/python -v
   ```

2. Fetch the toolchain and run the static suite:

   ```bash
   bash scripts/bootstrap_tools.sh
   pip install androguard==4.1.4
   source tools/tool-env.sh
   bash tests/run_tests.sh      # expect "22 passed, 0 failed"
   ```

   CI runs the same steps on every push and pull request.
3. Keep changes small and targeted. The patch is fail-closed on purpose:
   a fingerprint mismatch must abort, never guess.
4. Conversion changes need fixtures: add input/expected pairs so the
   behaviour is locked by a test.
5. If you change `data/loanspell/overrides.tsv`, regenerate the Java with
   `data/loanspell/gen_java.py`; a unit test checks the two stay in sync.
6. Update the docs and [`CHANGELOG.md`](CHANGELOG.md) when behaviour changes.
   The pull request template has a short checklist.

## What not to commit

- APKs, dex files, keystores or signing keys (`.gitignore` blocks the common
  ones).
- Google or third-party app content. The test fixture is synthetic for
  this reason. Fingerprints are stored as SHA-256 hashes, never as the full
  strings.
- API keys, tokens, or personal data, including diagnostic logs from a phone.

## Licence

By contributing you agree your work is released under GPL-3.0, the
project licence (see `LICENSE`).
