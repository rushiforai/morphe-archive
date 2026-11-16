## 1.6.2

### Fixed

- **Release-Asset und Download-Adresse korrigiert.** Die `.mpp` lag bisher nur
  als Link auf `/-/raw/main/...` am Release. Der Patch-Index von
  morphe-patches.software erwartet – wie bei allen anderen Morphe-Bundles –
  eine echte Release-Datei unter
  `/-/releases/v/<version>/downloads/patches-<version>.mpp`. Ab dieser Version
  wird die Datei als Release-Asset hochgeladen und
  `patches-bundle.json` zeigt auf diesen Pfad (`direct_asset_path`).

### Changed

- Keine Änderung an den Patches selbst: der Inhalt entspricht 1.6.1.

## 1.6.1

### Fixed

- **Material Capsule: Gesten wurden beim Öffnen der App abgeschaltet.** Auslöser
  war der Pro-/Billing-Abgleich der App (`u40` → `q40.u()` →
  `ny1.b(...)` → `m5`), der über die Massen-Reset-Funktion (`pswitch_4`) jede
  Geste auf `isEnabled = false` setzt und zusätzlich `widgetId` auf `0`. Der
  Patch **Unlock Pro features** erzwingt jetzt im generierten Setter
  `db3.x(Ldb3;Z)V` immer `true`, sodass dieser Reset nicht mehr greifen kann.
  Gefunden wird der Setter über das Protobuf-Feld `gestureActionId_` (nur die
  Gesten-Klasse `db3` besitzt es).

### Changed

- `RunBundleTest` prüft zusätzlich den Gesten-Setter im gepatchten DEX
  (`const/4 p1, 0x1` vor `iput-boolean` auf `isEnabled_`).
- Bekannter Nebeneffekt: Ein Gesten-Schalter springt wieder an, wenn man ihn
  von Hand ausschaltet. Nicht mehr gewünschte Gesten werden gelöscht statt
  deaktiviert.
- `docs/Material-Capsule.md` und `README.md` beschreiben den Reset-Pfad und den
  Nebeneffekt.

## 1.6.0

### Added

- Neuer Patch **Unlock Pro features** für Material Capsule: schaltet die
  Pro-/Premium-Funktionen frei (Gesten, Widgets, Kartenfarben, Full-Mode-Player,
  App-Suche). Der Patch setzt an der Entstehung des Pro-Zustands an, nicht an
  der UI: der Flow-Transform emittiert an beiden Emit-Stellen `Boolean.TRUE`
  (und umgeht damit zugleich den Integrity-Check), und die Suspend-One-Shot-
  Lesung liefert vorzeitig `true`. Das Billing bleibt unverändert.
- `RunBundleTest` prüft den Pro-Patch strukturell im gepatchten DEX
  (Emit-Stellen mit vorgeschaltetem `sget-object Boolean.TRUE`, One-Shot-Lesung
  mit `sget-object` + `return-object`).
- `docs/Material-Capsule.md`: vollständige Beschreibung der Pro-Kette
  (`uu1`, `SECURE_DATA`, `pro_version_key`, `pu1`, `uu1.c`/`d`/`e`).

### Changed

- Die Aussage aus 1.5.0 ("Kein Pro-/Paywall-Unlock") ist damit überholt.

## 1.5.0

### Added

- **Zweite App: Material Capsule** (`com.pryshedko.mtisland`, 17.3,
  versionCode 173, XAPK, arm64-v8a).
- Neuer Patch **Disable Firebase Analytics tracking** für Material Capsule:
  deaktiviert Google Analytics for Firebase über die dokumentierten
  Manifest-Schalter (`firebase_analytics_collection_deactivated`,
  `google_analytics_adid_collection_enabled`,
  `google_analytics_ssaid_collection_enabled`) und entfernt die
  Advertising-ID-/Privacy-Sandbox-Permissions. Kein DEX-Eingriff.
- Kompatibilitätsdeklaration `COMPATIBILITY_MATERIAL_CAPSULE`
  (`mtisland/shared/Constants.kt`).
