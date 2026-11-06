# Backdrop by Kyant, unchanged

These two folders hold source files from
[Kyant0/AndroidLiquidGlass](https://github.com/Kyant0/AndroidLiquidGlass), copied as they are
from commit [`65ab177e`](https://github.com/Kyant0/AndroidLiquidGlass/tree/65ab177e90e5c1d8c62e70cf7755841982da65f6)
(26 August 2026). They are licensed under the Apache License 2.0, see `LICENSE` in each folder.

| Here | Upstream |
| --- | --- |
| `backdrop/src/` | `backdrop/src/` (`commonMain` and `androidMain`): the glass itself |
| `backdrop-catalog/src/commonMain/.../components/` | `LiquidBottomTabs`, `LiquidBottomTab`, `LiquidButton`, `LiquidSlider`, `LiquidToggle` from the catalog app |
| `backdrop-catalog/src/commonMain/.../utils/` | `DampedDragAnimation`, `InteractiveHighlight`, `DragGestureInspector`, `Coroutines.kt`, which the components use |
| `backdrop-catalog/src/androidMain/.../utils/Coroutines.kt` | the Android `actual` of `Coroutines.kt` |

Nothing in `src/` is edited. Only the `build.gradle.kts` files are ours: they build the copies
as Kotlin Multiplatform libraries for Android, so the Liquid Glass extension can use them.
The extension calls the components from its own code (`LiquidTabBar.kt`, `SettingsSheet.kt`).

To check that the copies are unchanged:

```sh
git clone https://github.com/Kyant0/AndroidLiquidGlass /tmp/alg
git -C /tmp/alg checkout 65ab177e90e5c1d8c62e70cf7755841982da65f6
for f in $(find libs -name '*.kt' -not -path '*/build/*'); do
  sub=${f#libs/*/}
  cmp "$f" "$(find /tmp/alg -path "*/$sub" -not -path '*/build/*' | head -1)" || echo "changed: $f"
done
```

When R8 builds the extension, it moves these classes to `app.liquidmusic.shaded` so they cannot
clash with the classes inside Apple Music. That changes the compiled names only, not the code.
