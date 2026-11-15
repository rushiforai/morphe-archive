# Material Capsule – Technische Dokumentation

## Ziel-App

| | |
|---|---|
| Name | Material Capsule |
| Paket | `com.pryshedko.mtisland` |
| Version | 17.3 |
| VersionCode | 173 |
| SDK | minSdk 31, targetSdk 36 |
| UI | Jetpack Compose (R8-obfuskiert, `defpackage`), `MainAppActivity` |
| App-Schutz | PairIP (nur Lizenzcheck, `com.pairip.application.Application`) |
| Verteilung | XAPK: Base-APK + `config.arm64_v8a.apk` + Sprach-Splits (APKPure) |
| Signatur | APKPure-Signatur, SHA-256 des XAPK siehe unten |

Referenz-XAPK:
`MaterialCapsule_17.3.xapk`,
SHA-256 `7B68B2BF381C8E6B84D9837D1C93AFA4B68DE806D4CF7F19DB25212121719B94`,
23.978.982 Bytes.

## Bestandsaufnahme

### Kein Werbe-SDK

Die App enthält **kein** Werbe-SDK. Geprüft wurden unter anderem:

- AdMob / `play-services-ads` (nur `play-services-ads-identifier` als
  transitive Abhängigkeit von `play-services-measurement`),
- AppLovin, Unity Ads, ironSource/LevelPlay, Meta Audience Network,
- Pangle, Vungle, Chartboost, Mintegral, InMobi, Smaato, StartApp, Tapjoy.

Es gibt keine `InterstitialAd`-/`RewardedAd`-/`AdView`-Klassen, keine
Ad-Unit-Strings und keinen `com.google.android.gms.ads.APPLICATION_ID`-Eintrag
im Manifest. Die im Store-Screenshot ggf. sichtbare Kennzeichnung „enthält
Werbung“ spiegelt sich im Client nicht wider. **Folgerung:** Es gibt keinen
sinnvollen Ads-Patch für diese App; ein solcher würde nur Code entfernen, den
es nicht gibt.

### Firebase Analytics

Die App bindet Google Analytics for Firebase vollständig ein:

- `FirebaseInitProvider` und die Analytics-Komponenten-Registrare im Manifest,
- `com.google.firebase.analytics.FirebaseAnalytics`,
- `AppMeasurementService` / `AppMeasurementJobService`,
- eigene Wrapper-Klasse (`rf1`, `vz7`), die u. a. `select_item` loggt.

Die relevanten Schalter sind im SDK vorhanden und dokumentiert:

| Meta-Data-Schlüssel | Wirkung |
|---|---|
| `firebase_analytics_collection_deactivated` | `true` = SDK verwirft jedes Event, bevor es in die Queue geht |
| `google_analytics_adid_collection_enabled` | `false` = keine Advertising-ID lesen |
| `google_analytics_ssaid_collection_enabled` | `false` = keine App-Set-ID lesen |

Nachweis im DEX (jadx): `defpackage/ms8.java:178` liest
`firebase_analytics_collection_deactivated`, `defpackage/t79.java` und
`defpackage/uj9.java` lesen `google_analytics_adid_collection_enabled`.

### PairIP

`com.pairip.application.Application` erbt von `com.pryshedko.mtisland.App` und
ruft in `attachBaseContext` `LicenseClient.checkLicense(context)` auf. Zusätzlich
registriert das Manifest `com.pairip.licensecheck.LicenseActivity` (kein
`LicenseContentProvider` in dieser Variante).

Es gibt **kein** `libpairipcore.so` und keinen `com.pairip.VMRunner`; die App
nutzt damit dieselbe Lizenzcheck-only-Variante wie Memorize Pi Digits. Deshalb
ist der PairIP-Patch im Bundle **geteilt** (`patches/pairip/BypassPairIpPatch.kt`)
und gilt für beide Apps.

### Billing / Pro