- Integrations-Task `:patches:runBundleTestMaterialCapsule`, der den Patch-Lauf
  gegen die originale Base-APK und das resultierende Manifest prüft.
- Technische Doku `docs/Material-Capsule.md`.

### Changed

- Der PairIP-Patch ist jetzt **geteilt** (`patches/pairip/BypassPairIpPatch.kt`)
  und gilt für beide Apps; der alte Pi-spezifische Pfad
  `pi/pairip/BypassPairIpPatch.kt` entfällt.
- `RunBundleTest` filtert die Patches anhand ihrer `Compatibility`-Metadaten auf
  das Paket der Eingabe-APK. Dadurch wird beim Lauf gegen eine App nicht mehr
  versucht, die Patches der anderen anzuwenden.

### Notes

- Material Capsule enthält **kein Werbe-SDK** (kein AdMob, AppLovin, Unity Ads,
  ironSource usw.). Es gibt deshalb bewusst keinen Ads-Patch; die
  `AD_ID`-Permission stammt aus `play-services-measurement`.
- **Kein Pro-/Paywall-Unlock.** Das Billing (Play Billing 9.1.0) und die
  Pro-Freischaltung bleiben unverändert.
- Kein Gerätetest möglich (kein Android-SDK/adb/Emulator in der
  Build-Umgebung). Verifiziert sind Patch-Lauf, DEX und Manifest.
# Changelog

## 1.4.1

### Fixed

- **Das ausgelieferte `.mpp` enthielt keinen DEX-Code.** Es wurde mit
  `:patches:jar` gebaut; Morphe benötigt aber ein Bundle mit `classes.dex`
  (Aufgabe `:patches:buildAndroid`). Dadurch zeigte die Quelle in Morphe
  „0 mögliche Patches“. Die Releases werden jetzt mit `buildAndroid` gebaut.

### Changed

- Die Quelle heißt jetzt **Jo's Patches** und ist für weitere Apps gedacht;
  Memorize Pi Digits ist der erste Eintrag.
- Repository-Pfad: `JoPatches/jo-patches` (GitLab leitet den alten Pfad um).
- Eigenes Quell-Icon `patches-bundle.png` im Repository-Stamm.

## 1.4.0

### Added

- **Szenen-Patch direkt im Morphe-Bundle.** Das `.mpp` enthält jetzt den
  Patch **Remove cross-promotion (Prime Button and game icons)**. Er ersetzt
  `assets/bin/Data/data.unity3d` als `rawResourcePatch` und deaktiviert den
  „Prime Button“ ( `level0`) sowie den kompletten `PromoteIcon`-Teilbaum
  (`level0`–`level2`) inklusive Skalierung 0. Damit sind die
  Cross-Promo-Elemente auch über Morphe Manager/Desktop entfernbar, nicht
  nur über die direkt installierbare APK.
- Eigener LZ4-Block-Codec (`Lz4Block.kt`) und UnityFS/SerializedFile-Parser
  (`UnityBundlePatcher.kt`), damit das Bundle ohne externe Bibliothek
  auskommt. Objektgrößen bleiben unverändert; nur betroffene Blöcke werden
  neu komprimiert.
- Öffentliche Release-Struktur: GPLv3 + `NOTICE`, `release.yml`,
  `.releaserc`, semantische Releases, `patches-bundle.json`,
  README mit Add-Source-Link.

### Changed

- Das Bundle heißt jetzt **Memorize Pi Patches** und wird als
  `JoPatches/memorize-pi-patches` veröffentlicht (Projektname ohne
  „Morphe“, wie es die NOTICE verlangt). Die öffentliche Quelle liegt auf
  GitLab; das fertige `.mpp` wird direkt aus dem Repository geladen.
  `release.yml` und `.releaserc` bleiben für einen späteren GitHub-Spiegel
  im Projekt.
