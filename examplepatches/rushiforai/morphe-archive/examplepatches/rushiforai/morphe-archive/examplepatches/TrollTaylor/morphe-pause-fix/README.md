# 🔧 YouTube Auto-Pause Fix — Morphe Patch

A custom [Morphe](https://morphe.software) patch that fixes a YouTube bug where videos **auto-pause immediately after opening** and keep re-pausing when you try to play — only when logged in.

## 🐛 The Bug

- Open any video on YouTube → it pauses instantly
- Try to unpause → it pauses again
- Only happens when **logged in** (any account on the device)
- Works fine when logged out

## 💡 How the Fix Works

The patch intercepts YouTube's internal player pause method and adds a short **protection window** (3 seconds) after a new video starts loading. During this window, automatic pause calls from YouTube's internal logic are blocked — but user-initiated pauses still work normally after the window expires.

## 📦 How to Use

### Option 1: Add as Patch Source in Morphe Manager
1. Open **Morphe Manager**
2. Go to **Sources** → **Add**
3. Enter this repository URL: `https://github.com/YOUR_USERNAME/morphe-pause-fix`
4. Select **YouTube** as the target app
5. Enable **"Fix Auto-Play Pause"** patch
6. Patch and install!

### Option 2: Build from Source
1. Clone this repository
2. Set up GitHub Packages credentials in `~/.gradle/gradle.properties`:
   ```properties
   gpr.user=YOUR_GITHUB_USERNAME
   gpr.key=YOUR_GITHUB_TOKEN
   ```
3. Build:
   ```bash
   ./gradlew build
   ```

## 🗂 Project Structure

```
morphe-pause-fix/
├── settings.gradle.kts            # Gradle settings + Morphe plugin
├── gradle.properties              # Build properties
├── gradle/libs.versions.toml      # Dependency versions
├── patches/
│   ├── build.gradle.kts           # Patch module config
│   └── src/main/kotlin/app/pausefix/patches/youtube/playback/
│       ├── Fingerprints.kt        # Bytecode fingerprints for YouTube methods
│       └── FixAutoPlayPausePatch.kt  # Patch definition (smali injection)
└── extensions/
    └── extension/
        ├── build.gradle.kts       # Extension module config
        └── src/main/java/app/pausefix/extension/
            └── FixAutoPlayPausePatch.java  # Runtime pause-blocking logic
```

## ⚠️ Notes

- **Fingerprints may need updating** for different YouTube versions. If patching fails, the fingerprints didn't match — open an issue with your YouTube version.
- **Debugging**: Check logcat for `PauseFix` tag to see when pauses are being blocked.
- Based on the [Morphe Patches Template](https://github.com/MorpheApp/morphe-patches-template).

## 📜 License

[GPLv3](LICENSE)
