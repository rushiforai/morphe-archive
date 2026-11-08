# Guía de patches (para cualquier app)

Este archivo reúne lo más útil de gracie-patches, doom, hxreborn, morphe-patches y morphe-ai.  
Sirve para que, cuando digas “esta app tiene X, desbloquea premium / quita anuncios”, se pueda hacer **una sola vez bien** y no subir 40 releases.

---

## 1. Regla de oro (la más importante)

**Antes de escribir un solo parche, se analiza TODO el APK.**

Si no se hace esto, el parche suele:

- no encontrar el método (fingerprint falla)
- quitar solo una parte y la app se queda colgada
- dejar checks de seguridad vivos → la app se cierra sola
- olvidar un segundo camino (UI + lógica + red) → parece que no funciona

El análisis completo al principio evita casi todos los crashes y los “no se aplica”.

### Qué revisar siempre en el primer paso

1. **Package + versión exacta** del manifest (versionName y versionCode).
2. **Protecciones**: PairIP, Jiagu, DexGuard, anti-debug, anti-tamper, firma, instalador, DRM.
3. **Cómo decide “premium / pro / desbloqueado”**:
   - SharedPreferences (`isPremium`, `isPro`, `hasSubscription`…)
   - RevenueCat / Google Play Billing / Stripe / Firebase
   - Enum o clase de “tier” (PRO, PREMIUM, UNLIMITED…)
   - Respuesta de servidor (JSON, offer, license)
4. **Anuncios**: AdMob, AppLovin, Unity, Meta, Mintegral, Pangle, Vungle, TopOn, o SDK propio.
5. **Puntos de red** que validan licencia o recompensas (OkHttp, Retrofit, interceptores).
6. **Rutas de UI** que muestran el botón de compra o el bloqueo (para no dejar pantallas rotas).
7. **Multi-DEX / frameworks**: ¿tiene classes2.dex, classes3…? ¿es Flutter, React Native, nativo?

Si algo no se puede confirmar en el código, se dice en una línea. No se inventa.

---

## 2. Estructura de un patch (Morphe)

Un patch es un archivo `.kt` en:

`patches/src/main/kotlin/app/template/patches/<nombre-app>/NombrePatch.kt`

Partes mínimas:

```kotlin
@Suppress("unused")
val nombreDelPatch = bytecodePatch(
    name = "Nombre que se ve en Morphe",
    description = "Qué hace, en una frase clara.",
    default = true,   // true = viene activado
) {
    compatibleWith(COMPATIBILIDAD_DE_LA_APP)   // package + versiones

    dependsOn(otroPatch)   // solo si hace falta otro primero

    execute {
        // aquí van los cambios
    }
}
```

- **bytecodePatch** → cambia código.
- **resourcePatch** → cambia textos, imágenes, layouts.
- **Fingerprint** → describe un método **sin usar nombres ofuscados** (los que cambian en cada update).
- **returnEarly()** / **returnEarly(true/false)** → la forma más segura de forzar un resultado.
- **returnLate()** → deja que el método haga su trabajo y solo cambia lo que devuelve (útil cuando hace cosas necesarias).
- **addInstructions** → inserta smali en un punto concreto (usar solo cuando returnEarly no alcanza).
- **clearBody()** → borra todo el cuerpo del método (y los try/catch) antes de meter instrucciones nuevas. Obligatorio si el método original tenía try/catch, si no ART tira VerifyError.

### Fingerprint bueno (no se rompe fácil)

Usa cosas que casi nunca cambian:

- tipo de retorno y parámetros
- flags (public, static…)
- llamadas a clases de sistema o de librerías conocidas (AdMob, Billing, OkHttp, Firebase…)
- textos fijos (`string("isPremium")`)
- números fijos (`literal(1544385677)`)

**Nunca** uses el nombre de clase/método de la app (`A0`, `Tl`, `r8lambda…`) como base del fingerprint. Esos cambian en cada update.

Si no encontrar el método es normal (versión distinta), usa las versiones `OrNull` para no tirar error.

Varios cambios en el **mismo** método: empieza por el último y ve hacia atrás. O usa `clearMatch()` y vuelve a buscar.

### Registros libres (importante para no crashear)