- Die PairIP-Beschreibung ist nicht mehr auf „private use only“ beschränkt,
  sondern erklärt die Notwendigkeit für Sideload-Installationen.
- `PatchListGenerator` wählt das zuletzt gebaute `.mpp`, damit lokal
  liegengebliebene alte Versionen die Liste nicht mehr verfälschen.
- Test-Runner und Patch-List-Generator werden nicht mehr ins `.mpp`
  gepackt.

### Verified

- `runBundleTest`: 5 DEX-Methoden mit `return-void`, 50 Szenen-Zielobjekte
  inaktiv/Skalierung 0, `data.unity3d` im Ausgabe-APK **STORED**, 172
  geänderte Bytes ausschließlich innerhalb der Zielobjekte.
- Byte-Vergleich der 50 Zielobjekte mit der UnityPy-Referenz: identisch.

### Not verified

- Gerätetest 1.4.0 steht aus.

## 1.3.0

### Fixed

- **Seitliche Cross-Promo-Icons im Hauptmenü entfernt.** Rechts und links
  standen je drei Werbe-Icons für andere Spiele. Sie liegen in der Unity-Szene
  unter `UI Root/MainMenu/PromoteIcon/Icons/Icon (0..5)` (x = ±250,
  y = 0/−120/−240). Der Container ist in der Szene inaktiv, wird zur Laufzeit
  aber vom `PromoteIcon`-Manager aktiviert. Die direkt installierbare APK
  deaktiviert deshalb den kompletten Teilbaum und setzt alle zugehörigen
  Transforms auf Skalierung `(0,0,0)`. Dadurch verschwinden auch die
  `BoxCollider` (100×100) – die Flächen sind nicht mehr sichtbar und nicht
  mehr anklickbar.
- Angewendet auf `level0` (MainScene), `level1` (ReadScene) und `level2`
  (GameScene), nicht auf `level3` (NetworkGameScene, dort gibt es keinen
  `PromoteIcon`).

### Added

- Reproduzierbares Skript `tools/unity/patch_promote_icons.py` (Python +
  UnityPy).

### Verified

- Unity-Bundle: 2336 Objekte; gegenüber dem 1.2.0-Bundle ändern sich genau
  45 Objekte (21 × `GameObject.m_IsActive`, 24 × `Transform.m_LocalScale`),
  alle innerhalb der `PromoteIcon`-Teilbäume. Die übrigen 2291 Objekte sind
  byte-identisch. Der Prime Button bleibt inaktiv und auf Skalierung 0.
- APK gegenüber 1.2.0: nur `assets/bin/Data/data.unity3d` und die drei
  `META-INF`-Signaturdateien unterscheiden sich; die übrigen 181 Einträge
  sind byte-identisch. Bundle weiterhin STORED (Methode 0),
  `zipalign` und v3-Signatur verifiziert, gleiches Debug-Zertifikat
  (SHA256 `1e08a903…b5953`).
- Gerätetest 1.2.0: Prime Button entfernt, restliches Menü funktionsfähig
  (Rückmeldung des Auftraggebers).

### Not verified

- Gerätetest 1.3.0 (seitliche Icons) steht aus.

## 1.2.0

### Fixed

- **Banner blieb trotz Patch sichtbar.** Die C#-Seite fordert den Banner nicht
  zwangsläufig über `DeviceManager.ShowBannerAd` an – die Klasse
  `com.homelib.android.ad.AdManager` ist auch direkt in
  `global-metadata.dat` referenziert und per JNI erreichbar. Der Patch
  blockiert jetzt alle Ebenen:
  - `DeviceManager#ShowBannerAd(I)V`
  - `AdManager#ShowBannerAd(I)V`
  - `AdmobAdapter#showBannerAd()V`
  - `AdmobAdapter#show()V` (Sichtbar-Schalten des Views)

### Added

