# Technische Dokumentation

## Ziel-App

| | |
|---|---|
| Name | Memorize Pi Digits - 3.14π |
| Paket | `com.unknownprojectx.pi` |
| Version | 11.01 |
| VersionCode | 11010 |
| SDK | minSdk 32, targetSdk 37 |
| Engine | Unity (IL2CPP), Launcher `com.unity3d.player.UnityPlayerActivity` |
| Werbe-SDKs | AdMob (`ca-app-pub-5765285575554725~2670182333`), ironSource/LevelPlay, Tapjoy |
| App-Schutz | pairip (Play-Lizenzcheck), `com.pairip.application.Application` |
| Verteilung | XAPK: Base-APK + `config.arm64_v8a.apk` + `config.xxhdpi.apk` (APKPure) |

## Betroffene Stellen

### Unity-Plugin-Glue (nicht obfuskiert – stabil)

Die Spiellogik ist native IL2CPP, doch die Werbeanzeige selbst ist ein
Android-View. Der Unity-Plugin-Layer `com.homelib.android.*` verbindet
beide Welten. Der Banner kann über drei Ebenen angefordert werden:

```java
// 1) com.homelib.android.device.DeviceManager
public void ShowBannerAd(final int i2) {
    runSafelyOnUiThread(() -> this.adManager.ShowBannerAd(i2));
}

// 2) com.homelib.android.ad.AdManager
public void ShowBannerAd(int i2) {
    if (hasBanner) this.admob.showBannerAd();
}

// 3) com.homelib.android.ad.AdmobAdapter
public void showBannerAd() { ... create(...); ... }
```

Warum alle drei? Die C#-Seite referenziert `com.homelib.android.ad.AdManager`
in `global-metadata.dat` direkt (neben `DeviceManager`), kann die Singleton-
Instanz also per JNI ansprechen. Wird nur `DeviceManager` gepatcht, bleibt der
Banner sichtbar (am Gerät beobachtet in 1.1.0).

`AdmobAdapter.showBannerAd()`

1. Legt bei Bedarf einen AdView (`z2.b` – Banner-View des Google-Mobile-Ads
   v7/„ads_mobile_sdk“) an und fügt ihn via `Activity.addContentView(...)` am
   oberen oder unteren Rand des Unity-Contents hinzu.
2. Stellt den Banner-Request an AdMob.
3. Bei `onAdLoaded` → `show()` → `setVisibility(VISIBLE)`.

### Prime Button (Unity/NGUI, kein AdMob)

Der im Hauptmenü sichtbare „Prime Button“ ist **kein** AdMob-Kreativ, sondern
ein Unity-GameObject in der Szene `Assets/Scene/MainScene.unity`:

```
UI Root
└── MainMenu
    └── Shift
        └── Prime Button        (GameObject aktiv, Skalierung 1)
            ├── Label
            └── YesLabel
```

Der Button verweist auf die andere App des Entwicklers
(`com.unknownprojectx.prime.number`, in `global-metadata.dat` als
Cross-Promo-Ziel gelistet) und wird über `OnClickPrimeNumber` geöffnet.

Da er nicht im DEX liegt, kann er nicht per BytecodePatch entfernt werden.
Stattdessen bearbeitet der Patch **Remove cross-promotion** das Bundle
`assets/bin/Data/data.unity3d` (UnityFS, Szenen `level0`–`level3`) direkt:

- `GameObject` `Prime Button` in `level0` → `m_IsActive = False`
- zugehöriger `Transform` → `m_LocalScale = (0, 0, 0)`

Die Skalierung 0 stellt sicher, dass der Button auch dann unsichtbar bleibt,
wenn das Menü-Script ihn zur Laufzeit erneut aktiviert. Die Referenz- und
Entwicklungsskripte `tools/unity/patch_prime_button.py` und
`tools/unity/patch_promote_icons.py` (Python + UnityPy) erzeugen dieselben
Bytes; im Bundle steckt die Kotlin-Portierung
(`patches/.../scenes/UnityBundlePatcher.kt`).

