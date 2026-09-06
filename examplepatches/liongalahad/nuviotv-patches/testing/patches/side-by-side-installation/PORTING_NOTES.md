# Porting notes

## 0.9.0-beta port

Version 0.9 introduces launcher activity aliases for app-icon selection. Relabel every alias that declares LAUNCHER or LEANBACK_LAUNCHER, in addition to the application label, so all icon variants consistently identify Nuvio Morphe. Keep the package and provider authority changes unchanged. Regression coverage includes aliased launcher labels.

The earlier notes below describe historical ports; their old obfuscated owner names are not current compatibility contracts. Current machine-readable contracts are in this compartment’s `patch.json`.

## Earlier port history

NuvioTV `0.8.11-beta` declares package `com.nuvio.tv`, one matching dynamic-receiver permission, and provider authorities rooted at `com.nuvio.tv`. Other Morphe resource patches can add providers with the same root. The patch therefore runs in the final resource phase and validates and rewrites the complete provider set after every selected patch has executed.

Morphe's resource compiler detects the manifest package change and performs the required Android resource package renaming. The patch deliberately leaves Java/Kotlin component class names unchanged because the compiled DEX still contains `com.nuvio.tv.NuvioApplication`, `com.nuvio.tv.MainActivity`, and the other original implementations.

The structural identity check is exact rather than heuristic: the input package must be `com.nuvio.tv`; every app-defined permission must use that prefix and have a matching request; every provider authority must be non-empty and use that prefix. An unexpected future structure fails patching rather than silently generating an APK that can collide with the official installation.

For a future Nuvio version, re-audit the manifest package, custom permissions, provider authorities, application label, launcher component, shared user ID, task affinity, and any package-derived resources before updating compatibility. Data migration and sharing app-private state are deliberate omissions.
