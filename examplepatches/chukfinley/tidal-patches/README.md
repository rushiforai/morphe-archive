# 🌊 TIDAL Patches for Morphe

Patches for the TIDAL Android app, built for [Morphe](https://morphe.software).

## ❓ About

**Swipe to add to queue** — the gesture Spotify has: drag a row to the right and the item goes to
the play queue. The row follows the finger over a green strip carrying a queue glyph, and glides
back when you let go.

It works on every screen that lists items — the Compose screens (search, home, album, playlist,
artist, mix) and the RecyclerView screens (favourite tracks and friends) — because the gesture is
attached to the row primitives both are built on, not to individual screens.

**When a swipe counts.** Only on release, and only if the drag was meant: either the row travelled
past 45% of its width, or it left the finger at 125dp/s or more after at least 24dp. Anything
shorter glides back and queues nothing. Those are the two thresholds Compose's `AnchoredDraggable`
settles against, which is what Spotify's own swipe to queue is built on.

**No menu, ever.** The context menu the app would normally open is intercepted before it is built,
and the play queue source the app already assembled for the item is appended directly. While the
finger is down, a menu from the app's own long press detector is swallowed as well, so it cannot
cover the row mid drag — but it queues nothing by itself.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/chukfinley/tidal-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 TIDAL&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.202.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Swipe to add to queue](#swipe-to-add-to-queue) | Adds a Spotify style swipe right gesture that adds the swiped item to the play queue, on every screen that lists tracks, albums, playlists or mixes. |  |

</details>

<!-- PATCHES_END -->
&nbsp;

## 📲 Usage

1. Install [Morphe Manager](https://morphe.software).
2. Add this URL as a **remote patch source**:

   ```
   https://raw.githubusercontent.com/chukfinley/tidal-patches/main/patches-bundle.json
   ```

3. Get the TIDAL APK. The Play Store build is an App Bundle, so grab an `.apkm` from
   [APKMirror](https://www.apkmirror.com/apk/tidal/tidal-tidal/) — Morphe merges the splits itself.
   Morphe's "APKMirror" button leads to a Google search for apps it does not officially support, so
   the link above is the shortcut; pick **"No, I already have an APK"** in the dialog.
4. Patch TIDAL, enable **Swipe to add to queue**, install the result.

Morphe checks this source for updates on its own, so a new TIDAL version only needs a new release
here, not a new setup.

## 🔧 How it works

The patch is built on structural entry points rather than app specific code, so it keeps applying
to new TIDAL versions. Four hooks:

| Hook | Purpose |
| --- | --- |
| `androidx.compose.foundation.ClickableKt.combinedClickable*` | Appends the gesture to every long clickable Compose component. Non rows (buttons, grid cells, chips) are filtered at runtime by size. |
| `RecyclerView.setAdapter` | Attaches the same gesture to every list that is not Compose. |
| The context menu manager | A swipe consumes the call, takes the play queue source out of the menu object and queues it. No menu is built. |
| The play queue provider | The patch writes `PlayQueueProvider(PlayQueueHolder()).get().addAsLastInActives(source)` into the app, because those classes are renamed by the app's minifier and can only be resolved while patching. |

Nothing is matched by name: the play queue is found by the class that declares
`addAsLastInActives(Source)`, the context menu manager by the method that builds a
`BottomSheetDialog` subclass, and the long click callback by its position in the
`combinedClickable` signature.

The extension pins `minSdk 26`. Below API 24, D8 desugars the default methods of the Compose node
interfaces into `Interface$-CC` helper classes, which exist in neither the extension nor TIDAL, and
the app dies on the first layout pass.

## 🧪 Verifying a build

A patched APK can be checked without a device. Disassemble it and resolve every reference the
extension makes against the app:

```bash
apktool d -f --no-res -o smali patched.apk
python3 tools/check-classes.py smali    # every referenced class exists
python3 tools/check-members.py smali    # every method and field resolves, inherited included
```

This catches the class of bug a compile cannot: the extension is compiled against public Compose
artifacts, but at runtime it links against the copies inside TIDAL.

## 🧑‍💻 Development

- Work on `dev`, use [semantic commits](https://www.conventionalcommits.org) (`feat:`, `fix:`,
  `chore:`).
- Build with `./gradlew buildAndroid`; the bundle lands in `patches/build/libs/patches-*.mpp`.
- Apply locally with the [Morphe desktop tool](https://github.com/MorpheApp/morphe-desktop):

  ```bash
  java -jar morphe-desktop.jar patch -p patches/build/libs/patches-1.6.0.mpp \
      --exclusive -e "Swipe to add to queue" -o tidal-patched.apk tidal.apkm
  ```

- `dev` publishes pre-releases; merging `dev` into `main` publishes a stable release.

## 📄 License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE).