### Seitliche Cross-Promo-Icons (Unity/NGUI, kein AdMob)

Rechts und links im Hauptmenü standen je drei Icons für andere Spiele des
Entwicklers. Sie hängen ebenfalls an der Unity-Szene:

```
UI Root
└── MainMenu
    ├── Shift                        (die eigentlichen Menü-Buttons)
    └── PromoteIcon                  (in der Szene inaktiv)
        └── Icons
            ├── Icon (0)   (-250,    0)   ┐
            ├── Icon (2)   (-250, -120)   ├ 3 links
            ├── Icon (4)   (-250, -240)   ┘
            ├── Icon (1)   ( 250,    0)   ┐
            ├── Icon (3)   ( 250, -120)   ├ 3 rechts
            └── Icon (5)   ( 250, -240)   ┘
```

Obwohl `PromoteIcon` in der serialisierten Szene inaktiv ist, sind die Icons
am Gerät sichtbar: Das `PromoteIcon`-MonoBehaviour hält Referenzen auf die
sechs `OtherGamesButton`-Komponenten der Icons und aktiviert sie zur Laufzeit,
sobald Promo-Daten vorliegen. Eine reine Szenen-Deaktivierung des Containers
würde daher nicht genügen.

Der Patch bearbeitet deshalb den **kompletten Teilbaum** in `level0`
(MainScene), `level1` (ReadScene) und `level2` (GameScene); `level3`
(NetworkGameScene) enthält keinen `PromoteIcon`:

- jedes `GameObject` im Teilbaum → `m_IsActive = False`
- jeder zugehörige `Transform` → `m_LocalScale = (0, 0, 0)`

Die Skalierung 0 ist der entscheidende Teil: Sie bleibt auch dann wirksam,
wenn ein Script die GameObjects wieder aktiviert. Zugleich schrumpfen die
`BoxCollider` (100×100) der Icons auf 0, sodass unsichtbare, aber noch
anklickbare Flächen ausgeschlossen sind. Derselbe Szenen-Patch läuft im
Morphe-Bundle (Kotlin) und in der direkt installierbaren APK; die
Python-Skripte in `tools/unity/` dienen als Referenz und zum Vergleich.

## Szenen-Patch im Morphe-Bundle

Das `.mpp` enthält seit 1.4.0 auch die Szenen-Änderung. Sie läuft als
`rawResourcePatch` und ersetzt `assets/bin/Data/data.unity3d` als Ganzes:

1. **Container parsen:** `UnityFS`-Signatur, Version 8, Block-Directory
   (Big-Endian) und Dateiliste lesen. Die Blöcke sind mit LZ4 (HC)
   komprimiert; die 128-KiB-Blöcke werden mit einem eigenen LZ4-Block-Codec
   dekomprimiert.
2. **SerializedFile lesen:** Für `level0`–`level3` die Objekttabelle lesen
   (Version 22, `enable_type_tree = 0`). Die Feldlayouts sind für diese
   Unity-Version fest:
   - `GameObject`: `int32 componentCount`, `ComponentPair[12 × count]`,
     `uint32 layer`, `string name`, `uint16 tag`, `uint8 m_IsActive`
   - `Transform`: `PPtr` (12), Quaternion (16), Position (12),
     Scale (12, Offset +40), `vector<PPtr> children`, `PPtr father`
3. **In-place patchen:** `m_IsActive = 0` und `m_LocalScale = (0,0,0)`.
   Die Objektgrößen bleiben unverändert, daher bleiben alle Offsets gültig.
   Abweichende Layouts (andere Transform-Größe, fehlende Kinder, Big-Endian)
   brechen mit `PatchException` ab, statt ein kaputtes Bundle zu schreiben.
