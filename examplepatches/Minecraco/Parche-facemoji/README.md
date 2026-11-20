# 🧩 Parche Facemoji

[![Build patches bundle](https://github.com/Minecraco/Parche-facemoji/actions/workflows/build.yml/badge.svg)](https://github.com/Minecraco/Parche-facemoji/actions/workflows/build.yml)

Parches [Morphe](https://morphe.software) en español para **Facemoji AI Emoji Keyboard**
(`com.simejikeyboard`), el teclado con emojis, fuentes y temas de Nexileap.

### Cómo usar estos parches

Añade esta fuente a Morphe Manager con el botón de abajo, o manualmente con la URL
`https://github.com/Minecraco/Parche-facemoji`:

<a href="https://morphe.software/add-source?github=Minecraco/Parche-facemoji">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Después:

1. Descarga la APK de Facemoji **desde APKMirror** (se publica como *BUNDLE*, es decir, `.apkm`).
2. En Morphe Manager abre *Patcher*, elige Facemoji y selecciona los parches.
3. Aplica y instala la APK parcheada.

## 📦 Dónde está el `.mpp`

El archivo de parches se puede conseguir de dos formas:

1. **En cada release** (pestaña *Releases*): `patches-<versión>.mpp`, generado por
   `release.yml` con semantic-release. Las releases se crean al fusionar en `main`
   commits de tipo `feat:` o `fix:`.
2. **En cada push** (pestaña *Actions* → workflow **Build patches bundle**): artefacto
   `parche-facemoji-mpp`, sin necesidad de publicar release. También se puede lanzar a mano
   con *Run workflow*.

En ambos casos el `.mpp` se aplica en **Morphe Desktop** (*Patch bundle* → seleccionar el
fichero) o se añade como fuente local en Morphe Manager.

## 🩹 Parches

Versión objetivo del desarrollo: **Facemoji 3.7.0** (APKMirror la publica como *BUNDLE*,
es decir `.apkm`). El resto de versiones se aceptan como *experimental*.

| Parche | Por defecto | Qué hace |
| --- | --- | --- |
| **Ajustes Minecraco** | ✅ Sí | Añade la pantalla **"Ajustes Minecraco"** como primera entrada de los ajustes de Facemoji (y con icono propio), con interruptores para activar y desactivar los demás parches sin volver a parchear. |
| **Marcar la version como Mod** | ✅ Sí | Cambia el nombre de la versión de la app a `3.7.0-Mod` para distinguir la copia parcheada. |
| **Eliminar anuncios** | ✅ Sí | Apaga las **sugerencias patrocinadas** que la app inserta en la barra de sugerencias del teclado. |
| **Desbloquear VIP** | ✅ Sí | Marca como gratuitas las fuentes de color, las series de stickers, los TextBomb y las frases del teclado Rizz que la app reserva a la suscripción, y da por hechos los desbloqueos por vídeo. |
| **Desactivar rastreo** | ❌ No | Neutraliza el envío de eventos de Firebase Analytics, Crashlytics, Facebook y AppsFlyer. |
| **Quitar permiso de ID de publicidad** | ❌ No | Elimina `com.google.android.gms.permission.AD_ID` del manifiesto, así la app no puede leer el identificador de publicidad del dispositivo. |

Los parches se aplican de forma **opcional y tolerante**: si un rastreador o un SDK no está en
tu versión de Facemoji, se ignora en vez de romper el parcheo. Los parches de anuncios y de VIP
sí fallan de forma explícita si no encuentran **ninguno** de sus puntos de enganche, para que no
te quedes con una app "parcheada" que sigue igual.

### 🎛️ Ajustes dentro de la app

Con el parche **Ajustes de Minecraco** se añade una pantalla propia con tres interruptores. Se
puede abrir de dos formas:

1. **En los ajustes de Facemoji**: la fila **"Ajustes Minecraco"** aparece **la primera de
   todas**, encima de "Idiomas".
2. **Icono propio**: en el cajón de aplicaciones aparece **"Ajustes Minecraco"**, junto al de
   Facemoji.
3. **En Ajustes avanzados**: la misma fila, como tercera vía por si las otras dos fallan.

Detalle técnico: la pantalla de ajustes que se ve en la app **no usa preferencias**. La construye
`SettingFragment`, que en la 3.7.0 es la clase ofuscada `com.baidu.simeji.skins.v0`: monta un
`RecyclerView` cuyas filas son objetos del modelo `La9/b` (`String título, Drawable icono, int
tipo, String clave`) guardados en un `ArrayList`. El parche mete una fila más en el primer puesto
de esa lista y engancha el manejador de toques (`V2`) para reconocerla por identidad y abrir la
pantalla del parche.

La pantalla tiene tres interruptores:

| Interruptor | Qué hace al apagarlo |
| --- | --- |
| Bloquear anuncios | Las sugerencias patrocinadas vuelven a aparecer |
| Desbloquear VIP | Vuelven los candados y los avisos de suscripción |
| Desactivar rastreo | La app vuelve a enviar eventos de analítica |

Los cambios se aplican al instante y se guardan en el dispositivo: no hay que volver a
parchear ni reinstalar. Por dentro, cada gancho inyectado pregunta primero
`PatchHooks.esVipActivo()` (o `esAnunciosActivo()` / `esRastreoActivo()`) y, si el ajuste está
apagado, deja ejecutar el código original de la app.

El permiso de ID de publicidad no aparece como interruptor porque se quita en el manifiesto al
parchear, no en tiempo de ejecución.

### 🔍 Qué se ha encontrado en la app real (3.7.0)

Los análisis completos están en [`analisis/`](analisis) y se generan con
`tools/analizar_apk.py` sobre la APK 3.7.0 de APKMirror. Resumen:

- **La publicidad no es de AdMob.** AdMob solo está como stub de mediación (no existen
  `BaseAdView`, `InterstitialAd` ni `AdLoader`). La red real es **Pangle/CSJ (ByteDance)**,
  con unas 2.000 referencias, pero R8 ha renombrado sus clases: no queda ni un nombre estable
  dentro del SDK al que engancharse.
- **Lo que sí se puede apagar** es el motor de **sugerencias patrocinadas** del teclado
  (`com.baidu.simeji.plutus.adsuggestion.AdSuggestionUtils`): sus dos métodos de decisión y las
  tres configuraciones remotas que los alimentan. Es el anuncio que aparece mientras escribes.
- **El sistema VIP no está centralizado**: cada catálogo lleva su propia bandera
  (`CoolFontBean.isVip`, `SeriesStickerItem.isSeriesVip`, `TextBombBean.isVip`, …). Esas
  banderas tienen nombre propio y son el punto de enganche del parche de VIP.

Verificación automática contra la APK real (`--comprobar`):

```text
=== Eliminar anuncios ===   => 5/5 huellas disponibles.
=== Desbloquear VIP ===     => 12/12 huellas disponibles.
=== Desactivar rastreo ===  => 8/9 huellas disponibles. (falta Facebook, que la app no incluye)
```

### ⚠️ Estado de verificación y limitaciones

- Las huellas se comprueban contra la **APK 3.7.0 real** con `--comprobar`.
- Además, el workflow *Verificar que el parche se aplica* ejecuta el patcher completo sobre esa
  misma APK y comprueba el resultado: se aplican los 5 parches, se genera un APK de 55,9 MB, la
  actividad aparece en el manifiesto y los cuatro ganchos están en su clase
  (ver [`analisis/96-verificacion-apk.txt`](analisis/96-verificacion-apk.txt)). Eso descarta los
  fallos de smali y de manifiesto, que son los que rompen el parcheo.
- **Sigue sin probarse en un dispositivo**, así que no se puede confirmar el comportamiento
  visual (que la fila salga donde toca, que los interruptores cambien lo que deben). Por eso las
  versiones siguen apareciendo como *experimental* en Morphe Manager.
- **La publicidad a pantalla completa (bienvenida y emergentes) no se elimina**: la sirve Pangle
  con las clases renombradas y no hay un punto de enganche estable en 3.7.0. El parche de
  anuncios solo apaga las sugerencias patrocinadas del teclado.
- **El servidor sigue mandando**: si Facemoji comprueba la suscripción al descargar una fuente o
  un sticker, la descarga puede fallar aunque el candado ya no se vea.
- **La app no está ofuscada del todo**: los modelos de datos y los gestores conservan sus nombres
  (paquete `com.baidu.simeji.*`), pero la capa de UI, el motor de sugerencias por dentro y el SDK de
  anuncios sí están ofuscados. Los parches solo tocan lo que conserva nombre propio.

Si algo falla, abre una incidencia con el mensaje de error y la versión de la app, o ejecuta el
verificador incluido (ver [docs/VERIFICAR_HUELLAS.md](docs/VERIFICAR_HUELLAS.md)).

## 🩹 Lista de parches publicada

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/Minecraco/Parche-facemoji/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Facemoji AI Emoji Keyboard&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.simejikeyboard`

**🎯 Supported versions:**

| 3.7.0 |
| :---: |
| Version objetivo. Huellas y parcheo verificados en CI; el aspecto final no se ha revisado en dispositivo. | Cualquier otra version de Facemoji. Experimental: los objetivos pueden haber cambiado. Abre una incidencia si el parche falla. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Ajustes Minecraco](#ajustes-minecraco) | Anade una pantalla "Ajustes Minecraco" para activar y desactivar los parches de anuncios, VIP y rastreo sin volver a parchear. Se abre desde los ajustes avanzados de Facemoji y tambien con su propio icono en el cajon de aplicaciones. |  |
| [Desactivar rastreo](#desactivar-rastreo) | Deja de enviar los eventos de Firebase Analytics, Crashlytics, Facebook y AppsFlyer. Desactiva tambien el envio de registros de fallos. |  |
| [Desbloquear VIP](#desbloquear-vip) | Marca como gratuitos las fuentes de color, las series de stickers, los TextBomb y las frases del teclado Rizz que la app reserva a la suscripcion, y da por hechos los desbloqueos por video. Se puede activar o desactivar en los ajustes de Minecraco. |  |
| [Eliminar anuncios](#eliminar-anuncios) | Apaga las sugerencias patrocinadas que la app inserta en el teclado. Se puede activar o desactivar en los ajustes de Minecraco sin volver a parchear. En la version 3.7.0 la publicidad a pantalla completa la sirve Pangle con las clases renombradas, por lo que ese formato no se puede bloquear de forma estable. |  |
| [Marcar la version como Mod](#marcar-la-version-como-mod) | Anyade el sufijo -Mod al nombre de la version de la app (3.7.0 -> 3.7.0-Mod) para distinguir la copia parcheada de la original. |  |
| [Quitar permiso de ID de publicidad](#quitar-permiso-de-id-de-publicidad) | Elimina el permiso AD_ID del manifiesto para que la app no pueda leer el identificador de publicidad del dispositivo. |  |

</details>

<!-- PATCHES_END -->
