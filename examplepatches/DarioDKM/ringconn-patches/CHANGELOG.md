# Changelog

## 1.2.10 (2026-09-19)

### Localization & UI Consistency
* **English Patch Metadata & Descriptions:**
  * Updated `patches-list.json`, `patches-bundle.json` and Smali definitions with comprehensive English titles and descriptions.
  * Replaced German target descriptions with clear English metadata.
* **Full English Dashboard & Tile Interface:**
  * Complete English localization in `DashboardHtml.java` for metrics, sleep stages, status indicators, toasts and settings.
  * English status labels and button text in `HookHelper.java` (Cloud Sync, Sync Now, Active, Synced, Ready).

## 1.2.9 (2026-09-19)

### Fixes & Stabilität im Dashboard-Fenster
* **Korrektur der JavaScript-Syntax im Intervals.icu Hub (`DashboardHtml.java`):**
  * Behebung eines gravierenden Anführungszeichen-Syntaxfehlers in HTML/JS-String-Templates, der das Ausführen des gesamten Frontend-Skripts blockierte.
  * Korrekte Initialisierung und Live-Befüllung der Vitalwerte (Schlafdauer, Ruhepuls, HRV, Hauttemperatur, Schlafphasen-Balken und Effizienz).
  * Wiederherstellung der Interaktivität für alle Reiter (Sync, Historie, Einstellungen, Logs) sowie für den manuellen Übertragungs- und Schließen-Button.
* **Erweiterte Kachel-Interaktion (`HookHelper.java`):**
  * Klicks auf den gesamten Hintergrund der Kachel öffnen nun zuverlässig das Detailfenster (nicht mehr nur die Headerzeile).
* **Systemleisten-Integration (`IntervalsActivity.java`):**
  * `setFitsSystemWindows(true)` aktiviert, damit Header und Schließen-Button nicht von Display-Ausschnitten oder der Statusleiste verdeckt werden.
  * WebChromeClient Konsolen-Logging für WebView-Diagnose ergänzt.

## 1.2.8 (2026-09-17)

### Fokussierung & Bereinigung
* **Reine Datenübertragung:**
  * Vollständige Entfernung des Coaching-Reiters (Trainingsvorgaben, Power Zones und Periodisierungsregeln) aus dem eingebetteten RingConn-Hub.
  * Das Hub fungiert nun als schlankes, reines Synchronisationswerkzeug für die Übertragung von RingConn-Daten (Schlafdauer, Ruhepuls, HRV, SpO2, Temperatur) zu Intervals.icu.
  * Sämtliche Trainingssteuerung, Leistungsdiagnostik und das erweiterte Dashboard sind exklusiv in eine separate Companion-App überführt.

## 1.2.7 (2026-09-17)

### Fixes & Robuste Touch-Navigation
* **Beseitigung der Flutter Accessibility-Falle:**
  * Komplette Entfernung des fehlerhaften periodischen Semantik-Baum-Checks (`createAccessibilityNodeInfo`), welcher in Flutter ohne aktiven Screenreader stets leer blieb und die Kachel fälschlicherweise dauerhaft ausblendete.
* **Latenzfreie Interaktionssteuerung:**
  * Schalten auf `View.VISIBLE` direkt beim Antippen des Discover-Reiters (18 % bis 42 % der unteren Leiste).
  * Sofortiges Ausblenden (`View.GONE`) beim Wechsel auf andere Hauptreiter (Insights, Health, Plan, Me).
  * Zuverlässiges Ausblenden bei Klicks in Untermenüs (Workout-Karten, Sortierung oder Inhaltsbereiche oberhalb und unterhalb der Kachel).
  * Automatische Wiederanzeige bei Zurück-Gesten, Betätigung der Hardware-/System-Zurück-Taste, Tippen auf den Zurück-Pfeil oben links oder erneutem Antippen des Discover-Reiters.

## 1.2.6 (2026-09-15)

### Optimierungen
* **Kalibrierte Baumtiefe & Auflösungsunabhängigkeit:**
  * Maximale Traversierungstiefe im Flutter-Semantik-Baum auf 50 Ebenen angehoben, damit alle Discover-Root-Container zuverlässig aufgelöst werden.
  * Dynamische relative Koordinatenberechnung für Statusleiste, Inhaltsbereich und untere Navigationsleiste.
  * Versionierungssprung zur Erzwingung der Cloud-Aktualisierung im Morphe Manager.

## 1.2.5 (2026-09-15)

