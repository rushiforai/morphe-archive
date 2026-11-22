# Letterboxd patches

Parches para [Letterboxd](https://letterboxd.com) (Android) que la conectan con Bardo, un
cliente de Plex.
Compatibles con [Morphe](https://github.com/MorpheApp); no son un proyecto de Morphe.

*Patches for the Letterboxd Android app that connect it with Bardo, a Plex client. Compatible with Morphe.*

## Añadir a Morphe Manager

Abre este enlace en el móvil con Morphe Manager instalado:

**[Añadir a Morphe](https://morphe.software/add-source?github=Trvnce/letterboxd-patches)**

O en Morphe Manager › Repositorios, añade `https://github.com/Trvnce/letterboxd-patches`.

La Letterboxd parcheada va firmada por Morphe, no por Letterboxd: hay que desinstalar la de
Play Store antes de instalarla (y volver a iniciar sesión), y actualizarla desde Morphe en vez
de desde Play Store.

## Qué hacen

| Parche | Efecto |
|---|---|
| **Bardo buttons** | En la ficha de una película, el logo de Bardo junto al botón del tráiler: abre la película en Bardo. |
| **Bardo where to watch** | El logo de Bardo en «Dónde verlo» cuando la película está en tu servidor de Plex. |
| **Bardo bridge** | Deja que Bardo use Letterboxd con tu sesión: notas, amigos, reseñas y diario, y actualizar tu watchlist y tu diario. |
| **Bardo recently added** | Una fila «Recién llegado a Bardo» en el inicio con las últimas películas de tu servidor. Tocar abre la ficha de Letterboxd; mantener pulsado, la película en Bardo. |
| **Bardo watchlist filter** | En los filtros de una watchlist (la tuya o la de otro), «Service» › **Bardo** deja solo lo que está en tu servidor. |
| **Hide Video Store** | Quita el Video Store: el banner de alquiler de la ficha, el carrusel del inicio y la fila del buscador. |

Bardo solo deja en el puente ids de TMDB (qué hay en tu servidor y qué ha llegado último):
ni la dirección del servidor ni ningún token salen de Bardo.

### Quitar anuncios

Este repositorio no quita anuncios. Si los quieres quitar, añade también en Morphe Manager el
repositorio de [mvaishak](https://github.com/mvaishak/letterboxd-morphe-patches) y marca de él
**solo** «Hide ads» (y, si quieres, «Hide sponsored content»): los dos repositorios se aplican
juntos sin chocar (comprobado con Letterboxd 3.6.7 y su versión 3.0.1).

<!-- PATCHES_START -->
> **[v1.2.0](https://github.com/Trvnce/letterboxd-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Letterboxd&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.letterboxd.letterboxd`

**🎯 Supported versions:**

| 3.6.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bardo bridge](#bardo-bridge) | Permite a Bardo usar Letterboxd con tu sesión: leer notas, amigos, reseñas y tu diario, y actualizar tu watchlist y tu diario. Solo responde a Bardo (comprueba su firma). |  |
| [Bardo buttons](#bardo-buttons) | Añade a la ficha de película el logo de Bardo junto al botón de tráiler (abre la película en Bardo: la ficha del servidor si está en Plex, o la de Descubrir). |  |
| [Bardo recently added](#bardo-recently-added) | Añade al inicio una fila «Recién llegado a Bardo» con las últimas películas de tu servidor (en el hueco del Video Store). Bardo solo deja ids de TMDB en el puente; los pósters son los de Letterboxd. Necesita «Bardo bridge». |  |
| [Bardo watchlist filter](#bardo-watchlist-filter) | En los filtros de una watchlist, «Service» ofrece Bardo (con su logo): deja solo las películas que están en tu servidor (según lo que Bardo deja en el puente). Necesita «Bardo bridge». |  |
| [Bardo where to watch](#bardo-where-to-watch) | Añade el logo de Bardo a «Dónde verlo» cuando la película está en tu servidor (según lo que Bardo deja en el puente). El distintivo OWN sigue siendo el de Letterboxd. |  |
| [Hide Video Store](#hide-video-store) | Oculta el Video Store de Letterboxd: el banner de alquiler de la ficha, el carrusel del inicio y la fila de «Browse by» del buscador. |  |

</details>

<!-- PATCHES_END -->

## Privacidad

- El puente usa el cliente de la propia app de Letterboxd, que pone tu sesión. El parche no
  guarda ni lee contraseñas, tokens ni cookies.
- Solo responde a Bardo: comprueba el nombre del paquete que llama **y** su firma (la de
  Google Play o la de las builds de desarrollo). Ninguna otra app puede usarlo.
- Lo que Bardo deja en el puente (qué películas tienes en tu servidor) se guarda solo en el
  móvil.

## Compilar

Hace falta JDK 21 y el SDK de Android. El patcher y el plugin de Morphe se descargan de
GitHub Packages: necesitas un token de GitHub con `read:packages` en
`~/.gradle/gradle.properties` (`gpr.user` y `gpr.key`).

```bash
./gradlew :patches:buildAndroid
```

El resultado es `patches/build/libs/patches-<versión>.mpp`. Al hacer push a `main`, el workflow
`Release` publica una release con el `.mpp` y actualiza `patches-bundle.json`, que es lo que lee
Morphe Manager.

Hecho a partir de [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
Licencia GPLv3 (ver `LICENSE` y `NOTICE`).
