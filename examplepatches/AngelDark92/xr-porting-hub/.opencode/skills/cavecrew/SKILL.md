---
name: cavecrew
description: >
  Decision guide for delegating to caveman-style subagents. Tells the main
  thread when to spawn `cavecrew-investigator` (locate code), `cavecrew-builder`
  (1-2 file edit), or `cavecrew-reviewer` (diff review). Subagent output is
  compressed so the tool result costs less main-context budget.
  Trigger: "delegate to subagent", "use cavecrew", "spawn investigator/builder/reviewer",
  "save context", "compressed agent output".
---

# cavecrew

Three subagent presets with compressed output. Use them to keep the main context
small; the parent still owns verification and commits.

## Call contract

Every call states all five lines. If one is missing, the role returns
`ambiguous. ask: <the missing line>.`

1. **Role** - `investigator`, `builder` or `reviewer`.
2. **Goal** - one answerable question or one stated change.
3. **Bound** - exact files or directories; nothing outside them.
4. **Evidence** - the symptom, log line, failing check or diff to start from.
5. **Write authorization** - `read-only`, or the exact files a builder may edit.

## Roles

- **Investigator** - reads `AGENTS.md`, loads the matching skill, traces symbols
  and callers, returns `path:line` evidence plus what it ruled out. Read-only.
- **Builder** - reads the assigned files and their direct callers, makes only the
  stated change, re-reads the edited lines, runs the agreed focused check, returns
  the changed range and outcome. One or two files.
- **Reviewer** - reads the changed path and every directly affected consumer,
  reports only concrete defects with a fix, finishes with severity totals. Read-only.

If a task exceeds its contract, the role stops with a terminal token:
`too-big.` / `needs-confirm.` / `ambiguous.` / `regressed.`

## When to use

| Task | Use |
|---|---|
| Locate a definition, caller or use | `cavecrew-investigator` |
| Same plus architecture commentary | built-in `explore` |
| Surgical edit, one or two files, scope obvious | `cavecrew-builder` |
| New feature, three or more files, cross-cutting refactor | main thread or `general` |
| Review a diff, branch or file | `cavecrew-reviewer` |
| Deep review with rationale and alternatives | main thread or `general` |

Most common chain: investigator returns sites, main thread gives one or two paths to
the builder, reviewer audits the diff. Spawn two or three investigators in parallel
for different angles. Do not use a builder before the file is known; do not ask a
reviewer for general feedback.

## Output contracts

**Investigator**

```
<Header>:
- path:line - `symbol` - short note
totals: <counts>.
```

Or `No match.` Path first, line attached, symbols backticked.

**Builder**

```
<path:line-range> - <change, <=10 words>.
verified: <re-read OK | mismatch @ path:line>.
```

**Reviewer**

```
path:line: <severity>: <problem>. <fix>.
totals: N bug, N risk, N nit, N question.
```

Findings sorted file then line. Or `No issues.`

## Hosts

OpenCode discovers the roles in the nearest `.opencode/agents/`; this repository
carries all three. Hermes has no presets: spawn `delegate_task` children with the
contracts from `.agents/skills/cavecrew/references/hermes-roles.md` pasted into
their context. A child summary is a self-report; the main thread re-reads cited lines
and reruns checks.

Use normal prose for security warnings, irreversible actions and any output where a
fragment could be misread. Resume compressed output afterwards.
