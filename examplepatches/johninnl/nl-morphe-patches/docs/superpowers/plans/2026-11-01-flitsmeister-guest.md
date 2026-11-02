# Flitsmeister guest mode

The user selected a guest-mode patch after reproducing Google sign-in failure on the attached phone. Google reports `UNREGISTERED_ON_API_CONSOLE`; the app never receives a credential. The publisher base is the inspected 14.17/1287 input already supported by this repository.

Restore the existing guest callback in the landing screen's empty Compose group with a localized "Continue as guest" button. Keep the native permission/completion path, optional account login, genuine account state and backend authentication. Suppress the startup redirect based only on a previous login; retain first-run onboarding and Dash setup.

1. Add an independent decoded-DEX verifier for the guest button, startup decision, native completion and unchanged account login. Run it against the publisher original to demonstrate the missing behavior.
2. Add a guarded `Guest mode` patch using exact original method layouts and references, plus English/Dutch button resources. Keep every existing patch unchanged.
3. Build with the repository's Gradle checks. Validate guest-only and all-control APKs, including the emitted method bodies, resources and signatures. Run the Python suite.
4. Test clean guest entry and cold relaunch without an account on an isolated emulator. Verify map/traffic, destination search and navigation before making broad claims. Check account-required features separately; never manufacture a session.
5. Install the tested build on the attached phone while preserving data if its signature permits, and verify the guest flow with the user. Update the app documentation with verified behavior and limitations. Stable promotion requires separate user confirmation under AGENTS.md.

The implementation uses the existing Kotlin bytecode/resource patch framework and is performed in this session. Worktree: `.tools/worktrees/flitsmeister-guest`, branch `feat/flitsmeister-guest`. Baseline: 393 Python tests pass, 39 skipped.

The user subsequently declined reinstalling the attached phone and explicitly requested publication on `main` to test through Morphe with the existing signing key. Publish after review and artifact checks; report device/map/navigation testing as pending. Do not replace or clear the phone's installation.
