# 1.0.0 (2026-10-22)

First release of GCamVBoost, a Morphe patch bundle for Google Camera (`com.google.android.GoogleCamera` and `com.google.android.GoogleCameraEng`).

### ✨ Features

* **Clone Google Camera:** Change the package name (default `com.google.android.GoogleCameraEng`) so the patched app installs next to the stock Google Camera
* **Video Boost startup state:** Remember the last Video Boost setting between launches, or always start with it on or off
* **Video Boost shortcuts:** Add "Video VB On" and "Video VB Off" launcher shortcuts

### 🐛 Bug Fixes

* **Fix Magic Capture crash:** Fall back to CPU when the EdgeTPU can't be used on re-signed builds
* **Fix Magic Capture crash:** Add Me uses its CPU models instead of the EdgeTPU models
* **Fix MediaProvider invalid column crash:** Remap the `file_name` and `restore_path` columns to standard MediaStore columns
* **Fix launcher app shortcuts:** Point launcher shortcuts at the app's actual package name
