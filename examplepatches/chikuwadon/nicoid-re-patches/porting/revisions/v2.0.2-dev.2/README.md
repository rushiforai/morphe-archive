# v2.0.2-dev.2

Development candidate based on approved stable v2.0.1.

- Add an **Intense** ambient preset; modestly increase all four existing presets, extend brightness, spread and color limits, and migrate exact old presets without overwriting custom values
- Combine app bar/tab bar placement (six arrangements) and tab bar height (28–64 dp) in one preview-equipped dialog; retain the previous preferences as migration inputs
- Add three app-bar placements to Niconico Live settings: top, above bottom navigation, or below bottom navigation
- Retain native AppCompat action menus, gestures, tab state restoration, 12-view in-memory LRU and fresh data loading when starting the app
- Build and regress the actual candidate MPP; device-specific bar rendering, hit targets, software keyboard, gesture insets and low-memory behavior require Android device validation

No stable tag, release assets or stable branch modifications are authorized.

- Fix Android 16 settings crash by attaching the combined placement preference before registering its dependency
