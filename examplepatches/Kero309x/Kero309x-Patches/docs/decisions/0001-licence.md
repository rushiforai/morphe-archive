# 0001 — Licence: GPL-3.0-only

- **Status:** accepted
- **Date:** 2026-11-04

## Context

The project is a patch bundle for a GPL-3.0 framework. It is also the
replacement for an earlier repository whose provenance was unclear.

## Decision

The project is licensed under GPL-3.0-only. Every source file carries an SPDX
identifier and a copyright line.

## Consequences

- Compatible with the framework it is built against, without an additional
  compatibility analysis.
- If any similarity to an earlier GPL-3.0 implementation is ever found, the
  licence already permits the required obligations to be met.
- The licence text is the unmodified GPL-3.0 text, and no additional
  restrictions are placed on top of it.
- A different licence can only be adopted after a clean-room review, and that
  would be recorded as a new decision.

## Alternatives considered

- Apache-2.0 or MIT: rejected. A permissive licence increases the cost of being
  wrong about originality, and buys nothing this project needs.