### Fixes & Robustheit
* **Strikte Discover-Root-Erkennung:**
  * Vollständige semantische Validierung des aktiven Screens (Kopfzeile «Discover», Vorhandensein der unteren Navigationsleiste, Ausschluss von Zurück-Buttons).
  * Behebt das Fehlverhalten, bei dem die Kachel in Untermenüs (z. B. Workout-Details, Übungs-Picker) oder beim Tab-Wechsel sichtbar blieb.
* **Latenzfreie Ausblendung:**
  * Sofortige Ausblendung (`View.GONE`) bei Berührung außerhalb des Discover-Bereichs sowie bei Navigation in Detailansichten.
  * Korrektur der Statusvariable: Kein unbeabsichtigtes Festhalten des Sichtbarkeits-Flags mehr.

## 1.2.3 (2026-09-07)

### Fixes & Optimizations
* **Intervals.icu API Payload:** Nicht unterstütztes Feld `skinTemp` aus dem PUT-Payload entfernt, wodurch HTTP 422 Fehler behoben sind. Lokale Temperaturüberwachung bleibt im Sync-Modul aktiv.
* **Intelligenter Datums-Fallback:** Automatischer Fallback auf den jüngsten Schlafeintrag, falls für das aktuelle Datum noch kein Schlafzyklus abgeschlossen ist.
* **Persistenter Discover-Tab-Status:** Zuverlässige Erhaltung der Hub-Kachel-Sichtbarkeit bei Rückkehr aus dem Dashboard oder Activity-Wechseln.

## 1.2.2 (2026-09-07)

### Features & Architecture
* **Natives Quick-Sync-Hub im Discover-Tab:**
  * Schwebender FAB von Standard-Tabs (Insights, Health, Plan, Me) entfernt.
  * Native Glassmorphism-Kachel exklusiv im Discover-Tab integriert mit Tages-Readiness, Wattkorridor-Empfehlung, TSB-Status, Periodisierungsphase und Sofort-Sync-Button.
  * Latenzfreie Umschaltung via Window-Touch-Callback auf der unteren Navigationsleiste.
* **Erweiterter Coach-Reiter im Embedded Dashboard:**
  * Vollwertiger Startreiter mit Tages-Freigabe, Power Zones nach Coggan/Hunter, Formsteuerung (CTL/ATL/TSB) und Periodisierung.
* **Schlafapnoe-Monitoring (OSA):**
  * Nativer Freischalt-Hook in UserInfo (`isOSAHSAgreeTerm = 1`, `hasOpenOSAReport = 1`).
  * Nächtliche OSA-Auswertung und SpO2-Tiefstwerte direkt im Dashboard und Datenprovider verfügbar.

## 1.2.0 (2026-09-06)

### Features & Architecture
* **Modular Multi-Patch System:** Split into two independent Morphe patches:
  * `RingConn Health Data Provider`: Injects ContentProvider `com.gdjztech.ringconn.debug.provider` and sets `android:debuggable="true"`.
  * `Embedded Intervals Direct Dashboard`: Injects the embedded dashboard UI, floating action button, and auto-sync engine (depends on Provider).
* **Calibrated Athletic Sleep Score:**
  * Replaces inflated commercial scoring with a non-linear endurance recovery model based on total sleep duration ($T^{2.2}$), slow-wave deep sleep ($D^{1.5}$), REM ($R^{1.5}$), and wakefulness penalty (WASO).
  * Example: 6h 13m of sleep yields a realistic 60 score instead of an inflated 84.
* **Configurable Sleep Score Source:** Added a selector in Settings to switch between `Athletic (Recommended)` and `RingConn Official`.
* **Full English UI & Visual Polish:**
  * Complete English translation across all screens, cards, modals, and notifications.
  * OLED dark styling (`#070A11`), refined cards, stage percentage bars, and smooth closing animations.
  * Conditional floating action button that only appears if the dashboard patch is installed.

## 1.1.0 (2026-09-06)

### Features
* Embedded Intervals Direct Dashboard directly inside RingConn.
* Draggable Floating Action Button (FAB) on the RingConn main interface for instant access.
* Standalone launcher activity for Intervals Direct.
* Native Dark Theme UI with sleep staging visualization, 30 days history, and manual sync controls.
* Direct upload engine to intervals.icu without requiring companion apps.
* Full retention of `HealthDataProvider` and `android:debuggable="true"` for external companion apps.

## 1.0.0 (2026-09-06)

### Features
* Initial release of RingConn Morphe Patch.
* Registers `com.gdjztech.ringconn.provider.HealthDataProvider` with authority `com.gdjztech.ringconn.debug.provider`.
* Enables `android:debuggable="true"` in `AndroidManifest.xml`.
* Injects Dalvik bytecode to query local RingConn sleep, resting HR, and temperature database tables for Intervals Direct.