No pongas `v0` a ciegas.  
Después de `clearBody()` no se puede inventar un registro nuevo: ART se queja.  
Reutiliza un registro que ya exista y del tipo correcto, o usa `findFreeRegister` cuando esté disponible.  
Los registros de parámetros (`p0`, `p1`…) no se pueden reutilizar para otro tipo.

---

## 3. Cómo se crea un patch (flujo rápido)

1. **Análisis completo del APK** (sección 1).
2. Anotar todos los “interruptores maestros” (métodos que deciden sí/no).
3. Escribir fingerprints solo con señales estables.
4. Preferir **returnEarly** en el gatekeeper (el que decide), no solo en el “show” del anuncio o el botón.
5. Cubrir **todas** las rutas encontradas (lógica + UI + red + seguridad).
6. Si hay PairIP / virtualización / anti-tamper → parchearlos **antes** o en el mismo paquete.
7. Probar una sola vez con el análisis completo. Si falla, se ajusta el fingerprint con el error real, no se adivina.

---

## 4. Patches comunes (patrones listos)

### 4.1 Quitar anuncios

Orden correcto:

1. Buscar en el manifest `com.google.android.gms.ads.APPLICATION_ID` (AdMob) u otros SDKs.
2. Encontrar quién llama a `show` / `load` / `isReady`.
3. Subir hasta el **método que decide** si se muestra el anuncio (el gatekeeper).
4. Forzar ese método a “no hay anuncio” (`returnEarly(false)` o `returnEarly()` según el tipo).
5. También apagar los “enableAllAds”, “canShowAd”, “adEnablePlacement”, etc.

**Importante:** solo saltar el `show` deja la app esperando el callback → se queda congelada o crashea. Por eso se ataca el gatekeeper.

Otros SDKs (misma idea):

| SDK        | Métodos típicos          |
|------------|--------------------------|
| Unity Ads  | initialize, load, show   |
| AppLovin   | loadAd, showAd           |
| Meta       | loadAd, show             |
| Mintegral  | load, show, preload      |
| Pangle     | loadAd, showAd           |
| Vungle     | load, play, canPlayAd    |
| TopOn      | loadAd, show, isAdReady  |

### 4.2 Desbloquear premium / pro / suscripción

Primero identificar **qué usa la app**:

| Sistema              | Qué buscar                         | Qué hacer                              |
|----------------------|------------------------------------|----------------------------------------|
| SharedPreferences    | isPremium, isPro, hasSubscription  | returnEarly(true) en el getter         |
| RevenueCat           | getEntitlements / getActive        | forzar true / entitlements activos     |
| Google Play Billing  | BillingResult, Purchase            | resultado siempre OK / comprado        |
| Firebase Remote Config | getBoolean("premium_…")          | siempre true                           |
| Enum de tier         | PRO, PREMIUM, UNLIMITED            | devolver el valor más alto             |
| Servidor (offer)     | isValid, isExpired, featureIds     | isValid=true, isExpired=false          |

Siempre cubrir **también la UI**: banners, botones de “Unlock”, diálogos de compra. Si solo se cambia la lógica y la UI sigue mostrando “compra”, parece que no funciona.

**Capas típicas (ejemplo AccuBattery / doom):**

1. Oferta del servidor válida → `returnEarly(true)`
2. Oferta no caduca → `returnEarly(false)` en isExpired
3. Getter isPro → `returnEarly(true)`
4. LiveData / estado de UI → forzar “PURCHASED”
5. Overlay / banners → siempre modo pro

Ejemplo simple (Themezy / gracie):

```kotlin
IconIsUnlocked.method.returnEarly(true)
WallpaperIsUnlocked.method.returnEarly(true)
WidgetIsUnlocked.method.returnEarly(true)
```

### 4.3 Spoofs (hacer creer que algo es cierto)

Patrones reutilizables de doom/hxreborn (sirven en muchas apps):

| Qué spoofear              | Idea del parche                                      |
|---------------------------|------------------------------------------------------|
| Origen de instalación     | `getInstallerPackageName` / `getPackageSource` → Play Store |
| Firma / certificado       | verificación de firma siempre “ok”                   |
| Hash de cert Firebase     | spoof del hash que espera Firebase                   |
| DRM                       | respuestas DRM “válidas”                             |
| Estado de cuenta (WARP+)  | forzar UNLIMITED en el constructor o getter          |
| Debug / Frida / Xposed    | todos los detectores → false                         |
| Integridad / instalador   | verifyIntegrity / verifyInstallerSource → true       |

