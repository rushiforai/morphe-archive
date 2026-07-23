# DBT Coach — Morphe Patches

Patches Morphe pour l'application **DBT Coach** (`co.swasth.dbtcoach`).

## Patches disponibles

| Patch | Description |
|-------|-------------|
| `Unlock premium` | Déverrouille toutes les fonctionnalités premium en court-circuitant RevenueCat |

## Utilisation dans Morphe Manager

Dans Morphe Manager → **Sources** → ajoute ce repo :

```
https://github.com/mxkrgt/dbtcoach-morphe-patches
```

## Prérequis de développement

- JDK 17
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
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

## Déboguer un patch qui ne s'applique pas

1. Décompile l'APK avec JADX :
   ```bash
   jadx co.swasth.dbtcoach.apk -d jadx_output --deobf
   ```

2. Vérifie que la classe RevenueCat existe :
   ```bash
   grep -rn "EntitlementInfo\|isActive" jadx_output/ | grep revenuecat
   ```

3. Si la classe est obfusquée, adapte `REVENUECAT_ENTITLEMENT_CLASS` dans `UnlockPremiumPatch.kt`.

## Versions compatibles

- 6.4.2 (testée)
- 6.4.1
- 6.4.0
- 6.1.3
