# Posting limit indicators for livegalileo

## Behavior

- ChMate's posting editor continues to measure the title and body using its own native counter.
- The visible character count uses Java/Android UTF-16 code units. A supplementary emoji such as `😀` therefore counts as two characters. Existing overflow spans still start at a Unicode code-point boundary, so they never color only half of a surrogate pair.
- `https://nova.5ch.io/livegalileo/` and its `.net` alias receive a 1024-byte per-line cap when the board's public settings do not provide a more specific line cap. Other boards do not inherit this fallback.
- The per-line overflow is measured through the native body counter and highlighted from the first over-limit code point. An ASCII line of 1024 bytes fits; byte 1025 is highlighted.

## Verification

- Host logic checks: `scripts/PostLimitRulesTest.java` — 50 passing checks covering UTF-16 emoji counts, code-point-safe spans, the board-specific fallback, and 1024/1025-byte boundaries.
- Frida check: `scripts/frida-post-limit-regression.js`, compiled with `scripts/prepare-frida-verification.ps1 -Checks frida-post-limit-regression` and run on reporter191, reporter226, and reporter242. All three passed parser scope, emoji count/overflow, and byte-boundary assertions.
- The check invokes the actual compiled classes inside each reporter process and does not submit a post.