4. **Neu schreiben:** Nur die betroffenen Blöcke werden neu komprimiert,
   die Block-Directory wird neu aufgebaut (Info am Ende, LZ4). Vor dem
   Zurückschreiben wird das Ergebnis erneut geparst und mit den gepatchten
   Rohdaten verglichen (Round-Trip-Check).
5. **ZIP-Eintrag:** `data.unity3d` bleibt **STORED**. Morphe übernimmt das
   aus `uncompressed-files.json` der Eingabe-APK; der Integrationstest
   prüft die Methode am fertigen APK.

Geprüft im Bundle-Test: 50 Zielobjekte (25 GameObjects, 25 Transforms),
172 geänderte Bytes, keine Änderung außerhalb der Zielobjekte. Ein Vergleich
mit der UnityPy-Referenz (`out_side/data.unity3d`) ergibt byte-identische
Zielobjekte.

> **Wichtig beim Neubau der APK:** Der ZIP-Eintrag
> `assets/bin/Data/data.unity3d` muss wie im Original **unkomprimiert
> (STORE, Methode 0)** bleiben, ebenso `resources.arsc`. Wird das Bundle
> deflated, kann Unity es auf Android nicht mehr laden. `zipalign` und
> Signatur müssen danach erneut ausgeführt werden.

### Interstitial/Rewarded (unberührt)

`AdManager.ShowFullScreenAd` / `PlayRewardAd` sowie
`IronSourceAdapter` (LevelPlay-Interstitial/-Rewarded) und Tapjoy-Offerwall
bleiben unverändert.

## Patch-Design

Die Ad- und PairIP-Patches sind **BytecodePatches** (Patch-Engine: Morphe
Patcher), ohne Abhängigkeiten von Ressourcen oder Extensions. Der
Szenen-Patch ist ein **rawResourcePatch** und ergänzt dieselbe `.mpp` um die
Unity-Bundle-Bearbeitung.

```
patches/src/main/kotlin/app/memorizepi/patches/pi/
├── shared/Constants.kt                     Compatibility-Deklaration (XAPK, arm64-v8a, 11.01/11010)
├── ads/Fingerprints.kt                     4 Banner-Fingerprints (DeviceManager, AdManager, AdmobAdapter)
├── ads/RemoveHomeScreenAdsPatch.kt
├── pairip/BypassPairIpPatch.kt             LicenseClient-Fingerprints + Bypass
└── scenes/
    ├── RemoveCrossPromoScenesPatch.kt      rawResourcePatch für data.unity3d
    ├── UnityBundlePatcher.kt               UnityFS-/SerializedFile-Parser und In-place-Patch
    └── Lz4Block.kt                         LZ4-Block-Codec (dekomprimieren/komprimieren)
```

### Fingerprints (Banner)

```kt
object HomeBannerAdFingerprint : Fingerprint(          // DeviceManager
    definingClass = "Lcom/homelib/android/device/DeviceManager;",
    name = "ShowBannerAd", returnType = "V", parameters = listOf("I"),
)

object AdManagerShowBannerAdFingerprint : Fingerprint( // AdManager
    definingClass = "Lcom/homelib/android/ad/AdManager;",
    name = "ShowBannerAd", returnType = "V", parameters = listOf("I"),
)

object AdmobShowBannerAdFingerprint : Fingerprint(     // AdmobAdapter
    definingClass = "Lcom/homelib/android/ad/AdmobAdapter;",
    name = "showBannerAd", returnType = "V", parameters = emptyList(),
)

object AdmobShowFingerprint : Fingerprint(             // AdmobAdapter
    definingClass = "Lcom/homelib/android/ad/AdmobAdapter;",
    name = "show", returnType = "V", parameters = emptyList(),
)
```