- **„Prime Button“ entfernt (direkt installierbare APK).** Der Button ist
  kein AdMob-View, sondern ein Unity-/NGUI-GameObject
  `UI Root/MainMenu/Shift/Prime Button` in `MainScene` (level0). Er wird in
  `assets/bin/Data/data.unity3d` deaktiviert und zusätzlich auf Skalierung
  `(0,0,0)` gesetzt. Es handelt sich um Cross-Promotion für
  `com.unknownprojectx.prime.number`.
- Reproduzierbares Skript `tools/unity/patch_prime_button.py` (Python +
  UnityPy).
- Integrationstest verifiziert jetzt 5 gepatchte Methoden im DEX.

### Verified

- DEX: alle 5 Methoden beginnen im gepatchten `classes2.dex` mit `return-void`.
- Unity-Bundle: von 2336 Objekten unterscheiden sich genau 2
  (`GameObject.m_IsActive` und `Transform.m_LocalScale` des Buttons), alle
  übrigen Objekte sind byte-identisch.
- Signierte APK: Bundle- und DEX-Hashes stimmen mit den Patch-Artefakten überein.

### Device test (Nutzermeldung)

- Prime Button ist entfernt; sichtbar bleiben Challenge, Training, Pi Digits,
  Competition, Option und Review. Das Menü ist funktionsfähig.
- Die seitlichen Cross-Promo-Icons waren weiterhin sichtbar (behoben in 1.3.0).
- Bannerstatus wurde nicht separat gemeldet.

## 1.1.0

### Added

- Patch **„Bypass PairIP license check“** (Standard an), erforderlich damit der
  neu signierte Build startet:
  - `LicenseClient.checkLicense(Context)` → No-Op (zentraler Einstieg)
  - `LicenseClient.initializeLicenseCheck()` → No-Op
  - `LicenseClient.stopTrial(Context)` → No-Op
  - `LicenseClient.performLocalInstallerCheck()` → `true`
- Integrationstest prüft jetzt zusätzlich, dass `LicenseClient#checkLicense`
  im gepatchten DEX mit `return-void` beginnt.

### Changed

- Dokumentation: PairIP ist „license-check-only“ (kein `libpairipcore.so`,
  kein `VMRunner`); Bypass als bewusste, vom Auftraggeber für den privaten
  Gebrauch freigegebene Abweichung von §10 dokumentiert.

## 1.0.0

### Added

- Patch „Remove home screen ads“ für Memorize Pi Digits 11.01 (versionCode 11010, arm64-v8a):
  - Fingerprint `HomeBannerAdFingerprint` identifiziert stabil
    `com.homelib.android.device.DeviceManager#ShowBannerAd(I)V`.
  - `returnEarly()` verhindert Erzeugung des AdMob-Banner-Views
    sowie den zugehörigen Werbe-Request.
  - Annahme damals: Das Kreativ „Prime Number“ sei Teil des Banners.
    Tatsächlich ist es ein separates Unity-GameObject (siehe 1.2.0).
- Kompatibilitätsdeklaration `COMPATIBILITY_PI` (XAPK, arm64-v8a, Ziel 11.01/11010).
- Projekt aus dem offiziellen Morphe-Patches-Template aufgebaut
  (`app.morphe.patches` Gradle-Plugin 2.1.0, morhe-patcher 2.3.0, Gradle 9.8.2).

### Not verified

- Funktionstest auf Gerät/Emulator (nicht verfügbar in der Build-Umgebung).

### Findings (Gerätetest durch Nutzer)

- Der gepatchte, neu signierte Build wird beim Start von Googles pairip-Schutz
  (`com.pairip.application.Application` → `LicenseClient`) blockiert: Der
  Installer ist nicht `com.android.vending` und die Play-Lizenzantwort fehlt.
  `LicenseActivity` öffnet die Play-Store-Seite und beendet die App.
- Keine Umgehung dieses Schutzes (Projektvorgabe). Für die Praxis bleibt der
  netzwerkseitige Weg: Werbe-Domains blocken (Private DNS/App-Firewall); der
  Banner-View bleibt dann auf `GONE`, da `show()` erst bei `onAdLoaded` läuft.

