# AGENTS.md — project rules for coding agents

## Project
- What it is: Rambler Bangla, a source-only, fail-closed patch layer that keeps Gboard 18.3.1 voice typing in Bengali script.
- Stack: Python 3 smali patcher (`standalone-patcher/dex_patch.py`, stdlib only), pure-Java policy runtime (`extension-src/`),
  bash static suite on a synthetic APK fixture (`fixtures/`, `tests/run_tests.sh`), GitHub Pages site (`docs/index.html`).

## Commands
- Fast tests (stdlib only): `python3 -m unittest discover -s tests/python -v`.
- Static suite: needs the pinned toolchain (`scripts/bootstrap_tools.sh`); run it in CI (`.github/workflows/ci.yml`), not on a
  shared or memory-tight machine.

## Rules
- Read `docs/PROJECT_BRAIN.md` before changing anything; keep its Status and Next step current.
- Fail-closed is the product: a fingerprint, anchor or dataflow miss must abort, never guess.
- Never commit APKs, dex files, keystores, signing keys, Google content or phone diagnostics. Fingerprints stay hash-only.
- Patcher, runtime, fingerprint and signing changes need their own reviewed PR with fixtures; docs PRs never touch them.
- Small logical commits, CI green before merge, never force-push, never push to `main`.

## Memory
- `docs/PROJECT_BRAIN.md` is this repo's persistent memory. Update Status / Next step after each meaningful step and append a
  Session log line before you stop. Commit it with your work.
