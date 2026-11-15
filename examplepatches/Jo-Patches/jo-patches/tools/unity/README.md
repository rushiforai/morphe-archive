# Unity-Szenen-Patches

> **Hinweis:** Diese Skripte sind die Referenzimplementierung und dienten zur
> Verifikation. Im ausgelieferten Morphe-Bundle steckt die Kotlin-Portierung
> (`patches/src/main/kotlin/.../scenes/UnityBundlePatcher.kt`); sie erzeugt
> dieselben Bytes. Die Skripte sind nützlich, um ein neues App-Update zu
> prüfen oder die Szenen unabhängig nachzuvollziehen.

Entfernt die beiden Cross-Promo-Elemente aus dem Hauptmenü von
Memorize Pi Digits 11.01, die **keine** AdMob-Views sind und daher nicht per
Bytecode-Patch entfernt werden können:

| Skript | Entfernt | Szenen |
|---|---|---|
| `patch_prime_button.py` | `MainMenu/Shift/Prime Button` | `level0` |
| `patch_promote_icons.py` | `MainMenu/PromoteIcon` (inkl. `Icons`/`Icon (0..5)`) | `level0`–`level2` |

Beide GameObjects liegen in `assets/bin/Data/data.unity3d` (UnityFS,
Szenen `level0` = MainScene, `level1` = ReadScene, `level2` = GameScene).

## Voraussetzungen

- Python 3.10+
- `pip install UnityPy` (getestet mit 1.25.4)
- JDK 21 + `tools/uber-apk-signer.jar`

## Ablauf

```powershell
# 1) data.unity3d aus der APK extrahieren -> pi-unity/data.unity3d

# 2a) Prime Button entfernen (nur level0)
python tools/unity/patch_prime_button.py `
    --input pi-unity/data.unity3d `
    --out-dir pi-unity/out

# 2b) Seitliche Spiele-Icons entfernen (level0-level2)
python tools/unity/patch_promote_icons.py `
    --input pi-unity/out/data.unity3d `
    --out-dir pi-unity/out_side

# 3) ZIP neu bauen: data.unity3d und resources.arsc als STORE (Methode 0),
#    alle anderen Einträge mit ihrer ursprünglichen Methode.

# 4) zipalign + signieren
java -jar tools/uber-apk-signer.jar `
    --apks tools/patched/patched-unity.apk `
    --out tools/signed --allowResign
```

`patch_promote_icons.py` kann auch direkt auf ein Bundle angewendet werden, in
dem der Prime Button bereits entfernt wurde (siehe 2b).

## Was die Skripte ändern

`patch_prime_button.py`:

- `GameObject` `Prime Button` in `level0` → `m_IsActive = False`
- zugehöriger `Transform` → `m_LocalScale = (0, 0, 0)`

`patch_promote_icons.py`:

- findet jedes `GameObject` namens `PromoteIcon` (in `level0`, `level1`,
  `level2`) und läuft den kompletten Transform-Teilbaum ab
- jedes `GameObject` → `m_IsActive = False`
- jeder `Transform` → `m_LocalScale = (0, 0, 0)`

Die Skalierung 0 ist wichtig, weil die Menü-Scripts die Objekte zur Laufzeit
wieder aktivieren. Sie sorgt außerdem dafür, dass die `BoxCollider` der Icons
auf 0 schrumpfen – unsichtbare, aber anklickbare Flächen sind damit
ausgeschlossen.

## ZIP-Rebuild (wichtig)

`data.unity3d` **muss unkomprimiert** bleiben (Original: ZIP-Methode 0),
sonst lädt Unity das Bundle auf Android nicht. `resources.arsc` ebenfalls.

```python
import zipfile, sys
src, dst, bundle = sys.argv[1], sys.argv[2], sys.argv[3]
bundle_data = open(bundle, "rb").read()
with zipfile.ZipFile(src) as zin, zipfile.ZipFile(dst, "w") as zout:
    for info in zin.infolist():
        data = zin.read(info.filename)
        zi = zipfile.ZipInfo(info.filename, date_time=info.date_time)
        zi.external_attr = info.external_attr
        zi.create_system = info.create_system
        if info.filename == "assets/bin/Data/data.unity3d":
            zi.compress_type = zipfile.ZIP_STORED
            data = bundle_data
        else:
            zi.compress_type = info.compress_type
        zout.writestr(zi, data)
```

## Verifikation

Bundle (2336 Objekte):

- Prime-Button-Patch: genau 2 Objekte geändert (`GameObject` 73,
  `Transform` 265), 2334 byte-identisch.
- Icon-Patch gegenüber dem Prime-Bundle: genau 45 Objekte geändert
  (21 × `m_IsActive`, 24 × `m_LocalScale`), alle innerhalb der
  `PromoteIcon`-Teilbäume; 2291 byte-identisch.
- `Prime Button` bleibt inaktiv und auf Skalierung 0.

APK:

- ZIP-Methode von `data.unity3d` = 0 (STORED), `resources.arsc` = 0.
- `zipalign` und v3-Signatur verifiziert.
- Gegenüber der vorherigen APK unterscheiden sich nur das Bundle und die
  `META-INF`-Signaturdateien.
