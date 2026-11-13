# Morphe Patch Engineering Core Rules

Ce fichier définit les règles fondamentales et les standards d'ingénierie logicielle pour le développement de patchs dans le dépôt **D-moniakPatches**. Ces règles sont chargées et appliquées en permanence.

---

## 1. 🛡️ Règles Absolues de Manipulation Bytecode & Dalvik

1. **Gestion stricte des registres Dalvik :**
   - Ne jamais injecter d'instructions (`const/4 v0, 0x1`, etc.) en supposant que le registre `v0` est disponible sans vérifier ou recalculer le nombre total de registres de la méthode.
   - Les paramètres occupent toujours les registres les plus élevés (`p0`, `p1`, ...).
   - Lors d'un remplacement de méthode complet (`replaceInstructions` ou `replaceMethod`), **toujours allouer un headroom de registres dédié** :
     ```kotlin
     val regCount = maxOf(4, method.parameters.size + 2)
     method.toMutable().replaceInstructions("""
         const/4 v0, 0x1
         return v0
     """, regCount)
     ```
   - Cela prévient 100% des erreurs de vérification ART/Dalvik au runtime (`VerifyError`, `Register index out of range`).

2. **Privilégier le remplacement propre (`replaceMethod`) :**
   - Pour les méthodes dont le rôle est de vérifier un statut booléen (`isPremium`, `isSubscribed`, `isPro`, `isTrial`), préférer le remplacement intégral du corps de la méthode plutôt qu'une insertion d'instruction au début, afin d'éviter tout code mort ou conflit de registres.

---

## 2. 🎯 Règles de Fingerprinting (Résistance aux Mises à Jour)

1. **Déclaration sous forme d'`object` :**
   - Déclarer systématiquement les fingerprints comme des singletons `object` (ex: `object EntitlementFingerprint : Fingerprint(...)`). Cela fournit un nom explicite dans les logs de build et de debug de Morphe si le fingerprint ne match pas.

2. **Zéro dépendance aux noms obfusqués :**
   - Ne jamais cibler un nom de méthode ou de classe obfusqué (`a()`, `b.c()`, etc.) car ils changent à chaque release de l'application.
   - Toujours filtrer sur :
     - Le type de retour (`returnType = "Z"`, `"I"`, etc.)
     - Les drapeaux d'accès (`AccessFlags.PUBLIC`, `AccessFlags.FINAL`, etc.)
     - La liste précise des types de paramètres (`parameters = listOf(...)`)
     - Les chaînes de caractères littérales uniques (`string("subscription_tier")`)
     - Les opcodes ou appels de méthodes stables.

---

## 3. 💳 Standards de Contournement des Paywalls & Protections

1. **Google Play Billing :**
   - `BillingResult.getResponseCode()` -> `0` (`BillingClient.BillingResponseCode.OK`)
   - `Purchase.getPurchaseState()` -> `1` (`Purchase.PurchaseState.PURCHASED`)
   - `Purchase.isAcknowledged()` -> `true`
   - `BillingClient.isReady()` -> `true`

2. **RevenueCat / Purchases SDK :**
   - Cibler `CustomerInfo.getEntitlements()` et renvoyer un statut actif pour l'entitlement cible.

3. **Protection PairIP / Google Play App Signing :**
   - Neutraliser `LicenseContentProvider.onCreate()` (retourner `true` immédiatement).
   - Spoof `SignatureCheck.verifySignatureMatches()` -> `true`.
   - Neutraliser `LicenseClient.showPaywallAndCloseApp()` et `LicenseActivity.onStart()`.

4. **Vérification d'installation Play Store :**
   - Intercepter `PackageManager.getInstallerPackageName()` pour renvoyer `"com.android.vending"`.

---

## 4. 📚 Base de Connaissances & Références Locales

Pour tout besoin d'approfondissement technique, d'architecture ou de pattern spécifique, consulter la skill locale :
* Chemin : `.agents/skills/morphe-patching/`
  * Patrons de bypass complets : `.agents/skills/morphe-patching/references/patterns/`
  * Cheatsheets bytecode Smali : `.agents/skills/morphe-patching/references/bytecode/`
  * Guides d'extensions & APIS : `.agents/skills/morphe-patching/references/patching/`
  * Analyse de patchs de la communauté : `.agents/skills/morphe-patching/references/community/`
