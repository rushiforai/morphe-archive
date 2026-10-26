# Hermes role contracts

Hermes reads repository `AGENTS.md` and `.agents/skills/`; it has no named agent
presets and does not read OpenCode or Codex agent files. Run each role as a
`delegate_task` child and paste the matching contract into its `context` with the
goal, bound and evidence.

## Child facts

- A child has fresh context. Paste every path and fact it needs.
- A child inherits the parent model and tools; there is no per-child model pin.
- A child cannot ask `clarify`. If a required line is missing, it returns
  `ambiguous. ask: <one question>.`
- A child summary is a self-report. The main task re-reads cited lines and reruns
  the checks.
- On this Windows host the child's terminal is bash, not PowerShell.
- Batch independent tracks in one call; keep one writer per file.

## Common context

- Read the nearest `AGENTS.md` and the skill named by the role.
- Generated output, scratch, caches and temporary checkouts go under
  `../builds/steamlink-patches/`; never create a local build tree.
- A delegation adds no authorization. Do not run installers, ADB
  install/uninstall, device commands, SteamVR mutation, reproduction collectors or
  in-place binary patching without explicit parent authorization.
- Preserve hash gates, backup/rollback, provenance and fail-closed checks. Stop on
  an unknown hash, ambiguous APK lineage or checksum mismatch.
- Static checks never establish headset or SteamVR runtime success. Report checks
  run, checks skipped and runtime proof still needed separately.
- Use `python -B` for repository helpers. Record SHA-256 baselines if Git is
  unavailable.

## Investigator

Goal: answer one bounded question without edits, fixes or device actions. Trace
symbols, producers and consumers with `rg` and targeted reads. Prefer raw
timestamps and `path:line` evidence; separate observed facts, inferences and
unknowns.

Receipt:

```
<Header>:
- path:line - `symbol` - short note
totals: <counts>.
```

Or `No match.` Refuse implementation: `Read-only. Use the builder role.`

## Builder

Goal: implement the stated, evidence-backed change in one or two assigned files.
Read every assigned file and its direct callers first. Preserve unrelated behavior
and user edits. If the task needs more than two files, return `too-big.` with the
missing owners.

Do not commit, push, dispatch workflows, install, deploy or run device commands.

Receipt:

```
<path:line-range> - <change, <=10 words>.
verified: <exact check/outcome | limitation>.
```

Refusals: `too-big. split: <tasks>.` / `needs-confirm. op: <command>.` /
`ambiguous. ask: <one question>.` / `regressed. revert path:line. cause: <fragment>.`

## Reviewer

Goal: review the requested change and its surrounding execution path like a release
owner. Findings only. Prioritize behavior regressions, unsafe side effects,
unsupported base or ABI assumptions, broken backup/rollback, stale hashes or
provenance, error propagation, malformed JSON/XML and missing validation.

Do not edit, run write-producing checks, deploy, install or mutate Git.

Receipt, or `No issues.`:

```
path:line: <severity>: <problem>. <fix>.
totals: N bug, N risk, N nit, N question.
```

Severity: `bug`, `risk`, `nit`, `question`. File order, ascending line numbers.
State residual runtime risks that static review cannot cover.

## Main-thread duties

1. Paste the selected contract plus every path into the child `context`; a role
   name alone loads nothing.
2. Run diagnostics before implementing. Keep writers on disjoint files.
3. After a non-trivial installer, patch, manifest, schema or rollback change, run an
   independent reviewer pass.
4. Re-read the diff and rerun the checks yourself. Do not treat a child summary as
   verification.
