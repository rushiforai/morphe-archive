# Supported apps — main branch

This page records the functional target scope and the verification evidence documented for the promoted stable branch.

| App | Android package ID | Patch | Available | Working well |
|---|---|---|:---:|:---:|
| Instagram | `com.instagram.android` | AMOLED theme | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Add Mods menu | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Change channel name | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Remove ads | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Remove snooze warning | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Unlock developer options | 🟢 ✓ | 🟢 ✓ |
| Instagram | `com.instagram.android` | Upload Instants from Gallery | 🟢 ✓ | 🟢 ✓ |
| Instagram Instants | `com.instagram.moonshot` | Instants Mod | 🟢 ✓ | 🔴 ✗ |
| Threads | — | — | 🚧 Under development | — |

Edits is not currently included in this stable release line.

## Instagram

The Instagram target includes the developer-options/MobileConfig runtime path, Mods menu extension, theme and channel-label modifications, ad-pod suppression, snooze-warning removal, and a selectable gallery-upload patch for the Instants camera inside the main Instagram app.

The runtime writer installs the bundled configuration to:

```text
<filesDir>/mobileconfig/mc_overrides.json
```

The app-private path is intentional: the previous removable-storage/SAF design was removed because the extension's dex-only merge does not deliver the host app's assets to the target app.

The **Upload Instants from Gallery** patch explicitly targets `com.instagram.android`. It adds gallery selection to Instagram's built-in Instants camera. It is separate from the **Instants Mod** patch, which targets `com.instagram.moonshot`.

## Instagram Instants

The Instants Mod is a port of the functional parts of [Wagg13Patch_Morphe](https://github.com/WaggBR/Wagg13Patch_Morphe) (GPL-3). It adds a gallery picker to the camera flow and a save-to-gallery action for friends' Instants. The patch declares a version-agnostic target, but the documented harness check against 455.0.0.55.95 is not a guarantee for future releases. Device verification remains pending in the project notes.

## Verification terminology

- **Declared:** Morphe metadata registers the package/target.
- **Harness verified:** the project's APK-oriented build/test harness completed for the recorded input.
- **Device confirmed:** the behavior was observed on a physical device and exact app build.

Do not promote a feature from one evidence level to another without new test results. See [feature-status.md](feature-status.md) and [implementation-plan.md](implementation-plan.md).
