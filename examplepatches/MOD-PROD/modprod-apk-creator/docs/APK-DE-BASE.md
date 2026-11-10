# APK Base — repères

Sources : `base-app/apk-src/` (format Apktool M). Package de base : `app.modprod.apkbase`, nom affiché « APK Base », APK publié : `apk-base.apk`.
Toute modification de ces sources recompile l'APK (workflow **APK de base**) et met à jour
la release [base-apk](https://github.com/MOD-PROD/modprod-apk-creator/releases/tag/base-apk).

## Classes principales (smali)

| Fichier | Rôle |
|---|---|
| `smali/start/MainActivity.smali` | Activité principale : WebView `x`, ouvre `file:///android_asset/htmlapp/root/index.html`, pont JS « Android » |
| `smali/start/BackCb.smali` | Réponse de `window.__appBack()` : ferme l'appli si `"exit"` |
| `smali/start/Cfg.smali` | Réglages Android lus dans `res/values/bools.xml` (appelé à la fin de `onCreate`) |
| `smali/S/d.smali` | Pont JavaScript `Android` : `getBase64FromBlobData`, `autoSave`, `openExternal`, `listAssets` (champ `a` = MainActivity) |
| `smali/S/h.smali` | WebViewClient (`onReceivedError` : `helpers/error.html` seulement si la page principale échoue) |
| `smali/S/b.smali` | Clic OK de la fenêtre « Save As » |

## Assets

```
assets/htmlapp/
├── helpers/ loading.html, error.html
└── root/
    ├── index.html     ← lanceur : ouvre le .html de index/ (index.html prioritaire)
    ├── index/         ← la page de l'appli (remplacée par le patch)
    ├── config/        ← premier .js = configuration (remplacé par le patch)
    ├── icon.png       ← logo du splash (remplacé par le patch)
    └── manifest.json
```

## Réglages Android (`res/values/bools.xml`)

| bool | défaut | effet |
|---|---|---|
| fullscr | false | plein écran |
| flag_secure | false | bloque les captures d'écran |
| keepScreenOn | false | l'écran ne s'éteint pas |
| Zoom | false | zoom à deux doigts |
| ScrollBars | false | barres de défilement |
| portrait | true | false = suit la rotation |
| isDebugMode | false | inspection depuis Chrome PC (chrome://inspect) |

## Contrat JavaScript

```js
// Enregistrer un fichier (nom pré-rempli dans « Save As », MediaStore → Téléchargements)
Android.getBase64FromBlobData("data:" + mime + ";name=" + encodeURIComponent(nom) + ";base64," + b64, mime);
// Sauvegarde silencieuse → "ok" ou "err:…"
Android.autoSave(texte, "Documents/MonAppli/", "sauvegarde.json");
// Lien externe → "ok"
Android.openExternal(url);
// Liste d'un dossier d'assets (noms séparés par \n)
Android.listAssets("htmlapp/root/index");
// Bouton retour : la page définit window.__appBack() → "ok" (géré) ou "exit" (fermer)
```

## Règles

- smali : toujours `.locals`, `const-string` avec guillemets, `move-exception` en première instruction d'un catch,
  `@JavascriptInterface` sur chaque méthode du pont.
- Manifeste : `android:enableOnBackInvokedCallback="false"` (Android 16) ; pas de `--` dans les commentaires XML.
- Android 11+ : écrire les fichiers via MediaStore.