Robustheit: Die Plugin-Klassen und Methodennamen werden nicht obfuskiert
(JNI-Entry, aus IL2CPP per Namen gecalled). Zusätzlich werden Signatur
(`(I)V` bzw. `()V`) und defining class geprüft. Ohne Treffer bricht der Patch
mit einer kontrollierten `PatchException` ab (keine Annahmen).

### Änderung

```kt
execute {
    HomeBannerAdFingerprint.method.returnEarly()          // DeviceManager
    AdManagerShowBannerAdFingerprint.method.returnEarly() // AdManager
    AdmobShowBannerAdFingerprint.method.returnEarly()     // AdmobAdapter
    AdmobShowFingerprint.method.returnEarly()             // AdmobAdapter.show()
}
```

`returnEarly()` fügt am Methodenbeginn ein `return-void` ein; der Originalcode
der Methoden (Dispatch auf den UI-Thread → Banner-View erzeugen →
AdMob-Request → `setVisibility(VISIBLE)`) wird nie ausgeführt.

### PairIP-Bypass

```kt
execute {
    LicenseCheckFingerprint.method.returnEarly()                    // zentraler Einstieg
    LicenseInitializeFingerprint.method.returnEarly()               // initializeLicenseCheck()
    LicenseStopTrialFingerprint.method.returnEarly()                // stopTrial()
    LicenseLocalInstallerCheckFingerprint.method.returnEarly(true)  // performLocalInstallerCheck() -> true
}
```

`LicenseClient.checkLicense(Context)` ist der einzige Einstiegspunkt; er wird
von `com.pairip.application.Application#attachBaseContext` und
`LicenseContentProvider#onCreate` aufgerufen. Ist er ein No-Op, wird kein
`LicenseClient` konstruiert – kein Lizenzdienst, kein Paywall-Intent, kein
`System.exit`.

## Verzichtetes

- **Kein Black-Placeholder-View**: Die leere Fläche zeigt den Unity-Hintergrund
  (schwarz), was der Anforderung „schwarze Fläche“ ohne zusätzliche
  Abhängigkeit entspricht.
- **Keine Änderung an Interstitials/Rewards**.
- Ursprünglich war laut Master-Prompt §10 auch eine PairIP-Umgehung
  ausgeschlossen; der Auftraggeber hat diese Vorgabe für dieses rein private,
  nicht veröffentlichte Projekt ausdrücklich aufgehoben (siehe README).

## pairip im Detail (am Gerät verifiziert)

`AndroidManifest.xml` deklariert `android:name="com.pairip.application.Application"`.
Es handelt sich um die **license-check-only**-Variante: kein
`libpairipcore.so`, keine `com.pairip.VMRunner`-Klassen. Beim Start läuft
`LicenseClient.checkLicense(context)` → `initializeLicenseCheck()`:

1. `performLocalInstallerCheck()` – `PackageManager.getInstallSourceInfo()` muss
   `com.android.vending` als Installer liefern (sonst „wrong installer“).
2. Bindung an `com.android.vending.licensing.ILicensingService`; die signierte
   Lizenzantwort wird gegen den eingebetteten Lizenz-Public-Key geprüft.
3. Bei Fehlschlag: `LicenseActivity` startet den Paywall-PendingIntent
   (Play-Store-Seite) und beendet die App (`finishAndRemoveTask`, `exit`).

Ein neu signierter Build scheitert an Schritt 1 und 2; der Bypass-Patch
neutralisiert daher Schritt 0 (`checkLicense`), bevor irgendetwas davon läuft.



## Verifikation (tatsächlich ausgeführt)

- **DEX:** `runBundleTest` / `patchMergedApp` meldet `Changed 4 of 10030
  classes` und verifiziert im gepatchten `classes2.dex`, dass alle fünf
  Zielmethoden mit `return-void` beginnen: `DeviceManager#ShowBannerAd`,
  `AdManager#ShowBannerAd`, `AdmobAdapter#showBannerAd`, `AdmobAdapter#show`,
  `LicenseClient#checkLicense`.