Orden recomendado cuando hay varios:

1. Protecciones (PairIP, anti-tamper, firma, instalador)
2. Lógica premium / ads
3. UI
4. Red (si hace falta)

### 4.4 Red (respuestas locales o reescritura)

Cuando la app pide al servidor “¿tengo recompensa?” o “¿es premium?”:

- Interceptar el cliente OkHttp / Retrofit (en el **builder**).
- Reescribir **solo** la respuesta concreta (JSON de rueda, de licencia, etc.).
- Dejar el resto del tráfico normal.

Ejemplo (Werewolf / gracie): se engancha el builder de OkHttp y se instala un hook que reescribe solo la respuesta de `goldenWheelSpin`.

Nunca se corta toda la red: eso suele crashear o dejar la app inutilizable.

### 4.5 PairIP y protecciones locales

PairIP (y similares) suelen:

- cambiar el punto de entrada de la app
- virtualizar métodos (cuerpos vacíos o nativos)
- comprobar licencia local

Orden típico en gracie:

1. **Remove Pairip Protection** → saltar el check de licencia.
2. **Remove Pairip Key Import** / virtualización → recuperar cuerpos de métodos.
3. **Disable Pairip** (parche que depende de los anteriores).

Si se deja PairIP vivo, la app puede abrirse y cerrarse sola o no aplicar nada más.

Otros checks de seguridad (AAAD / doom):

```kotlin
IsDebuggerAttached → returnEarly(false)
DetectFrida → returnEarly(false)
DetectXposed → returnEarly(false)
IsBeingTraced → returnEarly(false)
VerifyIntegrity → returnEarly(true)
VerifyInstallerSource → returnEarly(true)
```

### 4.6 Preferencias locales (offline)

Muchas apps guardan “mostrar anuncios” o “feature desbloqueada” en preferencias.

Patrón usado en gracie (Glass / Minimal / Quick Settings):

- Un parche que hace que la preferencia local diga “ads off” o “feature on”.
- Así funciona aunque no haya red y sin tocar el servidor.

Útil cuando el check de premium es solo local o cuando se quiere un interruptor simple.

### 4.7 GMS / microG / clone

Cuando la app exige Google Play Services o se quiere clonar:

- Parche de soporte GMS (redirige a microG o similar).
- Parche de clone (cambia package name + ajustes de firma/instalador).

Van **después** de las protecciones y **antes** o junto con el unlock, según el caso.

---

## 5. Por qué crashea (y cómo evitarlo desde el primer intento)

Esto es lo que más se repite. Énfasis fuerte.

### Causas típicas de crash

1. **Solo se parcheó el “show” del anuncio**  
   La app espera un callback que nunca llega → se cuelga o tira NullPointer / timeout.

2. **Falta un check de seguridad**  
   Anti-tamper, firma, instalador, PairIP → la app se cierra a propósito.

3. **Fingerprint no encuentra el método**  
   Se usó un nombre ofuscado o una señal que cambió → el parche no se aplica o lanza error.

4. **Se cambió un método que la app necesita que corra**  
   Se usó `returnEarly()` cuando hacía falta `returnLate()` (el método prepara algo y luego devuelve).

5. **Solo se tocó la lógica y no la UI**  
   La pantalla sigue esperando un estado que nunca llega → crash o bucle.

6. **Se reescribió mal una respuesta de red**  
   JSON incompleto o tipo distinto → parse error → crash.

7. **Registro libre no comprobado**  
   Se escribió `v0` sin mirar si estaba libre → bytecode inválido / VerifyError.

8. **Try/catch viejos después de borrar el cuerpo**  
   Si se usa `addInstructions` sin `clearBody()` primero, los try/catch apuntan a offsets que ya no existen → VerifyError.

9. **Multi-DEX no revisado**  
   El método está en classes2.dex o classes3.dex y el fingerprint solo miró el primero.

### Cómo evitarlo (checklist antes de entregar)

