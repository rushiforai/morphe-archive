# ADR-0002: Keep the target application's package identity

## Status

Accepted

## Date

2026-09-24

## Context

Some patched clients rename the target package so a patched build can be installed beside
the original. This bundle patches the Zotero Android app so it can synchronise with the
operator's own server. The app's own identifiers appear in stored data and in URIs the client
parses (related-item URIs, citation links), and the operator asked for the patched app to
replace the installed app rather than appear as a second application. The requirement was
stated explicitly during grilling and is recorded as a spec requirement.

## Considered Options

- **Keep the original package identity** (chosen): the patched APK installs as
  `org.zotero.android` with the original version code; verification compares the patched
  manifest against the original's.
- **Rename the package** (for example a `.patched` suffix) so both builds coexist: rejected by
  the operator, and it puts the app's own URIs and stored identifiers out of step with the
  package the system and other components expect.
- **Ship under a second application id with separate data**: rejected for the same reasons,
  plus a second data directory and account state to maintain.

## Decision

The patch will replace endpoint string constants only. It must not rename the package, the
application id or the version code, and must not rename, remove or repackage any application
or library class; no patcher facility that renames or re-namespaces the application may be
used. Verification asserts that the patched APK's manifest reports the same package name and
version code as the original.

## Consequences

- Positive: the patched build updates the installed app, and the app's internal URIs and
  stored identifiers stay valid.
- Negative: the patched build cannot be installed beside the store build, and installing it
  over a Play-signed app requires uninstalling first because Morphe re-signs with the
  operator's keystore — documented rather than worked around.
- Follow-up: the identity check is part of the verification for every app version this bundle
  targets.