- **Unity-Bundle (Prime Button, 1.2.0):** 2336 Objekte vor und nach der
  Bearbeitung; genau zwei Objekte unterscheiden sich (`GameObject` 73 →
  `m_IsActive`, `Transform` 265 → `m_LocalScale`), alle übrigen 2334 Objekte
  sind byte-identisch.
- **Unity-Bundle (seitliche Icons, 1.3.0):** 2336 Objekte; gegenüber dem
  1.2.0-Bundle ändern sich genau 45 Objekte (21 × `GameObject.m_IsActive`,
  24 × `Transform.m_LocalScale`), ausschließlich innerhalb der
  `PromoteIcon`-Teilbäume in `level0`/`level1`/`level2`. Die übrigen 2291
  Objekte sind byte-identisch; der Prime Button bleibt inaktiv und auf
  Skalierung 0.
- **Unity-Bundle (1.4.0, Kotlin-Patch im .mpp):** `runBundleTest` prüft am
  fertigen APK:
  - `assets/bin/Data/data.unity3d` ist **STORED** (Methode 0),
  - 50 Zielobjekte (25 GameObjects, 25 Transforms) sind inaktiv bzw. auf
    Skalierung 0,
  - genau 172 Bytes unterscheiden sich gegenüber dem Original, alle innerhalb
    der Zielobjekte; außerhalb ändert sich kein Byte,
  - mit `MORPHE_SCENE_REFERENCE` sind die 50 Zielobjekte byte-identisch zur
    UnityPy-Referenz (`out_side/data.unity3d`).
- **APK:** ZIP-Eintrag `assets/bin/Data/data.unity3d` und die DEX-Einträge der
  signierten APK haben dieselben SHA-256-Hashes wie die Patch-Artefakte;
  `zipalign` und v3-Signatur sind verifiziert. Gegenüber der 1.2.0-APK
  unterscheiden sich nur das Bundle und die drei `META-INF`-Signaturdateien
  (181 weitere Einträge byte-identisch); Bundle weiterhin STORED.
- **Gerät:** 1.1.0 startet (PairIP-Bypass wirkt), Banner und Button waren
  jedoch weiterhin sichtbar. Bei 1.2.0 ist der Prime Button entfernt, das
  übrige Menü funktioniert. 1.3.0 (seitliche Icons) läuft nach Nutzermeldung
  ohne erkennbare Probleme; der Szenen-Patch in 1.4.0 erzeugt dieselben Bytes.
  Ein Gerätetest des Morphe-Bundles 1.4.0 selbst steht noch aus.

## Wartung

Bei App-Updates:

1. Neue Zielversion an APKPure prüfen (VersionCode!).
2. `AppTarget(version=...)` in `Constants.kt` erweitern.
3. APK dekompilieren (jadx) und verifizieren, dass alle vier
   Banner-Methoden unverändert existieren (`DeviceManager#ShowBannerAd`,
   `AdManager#ShowBannerAd`, `AdmobAdapter#showBannerAd`, `AdmobAdapter#show`);
   bei Umbau `Fingerprints.kt` anpassen.
4. Unity-Bundle prüfen: GameObject `Prime Button` in Szene `level0`
   (MainScene) sowie `PromoteIcon`/`Icons`/`Icon (0..5)` in `level0`–`level2`.
   Bei Layout-Änderungen `UnityBundlePatcher.kt` anpassen (die Python-Skripte
   in `tools/unity/` dienen als Referenz).
5. `gradlew buildAndroid` erneut ausführen und Bundle testen.

## Build-Umgebung (dieses Projekt)

- Gradle 9.8.2 (Wrapper aus Template), JDK 21 (Temurin),
  morphe-patcher 2.3.0 (MorpheApp GitHub Packages),
  Gradle-Plugin `app.morphe.patches` 2.1.0.
- Build-Verifikationslink: Ausgabe `patches/build/libs/*.mpp`.
