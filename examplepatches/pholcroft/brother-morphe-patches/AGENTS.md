# Project instructions

- Follow `RELEASING.md` for channel separation. Experimental changes go to `dev`; publish a stable patch to `main` only after the owner is happy with the tested version.
- Do not put packet captures, printer-specific snapshots, printer IP/MAC addresses, credentials, or other private data into the public repository.
- For each release, verify that the versioned bundle, `patches-list.json` and `patches-bundle.json` agree and that the intended channel serves them.
