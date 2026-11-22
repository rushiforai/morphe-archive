# SwiftKey Gesture Input Patches

Morphe patches for Microsoft SwiftKey.

<a href="https://morphe.software/add-source?github=Kaysera/swiftkey-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or add this repository URL manually in Morphe Manager:

```
https://github.com/Kaysera/swiftkey-morphe-patches
```

## Patches

### Gesture input: Disabled

Adds a third option, **Disabled**, to SwiftKey's **Typing → Gesture input** setting.

SwiftKey only offers **Flow** (swipe typing) or **Gestures** (swipe left to delete,
swipe down to hide the keyboard). While Flow is selected, the gestures are disabled, but
there is no way to disable both. This patch adds that option and makes the keyboard enter
its existing `NEITHER` gesture state, the same state SwiftKey already uses when
accessibility "Explore by touch" is enabled.

Verified against:

| App | Package | Version | File type |
| --- | --- | --- | --- |
| Microsoft SwiftKey | `com.touchtype.swiftkey` | 9.13.20.4 | XAPK |
| Microsoft SwiftKey | `com.touchtype.swiftkey` | 9.13.19.3 | XAPK |

The patch relies on SwiftKey's obfuscated keyboard layout code. It locates the gesture mode
enum and the selection method from their bytecode shape and enum constant names, so an
unsupported build fails the patch instead of producing a broken keyboard.

## Usage

1. Download a supported SwiftKey XAPK (see the table above).
2. Add this repository as a patch source in Morphe Manager, or build it locally:
   ```bash
   ./gradlew buildAndroid
   ```
   The bundle is written to `patches/build/libs/patches-*.mpp`.
   Building requires JDK 21 or newer and a GitHub token with the `read:packages`
   scope, as described in the
   [Morphe setup documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md).
3. Patch the XAPK with Morphe Manager or Morphe Desktop CLI and install the result.
4. Open **SwiftKey Settings → Typing → Gesture input** and select **Disabled**.

## Verifying on a device

Morphe re-signs the APK, so Android will not install it over an existing SwiftKey
installation. Uninstall SwiftKey first; this also clears its settings and language data.

1. Install the patched APK.
2. Open **SwiftKey Settings → Typing → Gesture input**. The list must show **Flow**,
   **Gestures**, and **Disabled**.
3. Select **Disabled**.
4. On the keyboard, verify that Flow (gliding between letters) does nothing, swiping down
   does not hide the keyboard, and swiping left does not delete a word.
5. Switch back to **Flow** and **Gestures** and verify both work again.

The patch aborts if it cannot find the gesture mode enum or selection method, rather than
producing a keyboard that silently behaves incorrectly.

## How it works

- Adds the `Disabled` entry and value to the `pref_flow_gestures_entries` and
  `pref_flow_gestures_entry_values` arrays.
- Stores the selection in a new `pref_gesture_input_disabled` boolean and restores it when
  the settings screen is reopened.
- Patches the keyboard layout presenter to map the new preference to SwiftKey's existing
  `NEITHER` state, which adds neither Flow nor swipe gesture handlers.

## License

GPLv3. See [LICENSE](LICENSE).
