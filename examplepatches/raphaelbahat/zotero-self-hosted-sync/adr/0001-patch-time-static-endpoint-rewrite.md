# ADR-0001: Rewrite the Zotero Android endpoints at patch time

## Status

Accepted

## Date

2026-09-24

## Context

The Zotero Android app compiles its API host and its streaming host into the build and
offers no runtime setting for another server, so a self-hosted server can only be reached
from a patched client. A Morphe patch bundle can either rewrite those compiled constants
while patching, or ship a runtime extension that changes behaviour once the app is running.
The operator chooses the server address in the patch dialog, so the value is known before
the APK is produced. The app receives its login/approval and attachment-upload URLs from the
server, so only two constants need to change.

## Considered Options

- **Patch-time rewrite** (chosen): the patch validates the operator's origin and replaces the
  compiled endpoint constants. No code executes inside the app, there is nothing to maintain
  at runtime, and the application's identity and class names are untouched.
- **Runtime extension**: could read a preference or re-resolve hosts while the app runs, but
  requires shipping extension code that executes inside the patched app and becomes a second
  thing to debug whenever sync misbehaves.
- **Redirection outside the patch** (proxy, DNS, VPN): requires infrastructure the operator
  must run, and cannot be distributed as a patch bundle.

## Decision

We will rewrite the endpoints at patch time. The patch normalises and validates the
operator's origin, then replaces the compiled endpoint constants — every `const-string` for
the API and streaming endpoints, and the `BuildConfig.BASE_API_URL` field initializer where
the release build carries one — so the rewrite is correct whether or not the Kotlin compiler
inlined the constant. No runtime code is added to the patched app.

## Consequences

- Positive: the patch is data-only; the app keeps its package identity and class names; an
  unusable address is rejected while patching instead of at runtime.
- Negative: changing the server address later means patching the APK again, and the bundle
  must declare compatibility per app version instead of adapting at runtime.
- Follow-up: the rewrite sites are enumerated from the release APK's smali before the patch is
  written, and re-checked whenever a new app version is targeted.
