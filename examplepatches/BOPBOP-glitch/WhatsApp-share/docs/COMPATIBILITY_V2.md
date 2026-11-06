# Compatibility-Only Development

This branch changes **no patch features or behavior**.

Its purpose is only to improve build and version compatibility around the existing patch set.

## Rules

- Keep the patch set identical to `main`.
- Do not add, remove, enable, disable, or alter patch behavior.
- Keep all existing defaults unchanged.
- Validate that the generated Morphe bundle contains DEX.
- Validate that every existing patch still targets `com.whatsapp`.
- Add WhatsApp versions only after build-time and device testing.
- Treat an untested WhatsApp version as unsupported.

## Current target

- Package: `com.whatsapp`
- Declared version: `2.26.27.4`
- Status: experimental until real-device testing is completed.

Compatibility work must not be described as anti-ban protection. Platform-side enforcement cannot be guaranteed by a patch bundle.


## Patch versioning

Development builds use SemVer prerelease numbers.

- Current development series starts at `1.0.5-dev.1`.
- Every development update increments only the final counter:
  `1.0.5-dev.1` → `1.0.5-dev.2` → `1.0.5-dev.3`.
- When the compatibility milestone is approved, the same series is promoted to `1.0.5`.
- The next development cycle then starts at `1.0.6-dev.1`.

This keeps the version valid for Gradle, GitHub releases, and semantic-version tooling.
