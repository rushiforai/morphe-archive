# Asana Rebel — notes d'analyse

Cible : `com.asanayoga.asanarebel`, versionName `6.29.0.7409`, versionCode `7409`
(minSdk 26, targetSdk 36). Écrit et validé contre l'APK `asana-rebel-6-29-0-7409.apk`.

## Unlock Asana Rebel Pro

`PayWall.isOpen()` est l'unique source de vérité du statut « abonné ».

```
PayWallImpl.smali

.method public isOpen()Z
    iget-object v0, p0, L...PayWallImpl;->payWallStorage:L...PayWallStorage;
    invoke-interface {v0}, L...PayWallStorage;->retrievePayWallIsOpen()Z
    move-result v0
    return v0
.end method
```

Il est alimenté par `SplashScreenPresenter$bootstrap$1` avec
`latestSubscription != null && !latestSubscription.canceled`, donc `true` = Pro.
La valeur est persistée dans les SharedPreferences sous la clé `pay_wall_is_open`.

28 sites d'appel le consomment : `WorkoutDetailPresenter` (le paywall des séances),
téléchargements hors-ligne, Yoga Stories, recettes, sons, weekly plan,
`SettingsPresenter.isUserPro`, `WeeklyPlanViewModel.isPro`.

Le verrou des séances est dans `WorkoutDetailPresenter.onPlayButtonClicked` :

```java
if (!z2 && !this.payWall.isOpen()) {
    if (!workout.getFree()) {
        view.goToSalesPage();
        return;
    }
}
view.startWorkoutPlayback(...);
```

## Skip sign up and login

L'app crée déjà un **compte invité anonyme** en arrière-plan quand `LoginStatus` vaut
`LoggedOutUser` : `GetGuestUserUseCase` (`POST /api/v1/guest_users`) puis
`changeUserUseCase.saveNewUser(id, abToken, token, TRUE, language)`.

Le blocage est purement la navigation : les branches `LoggedOutUser` **et** `GuestUser` de
`SplashScreenPresenter$bootstrap$1` finissent toutes les deux sur
`view.goToLoginGetStarted()`. `SplashScreenActivity` délègue à `NavigatorImpl` :

```
.method public goToLoginGetStarted(Landroidx/appcompat/app/AppCompatActivity;)V
    const-class v1, Lcom/asanayoga/asanarebel/ui/onboarding/OnboardingActivity;
    invoke-static {p1, v1, v0}, L.../ViewExtKt;->internalStartActivity(...)V
.end method
```

Le patch remplace le corps par `goHome(context, null, null)`, qui démarre `RootActivity`
(`FLAG_ACTIVITY_NEW_TASK | FLAG_ACTIVITY_CLEAR_TASK`). Un seul point de sortie, donc tout le
tunnel `OnboardingActivity` (landing, questions, sign up, login) disparaît.

Effet de bord : se déconnecter depuis les réglages ramène au home en invité, plus à l'onboarding.

## Skip privacy consent screen

`RootViewModel.checkGDPRStatus()` ouvre l'écran de consentement quand le compte n'a pas
`privacyPolicy && termsOfService`. Un compte invité tout neuf est exactement dans ce cas.
`returnEarly()` sur cette méthode évite l'écran après le splash.

## Ce qui reste et n'a pas été touché

- Les cartes `verticalOnboarding` (poids, taille, objectif) sont des éléments du feed du home,
  pas un écran bloquant.
- Aucune vérification de signature ou de licence Play dans le code de l'app : le seul contrôle
  est ce flag local plus le serveur.

## Build

```bash
JAVA_HOME=/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home \
GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token) \
./gradlew buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

Pièges rencontrés :

| Erreur | Cause / fix |
|---|---|
| `401` sur `maven.pkg.github.com` | token GitHub sans `read:packages` → `gh auth refresh -h github.com -s read:packages` |
| `jlink` échoue sur `core-for-system-modules.jar` | JDK 27 trop récent pour l'AGP → build avec JDK 21 |
| `App icon color must be 0xRRGGBB format` | `appIconColor` doit tenir sur 6 chiffres hex, pas d'alpha |

Validation : `morphe-desktop patch ... --validate` (fingerprints uniques) puis inspection du
DEX produit.
