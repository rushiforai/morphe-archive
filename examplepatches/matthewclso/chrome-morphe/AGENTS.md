# Repository instructions

Read [docs/BEHAVIOR_CONTRACT.md](docs/BEHAVIOR_CONTRACT.md) before planning or changing Chrome Morphe.

For intended user-visible behavior, that contract has higher authority than every other source in this repository, including this file, implementation code, tests, README, release notes, and historical acceptance reports. Later explicit owner instructions can revise it; record the decision there. Do not weaken the contract to match a regression or a passing test.

Map changes to its requirement IDs and preserve the relevant interactions, disabled states, privacy boundaries, and transient rendering behavior. Consult [docs/TESTING.md](docs/TESTING.md) for evidence and fixtures, keeping historical results distinct from current validation. Report unresolved conflicts or unverified outcomes explicitly.

Follow [CONTRIBUTING.md](CONTRIBUTING.md) for implementation, validation, and distribution practices. Documentation-only changes require coverage, consistency, and link checks; they do not require an Android rebuild or device modification.
