# Mitschnitt der YAZIO-API (mitmproxy)

Diese Anleitung beschreibt den Weg, mit dem die YAZIO-App dazu gebracht wird,
ihren API-Verkehr über einen eigenen Proxy zu leiten und dort im Klartext
abzulegen. Sie ist **kein Dauerbetrieb**, sondern ein Werkzeug zur Analyse:
einmal einschalten, Verkehr ablesen, wieder abschalten.

Der Patch „Trust user certificates" in diesem Repository existiert genau für
diesen Zweck. Ohne Proxy tut er nichts.

## Was gebraucht wird

1. **Gepatchte YAZIO-APK** mit dem Patch „Trust user certificates"
   (Bundle `patches-1.0.2.mpp` oder neuer), installiert auf dem Telefon.
2. **mitmproxy** auf einem Rechner im selben Netz, erreichbar vom Telefon.
3. Das **Telefon** im gleichen Netz wie der Proxy, mit der Möglichkeit, einen
   WLAN-Proxy einzustellen.

Der Patch ersetzt in `res/xml/network_security_config.xml` die
Vertrauensanker, sodass die App auch das mitmproxy-CA-Zertifikat akzeptiert:

```diff
 <network-security-config>
-    <debug-overrides>
-        <trust-anchors>
-            <certificates src="user"/>
-        </trust-anchors>
-    </debug-overrides>
+    <base-config cleartextTrafficPermitted="true">
+        <trust-anchors>
+            <certificates src="system"/>
+            <certificates src="user"/>
+        </trust-anchors>
+    </base-config>
 </network-security-config>
```

Zusätzlich ist bei YAZIO **kein Zertifikats-Pinning** aktiv — es gibt weder
`<pin-set>` in der Netzwerkkonfiguration noch einen `CertificatePinner` im
App-Code. Deshalb genügt der Vertrauensanker, ein Bytecode-Patch ist nicht
nötig.

## Der Proxy-Stack

`docker-compose.yml` (Auszug, vollständig im Infra-Repo unter
`/opt/docker-compose/yazio-capture/`):

```yaml
services:
  mitmproxy:
    image: mitmproxy/mitmproxy:12.3.1
    container_name: yazio-mitmproxy
    restart: unless-stopped
    command:
      - mitmweb
      - --listen-host=0.0.0.0
      - --listen-port=8080
      - --web-host=0.0.0.0
      - --web-port=8081
      - --set=web_password=${MITMWEB_PASSWORD:?}
      # Nur YAZIO wird entschluesselt, alles andere laeuft als Tunnel durch.
      # mitm.it liefert die CA zum Installieren auf dem Handy.
      - '--set=allow_hosts=yazio\.com|^mitm\.it'
      - --scripts=/addons/yazio.py
    environment:
      TZ: Europe/Berlin
      PYTHONUNBUFFERED: "1"
    ports:
      - "8080:8080"   # Proxy
      - "8082:8081"   # mitmweb-Oberflaeche
    volumes:
      - /etc/docker/yazio-capture/mitmproxy:/home/mitmproxy/.mitmproxy
      - /etc/docker/yazio-capture/addons:/addons:ro
      - /etc/docker/yazio-capture/captures:/captures
```

Wichtig: die Verzeichnisse für CA und Mitschnitte müssen dem Benutzer im
Container gehören (`chown -R 1000:1000`), sonst schreibt das Addon nichts und
mitmproxy meldet nur „Permission denied".

### Das Addon

`/etc/docker/yazio-capture/addons/yazio.py` schreibt jede YAZIO-Antwort als
JSON-Zeile nach `/captures/<datum>.jsonl` und redigiert `Authorization`,
`Cookie` sowie Felder mit `token`, `password`, `secret` im Namen:

