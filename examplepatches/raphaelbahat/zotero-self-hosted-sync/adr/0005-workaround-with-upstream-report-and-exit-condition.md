# ADR-0005: Workarounds ship with an upstream report and an exit condition

## Status

Accepted

## Date

2026-09-24

## Context

The failures this bundle exists to fix are not all ours. Some are defects in the patched Zotero
Android client, and some are gaps in the sync server the operator runs (altero), which this project
neither owns nor deploys. The operator needs syncing to work now; the durable fix belongs where the
defect is.

A workaround with no recorded exit condition is how a bundle accumulates patches nobody can safely
remove: the reason it exists is only in the head of whoever added it, and the day upstream fixes the
defect, nothing says the patch has become dead weight. Conversely, reporting a defect upstream and
then leaving the operator blocked until it is merged helps nobody.

The specific failure mode to avoid on the reporting side: a speculative issue. In the session that
produced this record, four hypotheses about one banner were disproven before the two real causes
(an empty `md5`, and an upload authorization without an upload form) were pinned by evidence. An
issue that asserts a cause it cannot demonstrate costs the maintainer time and the operator
credibility.

## Decision

For every defect, do both, in this order:

1. **File it upstream** where the defect actually is — altero, or the Zotero Android client —
   stating only what has been demonstrated, with the exact code or response that shows it, and a
   suggestion for the fix. Do not file a hypothesis: if the cause is not pinned, keep investigating.
2. **Ship a local workaround** in this patch bundle at the same time, so the operator's setup works
   while upstream decides. Never leave the operator blocked waiting.
3. **Record the exit condition** so the workaround cannot outlive its reason: the revert path goes
   into the change's Migration Plan, and a task in the operator's own list names the same steps.
4. **Remove it once the fix is merged and released** — and only once it is *both*. In practice:
   disable the workaround and prove the path still works, delete the patch and its extension class,
   drop any compile-only dependency that existed only for it, rebuild, re-patch the pinned APK,
   confirm the package identity is unchanged, then archive the OpenSpec change.

Where no honest workaround exists (a diagnostic gap that cannot be patched cleanly), say so and file
the report alone rather than shipping something that pretends to fix it.

## Consequences

- The bundle carries patches that are explicitly temporary, each with a written reason and a written
  removal procedure, instead of a growing pile of unexplained special cases.
- Upstream reports are reproducible and specific, which is what makes a maintainer act on them.
- The operator's setup keeps working during the wait, which is the whole point of the bundle.
- The cost is bookkeeping: every workaround needs its exit condition recorded at the moment it is
  written, not later. That is cheap now and expensive afterwards.

## Worked example

`eseifert/altero#13` (the authorize response carries no `params`; the upload endpoint took only a raw
body) — reported with both gaps quoted from server code and client code — was accompanied by two
patches, **Accept upload authorization that carries no upload form** and **Send attachment uploads
as the file itself** (the temporary half, an OkHttp interceptor installed by replacing the call that
closes the client's chain). The revert path went into the change's Migration Plan, and the same
steps into the operator's task list.

It has since been carried out, which is the point of writing the path down. The maintainer confirmed
the diagnosis, fixed both gaps, and released them; the workarounds then came out in the order the
plan set: proven first by running with all three disabled and uploading a 2.5 MB file end to end
against the released server (authorize `200` with the form shape parsed, storage upload `201` with
the server verifying the length and digest it received, register `204`), then deleted along with the
compile-only dependencies they had brought in, and the change archived.

One workaround stayed, and the record is what makes that legible: `Recover attachments with an
unusable modification time` cannot be removed by the server fix, because serving `mtime` as `null`
still reads as an unusable string to the client's reader, which discards the attachment rather than
repairing it. It stays until the client handles that, and the patch's own description says it is a
workaround, so a reader of the bundle's tables cannot mistake it for a feature.
