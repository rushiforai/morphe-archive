# ADR-0003: Permit cleartext for the operator-supplied streaming host only

## Status

Accepted

## Date

2026-09-24

## Context

The application's network security configuration permits cleartext only for `arxiv.org`,
`home.arpa`, `local` and `www.zotero.org`, and the platform has blocked cleartext by default
since API 28; the pinned target reports targetSdk 35. The operator's self-hosted server serves
the synchronisation API over TLS (`https://altero.myhut.live/`) but serves the streaming
endpoint over plain WebSocket (`ws://altero.myhut.live/stream`), which the client's OkHttp
stack refuses for a host that is not allowlisted. The API and the streaming endpoint therefore
differ in scheme, and a single HTTPS origin cannot express the streaming address.

## Considered Options

- **Scoped cleartext exception** (chosen): the streaming address is an optional override; when
  its scheme is cleartext, the patch adds exactly that host to the existing cleartext allowlist
  in `res/xml/network_security_config.xml`.
- **Require `wss://` for streaming**: keeps every transport encrypted, but the operator's server
  does not serve the stream over TLS today, so live updates would fail and the change would not
  work for the deployment that motivated it.
- **Allow cleartext generally**: accept `http://` API origins and add exceptions for whatever is
  supplied; rejected because it weakens the API transport for no benefit — the API is already
  reachable over TLS.

## Decision

The API origin stays HTTPS-only. The streaming endpoint is an optional, operator-supplied
WebSocket URL; when it is cleartext, the patch adds that host — and only that host — to the
cleartext allowlist by editing the network security configuration at patch time. Nothing else
about the cleartext policy changes, and no host other than the supplied streaming host is added.

## Consequences

- Positive: the patch works with the operator's actual deployment while the API, the login flow
  and all attachment traffic stay encrypted.
- Negative: live-update traffic to that host is unencrypted and visible on the path, and the
  exception is one line of resource XML that a reviewer must be able to find in the patched APK.
- Follow-up: prefer `wss://` wherever the server can serve the stream over TLS; a later change
  can drop the exception once it does.
