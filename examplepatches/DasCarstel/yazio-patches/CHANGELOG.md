# Changelog

## [1.0.2](https://github.com/DasCarstel/yazio-patches/releases/tag/v1.0.2) (2026-11-04)

### Fehlerbehebungen

* **Bundle enthielt keine dex-Datei** – Morphe Manager lädt Patches ausschließlich aus
  `classes.dex` im Bundle. `./gradlew build` erzeugt das JVM-Archiv mit `.class`-Dateien und
  überschreibt dabei das Android-Bundle; Morphe zeigte deshalb `Patches 0` an. Richtig ist
  `./gradlew buildAndroid`, und zwar als letzter Build-Schritt.

## [1.0.1](https://github.com/DasCarstel/yazio-patches/releases/tag/v1.0.1) (2026-11-04)

### Fehlerbehebungen

* Manifest für die Remote-Quelle korrigiert: `created_at` ohne Zeitzone, Pflichtfelder,
  `CHANGELOG.md` ergänzt.

## [1.0.0](https://github.com/DasCarstel/yazio-patches/releases/tag/v1.0.0) (2026-11-04)

### Neue Patches

* **Trust user certificates** – ergänzt die Network-Security-Config von YAZIO um den
  Vertrauensanker `user`. Damit akzeptiert die App TLS-Verbindungen über einen Proxy mit
  eigenem CA-Zertifikat und der API-Verkehr lässt sich mitschneiden.

Unterstützte App-Version: YAZIO 26.36.1 (`com.yazio.android`), weitere Versionen
experimentell.
