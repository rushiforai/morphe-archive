# Gboard Pro for iPhone & iPad (iOS 16+)

Native Swift + SwiftUI + UIKit universal iOS & iPadOS edition of **Gboard Pro v2.2.0 (Beta 3)** featuring:
- **GboardProApp** (`com.smartworldarafath.gboardpro`): Universal iPhone & iPad settings app, Classic Material UI (Default), 3D Liquid Glass UI (Dark & Light water-drop orbs), AMOLED Pure Black `#000000`, Multi-language `+ Add keyboard`, `Additional -> Choose UI`, `Notification` (3 alert/silent channels), `Beta Program` (`Beta version testing` with 5-screenshot bug reporting & `New features (Beta)`), `About`, `Help & feedback`, and interactive **Live Keyboard Sandbox**.
- **GboardProKeyboard** (`com.smartworldarafath.gboardpro.keyboard`): System-wide `UIInputViewController` Keyboard Extension with App Group sync (`group.com.smartworldarafath.gboardpro`), CoreGraphics 3D Liquid Glass & Classic keycaps, iPhone + iPad adaptive layouts, Emoji & Flag drawer, Clipboard drawer, Glide trail gesture typing, Spacebar cursor swipe, and Taptic haptics.

---

## Multi-Approach Build Options

### 1. Automated Virtual iPhone + iPad Build & Test via GitHub Actions (No Mac Required)
Push this directory to GitHub and trigger **Actions -> Build & Test Gboard Pro iOS (iPhone & iPad)**.
- Runs on official Apple Silicon `macos-latest` with Xcode & iOS Simulator (`xcrun simctl`)
- Tests both **Virtual iPhone** & **Virtual iPad** (`GboardProUnitTests` & `GboardProUITests`)
- Exports `Gboard_Pro_iOS_Unsigned.ipa` (installable via AltStore, SideStore, Sideloadly, or TrollStore)

### 2. Local Build on macOS with Xcode
```bash
cd ios
brew install xcodegen
xcodegen generate
open GboardProiOS.xcodeproj
```
Select an iPhone or iPad simulator and press **Cmd + R** (Run) or **Cmd + U** (Tests).

### 3. Linux / WSL2 SwiftPM + `xtool` Setup
`Package.swift` and `xtool.yml` are included for SwiftPM / `xtool` workflows when pairing a physical iPhone with an official `Xcode.xip` SDK inside WSL2.
