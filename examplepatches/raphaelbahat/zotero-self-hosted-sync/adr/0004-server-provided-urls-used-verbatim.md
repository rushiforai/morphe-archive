# ADR-0004: A server-provided URL is opened verbatim

## Status

Accepted

## Date

2026-09-24

## Context

The Zotero Android client asks its API for a login session (`POST /keys/sessions`) and opens
the `loginURL` the server returns in a WebView. The client appends the literal `"&app=1"` to
that URL, which the original zotero.org service tolerated because its login URL already carries
a query string. A self-hosted server is free to return a queryless URL, and then the append
lands in the *path*:

| URL opened | Response from the operator's server |
|---|---|
| as the server returned it (`…/keys/sessions/<token>/login`) | `303` — the approval page |
| with the client's append (`…/login&app=1`) | `404` — "Not Found", an empty page in the WebView |
| with a corrected separator (`…/login?app=1`) | `303` |

The device reproduced the middle row: clicking sign-in showed a blank "Not Found" page.

## Considered Options

- **Open the returned URL unchanged** (chosen): the client's only job is to display what the
  server handed it; the server owns its URL shape and may add whatever query it needs.
- **Rewrite the separator** (`"&app=1"` → `"?app=1"`): correct for a queryless URL and wrong
  for any server that returns one, so it trades one deployment's bug for another's.
- **Change the server** to accept `/login&app=1`: fixes one server, leaves every other
  self-hosted server broken, and is outside this project's scope.

## Decision

The patch rewrites the appended literal to an empty string so the `loginURL` is opened exactly
as the server returned it. Absence of the literal in a target is tolerated and recorded — a
future client may stop appending — because the goal is the verbatim URL, not the rewrite
itself.

## Consequences

- Positive: account linking works against any server whose login URL is shaped differently from
  zotero.org's, which is the whole point of the change.
- Negative: the cosmetic `app=1` hint no longer reaches the login page; on zotero.org that hint
  only selects a web layout, and for self-hosted servers it was never meaningful.
- Follow-up: if a future client version constructs the URL differently, re-check the
  neutralisation during target confirmation (task 1.4) and note it in the task list.