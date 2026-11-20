# Repository Guidelines

Scope: Java runtime bridges packaged by `extensions/extension/` into `extensions/extension.mpe`.

## Architecture

Extension classes are merged into a patched target APK's DEX and called from injected Smali. They are not a standalone Android application and cannot compile against proprietary target-app classes.

- Source: `extension/src/main/java/app/aidan/extension/<app-or-domain>/`.
- Manifest: `extension/src/main/AndroidManifest.xml`; keep minimal unless a feature truly requires declarations.
- Build config: `extension/build.gradle.kts`; output name is `extensions/extension.mpe`.
- Callers: Kotlin patches under `../patches/` using `extendWith("extensions/extension.mpe")`.

Current package ownership is visible under `app.aidan.extension`: app packages plus shared-purpose packages such as `emoji`. Follow the existing package for the target feature.

## Bridge Conventions

- Prefer `public final` classes, private constructors, and narrow static entry points.
- Treat every public bridge class path, method name, parameter type, and return type as an ABI. Update the exact injected Smali descriptor with Java changes.
- Access obfuscated/proprietary target classes through reflection. Do not add compile-time imports from target APKs.
- Pass Android/app state into the bridge through the injected call; avoid hidden global state. Cache only objects whose lifecycle and invalidation are explicit.
- Keep target-specific behavior inside its package. Shared helpers must be genuinely cross-app and free of target assumptions.

## UI, Async, and Error Handling

- Android view/dialog changes must run on the main thread via the activity, a view post, or a main `Handler`.
- Guard null, detached, destroyed, or finishing activities/views before UI work.
- Reflection is a runtime compatibility boundary. Catch and log failures where the feature is best-effort and can safely degrade; required initialization must fail visibly rather than leave misleading partial state.
- Do not retain `Activity`, `View`, dialog, or WebView instances beyond their lifecycle without cleanup.
- Keep WebView configuration, JavaScript interfaces, URL policy, and network assumptions explicit. Avoid broad interface exposure or permissive navigation not required by the feature.
- Avoid blocking, network, or expensive reflection work on the UI thread. Return to the main thread only for view mutation.

Use neighboring bridges as patterns: `sezzle/ConsentGate.java` for a small guarded dialog, `fizz/DeveloperMenuBridge.java` for activity integration, and `aftership/OsmMapBridge.java`/`OsmMapView.java` for reflective UI and WebView behavior.

## Cross-Layer Rules

- `extendWith(...)` packages runtime code; it does not modify raw APK assets or XML.
- Put XML/assets/native-library edits in `compositeFeaturePatch` internal layers (for private one-to-one features) or standalone `resourcePatch`/`rawResourcePatch` companions with `dependsOn(...)` (for shared or multi-feature prerequisites) under `patches/`.
- A bridge method must not be added without its Kotlin patch caller, and a caller must not reference a bridge without `extendWith(...)`.
- Document runtime/network assumptions in the matching `docs/<app>/patches.md`.

## Commands & Verification

```bash
./gradlew :extensions:extension:compileReleaseJavaWithJavac --console=plain
./gradlew :extensions:extension:testReleaseUnitTest --console=plain
./gradlew :patches:buildAndroid
```

Then run the matching real-artifact compatibility check and device smoke from `../tools/apk-lab/AGENTS.md`. Exercise the exact UI/runtime path and monitor for crashes, ANRs, leaks, and main-thread spin. Finish code changes with root `bun run audit`.

Synthetic unit tests in `src/test/` verify transaction rollback logic, recovery state transitions, coordinator mappings, and JNI constant alignment. However, unit tests cannot verify reflection targets or target-app lifecycle behavior; real APK deployment and device testing remain mandatory.
