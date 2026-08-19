# Plantilla para un parche nuevo

1. Copia esta carpeta y renómbrala con el nombre corto de la app, por ejemplo `spotify/`.
2. Dentro crea subcarpetas por función: `ads/`, `premium/`, `ui/`, etc.
3. Crea un archivo `MiParche.kt` siguiendo el ejemplo de `multirun/ads/DisableAdsPatch.kt`.

## Checklist

- [ ] `packageName` correcto (ej. `com.spotify.music`)
- [ ] `appIconColor` en formato **0xRRGGBB** (sin alpha)
- [ ] Al menos una `AppTarget(version = "...")` con la versión que probaste
- [ ] `val miParchePatch = bytecodePatch(name = "...", default = true) { ... }`
- [ ] Nombre del parche en inglés o español, claro y corto

## Ejemplo mínimo

```kotlin
package maurogamervn.miapp.ads

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private val COMPATIBILITY = Compatibility(
    name = "Nombre de la app",
    packageName = "com.ejemplo.app",
    appIconColor = 0x2196F3, // RRGGBB
    targets = listOf(AppTarget(version = "1.0.0"))
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Elimina anuncios.",
    default = true
) {
    compatibleWith(COMPATIBILITY)
    execute {
        // fingerprints + patches aquí
    }
}
```
