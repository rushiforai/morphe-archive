# Transit Patches

[Morphe](https://morphe.software) patches for the [Transit](https://transitapp.com) Android app
(`com.thetransitapp.droid`). These patches are not affiliated with Transit or the Morphe project.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v0.1.0](https://github.com/oliver-leung/transit-patches/releases/tag/v0.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Transit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.thetransitapp.droid`

**🎯 Supported versions:**

| 6.3.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GO Live Update](#go-live-update) | Shows the GO trip notification as a Live Update on Android 16 QPR1 and newer, with the remaining time in the status bar chip and the trip progress as a progress bar. |  |

</details>

<!-- PATCHES_END -->

### GO Live Update

On Android 16 QPR1 and newer, the GO notification is shown as a
[Live Update](https://developer.android.com/develop/ui/views/notifications/live-update): it is
promoted to the top of the notification shade and the lock screen, and it shows a chip in the status
bar.

- The status bar chip shows the remaining trip time.
- The notification shows the current and the next GO instruction, the arrival time and the remaining
  trip time, and the trip progress as a progress bar.

Live Updates do not support custom notification layouts, so the Live Update uses the standard
notification layout instead of the GO layout of the app. The patch keeps the GO layout of the app
when Android reports that the notification cannot be promoted: on Android 15 and older, on the first
Android 16 release, when Live Updates are turned off for Transit in the system settings, or when the
GO notification category is set to minimized.

## 📲 How to use

Tap the button on your Android device to add these patches to Morphe Manager, or add
`https://github.com/oliver-leung/transit-patches` as a patch source in Morphe Manager:

<a href="https://morphe.software/add-source?github=oliver-leung/transit-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

With [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop), download `patches-*.mpp` from
the latest release of this repository, or build it locally, and run:

```bash
java -jar morphe-desktop-*-all.jar patch --patches patches-*.mpp transit.xapk
```

## 🛠️ Building locally

Morphe publishes its Gradle plugin and patcher to GitHub Packages, which requires a GitHub token with
the `read:packages` scope, even for public packages:

```bash
gh auth refresh -h github.com -s read:packages
export GITHUB_ACTOR=<GitHub username>
export GITHUB_TOKEN=$(gh auth token)
./gradlew buildAndroid
```

The patches file is `patches/build/libs/patches-*.mpp`.

## 📜 License

Transit Patches are licensed under the [GNU General Public License v3.0](LICENSE), with the
additional terms in the [NOTICE](NOTICE).
