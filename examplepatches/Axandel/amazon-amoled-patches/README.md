# 🌑 Amazon AMOLED Patches

Un thème sombre **AMOLED (noir pur)** qui fonctionne vraiment pour l'application **Amazon Shopping**, à appliquer avec [Morphe](https://morphe.software).

Compatible avec Amazon Shopping (`com.amazon.mShop.android.shopping`), Amazon India et Amazon Business (expérimental).

### Ajouter ces patches à Morphe

Ajoute l'URL de ce dépôt comme source dans Morphe Manager : `https://github.com/Axandel/amazon-amoled-patches`

<a href="https://morphe.software/add-source?github=Axandel/amazon-amoled-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Liste des patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Axandel/amazon-amoled-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**3 patches** across **3 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Amazon Business**](PATCHES.md#amazon-business-comamazonmshopandroidbusinessshopping) | 1 | — | [`com.amazon.mShop.android.business.shopping`](https://play.google.com/store/apps/details?id=com.amazon.mShop.android.business.shopping) |
| 2 | [**Amazon India**](PATCHES.md#amazon-india-inamazonmshopandroidshopping) | 1 | `32.19.0.300` | [`in.amazon.mShop.android.shopping`](https://play.google.com/store/apps/details?id=in.amazon.mShop.android.shopping) |
| 3 | [**Amazon Shopping**](PATCHES.md#amazon-shopping-comamazonmshopandroidshopping) | 1 | `32.19.0.100` | [`com.amazon.mShop.android.shopping`](https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping) |
<!-- PATCHES_END -->

## ⚙️ Options du patch

| Option | Valeurs | Par défaut |
|---|---|---|
| **When to use the dark theme** | `Always on` (toujours sombre, même si le téléphone est en mode clair) · `Follow the system theme` (suit le thème d'Android) | Always on |
| **Brightness of product photos** | 100 % · 85 % · 70 % · 55 % (ou toute valeur entre 30 et 100). Les photos produits ont un fond blanc : les atténuer fatigue moins les yeux la nuit. | 85 % |
| **Web page rendering** | `Accurate colors` (couleurs exactes) · `Fast` (filtre plus léger, à choisir seulement si le défilement saccade) | Accurate colors |
| **Black native screens** | Repeint aussi en noir les écrans qui ne sont pas des pages web (menus, barres, réglages) | Activé |

> ⚠️ N'active pas en même temps le patch **Dark mode** d'une autre source (celui de Doom, par exemple) : les deux se marcheraient dessus.

## 🔍 Pourquoi les autres patches « Dark mode » ne marchent pas bien

L'app Amazon est surtout une coquille native autour de **WebViews** : fiches produit, résultats de recherche, panier et compte sont des pages web.

Les patches existants comptent principalement sur le *Force Dark* d'Android (`android:forceDarkAllowed`) et sur l'assombrissement automatique de Chromium. Ces mécanismes présentent quatre défauts :

- ils ne s'activent que si le téléphone est déjà en mode sombre, donc l'option « toujours activé » ne fait presque rien ;
- l'assombrissement de Chromium est désactivé par les pages qui déclarent un schéma de couleurs clair, et il ne produit jamais du noir pur (au mieux du gris très foncé) ;
- le *Force Dark* d'Android inverse aussi les images claires, ce qui peut faire apparaître les photos produits sur fond blanc en négatif ;
- le CSS n'est injecté qu'à la fin du chargement de la page, d'où des flashs blancs.

## 🧠 Comment ce patch fonctionne

**Pages web** (le cœur de l'app)

- Une feuille de style est injectée **dès le début du chargement** de chaque page, par un script « document-start » de WebView quand il est disponible, puis à chaque étape du chargement par sécurité. Il n'y a pas de flash blanc et le fond du WebView est noir pendant le chargement.
- Toute la page passe par une **inversion de luminosité** faite avec un filtre SVG : `x − min(r,g,b) + 1 − max(r,g,b)`. Le blanc devient **noir pur** (#000000), le texte sombre devient clair, et la teinte est conservée (les liens restent bleu-vert, les prix restent rouges).
- Les photos, vidéos, bannières, boutons jaunes et orange « Ajouter au panier » / « Acheter maintenant » et les badges repassent une seconde fois dans le même filtre. Comme ce filtre redonne exactement l'original quand on l'applique deux fois, **leurs couleurs sont intactes** (testé au pixel près).
- Les petites icônes restent inversées, ce qui rend les icônes sombres claires. Les pages déjà sombres sont détectées et simplement passées sur fond noir.
- L'assombrissement propre à Chromium est désactivé sur ces WebViews pour ne pas tout ré-éclaircir.
- La feuille de style est « constructible », ce qui fait que les règles CSP des pages ne la bloquent pas.

**Écrans natifs**

- Sur Android 12 et plus, l'app (et elle seule) est passée en **mode nuit** avec `UiModeManager.setApplicationNightMode`. Sur Android 10 et 11, chaque activité est marquée en mode nuit.
- `android:forceDarkAllowed` est activé dans les thèmes, ce qui permet à Android d'assombrir ce que le patch ne repeint pas lui-même (vues dessinées à la main, écrans Jetpack Compose).
- Après chaque mise en page et chaque défilement, avant l'affichage de l'image suivante, l'arbre des vues est parcouru :
  - les fonds clairs deviennent noirs (le jaune et l'orange des boutons Amazon sont conservés) ;
  - le texte sombre posé sur un fond sombre devient clair, en gardant les différences d'état (onglet sélectionné, case cochée…) ;
  - les icônes sombres et monochromes deviennent claires, les photos ne sont jamais touchées (et sont soustraites au *Force Dark* pour ne pas passer en négatif) ;
  - la barre d'état et la barre de navigation passent au noir avec des icônes claires.

**Accroches dans l'app** (génériques, sans dépendre des noms internes d'une version précise d'Amazon)

- le début de `Application.onCreate()` (classe lue dans le manifeste) ;
- `onPageStarted`, `onPageCommitVisible` et `onPageFinished` de **toutes** les sous-classes de `WebViewClient` (les méthodes manquantes sont ajoutées) ;
- `onAttachedToWindow()` de toutes les sous-classes de `WebView`.

Toutes les injections ont lieu en tout début de méthode et ne lisent que des registres de paramètres. Elles ne peuvent donc pas écraser une variable de l'app. Le code de l'extension ne lève jamais d'exception vers l'app.

## 🚀 Mise en route (première fois)

Tu as besoin d'un compte GitHub. La compilation se fait gratuitement sur GitHub Actions : tu n'as rien à installer.

1. Crée un dépôt **public** vide nommé `amazon-amoled-patches` sur GitHub.
2. Dans le dossier de ce projet, remplace les `Axandel` par ton nom d'utilisateur GitHub :
   ```bash
   python3 scripts/set_owner.py <ton-pseudo-github>
   ```
3. Dans le dépôt GitHub, va dans **Settings → Actions → General → Workflow permissions**, coche **Read and write permissions** et **Allow GitHub Actions to create and approve pull requests**.
4. Envoie le code, sur `main` **et** `dev` (la configuration de release attend les deux branches) :
   ```bash
   git init -b main
   git add .
   git commit -m "feat: AMOLED dark theme for Amazon Shopping"
   git remote add origin https://github.com/<ton-pseudo-github>/amazon-amoled-patches.git
   git push -u origin main
   git push origin main:dev
   ```
5. Attends que le workflow **Release** (onglet *Actions*) se termine : il publie une release `v1.0.0` avec le fichier `patches-1.0.0.mpp`.
6. Dans **Morphe Manager**, ajoute la source `https://github.com/<ton-pseudo-github>/amazon-amoled-patches`, choisis Amazon Shopping, coche **AMOLED dark theme** (décoche le *Dark mode* des autres sources), règle les options et lance le patch.

Pour publier une nouvelle version plus tard : fais un commit dont le message commence par `fix:` ou `feat:` sur `main`, et le workflow publie la release tout seul.

### Compiler en local (optionnel)

```bash
./gradlew buildAndroid
```

Il faut un JDK 21 et un jeton GitHub (*classic*, droit `read:packages`) dans `~/.gradle/gradle.properties` (`gpr.user=<pseudo>` et `gpr.key=<jeton>`), car le plugin Gradle de Morphe est hébergé sur GitHub Packages. Le fichier produit est `patches/build/libs/patches-*.mpp`, à utiliser par exemple avec [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).

## 🛠️ Modifier le thème

- Le script des pages web est lisible dans `extensions/extension/src/main/js/amoled-dark.js`. Après une modification, régénère la version embarquée avec `python3 scripts/embed_js.py`.
- La liste `KEEP` du script contient les éléments qui gardent leurs couleurs d'origine (classes CSS d'Amazon). Ajoute-y un sélecteur si un élément coloré ressort mal.
- Les écrans natifs sont gérés dans `NativeDarkener.java`, les règles de couleur dans `Colors.java`.

## ⚠️ Limites connues

- **Non testé sur un appareil réel** pour l'instant. Le script web a été testé dans Chrome (même moteur que WebView), l'extension compile contre l'API Android 34 et les accroches suivent l'API de Morphe Patcher 2.5.
- Les écrans en **Jetpack Compose** et les **boîtes de dialogue** sont assombris par Android : ils seront gris très foncé plutôt que noir pur.
- Les photos produits gardent leur **fond blanc** (c'est l'image elle-même). L'option de luminosité permet de les atténuer.
- Au tout premier lancement après le patch, l'écran peut clignoter une fois, le temps qu'Android applique le mode nuit à l'app.
- Si le **thème sombre étendu** d'Android 16 (« rendre plus d'apps sombres ») est activé, il peut se superposer au patch. Désactive-le si les pages repassent en clair.
- Pour diagnostiquer un problème, filtre logcat sur le tag `AmazonAmoled`. Le journal de patch de Morphe indique aussi combien d'accroches ont été posées (`AMOLED dark theme: N WebViewClient callback(s)…`).

## 📜 Licence

Projet basé sur le [template de patches Morphe](https://github.com/MorpheApp/morphe-patches-template), sous licence [GNU General Public License v3.0](LICENSE). Ce projet n'est affilié ni à Amazon ni au projet Morphe.
