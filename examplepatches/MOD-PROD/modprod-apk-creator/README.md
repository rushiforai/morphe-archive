# 🧩 ModProd APK Creator

Crée une appli Android à partir d'une page HTML ou d'un site web, **sur le téléphone**, sans recompiler à la main :
l'**APK Base** ModProd + les patches pour Morphe Manager. Crée aussi des **lanceurs Android TV** (ATV Base + patch « ATV Launcher »).

Ajouter les patches à Morphe Manager :
👉 https://morphe.software/add-source?github=MOD-PROD/modprod-apk-creator

## 📦 Contenu du dépôt

| Dossier | Rôle |
|---|---|
| `base-app/apk-src/` | Sources de l'**APK Base** (format **Apktool M** : smali, manifeste, res, assets). Modifiables sur le téléphone. |
| `base-app/atv-src/` | Sources de l'**ATV Base** (lanceur Android TV, format Apktool M). |
| `base-app/icons/` | Icônes sources des APK de base. |
| `patches/` | Projet Morphe : patches **ModProd App**, **ModProd Réglages**, **ATV Launcher** (Kotlin). |
| `docs/` | Documentation : [créer une appli](docs/CREER-UNE-APPLI.md), [APK de base](docs/APK-DE-BASE.md). |
| `.github/workflows/base-apk.yml` | Compile les APK de base → release [**base-apk**](https://github.com/MOD-PROD/modprod-apk-creator/releases/tag/base-apk). |
| `.github/workflows/release.yml` | Compile les patches → release `vX.Y.Z` (fichier `.mpp`) lue par Morphe Manager. |

## 🚀 Créer une appli en 5 étapes

1. Télécharger **[`apk-base.apk`](https://github.com/MOD-PROD/modprod-apk-creator/releases/download/base-apk/apk-base.apk)** (le lien est aussi affiché dans Morphe Manager).
2. Dans **Morphe Manager** : ajouter la source ci-dessus, puis choisir l'APK de base depuis le stockage.
3. Patch **ModProd App** → remplir les options :
   - **Nom de l'appli** (obligatoire)
   - **Nom de package** (obligatoire, unique par appli, ex. `app.modprod.quantix`)
   - **Dossier de l'appli HTML** : dossier contenant la page `.html` (et ses images, css, js)
   - ou **Adresse web** : un site `https://…` à ouvrir à la place de la page HTML
   - **Fichier de configuration** (`.js`, facultatif), **Icône** (`.png` carré, facultatif)
   - **Version (nom / code)** (facultatif)
4. Patch **ModProd Réglages** (facultatif) : orientation, plein écran, écran allumé, captures bloquées, zoom,
   couleurs (fond, barres, accent), autorisations caméra / micro / localisation.
5. Lancer les patches → installer l'appli créée.

Détails : [docs/CREER-UNE-APPLI.md](docs/CREER-UNE-APPLI.md).

## 📺 Créer un lanceur Android TV

1. Télécharger **[`atv-base.apk`](https://github.com/MOD-PROD/modprod-apk-creator/releases/download/base-apk/atv-base.apk)**.
2. Morphe Manager → patch **ATV Launcher** : nom, package, action (lien / appli installée / appli sinon lien),
   lien cible, package cible, bannière 320 × 180, icône, « Jeux », version.
3. Installer l'APK créé sur la TV.

Détails : [docs/ATV-LAUNCHER.md](docs/ATV-LAUNCHER.md).

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/MOD-PROD/modprod-apk-creator/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📺 ATV Base (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [ATV Launcher](#atv-launcher) | Crée un lanceur Android TV : ouvre un lien, une appli installée, ou l'appli sinon le lien. Nom, package, bannière TV, icône et version. | • Nom du lanceur<br>• Nom de package<br>• Action au lancement<br>• Lien cible<br>• Package de l'appli cible<br>• Bannière TV<br>• Icône<br>• Ranger dans « Jeux »<br>• Version (nom)<br>• Version (code) |

</details>

<details open>
<summary>📦 APK Base&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [ModProd App](#modprod-app) | Transforme l'APK de base en une nouvelle appli : nom, nom de package, page HTML ou adresse web, configuration, icône et version. | • Nom de l'appli<br>• Nom de package<br>• Dossier de l'appli HTML<br>• Adresse web (au lieu du HTML)<br>• Fichier de configuration<br>• Icône du site (adresse web)<br>• Icône<br>• Version (nom)<br>• Version (code) |
| [ModProd Réglages](#modprod-r-glages) | Réglages Android de l'appli : orientation, plein écran, captures d'écran, écran allumé, zoom, couleurs, autorisations (caméra, micro, localisation). | • Orientation<br>• Plein écran<br>• Écran toujours allumé<br>• Bloquer les captures d'écran<br>• Zoom à deux doigts<br>• Barres de défilement<br>• Inspection depuis Chrome PC<br>• Thème des sites web<br>• Couleur de fond<br>• Couleur des barres système<br>• Couleur d'accent<br>• Autorisation : caméra<br>• Autorisation : micro<br>• Autorisation : localisation |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Développement

- Messages de commit **sémantiques** : `feat:` (nouvelle fonction → nouvelle release), `fix:` (correction → release),
  `chore:` / `docs:` (pas de release).
- Ne pas modifier à la main `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` : la release s'en charge.
- Compilation locale des patches : `./gradlew buildAndroid` (jeton GitHub nécessaire dans `gradle.properties` :
  `gpr.user` / `gpr.key`, droit `read:packages`) → `patches/build/libs/patches-*.mpp`.
- Une modification de `base-app/apk-src/` recompile l'APK de base automatiquement (pas de release de patches).

Documentation Morphe : [patcher](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md).

## 📜 Licence

Patches compatibles avec Morphe, sous licence [GNU GPL v3](LICENSE). Projet indépendant, non affilié au projet Morphe (voir [NOTICE](NOTICE)).
