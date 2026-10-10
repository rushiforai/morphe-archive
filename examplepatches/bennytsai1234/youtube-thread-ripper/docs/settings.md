# Settings screen

An internal resource patch (`settings/SettingsResourcePatch.kt`, dependency of every patch) appends a "Thread Ripper" PreferenceScreen to `res/xml/morphe_prefs*.xml` in finalize. The official settings patch copies those files in execute and appends its own preferences in finalize; morphe-patcher runs all executes before any finalize, so the order of the two finalize blocks does not matter.

- The official fragment skips keys without a Morphe Setting, and Android stores the values in `morphe_prefs` (`tr_*` keys), which `Config` reads via `ActivityThread.currentApplication()`.
- The entry looks like the official top-level screens (title only; in the icon styles a Material icon, `@layout/preference_with_icon`, `app:iconSpaceReserved`); the root is sorted by key, so it is last.
- Texts are Traditional Chinese, hard-coded (the maintainer's own use).
- Precedence: `debug.tr.*` system property, then the settings screen, then the default.