```python
"""mitmproxy-Addon: schreibt den YAZIO-API-Verkehr als JSONL nach /captures."""

import json
import os
import re
import traceback
from datetime import datetime, timezone

from mitmproxy import ctx, http

CAPTURE_DIR = "/captures"
MAX_BODY = 64 * 1024
TEXT_TYPES = ("json", "text", "xml", "x-www-form-urlencoded")
SENSITIVE = re.compile(r"(?i)(authoriz|cookie|token|passw|secret|session|api[-_]?key|credential)")


def _redact_headers(headers):
    return {key: ("<redacted>" if SENSITIVE.search(key) else value) for key, value in headers.items()}


def _redact(value):
    if isinstance(value, dict):
        return {key: ("<redacted>" if SENSITIVE.search(key) else _redact(item)) for key, item in value.items()}
    if isinstance(value, list):
        return [_redact(item) for item in value]
    return value


def _body(message):
    if message is None or not message.raw_content:
        return None
    content_type = message.headers.get("content-type", "")
    if not any(kind in content_type for kind in TEXT_TYPES):
        return "<%s %d bytes>" % (content_type or "binary", len(message.raw_content))
    try:
        text = message.get_text(strict=False) or ""
    except Exception:
        return "<decode error>"
    if "json" in content_type:
        try:
            text = json.dumps(_redact(json.loads(text)), ensure_ascii=False)
        except Exception:
            pass
    return text[:MAX_BODY]


def _record(flow):
    started = flow.request.timestamp_start or 0.0
    finished = flow.response.timestamp_end if flow.response else None
    return {
        "ts": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "method": flow.request.method,
        "url": flow.request.pretty_url,
        "status": flow.response.status_code if flow.response else None,
        "duration_ms": round((finished - started) * 1000) if finished else None,
        "req_headers": _redact_headers(flow.request.headers),
        "req_body": _body(flow.request),
        "resp_headers": _redact_headers(flow.response.headers) if flow.response else {},
        "resp_body": _body(flow.response),
    }


def response(flow: http.HTTPFlow) -> None:
    if "yazio.com" not in (flow.request.pretty_host or ""):
        return
    try:
        line = json.dumps(_record(flow), ensure_ascii=False)
        path = os.path.join(CAPTURE_DIR, datetime.now().strftime("%Y-%m-%d") + ".jsonl")
        with open(path, "a", encoding="utf-8") as handle:
            handle.write(line + "\n")
    except Exception:
        with open(os.path.join(CAPTURE_DIR, "_errors.log"), "a", encoding="utf-8") as handle:
            handle.write(traceback.format_exc() + "\n")


def load(loader):
    ctx.log.info("yazio capture addon active, writing to %s" % CAPTURE_DIR)
```

## Ablauf

1. **Proxy im Telefon eintragen**: WLAN-Einstellungen → Netzwerk → Erweitert →
   Proxy → Manuell, Host und Port des mitmproxy-Rechners (z. B.
   `192.168.1.20:8080`).
2. **CA-Zertifikat installieren**: im Browser des Telefons `http://mitm.it`
   öffnen, Android wählen, Zertifikat herunterladen. Dann Einstellungen →
   Sicherheit → Weitere Sicherheitseinstellungen → **CA-Zertifikat
   installieren**.
3. **App benutzen**: die Ansichten öffnen, deren Verkehr man sehen will. Nach
   jedem Wechsel kurz warten, bis die Anfrage abgeschlossen ist.
4. **Auswerten**: die JSONL-Dateien unter `captures/` auslesen, z. B.

   ```sh
   python3 -c "import json;[print(r['method'], r['url'], r['status']) for r in map(json.loads, open('/etc/docker/yazio-capture/captures/2026-11-04.jsonl'))]"
   ```

