# 🧑‍💻 Desarrollo

Guía para modificar, compilar y publicar los parches de este repositorio.

## 1. Preparar el entorno

1. Instala **JDK 21** (`java -version` debe responder 21).
2. Crea un *Personal Access Token* de GitHub con el permiso `read:packages`.
   El plugin `app.morphe.patches` y el patcher se descargan desde GitHub Packages.
3. Expórtalo antes de compilar:

   ```bash
   export GITHUB_ACTOR=tu-usuario
   export GITHUB_TOKEN=ghp_xxx
   ```

4. `./gradlew buildAndroid` genera el bundle en `patches/build/libs/patches-*.mpp`.

También puedes compilar sin entorno local: cada push lanza el workflow
**Build patches bundle** (`.github/workflows/build.yml`), que deja el `.mpp` como artefacto
descargable en la pestaña *Actions*. Las releases estables las publica `release.yml`.

Alternativa para desarrollo: clona también `morphe-patcher` y `morphe-patches-library`
junto a este repositorio. `settings.gradle.kts` los detecta como *composite builds* y así
no hace falta publicar el plugin para probar cambios del patcher.

## 2. Estructura del proyecto

```text
patches/src/main/kotlin/app/parchefacemoji/patches/facemoji/
├── ads/
│   ├── Fingerprints.kt        puntos de entrada de cada red publicitaria
│   └── RemoveAdsPatch.kt      parche "Eliminar anuncios"
├── tracking/
│   ├── Fingerprints.kt        puntos de entrada de analítica y atribución
│   └── DisableTrackingPatch.kt
├── privacy/
│   └── RemoveAdIdPermissionPatch.kt
└── shared/
    ├── Constants.kt           compatibilidad con la app (paquete, versiones)
    └── Hooks.kt               ayuda para neutralizar métodos void

extensions/extension/src/main/java/app/parchefacemoji/extension/facemoji/
└── PatchHooks.java            código Java inyectado en la app (logcat)
```

## 3. Cómo funciona un parche de este repo

Los parches **no tocan el código ofuscado de Facemoji**: interceptan la API pública de los
SDK de terceros que la app incluye (AdMob, Firebase…). Esa API la conservan las reglas de
ofuscación de cada SDK, así que el parche sobrevive a las actualizaciones de la app.

Para bloquear un anuncio se reescribe el principio del método del SDK así:

```smali
const-string v0, "AdMob: banner"
invoke-static {v0}, Lapp/parchefacemoji/extension/facemoji/PatchHooks;->logBlocked(Ljava/lang/String;)V
return-void
```

El SDK nunca llega a descargar el anuncio y la app no recibe ningún callback, así que no
aparece ni el anuncio ni un mensaje de error. Las etiquetas se ven en logcat con:

```bash
adb logcat -s ParcheFacemoji
```

La implementación vive en `shared/Hooks.kt` (`Fingerprint.blockVoidMethods`), que resuelve
la huella con `matchAllOrNull()`: si el SDK no está en esa versión de la app, se ignora.

## 3 bis. Ganchos condicionales (ajustes dentro de la app)

Los tres parches no actúan siempre: cada gancho empieza preguntando si su interruptor está
activo, y si no lo está deja ejecutar el código original de la app.

```smali
invoke-static {}, Lapp/parchefacemoji/extension/facemoji/PatchHooks;->esVipActivo()Z
move-result v3
if-eqz v3, :parche_apagado
const-string v3, "vip: Fuentes de color: es VIP"
invoke-static {v3}, L.../PatchHooks;->logBlocked(Ljava/lang/String;)V
const/16 v3, 0x0
return v3
:parche_apagado
```

`v3` es el registro local más alto del método: está libre porque la inyección va en el índice 0,
donde el método original todavía no ha escrito ningún local. El cálculo está en
`shared/Hooks.kt` (`registroLibre`).

Las utilidades disponibles son `bloquearVoidSiActivo`, `forzarBooleanSiActivo`,
`forzarIntSiActivo` y `forzarBooleanObjetoSiActivo`; todas reciben el nombre del ajuste
(constantes de `Ajustes`).

## 3 ter. Forzar un valor de retorno (VIP, interruptores)

Muchas comprobaciones de la app no son métodos `void` sino booleanos (`isVip()`, `getEnable()`).
Para esas están las utilidades de `shared/Hooks.kt`:

| Utilidad | Tipo de retorno | Uso |
| --- | --- | --- |
| `forceBoolean(value, surface)` | `Z` | Apagar un interruptor o una comprobación de pago |
| `forceInt(value, surface)` | `I` | Banderas numéricas (`isVip()I` del teclado Rizz) |
| `forceBooleanObject(value, surface)` | `Ljava/lang/Boolean;` | Envoltorios (`getVipIsUnLock()`) |

Insertan al principio del método el `const-string` de traza, la llamada a `PatchHooks.logBlocked`
y el `return` con el valor fijo, así que el cuerpo original nunca se ejecuta. El parche de VIP
(`vip/UnlockVipPatch.kt`) es el ejemplo más completo.

## 4. Añadir una red publicitaria nueva

1. Añade la huella en `ads/Fingerprints.kt`:

   ```kotlin
   internal object MiRedInterstitialFingerprint : Fingerprint(
       definingClass = "Lcom/mired/ads/Interstitial;",
       name = "show",
       returnType = "V",
   )
   ```

2. Regístrala en `AD_SWITCHES` dentro de `RemoveAdsPatch.kt` (o en `VIP_FLAGS` si es una
   bandera de pago).
3. Comprueba que existe en la APK real:

   ```bash
   python3 tools/analizar_apk.py Facemoji.apkm --comprobar
   ```

## 5. Reglas de estilo

- Nombra las huellas con lo que hacen y terminadas en `Fingerprint`.
- Los parches se nombran por lo que hacen ("Eliminar anuncios") y la descripción va en
  tercera persona, presente y termina en punto.
- Las etiquetas que se envían al smali deben ser **ASCII** (sin acentos) para evitar
  problemas de codificación en el `const-string`.
- Documenta *por qué* se parchea un método, no solo cómo.

## 6. Publicar

- Los commits deben ser semánticos: `feat:`, `fix:` o `chore:`.
  `feat:` y `fix:` generan nueva versión; `chore:` no.
- Trabaja en `dev` para pre-releases y fusiona en `main` (sin *squash*) para una versión estable.
- No edites a mano `patches-list.json`, `patches-bundle.json` ni `CHANGELOG.md`: los genera
  `release.yml`.
- Opcional pero recomendado: firma las releases para que Morphe Manager rechace un bundle
  manipulado.

  ```bash
  ./gradlew generateSigningKey   # crea morphe-signing.pub y morphe-signing.key
  ```

  Sube `morphe-signing.pub`, guarda `morphe-signing.key` como secreto `MORPHE_SIGNING_KEY`
  en el repositorio y borra el fichero.
