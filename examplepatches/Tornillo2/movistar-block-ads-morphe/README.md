# 🧩 Movistar Plus – Block Ads (Morphe Patches)

Font de _patches_ per a **[Morphe](https://morphe.software)** (compatible amb l'ecosistema ReVanced) que **elimina els anuncis i els clips promocionals** de l'aplicació de **Movistar Plus per a Android TV**, sense recompilar l'app manualment: el _patcher_ modifica el bytecode de l'APK original i injecta una petita extensió.

> ⚠️ **Avís**: aquest projecte és només amb finalitats educatives i d'interoperabilitat. Aplica els _patches_ sobre una APK que hagis obtingut legalment i fes-ho sota la teva responsabilitat.

---

## ❓ Què fa

L'aplicació de Movistar Plus reprodueix anuncis inserits en el flux de vídeo (pre-roll, promocions, clips `PROMO_AD`, etc.). Aquest _patch_ intercepta el moment exacte en què el reproductor va a carregar un contingut, detecta si es tracta d'un anunci i, si ho és, **impedeix que es reprodueixi i força el salt cap al contingut real**.

En resum, el _patch_ **`Block Ads`**:

1. **Detecta** si el contingut que està a punt de reproduir-se és un anunci.
2. **Bloqueja** la inicialització del reproductor per a aquest anunci.
3. **Salta** automàticament al contingut següent (el programa/canal que l'usuari volia veure).

---

## ⚙️ Com funciona per dins

El _patch_ té dues parts que treballen juntes: el **_patch_ de bytecode** (Kotlin) i l'**extensió** (Java) que s'injecta dins de l'app.

### 1. Fingerprint – localitzar el mètode objectiu

`Fingerprints.kt` defineix un _fingerprint_ que localitza el mètode del reproductor a modificar. En lloc de buscar una cadena de text (que no existeix al bytecode), el localitza **pel nom del mètode i la classe**:

```kotlin
methodDef.name == "initializePlayer" &&
    classDef.type == "Lcom/movistarplus/androidtv/player/PlayerTV;"
```

El mètode objectiu és:

```java
PlayerTV.initializePlayer(Uri, long, boolean, PlayerDataModel, String)
```

### 2. El patch de bytecode – injectar la comprovació

`ExamplePatch.kt` (`bytecodePatch` anomenat **"Block Ads"**) injecta, al **principi** de `initializePlayer`, una crida a l'extensió i un retorn condicional en Smali:

```smali
invoke-static {p5}, Lapp/template/extension/extension/ExamplePatch;->shouldBlockAndSkip(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :continue
return-void          # si és un anunci -> surt sense inicialitzar el reproductor
:continue
nop
```

- `p5` és el `PlayerDataModel` (les dades del contingut que es vol reproduir).
- Si `shouldBlockAndSkip(...)` retorna `true`, s'executa `return-void` i **el reproductor mai arriba a muntar l'anunci**.
- Si retorna `false`, el flux continua amb normalitat.

L'extensió es vincula amb `extendWith("extensions/extension.mpe")` i el _patch_ només s'aplica a l'app de Movistar (`compatibleWith(COMPATIBILITY_MOVISTAR)`).

### 3. L'extensió – decidir i saltar

`extensions/.../ExamplePatch.java` conté la lògica en temps d'execució:

- **`shouldBlockAndSkip(Object playerData)`**: comprova el `PlayerDataModel` i decideix si és un anunci. Ho detecta de dues maneres:
  - `playerDataModel.isAds()` és `true`, o
  - `playerDataModel.getTypeOfContent()` és igual a `PlayerDataModel.TYPE_PROMO_AD` (`"PROMO_AD"`).
- Si detecta un anunci, crida **`notifyPlayerEnded()`**, que dispara l'esdeveniment `ended` cap a la capa Cordova/JS de l'app perquè avanci al contingut real:

```java
Class.forName("com.movistarplus.androidtv.MainActivity")
     .getMethod("fireEvent", String.class)
     .invoke(null, "ended");   // fireEvent és static
```

Aquesta crida estàtica és clau: `MainActivity.fireEvent(String)` és `public static` i utilitza el `cordovaWebView` intern, de manera que no cal cap instància de l'activitat.

---

## 🩹 Llista de patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.9](https://github.com/Tornillo2/movistar-block-ads-morphe/releases/tag/v1.0.9)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch en total
<details open>
<summary>📦 Movistar Plus&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Versions compatibles:**

| 26.03.100 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Descripció | ⚙️&nbsp;Opcions |
|----------|----------------|-----------|
| Block Ads | Bloqueja els anuncis i clips promocionals. | — |

</details>
<!-- PATCHES_END -->

---

## 🚀 Com utilitzar aquests patches

**Opció A – afegir la font a Morphe (recomanat):**

Afegeix aquest repositori com a _patch source_ a Morphe:

```
https://github.com/Tornillo2/movistar-block-ads-morphe
```

Després selecciona l'app de **Movistar Plus**, marca el _patch_ **Block Ads**, aplica'l sobre l'APK **original** i instal·la l'APK resultant.

**Opció B – ReVanced CLI:**

```bash
java -jar revanced-cli.jar patch \
  -b patches.rvp \
  -o movistarplus-patched.apk \
  movistarplus-original.apk
```

> Aplica sempre els _patches_ sobre una **APK original sense modificar**, mai sobre una ja pegada.

---

## 🛠️ Compilar el projecte

Requereix JDK 17+ i el _wrapper_ de Gradle inclòs.

```bash
./gradlew build
```

Això compila:

- El mòdul **`patches`** (Kotlin) → el bundle de _patches_ (`.rvp`).
- El mòdul **`extensions/extension`** (Java) → l'extensió `extension.mpe` que s'incrusta a l'app.

Consulta la [documentació de Morphe](https://github.com/MorpheApp/morphe-documentation) per a més detalls.

### Estructura del repositori

```
patches/                 # Patches de bytecode (Kotlin)
  └─ .../example/
      ├─ ExamplePatch.kt   # Patch "Block Ads": injecta la comprovació a initializePlayer
      ├─ Fingerprints.kt   # Localitza PlayerTV.initializePlayer
      └─ ../shared/Constants.kt  # COMPATIBILITY_MOVISTAR (paquet + versions)
extensions/extension/    # Extensió injectada a l'app (Java)
  └─ .../ExamplePatch.java  # shouldBlockAndSkip() + notifyPlayerEnded()
patches-list.json        # Metadades de la llista de patches
.github/workflows/       # CI: build de PRs i release automàtic (semantic-release)
```

---

## 🔍 Com verificar que funciona

Instal·la l'APG pegada i observa els logs:

```bash
adb logcat -s MorpheBlockAds
```

Quan salti un anunci hauries de veure:

```
Ad detected... Blocking playback
fireEvent('ended') dispatched successfully.
```

---

## 📜 Llicència

Aquest projecte està llicenciat sota la [GNU General Public License v3.0](LICENSE).
