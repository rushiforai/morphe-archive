# UI settings

UI settings are available through Patch settings, player settings and V2 chat
settings. Customization options are off by default and apply without restarting
Twitch.

## Controls

- Player controls: Clip, Cast and Share.
- Channel actions: Subscribe, gifting, Bits and extensions.
- Chat overlays: Hype Trains and channel leaderboards.
- Display: Android status and navigation bars during landscape fullscreen playback.

Controls with several locations have a Hide everywhere switch and individual
location switches. Classic Split settings also cover fullscreen playback. Vertical View
distinguishes header buttons from actions below the video. Options apply where
Twitch provides the corresponding control.

Empty action rows and dividers collapse automatically. Remaining actions keep
their order, spacing and callbacks. Extension settings also cover overflow
buttons and containers beside the leaderboard.

Hype Train settings cover banners and player overlays. Leaderboard settings
separate channel rankings from the player button. Hidden Hype Trains retain their current state and can be shown again
without restarting or waiting for a new event.

Hiding the status bar removes Twitch's reserved camera-cutout padding in
landscape fullscreen. Player and settings windows follow both system-bar options
in either direction. Keyboard insets remain active, and leaving fullscreen restores
normal inset handling.

Fullscreen state comes from the native and React Native player controllers.
System-bar overrides follow player transitions, window focus and preference
changes. Native bar requests are filtered before reaching Android while an override
is active. Disabling it restores Twitch's current request. Picture-in-picture and
minimized playback retain their normal behavior.

Search covers the included patches and identifies each result's category and
location. Switches can be changed from the results. Back restores the previous
page, query and scroll position.

Navigation groups use native icons and summarize their current visibility settings.
Individual switches use text labels without repeated icons.

## Adding an option

Keep hooks and runtime policy under the `ui` feature directory. Register the option
with `UiFeatureRegistry`, then add it to `UiOptions` with a section, native drawable
and concise label. Keys use lowercase letters, digits and underscores and remain
stable across updates. Group switches derive their state from individual
preferences.

Native views read `UiSettings.enabled(key)` and observe preference changes through
`UiSettings.observe`. Close subscriptions when their owner stops or detaches.
Retain the original content state so disabling an override restores Twitch's
current layout. Native action headers use weak bindings and preserve state
through temporary detachment.

Compose controls collect the preference flow inside balanced composition groups.
Resolve types and methods from the original APK. Scan call sites once and request
mutable classes only for matching methods to limit Android patcher memory use.

React Native components use `runtime.ui.useEnabled(React, key)`. Filter action
models before rendering. Preserve callbacks, keys and untouched elements, and
bound any tree traversal. Update parent availability as well as child visibility;
`ChannelMetadata` reserves padding while actions or extensions remain available.

## Verification

Check both toggle directions, mixed groups, search, Back navigation and omitted
patches. Cover native and V2 players, themes, rotation and temporary detachment.
System-bar tests must include enabling an option again with unchanged insets.
Check unlocked landscape playback as well as rotation-locked fullscreen, and
confirm that Home and the mini-player retain normal insets.

With an Android device connected:

```powershell
./scripts/test-ui-fullscreen.ps1
./scripts/test-ui-actions.ps1
./scripts/test-chat-ui.ps1
./scripts/test-replay-binding.ps1 -Apk '<patched.apk>'
```

These probes check Android view behavior and patched replay bindings without
installing Twitch. Follow them with an installed-app test and a Morphe Manager
build before release.
