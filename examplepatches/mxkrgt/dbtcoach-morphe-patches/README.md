# DBT Coach — Morphe Patches

Patches Morphe pour l'application **DBT Coach** (`co.swasth.dbtcoach`).

## Patches disponibles

| Patch | Description |
|-------|-------------|
| `Unlock premium` | Déverrouille les fonctionnalités premium en simulant un abonnement Google Play actif lors de la lecture des achats natifs |

## Fonctionnement du patch

DBT Coach est une application React Native + Hermes. L'état premium est décidé
côté JavaScript (`state.iap.isSubscribed`) :

1. au démarrage, `initializePremiumContent()` interroge le backend
   (`getSubscriptionStatus`, `fetchPolicy: network-only`) ;
2. si le serveur ne renvoie pas `hasAccess === true`, l'application se rabat sur
   les achats Google Play locaux via `RNIap.getAvailablePurchases()` ;
3. une liste d'achats non vide passe `isSubscribed` à `true` et persiste
   `HAS_PREMIUM`.

Le patch branche l'implémentation native Nitro
(`com.margelo.nitro.iap.HybridRnIap.getAvailablePurchases`). Une méthode d'aide
construit un `dev.hyo.openiap.PurchaseAndroid` synthétique (`dbtcoach.monthly`,
`IapStore.Google`, `PurchaseState.Purchased`, `transactionDate` = maintenant),
puis appelle le convertisseur interne de la bibliothèque
(`HybridRnIap.access$convertToNitroPurchase`) pour obtenir un `NitroPurchase`
authentique. Le tout est renvoyé dans une `Promise` résolue, et l'embranchement
Android de `getPurchases()` considère l'abonnement comme actif.

Cette approche évite de construire à la main le `NitroPurchase` 6.5.0
(55 paramètres avec wrappers `Variant_NullType_*`).

Les achats réels, la restauration et RevenueCat ne sont pas modifiés.

> ⚠️ Le chat IA « Diya » utilise des backends payants (AWS Bedrock / OpenAI) et
> peut rester limité côté serveur même avec `isSubscribed = true`.

## Utilisation dans Morphe Manager

Dans Morphe Manager → **Sources** → ajoute ce repo :

```
https://github.com/mxkrgt/dbtcoach-morphe-patches
```

## Prérequis de développement

- JDK 17+
- Android SDK
- GitHub PAT avec scope `read:packages`

Ajoute dans `~/.gradle/gradle.properties` :

```properties
gpr.user=TON_USERNAME
gpr.key=TON_PAT_TOKEN
```

## Build

```bash
ANDROID_HOME="$HOME/Android/Sdk" \
GITHUB_ACTOR="$(gh api user --jq '.login')" \
GITHUB_TOKEN="$(gh auth token)" \
./gradlew :patches:buildAndroid
```

Le bundle est produit dans `patches/build/libs/patches-<version>.mpp`.

## Tester le patch

```bash
java -jar ../morphe-cli.jar patch -p patches/build/libs/patches-<version>.mpp \
  -o ../analysis/dbt-coach/builds/dbt-coach_unlocked.apk -f \
  "../analysis/dbt-coach/apk/DBT Coach.apk"
```

Utilise un compte **sans abonnement** et vérifie :

- démarrage sans crash (lecture des achats natifs) ;
- compétences verrouillées accessibles, plus de badge cadenas ;
- écran d'abonnement considéré comme actif ;
- comportement du chat Diya (peut rester bloqué côté serveur).

## Déboguer un patch qui ne s'applique pas

1. Vérifie la classe cible dans le DEX :
   ```bash
   rg -n "getAvailablePurchases|HybridRnIap" decompiled/smali/classes4/com/margelo/nitro/iap/HybridRnIap.smali
   ```
2. Vérifie le descripteur du constructeur `NitroPurchase` (l'ordre des 42
   paramètres est utilisé par le smali injecté) :
   ```bash
   rg -n "constructor <init>" decompiled/smali/classes4/com/margelo/nitro/iap/NitroPurchase.smali
   ```
3. Si l'application change de version de `react-native-iap` / Nitro, la
   signature de `getAvailablePurchases` peut changer : le fingerprint échouera
   explicitement au lieu de patcher la mauvaise méthode.

## Versions compatibles

- **6.5.0** (versionCode 552) — seule version déclarée et vérifiée

Les versions 6.4.x utilisaient une API Nitro IAP différente
(`NitroPurchase` à 42 paramètres) : ne les ajouter qu'après vérification de leur
smali et adaptation du patch.