5. **Aufräumen**: siehe [Nach dem Mitschnitt](#nach-dem-mitschnitt).

## Stolperfallen, die uns Zeit gekostet haben

| Symptom | Ursache | Lösung |
|---|---|---|
| `http://mitm.it` zeigt „traffic is not going through mitmproxy" | `allow_hosts` enthält `mitm.it` nicht, die Seite wird also nicht abgefangen | `allow_hosts=yazio\.com\|^mitm\.it` setzen |
| `Client TLS handshake failed … tls alert certificate unknown` | CA liegt im falschen Speicher: Samsung installiert „Netzwerkzertifikat" für WLAN/VPN, Apps schauen woanders | Über **CA-Zertifikat installieren** installieren, Kontrolle: Vertrauenswürdige Zertifikate → Reiter **Nutzer** |
| Dienste im Heimnetz vom Telefon nicht mehr erreichbar | Mit gesetztem Proxy fragt nicht mehr das Telefon den Dienst an, sondern der Proxy-Rechner | Normal, Proxy nur während des Mitschnitts aktiv lassen |
| Addon schreibt nichts, keine Dateien in `captures/` | Container läuft als Benutzer `mitmproxy`, das Verzeichnis gehört `root` | `chown -R 1000:1000 captures/` |
| `docker logs` bleibt leer | Python puffert die Ausgabe | `PYTHONUNBUFFERED=1` in der Compose-Datei |
| Wert in `env_file` ist abgeschnitten | Compose interpoliert `$` auch in env-Dateien | `$` als `$$` schreiben |
| Morphe meldet „für eine ältere Patcher-Version gebaut" | Bundle deklariert Patcher 2.2.0, installierter Morphe ist neuer | Für reine Ressourcen-Patches ohne Bedeutung |

## Nach dem Mitschnitt

Der Mitschnitt ist ein Werkzeug, kein Dauerbetrieb. Wenn er seinen Zweck erfüllt
hat:

1. Proxy im WLAN wieder auf **Kein Proxy** stellen.
2. `docker compose stop mitmproxy` — der Container startet auch nach einem
   Reboot nicht von selbst wieder.
3. CA-Zertifikat auf dem Telefon löschen: Einstellungen → Sicherheit →
   Vertrauenswürdige Zertifikate → Reiter **Nutzer** → `mitmproxy`.
4. Optional die Aufzeichnungen unter `captures/` löschen.

### Zurück zur Play-Store-Version

Der Patch hat danach keine Aufgabe mehr. Zurück geht es so:

1. In Morphe **Settings → Advanced → Export signing keystore** — ohne diesen
   Keystore sind spätere Patch-Builds eine Neuinstallation statt eines Updates.
2. Gepatchte App deinstallieren.
3. App aus dem Play Store installieren und anmelden. Die Daten liegen am Konto,
   nicht auf dem Gerät; es geht nichts verloren.

Für einen API-Client (Exporter) ist der Patch ohnehin überflüssig: der spricht
TLS direkt und braucht kein Zertifikat auf dem Gerät.

## Werte aus einem neuen APK lesen, ohne zu patchen

Bei einer neuen YAZIO-Version muss man **nicht** patchen, um an die Werte zu
kommen, die ein API-Client braucht. Sie stehen als Klartext im Code:

- **`client_id` und `client_secret`**: Klasse `yazio.network.api.Environment`.
  Dort stehen mehrere lange String-Konstanten; in der Produktionskonfiguration
  war das Paar an Position 3 und 4 (Index 2 und 3) gültig, die anderen Paare
  antworten mit `400 Invalid client`. Welches Paar passt, ist in zwei Versuchen
  geklärt.
- **App-Version und Build-Nummer** für die Header `x-yazio-app-version` und
  `x-yazio-build-number`: `versionName` und `versionCode` des APK, z. B. mit
  `aapt2 dump badging base.apk`.

Weg dorthin: APK besorgen, mit `apktool d` auspacken, die Klasse im Smali lesen.
Kein Patch, kein Gerät, keine Signatur. Der Patch ist ausschließlich fürs
Mitlesen des Verkehrs nötig.

## Wie lange das trägt

Die Lösung hängt an Dingen, die YAZIO ändern kann:

| Änderung bei YAZIO | Symptom | Aufwand |
|---|---|---|
| Pflicht-Header (App-Version, Build-Nummer) | `400`/`426`, Login scheitert | zwei Zahlen anpassen |
| API-Version `v22` → `v23`, umbenannte Felder | `404`, fehlende Werte | Pfade und Mapping anpassen |
| Neue `client_id`/`client_secret` | `400 Invalid client` | Werte aus neuem APK lesen |
| Geräte-Attestierung (Play Integrity) für den Login | Client ausgesperrt | erneut mitschneiden, dann neu entscheiden |

Keiner dieser Fälle verlangt einen Patch — außer dem letzten, und der ist
unwahrscheinlich: er würde auch ältere Geräte der eigenen Nutzer aussperren.

## Was der Mitschnitt ergeben hat

Die Aufzeichnung war die Grundlage für den Exporter, der die Daten
dauerhaft in eine Postgres-Datenbank schreibt. Kurzfassung der API:

- Authentifizierung: `POST /v22/oauth/token` mit
  `grant_type=password`, `username`, `password`, `client_id`, `client_secret`
  → `access_token` (48 h) und `refresh_token`.
- Lesen: `GET /v22/user`, `/v22/user/consumed-items?date=…`,
  `/v22/user/consumed-items/nutrients-daily?start=…&end=…`,
  `/v22/user/goals?date=…`, `/v22/user/water-intake?date=…`,
  `/v22/user/bodyvalues?date=…`, `/v22/user/exercises/summary-daily?start=…&end=…`,
  `/v22/user/fasting-countdowns[/history]`.
- Das Tagebuch besteht aus drei Listen: `products`, `recipe_portions` und
  `simple_products`.
- `client_id` und `client_secret` stehen fest in
  `yazio.network.api.Environment` und gelten für alle Nutzer.

Für den Alltag ist dieser Mitschnitt nicht mehr nötig — er bleibt hier
dokumentiert, damit man ihn bei einer neuen App-Version oder einer neuen Frage
an die API erneut aufsetzen kann.
