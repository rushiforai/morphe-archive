# Changelog

## [1.6.0](https://github.com/patapon888/morphe-patches/releases/tag/v1.6.0) (2026-11-21)

### Fruit Ninja Classic
* New: Remove Halfbrick+ check, Offline mode, Skip startup video, Remove rating prompts, Disable debug logging, Disable tracking, Loop events
* The game starts and plays without network access, also on a first start with no saved data
* The save stays on the device: Offline mode stops the online account service, which replaced the save with an empty account's, and removes the Play Games sign-in pop-up
* Fixed: the game froze after game over when the save had no starfruit yet
* Disable tracking removes the network access and turns off analytics and crash reports, with no effect on frame rate
* Offline mode hides the weekly leaderboards (main menu button and results panel), which are empty offline
* Loop events: once the event calendar bundled with the app is over, it starts again, and each event starts with fresh points and rewards

### Daydream
* The Daydream Everywhere patches are now named DuskDream

## [1.5.0](https://github.com/patapon888/morphe-patches/releases/tag/v1.5.0) (2026-11-20)

### Daydream
* The app catalog (store.json and its icons) now comes from this repository
* New XR category in discovery, with Wolvic

## [1.4.0](https://github.com/patapon888/morphe-patches/releases/tag/v1.4.0) (2026-11-20)

First release from this repository: Daydream, Nova Launcher and Bejeweled Classic patches in one bundle.

### Daydream
* 6DoF head tracking in Daydream (GVR) apps through ARCore
* Controller state is sent again after the VR service reconnects

### Nova Launcher
* Enable Prime, Open in bubble
* Support Nova Launcher 9.0.0 (8.9.5 and 8.8.6 are no longer supported)

### Bejeweled Classic
* Unlock game modes, purchases and ads removal, Play Games removal, classic layout, language setting and other fixes