- [ ] Análisis completo del APK hecho (protecciones + premium + ads + red + UI + multi-DEX).
- [ ] Todos los gatekeepers encontrados están parcheados, no solo un `show`.
- [ ] Protecciones (PairIP, anti-debug, integridad, firma, instalador) cubiertas o confirmadas como no presentes.
- [ ] Fingerprints solo con señales estables (sin nombres ofuscados).
- [ ] Si el método hace trabajo útil → `returnLate`, no `returnEarly` a ciegas.
- [ ] UI y lógica alineadas (mismo estado “premium / sin ads”).
- [ ] Respuestas de red solo se reescriben en el endpoint concreto y con forma válida.
- [ ] Si un fingerprint puede no existir en otra versión → versión `OrNull` o mensaje claro.
- [ ] Si se reemplaza el cuerpo de un método → `clearBody()` antes de `addInstructions`.
- [ ] No se inventó ningún método ni clase que no esté en el código.

Si después de esto algo falla, el mensaje de error de la release (línea en rojo) es lo que se usa para ajustar. No se adivina.

---

## 6. Extensiones (cuando el cambio es grande)

Si el cambio es demasiado largo para meter solo en el patch (hooks de red, lógica compleja):

- Se pone el código en `extensions/extension` (Java/Kotlin).
- Se compila a `.mpe`.
- El patch lo llama con `extendWith("extensions/extension.mpe")` e `invoke-static`.

Ejemplo: hook de rueda de recompensas en Werewolf.

---

## 7. Smali listo para usar

```smali
; Siempre "sí" (true)
const/4 v0, 0x1
return v0

; Siempre "no" (false)
const/4 v0, 0x0
return v0

; No hacer nada (método void)
return-void

; Devolver null
const/4 v0, 0x0
return-object v0

; Devolver un texto fijo
const-string v0, "valor_falso"
return-object v0

; Devolver un enum concreto (ej. PRO)
sget-object v0, Lcom/app/Tier;->PRO:Lcom/app/Tier;
return-object v0
```

En la mayoría de los casos `returnEarly(...)` ya hace esto. Los smali sueltos solo hacen falta cuando se inserta en medio del método con `addInstructions`.

---

## 8. Árbol de decisión rápido

```
¿La app se cierra sola al abrir?
  → Sí → buscar PairIP / anti-tamper / firma / instalador primero.
  → No → seguir.

¿Hay anuncios?
  → Localizar gatekeeper (no solo show) y apagarlo.
  → Cubrir también enable/canShow.

¿Hay premium / pro?
  → ¿Prefs locales? → forzar true.
  → ¿RevenueCat / Billing / Firebase? → forzar respuesta positiva.
  → ¿Servidor? → isValid true + isExpired false + UI.
  → Siempre alinear la UI.

¿Hay recompensas / rueda / API?
  → Interceptar solo ese endpoint, no toda la red.

¿Hay que clonar o quitar dependencia de GMS?
  → Spoof instalador + firma + (si hace falta) GMS support.
```

---

## 9. Nombres y entrega (stealth)

- Nombres de patches y descripciones: neutros, sin palabras que activen filtros de GitHub. Preferir: “Disable Pairip”, “Unlock Local”, “Hide Ads Preference”, “Local reward flow”, “Spoof install source”.
- Cada cambio se entrega en ZIP con solo los archivos tocados + `ROUTES.txt` si hay archivos nuevos.
- Cosas de `.github/` van sueltas (no dentro del ZIP de patches).
- `AGENTS.md` se actualiza cuando cambia una regla de trabajo.

---

## 10. Resumen operativo (para cuando pidas una app nueva)

1. Me pasas el APK (o el package + versión).
2. Se hace **análisis completo** primero (protecciones, premium, ads, red, UI, multi-DEX).
3. Se listan todos los puntos reales tocados.
4. Se escriben los patches cubriendo **todas** las rutas y las protecciones.
5. Se entrega el ZIP listo para Sort Uploads.
6. Tú pruebas. Si algo falla, el log de la release sirve para el ajuste fino (una vez, no 40).

Con este orden se reduce mucho el “crashea” y el “no se aplica”.

---

*Basado en: gracie-patches (PairIP, ads, local unlock, network hook), doom/hxreborn (premium multi-capa, security bypass, spoof firma/instalador/DRM/Firebase, clearBody, GMS), morphe-ai (recon + patch-writer), Morphe-Development-Guide y patrones reales de fingerprints estables.*
