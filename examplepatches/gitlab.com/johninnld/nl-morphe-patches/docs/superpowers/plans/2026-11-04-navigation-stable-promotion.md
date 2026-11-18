# Maps, Vela and FM15 stable promotion

The user approved main promotion and a new stable release on 2026-11-04, explicitly retaining the current Waze provider because native Waze warnings remain work in progress.

Promote the native FM warning integration through checkpoint `304bbcf`, the shared receiving-side correctness/relevance changes through `55cc86b`, and the Vela connection-status fix. Preserve main's published Waze provider, branding, release automation and standard Android Auto actions. Reconcile warning viewport updates with main's current drawing insets/control attachment. Vela identifies a legacy Waze data connection separately from native-warning API availability.

Use the complete `scripts/local-release/verify.cjs` checkpoint before pushing the approved main update. The local release driver must build/sign once, retain the original Morphe key, select the stable version, publish and verify the canonical GitLab release, then verify its mirrors and Pages. Do not manually select a version, rewrite generated metadata, alter validation tooling or claim pending physical/car acceptance has passed. Preserve the existing runtime acceptance receipts and their explicit incomplete scopes; this release enables the requested further testing.

Keep the primary and active worktrees intact. Archive compact source/verification/publication receipts and clean only this promotion/release job's owned storage after terminal completion.
