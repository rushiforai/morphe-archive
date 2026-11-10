# Lanceur Android TV — patch « ATV Launcher »

APK à patcher : [`atv-base.apk`](https://github.com/MOD-PROD/modprod-apk-creator/releases/download/base-apk/atv-base.apk)
(« ATV Base », package `app.modprod.atvlink.base`, sources dans `base-app/atv-src/`).

Le lanceur apparaît sur l'écran d'accueil de la TV (bannière) et ouvre sa cible, puis se ferme.

## Options

| Option | Obligatoire | Effet |
|---|---|---|
| Nom du lanceur | oui | `app_name` |
| Nom de package | oui | `package` du manifeste (unique par lanceur) |
| Action au lancement | oui | `Lien` → `atv.links.Url` · `Appli installée` → `atv.links.Apk` · `Appli installée, sinon lien` → `atv.links.ApkToUrl` |
| Lien cible | modes Lien | `target_url` : `https://…` ou `intent://…#Intent;scheme=https;end` (lu par `Intent.parseUri`) |
| Package de l'appli cible | modes Appli | `target_apk` + `<queries><package>` du manifeste |
| Bannière TV | non | `res/drawable/ic_banner.png` (PNG 320 × 180) |
| Icône | non | `res/mipmap-*/ic_launcher.png` |
| Ranger dans « Jeux » | non | `android:isGame` |
| Version (nom / code) | non | `android:versionName` / `android:versionCode` |

## Pourquoi la compilation échouait avant

Le manifeste d'origine utilisait `@string/MainActivity` pour le nom de l'activité et `@string/target_apk`
dans `<queries>`. `aapt2` refuse une référence de ressource à ces endroits (« must be a valid Java class/package name »).
L'ATV Base contient maintenant des valeurs littérales, et le patch les remplace selon les options.
