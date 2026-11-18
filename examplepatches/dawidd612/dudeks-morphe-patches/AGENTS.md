# Project instructions

## Codebase navigation

- Use the `codebase-memory` skill and `codebase_memory` MCP server first for repository discovery, architecture, symbols, call tracing and impact analysis. Verify index freshness at the start of work; prefer bounded graph results and targeted source reads.
- Keep `auto_watch=false` on this generated/dirty workspace and explicitly refresh the index. If Windows MCP returns `Transport closed` twice, use the installed binary's `cli --json` interface, starting with `list_projects` and `index_status`.
- Use `rg` or filesystem exploration when graph coverage is missing/stale or for non-structural text. Do not apply this workflow to non-code conversations.

## Reliability and data preservation

- Prefer explicit invariants and one source of truth. Validate trust boundaries without duplicating policy across layers.
- Reliability, debuggability and data preservation take precedence over speculative hardening. A failed helper must not block an independent safe capability.
- When behavioral parity proves a replacement, remove the superseded path and implementation-coupled tests in the same change.
- Test observable behavior, recovery and compatibility rather than private names or source-text order.
- Before a security gate, identify its concrete threat, policy owner, failure behavior and black-box regression test.

## Persistent Pizza working agreement

- Continue the current Good Pizza, Great Pizza (`com.tapblaze.pizzabusiness`) Morphe patch until startup, real Google/Google Play Games sign-in and user-data preservation pass consistently. Do not claim success from build/static checks or one successful launch.
- Follow the full cycle: change -> build -> patch clean input -> ADB installation -> launch -> test -> diagnosis -> correction -> full retest. Check regressions after every change and continue diagnosing subsequent failures.
- Prefer ADB, filtered logcat, dumpsys and UIAutomator. Keep full logs locally; present only relevant exceptions and bounded context, with secrets/account details redacted.
- Use screenshots only for an unrecognized state, after text diagnostics and local OpenCV analysis where useful.
- Test repeated starts, force-stop/relaunch, device restart, background/foreground, real authentication, saved-progress persistence and clean installation. A clean-install test must use a disposable test environment or a verified recoverable backup; never destroy the user's only save or signing key.
- Preserve logs and artifacts for every failure with input/output hashes, selected patches, build revision, environment and reproduction steps. Keep APKs, saves, keys and raw logs out of Git.
- Android Studio is installed. The user permits work on the clean Pizza APKM in Downloads. Discover actual SDK/ADB/device paths and status each session.
- Keep durable progress and exact remaining blockers in `docs/pizza-project-context.md`. These instructions apply across sessions. Account authentication requiring the user's credentials remains a user action; never fabricate successful sign-in or cloud synchronization.
- The user confirmed working Google Play Games, TapBlaze and restored progress on 2026-09-28. After the signing restriction blocked real-money checkout, the user accepted hiding broken paid offers and cancelling checkout. Preserve in-game exchanges, rewards, saved data, existing purchase tokens, verification, acknowledgement and consumption. Never substitute purchase success or grant paid goods without a real verified purchase. Do not complete a real-money charge without explicit authorization for that charge.
- The user requested committing the verified fixes and publishing a GitHub release. State unresolved billing or runtime limitations accurately in the release; do not present a platform/signing restriction as a repaired checkout.
