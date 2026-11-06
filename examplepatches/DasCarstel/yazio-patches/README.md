# YAZIO Patches

Morphe-Patch-Bundle für **YAZIO** (`com.yazio.android`).

Die Patches verändern die App auf dem Gerät: Morphe wendet sie beim Patchen an,
das Ergebnis ist ein selbst signiertes APK. Es wird nichts an fremden Servern
verändert und kein App-Code weitergegeben.

## Patches

| Patch | Typ | Standard | Wirkung |
|---|---|---|---|
| `Trust user certificates` | Resource | aus | Ergänzt `res/xml/network_security_config.xml` um die Vertrauensanker `system` und `user`, damit die App TLS-Verbindungen über einen Proxy mit eigenem CA-Zertifikat (z. B. mitmproxy) akzeptiert. |

Der Patch ist ein reiner Resource-Patch: er ändert kein Smali und keine
Dex-Dateien, sondern nur eine XML-Ressource. Dadurch überlebt er App-Updates,
solange die Datei existiert.

> **Wozu der Patch dient:** ausschließlich zum Mitschneiden des API-Verkehrs
> über einen eigenen Proxy. Für den dauerhaften Datenexport wird er **nicht**
> gebraucht — der läuft serverseitig gegen die API. Ohne Proxy tut der Patch
> nichts und schadet auch nicht.

## Dokumentation

| Dokument | Inhalt |
|---|---|
| [Mitschnitt der API mit mitmproxy](docs/mitmproxy-mitschnitt.md) | Proxy-Stack, CA-Zertifikat auf dem Telefon, Auswertung, Aufräumen, Stolperfallen |

Weitere Patches kommen als eigene Einträge dazu; bestehende bleiben erhalten und
werden nicht ersetzt, damit ältere Builds reproduzierbar bleiben.

## Benutzung

1. **Morphe** installieren: <https://morphe.software> (oder die Releases von
   [MorpheApp/morphe-manager](https://github.com/MorpheApp/morphe-manager)).
2. Morphe → **Sources** → **+** → Reiter **Remote** → `github.com/DasCarstel/yazio-patches`
   eintragen. Damit aktualisiert sich die Quelle selbst. Alternativ Reiter **Local**
   und eine `patches-*.mpp` aus dem Download-Ordner wählen — die aktualisiert sich nicht
   von allein, dafür funktioniert sie ohne Netzverbindung zu GitHub.
3. YAZIO patchen: **Expert mode** einschalten, Patch `Trust user certificates`
   anhaken, APK wählen (`.apkm` von APKMirror funktioniert, Morphe merged die
   Splits selbst).
4. Installieren. Achtung: die Play-Store-Version muss vorher deinstalliert
   werden, weil die Signatur abweicht. Danach sind alle weiteren Patch-Builds
   normale Updates — solange Morphe denselben Keystore benutzt
   (siehe `docs/backup-and-keystore` in der Morphe-Dokumentation).

## Remote-Quelle: zwei Fallstricke

Morphe liest `patches-bundle.json` in ein festes Datenmodell (`ReleaseAsset`) ein.
Zwei Dinge brechen die Quelle zuverlässig:

- `created_at` muss **ohne Zeitzone** stehen (`2026-11-04T12:55:00`). Ein
  angehängtes `Z` lässt `LocalDateTime.parse` werfen, und Morphe meldet dann
  „Metadaten nicht verfügbar".
- `CHANGELOG.md` muss im Branch `main` liegen. Morphe holt sie fest von
  `raw.githubusercontent.com/<owner>/<repo>/main/CHANGELOG.md`; fehlt sie,
  erscheint „Download des Changelogs fehlgeschlagen".

Pflichtfelder im Manifest: `download_url`, `created_at`, `description`,
`version`. Optional: `public_key` (Signatur), `page_url`.

Nach einer Änderung an diesen Dateien liefert `raw.githubusercontent.com` noch
einige Minuten die alte Fassung aus dem CDN. Nicht verzweifeln, kurz warten.

## Selbst bauen

Voraussetzungen: JDK 21, ein GitHub-Token mit `read:packages` (Morphe
veröffentlicht den Patcher ausschließlich über GitHub Packages).

```sh
export GITHUB_TOKEN=...
./gradlew :patches:build -Pgpr.user=<github-user> -Pgpr.key="$GITHUB_TOKEN"
# Ergebnis: patches/build/libs/patches-<version>.mpp
```

> [!IMPORTANT]
> Für Morphe muss das Bundle **dex** enthalten. `./gradlew build` erzeugt dagegen ein
> JVM-Archiv mit `.class`-Dateien; Morphe Manager lädt Patches ausschließlich aus
> `classes.dex` und zeigt bei einem Klassen-Bundle `Patches 0` an.
>
> Richtig ist:
>
> ```sh
> ./gradlew buildAndroid -Pgpr.user=<github-user> -Pgpr.key="$GITHUB_TOKEN"
> ```
>
> Und zwar als **letzten** Build-Schritt: `build` und `generatePatchesList` bauen das
> JVM-Archiv und überschreiben dabei `patches/build/libs/patches-<version>.mpp`. Kontrolle:
> `unzip -l patches/build/libs/patches-<version>.mpp | grep classes.dex`.

## Patch gegen eine APK testen

Das Modul `harness` wendet ein Bundle auf eine APK an, ohne Morphe:

```sh
./gradlew :harness:run -Pgpr.user=<user> -Pgpr.key="$GITHUB_TOKEN" \
  --args="/pfad/app.apk /pfad/patches-1.0.0.mpp /tmp/patchtest"
```

Das Ergebnis liegt in `/tmp/patchtest/resources-patched.apk`; die geänderte
Ressource lässt sich z. B. mit
`aapt2 dump xmltree --file res/xml/network_security_config.xml <apk>` prüfen.

## Struktur

```
patches/src/main/kotlin/app/yaziopatches/patches/
  shared/Constants.kt              # App-Kompatibilität (Paket, Versionen)
  trustusercerts/…Patch.kt         # Patch-Implementierung
harness/                           # lokales Testwerkzeug
```

## Lizenz

GPLv3, siehe [LICENSE](LICENSE). Basiert auf
[MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template).
