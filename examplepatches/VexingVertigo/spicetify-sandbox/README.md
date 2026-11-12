# Spicetify Android patches (unofficial hotfix)

> **Spotify 9.2.0.26: only `Clean sharing links` works.**
> Every other patch in this bundle still targets 9.1.80.2221 and will fail with an ABI exception on 9.2.0.26.
> On Premium, Clean sharing links is the only patch you need anyway.

---

## Install on 9.2.0.26

1. Add `https://github.com/VexingVertigo/spicetify-sandbox` as a source in Morphe Manager
2. Select Spotify 9.2.0.26
3. Enable **only `Clean sharing links`**
4. Patch

## Patch status

| Patch | 9.1.80.2221 | 9.2.0.26 |
|---|---|---|
| Clean sharing links | yes | yes |
| Hide Premium tab | yes | NO |
| Hide Home and Browse ads | yes | NO |
| Hide player ad cards | yes | NO |
| Spicetify extensions | yes | NO |
| Pin shortcuts on Home | yes | NO |
| Local files from a server | yes | NO |
| Theme colors | yes | NO |

## Why the other patches fail on 9.2.0.26

Spotify ships every build R8-obfuscated. Class names, method names, and internal structures change between minor versions. Patches that fail on 9.2.0.26 rely on bytecode snapshots of 9.1.80.2221 that no longer match.

`Clean sharing links` uses fingerprint-based matching (protobuf field names, method signatures) instead of a snapshot, so it survives minor version bumps without modification. Porting the rest is a real reverse-engineering job, not a version-string change.