Die App nutzt Play Billing 9.1.0; `MainAppActivity` liest u. a. das Extra
`showUnlock`. Der Pro-Zustand ist ein einzelner verschlüsselter Wert im
DataStore:

| Element | Bedeutung |
|---|---|
| `uu1` | Entitlement-Klasse (`defpackage/uu1`) |
| `uz5` (`SECURE_DATA`) | DataStore, in dem der Wert liegt |
| Alias `pro_version_key` | AndroidKeyStore-AES-Schlüssel (CBC/PKCS7) |
| Klartext `"yes"` / `"no"` | Pro aktiv / nicht aktiv |
| `uu1.a(String, SecretKey)` | Entschlüsselung (Base64 → IV + Ciphertext) |
| `uu1.b()` | Schlüsselfabrik (`SecretKey`) |
| `uu1.c(kj1)` | Suspend-One-Shot-Lesung des Werts |
| `uu1.d()` | `Flow<Boolean>` für die Feature-Gates |
| `uu1.e(boolean, ...)` | Schreiben des Werts (nach Kauf) |

Alle Feature-ViewModels (`ya3`, `kh2`, `vz7`, `su4`, `hr2`, …) sammeln
`uu1.d()`; die UI-Strings `main_screen_unlock_pro`, `gestures_pro_action` und
`pro_features_title` hängen ausschließlich an diesem Zustand. Der Flow läuft
durch den Transform `pu1` (implementiert `az2`), der den DataStore-Snapshot
liest, entschlüsselt und das `Boolean` an den Collector übergibt — zusätzlich
verlangt er `ty1.d` (`integrity_status`) und lehnt
`ty1.b` (`custom_status_bar_height`) == 148 ab. `u40.b` (hasPurchased) wird nur
innerhalb von `u40` aufgerufen, es gibt kein separates UI-Gate.

## Patches

### Disable Firebase Analytics tracking

Datei: `patches/src/main/kotlin/app/memorizepi/patches/mtisland/tracking/DisableFirebaseAnalyticsPatch.kt`

Reiner Manifest-Patch (`resourceXml("AndroidManifest.xml")`), kein DEX-Eingriff:

1. `meta-data`-Einträge unter `<application>` setzen bzw. ersetzen:
   - `firebase_analytics_collection_deactivated` = `true`
   - `google_analytics_adid_collection_enabled` = `false`
   - `google_analytics_ssaid_collection_enabled` = `false`
2. `<uses-permission>`-Knoten entfernen:
   - `com.google.android.gms.permission.AD_ID`
   - `android.permission.ACCESS_ADSERVICES_AD_ID`
   - `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`

Vorteil gegenüber einem Smali-Patch: Die Aufrufstellen sind durch R8
obfuskiert (10.118 Klassen in `defpackage`), die Manifest-Schalter sind
dokumentiert und versionsstabil. Es wird kein App-Feature verändert.

### Unlock Pro features

Datei: `patches/src/main/kotlin/app/memorizepi/patches/mtisland/pro/UnlockProPatch.kt`

Der Patch setzt an der Entstehung des Pro-Zustands an, nicht an der UI:

1. **Flow-Transform** (`pu1`, gefunden über das Interface `Laz2;`, das Literal
   `"yes"` und den Aufruf `uu1.a(String, SecretKey)`) emittiert an **beiden**
   `az2.d(Object, ij1)`-Aufrufstellen `Boolean.TRUE` statt des berechneten
   Werts (`sget-object` direkt vor dem `invoke-interface`, absteigend nach
   Index eingefügt). Damit sehen alle Collector sofort Pro als aktiv, und der
   Integrity-Check ist mit erledigt.
2. **Suspend-One-Shot-Lesung** (`uu1.c`, gefunden über den Feldzugriff
   `ty1.d` plus Schlüsselfabrik und Decrypt-Helper in derselben Klasse) gibt
   vorzeitig `Boolean.TRUE` zurück, damit die Kaufprüfung nicht widerspricht
   und Pro nie zurückgenommen wird.
