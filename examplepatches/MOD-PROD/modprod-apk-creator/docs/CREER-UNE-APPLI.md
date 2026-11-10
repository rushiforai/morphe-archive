# Créer une appli avec le patch « ModProd App »

APK à patcher : [`apk-base.apk`](https://github.com/MOD-PROD/modprod-apk-creator/releases/download/base-apk/apk-base.apk) (« APK Base »).

## 1. Préparer les fichiers sur le téléphone

```
Download/MonAppli/
├── html/              ← « Dossier de l'appli HTML »
│   ├── index.html     ← la page (nom libre : index.html prioritaire, sinon le 1er .html)
│   └── images/…       ← fichiers utilisés par la page (facultatif)
├── config.js          ← « Fichier de configuration » (facultatif)
└── icone.png          ← « Icône », carrée, 512 × 512 conseillé (facultatif)
```

- La page part du modèle : `base-app/apk-src/assets/htmlapp/root/index/index.html`
  (blocs 1 à 8 : menu développeur, configuration, splash, saveFile, autoSave, bouton retour, liens externes).
- La configuration part de `base-app/apk-src/assets/htmlapp/root/config/config.js`.

## 2. Options du patch

| Option | Obligatoire | Effet dans l'APK |
|---|---|---|
| Nom de l'appli | oui | `res/values/strings.xml` → `app_name` |
| Nom de package | oui | manifeste : `package`, permission `….DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION`, `android:authorities` des providers |
| Dossier de l'appli HTML | non | remplace tout `assets/htmlapp/root/index/` |
| Adresse web (au lieu du HTML) | non | `https://…` : l'appli ouvre ce site. Remplace le lanceur `root/index.html` ; le dossier HTML est alors ignoré |
| Icône du site (adresse web) | non (activé) | avec une adresse web et sans icône choisie : récupère l'icône PNG du site pendant le patch (manifest web → icône « any » la plus grande, puis apple-touch-icon, puis `<link rel="icon">`) |
| Fichier de configuration | non | remplace `assets/htmlapp/root/config/` par `config.js` |
| Icône | non | `res/mipmap*/ic_launcher.png` + `ic_launcher_round.png` + `assets/htmlapp/root/icon.png` |
| Version (nom) | non | `android:versionName` |
| Version (code) | non | `android:versionCode` (entier, +1 à chaque mise à jour) |

Règles du nom de package : minuscules, au moins deux segments (`app.modprod.monappli`),
lettres/chiffres/_, chaque segment commence par une lettre, pas de mot réservé Java (`new`, `class`, `int`…).

## 2 bis. Patch « ModProd Réglages » (facultatif, activé par défaut)

Valeurs par défaut = APK de base inchangé.

| Option | Défaut | Effet dans l'APK |
|---|---|---|
| Orientation | Portrait | `Portrait` bloqué ou `Automatique (rotation)` (bools.xml `portrait` + manifeste) |
| Plein écran | non | masque la barre d'état (`fullscr`) |
| Écran toujours allumé | non | `keepScreenOn` |
| Bloquer les captures d'écran | non | `flag_secure` (aussi l'aperçu des applis récentes) |
| Zoom à deux doigts | non | `Zoom` |
| Barres de défilement | non | `ScrollBars` |
| Inspection depuis Chrome PC | non | `isDebugMode` (chrome://inspect) — à couper pour une version publiée |
| Couleur de fond | #141a21 | thème (fond + splash Android 12), layout, `loading.html`, `error.html` |
| Couleur des barres système | #141a21 | barre d'état + navigation ; couleur claire = icônes sombres automatiquement |
| Couleur d'accent | #f08a24 | `colorAccent` (fenêtres Android « Save As »…) |
| Autorisation : caméra | non | `CAMERA` (photo depuis un champ fichier, vidéo getUserMedia) |
| Autorisation : micro | non | `RECORD_AUDIO` + `MODIFY_AUDIO_SETTINGS` |
| Autorisation : localisation | non | `ACCESS_FINE_LOCATION` + `ACCESS_COARSE_LOCATION` |

Couleurs : `#RGB`, `#RRGGBB` ou `#AARRGGBB`. Les demandes d'autorisation à l'utilisateur sont déjà dans l'APK de base :
il suffit de cocher l'autorisation dont la page a besoin.

## 3. Appli « site web »

Remplir **Adresse web** (ex. `https://quantix.modprod.app/`) au lieu du dossier HTML.

- Le site s'ouvre dans l'appli ; tous les liens `http(s)` restent dans l'appli,
  `mailto:`, `tel:`, `geo:`, `whatsapp:`… ouvrent l'appli Android correspondante.
- Bouton retour : page précédente du site, puis fermeture de l'appli
  (ou `window.__appBack()` si le site la définit, voir le contrat JS).
- Icône : laissée vide, elle est récupérée sur le site (connexion nécessaire pendant le patch). Seuls les PNG
  d'au moins 48 px sont pris ; sinon l'icône « APK Base » est gardée (avertissement dans le journal du patch).
- Hors connexion : page d'erreur avec un bouton **Réessayer**.
- Seules les adresses `https://` sont acceptées (Android bloque le `http://` non chiffré).
- Le pont `Android` (`Android.getBase64FromBlobData`, `Android.autoSave`…) est aussi disponible pour le site.

## 4. Mises à jour d'une appli

- Garder **le même nom de package** et augmenter **Version (code)**.
- Morphe Manager signe avec sa propre clé : toujours patcher depuis le même Morphe Manager
  (sinon Android refuse la mise à jour → exporter les données avant de désinstaller).

## 5. Tester sans repatcher

Dans l'appli : 10 touchers sur le logo → **Menu développeur** → *Charger un .html…*
La version de test remplace la page intégrée jusqu'à *Revenir à la version intégrée*.
