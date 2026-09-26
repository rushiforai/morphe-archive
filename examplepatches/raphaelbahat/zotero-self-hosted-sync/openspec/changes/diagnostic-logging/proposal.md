## Why

The app's own log lines never reach logcat. It bundles Timber, but nothing plants a tree: `Timber.<clinit>` builds an empty forest and no call to `Timber.plant` exists in the release
build, so every `Timber.d/e/...` — including the whole attachment-upload path — is a no-op. When
a self-hosted server refuses an upload, the only traces left are HTTP-level ones, and the client's
own decisions (which attachments it queued, which it skipped and why) are invisible.

## What Changes

- A new patch, **Enable verbose logging**, **off by default**, that plants Timber's `DebugTree` so
  the app's existing log calls appear in logcat.
- It changes no behaviour and no network traffic; it is a diagnostics tool. Expect a lot of output.

## Capabilities

### New Capabilities

- `diagnostic-logging`: making the client's own log output observable on demand, without altering
  app behaviour.

### Modified Capabilities

- None.

## Impact

- `patches/src/main/kotlin/app/anondev/patches/zotero/diag/` — the new patch.
- Compatible with the same pinned target as the rest of the bundle; no extension code, no new
  dependency.
- Operators enable it explicitly (`-e "Enable verbose logging"`); it must stay off in normal use.

## Context

Recorded from the operator's own debugging session: three attachments (two created during an
earlier broken-metadata window, one created fresh) all failed to upload — only their metadata
reached the server. Device logcat showed **no** request to any attachment file endpoint
(`items/<key>/file`: authorize, upload, register) while metadata sync and the streaming WebSocket
were healthy, so the client never entered the file protocol. The client's own trace — which
attachment it queued and which it skipped, and why — is the missing evidence.