3. **Gesten-Schalter** (`db3.x`, der generierte Setter von
   `isEnabled_`) speichert immer `true`. Gefunden über das Protobuf-Feld
   `gestureActionId_` (nur die Gesten-Klasse `db3` hat es; `mg5` und `zq6`
   haben ebenfalls ein `isEnabled_`, sind aber andere Modelle).

Warum Schritt 3 nötig ist: Die App schaltet beim Start alle Gesten selbst ab.
Auslöser ist der Pro-/Billing-Abgleich (`u40` → `q40.u()` →
`ny1.b(...)` → `m5` mit `pswitch_4`), der über die Massen-Reset-Funktion
`db3.x(false)` plus `db3.H(0)` **jede** Geste deaktiviert. Da der gepatchte
Build immer Pro meldet, darf dieser Reset nie gewinnen.

Nebeneffekt: Ein Gesten-Schalter springt wieder an, wenn man ihn von Hand
ausschaltet. Eine Geste, die nicht mehr gewünscht ist, wird deshalb gelöscht
statt deaktiviert.

Das Billing (`u40`, `sku_five_dollars`, Play Billing 9.1.0) bleibt unverändert:
Es existiert weiter und schreibt den Wert nach einem echten Kauf, die App ist
nur nicht mehr darauf angewiesen.

Die Fingerprints matchen die obfuskierten Klassen **strukturell**, nicht über
ihre Namen. Eine neu obfuskierte Version lässt den Patch dadurch laut
fehlschlagen, statt die falsche Methode zu verändern.

Nebeneffekt, der bewusst in Kauf genommen wird: Der Integritätsstatus
(`ty1.d`) wird für Pro nicht mehr ausgewertet; die übrigen
Manipulationsprüfungen der App (PairIP, Signatur) bleiben unverändert und
werden weiterhin vom PairIP-Patch behandelt.

### Bypass PairIP license check

Datei: `patches/src/main/kotlin/app/memorizepi/patches/pairip/BypassPairIpPatch.kt`

Gemeinsam für `com.unknownprojectx.pi` und `com.pryshedko.mtisland`. Setzt
folgende Methoden auf `return-void` (bzw. `return true`):

- `LicenseClient.checkLicense(Context)`
- `LicenseClient.initializeLicenseCheck()`
- `LicenseClient.stopTrial(Context)`
- `LicenseClient.performLocalInstallerCheck()` → `return true`

Die Namen stammen aus dem nicht obfuskierten PairIP-Glue und sind für beide
Apps identisch.

## Kompatibilität

`patches/src/main/kotlin/app/memorizepi/patches/mtisland/shared/Constants.kt`:

```kotlin
Compatibility(
    name = "Material Capsule",
    packageName = "com.pryshedko.mtisland",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x212121,
    targets = listOf(AppTarget(version = "17.3", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 173))),
)
```

Der Icon-Farbwert `#212121` entspricht `ic_launcher_background` aus der App.

## Build und Test

```powershell
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot"

# Integrationstest gegen die originale Base-APK
.\gradlew.bat :patches:runBundleTestMaterialCapsule "-Pversion=1.6.0"

# Release-Bundle (muss zuletzt laufen, fügt classes.dex hinzu)
.\gradlew.bat clean :patches:generatePatchesList "-Pversion=1.6.0"
.\gradlew.bat :patches:buildAndroid "-Pversion=1.6.0"
```

Der Test `RunBundleTestKt` filtert die geladenen Patches anhand ihrer
`Compatibility`-Metadaten auf das Paket der Eingabe-APK. Dadurch werden beim
Material-Capsule-Lauf die Pi-Patches (Ads, Unity-Szenen) nicht angewendet und
umgekehrt.

Geprüft wird:

- `Lcom/pairip/licensecheck/LicenseClient;#checkLicense` beginnt mit
  `return-void`,
