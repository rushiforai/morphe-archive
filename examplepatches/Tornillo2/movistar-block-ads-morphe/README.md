# 🧩 Movistar Plus – Block Ads (Morphe Patches)

A source of patches for **[Morphe](https://morphe.software)** (compatible with the ReVanced ecosystem) that **removes ads and promotional clips** from the **Movistar Plus Android TV** app without manually recompiling it. The patcher modifies the original APK's bytecode and injects a small extension.

> ⚠️ **Disclaimer:** This project is provided for educational and interoperability purposes only. Apply these patches only to an APK that you have obtained legally, and do so at your own risk.

---

## ❓ What it does

The Movistar Plus app plays advertisements embedded in the video stream (pre-rolls, promotional content, `PROMO_AD` clips, etc.). This patch intercepts the exact moment when the player is about to load content, determines whether it is an advertisement, and if so, **prevents it from playing and immediately skips to the actual content**.

In short, the **`Block Ads`** patch:

1. **Detects** whether the content about to be played is an advertisement.
2. **Blocks** the player initialization for that advertisement.
3. **Automatically skips** to the next piece of content (the program or channel the user originally wanted to watch).

---

## ⚙️ How it works internally

The patch consists of two parts working together: the **bytecode patch** (Kotlin) and the injected **extension** (Java).

### 1. Fingerprint – locating the target method

`Fingerprints.kt` defines a fingerprint that locates the player method to modify. Instead of searching for a string (which does not exist in the bytecode), it identifies the method **by its name and class**:

```kotlin
methodDef.name == "initializePlayer" &&
    classDef.type == "Lcom/movistarplus/androidtv/player/PlayerTV;"
```

The target method is:

```java
PlayerTV.initializePlayer(Uri, long, boolean, PlayerDataModel, String)
```

### 2. The bytecode patch – injecting the check

`ExamplePatch.kt` (the `bytecodePatch` named **"Block Ads"**) injects a call to the extension at the **beginning** of `initializePlayer`, followed by a conditional return in Smali:

```smali
invoke-static {p5}, Lapp/template/extension/extension/ExamplePatch;->shouldBlockAndSkip(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :continue
return-void          # If it's an ad -> exit without initializing the player
:continue
nop
```

- `p5` is the `PlayerDataModel` (the metadata of the content about to be played).
- If `shouldBlockAndSkip(...)` returns `true`, `return-void` is executed and **the player never initializes the advertisement**.
- If it returns `false`, execution continues normally.

The extension is linked using `extendWith("extensions/extension.mpe")`, and the patch is only applied to the Movistar app through `compatibleWith(COMPATIBILITY_MOVISTAR)`.

### 3. The extension – deciding and skipping

`extensions/.../ExamplePatch.java` contains the runtime logic:

- **`shouldBlockAndSkip(Object playerData)`** inspects the `PlayerDataModel` to determine whether the content is an advertisement. It detects ads in two ways:
  - `playerDataModel.isAds()` returns `true`, or
  - `playerDataModel.getTypeOfContent()` equals `PlayerDataModel.TYPE_PROMO_AD` (`"PROMO_AD"`).
- If an ad is detected, it calls **`notifyPlayerEnded()`**, which dispatches the `ended` event to the app's Cordova/JavaScript layer so playback immediately advances to the real content:

```java
Class.forName("com.movistarplus.androidtv.MainActivity")
     .getMethod("fireEvent", String.class)
     .invoke(null, "ended");   // fireEvent is static
```

This static invocation is essential: `MainActivity.fireEvent(String)` is `public static` and uses the internal `cordovaWebView`, so no activity instance is required.

---

## 🩹 Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.9](https://github.com/Tornillo2/movistar-block-ads-morphe/releases/tag/v1.0.9)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch available
<details open>
<summary>📦 Movistar Plus&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.03.100 |
| :---: |

| 💊 Patch | 📜 Description | ⚙️ Options |
|----------|----------------|-----------|
| Block Ads | Blocks advertisements and promotional clips. | — |

</details>
<!-- PATCHES_END -->

---

## 🚀 How to use these patches

### Option A – Add this source to Morphe (recommended)

Add this repository as a patch source in Morphe:

```
https://github.com/Tornillo2/movistar-block-ads-morphe
```

Then select the **Movistar Plus** app, enable the **Block Ads** patch, apply it to the **original** APK, and install the resulting patched APK.

### Option B – ReVanced CLI

```bash
java -jar revanced-cli.jar patch \
  -b patches.rvp \
  -o movistarplus-patched.apk \
  movistarplus-original.apk
```

> Always apply patches to an **unmodified original APK**, never to one that has already been patched.

---

## 🛠️ Building the project

Requires JDK 17+ and the included Gradle wrapper.

```bash
./gradlew build
```

This builds:

- The **`patches`** module (Kotlin) → the patch bundle (`.rvp`).
- The **`extensions/extension`** module (Java) → the `extension.mpe` extension embedded into the app.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more details.

### Repository structure

```
patches/                 # Bytecode patches (Kotlin)
  └─ .../example/
      ├─ ExamplePatch.kt      # "Block Ads" patch: injects the check into initializePlayer
      ├─ Fingerprints.kt      # Locates PlayerTV.initializePlayer
      └─ ../shared/Constants.kt  # COMPATIBILITY_MOVISTAR (package + supported versions)

extensions/extension/    # Extension injected into the app (Java)
  └─ .../ExamplePatch.java    # shouldBlockAndSkip() + notifyPlayerEnded()

patches-list.json        # Patch list metadata
.github/workflows/       # CI: PR builds and automatic releases (semantic-release)
```

---

## 🔍 Verifying that it works

Install the patched APK and monitor the logs:

```bash
adb logcat -s MorpheBlockAds
```

When an advertisement is skipped, you should see:

```
Ad detected... Blocking playback
fireEvent('ended') dispatched successfully.
```

---

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
