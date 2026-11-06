## Patch compatibility and fingerprints

- Keep each patch pinned to one supported app version; do not add legacy-version variants.
- Never fingerprint obfuscated/temporary class or method IDs (for example `Luf5;`). Match stable signatures and referenced APIs, and verify the match is unique against the target APK.
- Create or update the patch's `notes.md` with useful reverse-engineering findings, stable targets, and uniqueness evidence whenever changing app-specific patch behavior.
- Start commit messages with a capitalized infinitive verb; do not use type prefixes.