- der Pro-Flow-Transform: jeder `INVOKE_INTERFACE`-Emit auf
  `az2.d(Object, ij1)` wird von einem `sget-object ... Boolean.TRUE`
  unmittelbar davor begleitet (beide Emit-Stellen),
- die Pro-One-Shot-Lesung beginnt mit `sget-object Boolean.TRUE` +
  `return-object`,
- `AndroidManifest.xml` enthält die drei Analytics-Schalter,
- `AndroidManifest.xml` enthält keine der drei Tracking-Permissions mehr
  (Suche als UTF-8 und UTF-16LE im binären String-Pool).

## Installation und Play Protect

Material Capsule deklariert `BIND_ACCESSIBILITY_SERVICE`
(`GlobalActionBarService`) und `BIND_NOTIFICATION_LISTENER_SERVICE`
(`NotificationService`). Das sind die Kernfunktionen (Gesten, Island-
Benachrichtigungen) und lässt sich nicht entfernen, ohne die App unbrauchbar zu
machen.

Googles Play-Protect-Regel für Internet-Sideloading-Quellen blockt genau diese
Kombination **hart** (Dialog mit nur „OK“, keine Installationsoption), wenn das
APK aus Browser, Messenger oder Dateimanager installiert wird:
<https://developers.google.com/android/play-protect/warning-dev-guidance>
(Trigger: `RECEIVE_SMS`, `READ_SMS`, `BIND_NOTIFICATION_LISTENER_SERVICE`,
`BIND_ACCESSIBILITY_SERVICE`).

Deshalb ist der Installationsweg entscheidend, nicht die Signatur:

- Morphes `SessionInstaller` setzt `PACKAGE_SOURCE_LOCAL_FILE`
  (`domain/installer/SessionInstaller.kt`), also „lokal erzeugte Datei“ statt
  „Internet-Download“. Ein in Morphe gepatchtes und **dort** installiertes
  Material Capsule läuft damit ohne Play-Protect-Dialog bei aktiver Protection.
- Alternativen: `adb install -r -d <apk>` oder Play-Protect-Scannen kurz aus.
- Signaturschlüssel und Paket-Rename sind wirkungslos; Memorize Pi bekommt nur
  die weiche Warnung, weil es keine der vier Fähigkeiten deklariert.

## Grenzen

- **Kein Gerätetest möglich.** In der Build-Umgebung gibt es kein Android-SDK,
  kein `adb` und keinen Emulator. Verifiziert sind der Patch-Lauf, das
  resultierende DEX und das resultierende Manifest, nicht das Laufzeitverhalten
  auf einem Gerät.
- Das XAPK enthält nur `arm64-v8a`. Andere ABIs werden nicht unterstützt.
- Die App ist stark R8-obfuskiert. Zukünftige Versionen können die
  Manifest-Schalter unverändert lassen (dokumentierte Firebase-API), aber die
  PairIP-Fingerprints müssen bei einem Wrapper-Update erneut geprüft werden.
- Die Pro-Fingerprints hängen an der obfuskierten Entitlement-Kette
  (`Laz2;`, `"yes"`, `uu1.a(String, SecretKey)`, `ty1.d`). Bei einer neuen
  App-Version können sich diese Klassen ändern; der Patch bricht dann mit einer
  klaren Meldung ab, statt die falsche Methode zu patchen.
- Der Pro-Unlock umgeht die Bezahlschranke der App. Das ist urheber- und
  lauterkkeitsrechtlich relevant (u. a. § 95a UrhG) und kann zur Ablehnung
  durch den Community-Index führen — siehe `README.md`, Abschnitt
  „Legal notice“.
- Die Entfernung der `AD_ID`-Permission kann dazu führen, dass die
  Firebase-Konsole keine adressierbaren Zielgruppen mehr erhält — das ist der
  beabsichtigte Effekt.
