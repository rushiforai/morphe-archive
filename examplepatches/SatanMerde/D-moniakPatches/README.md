# 🦈 D-moniak Patches

> [!IMPORTANT]
> **⚠️ AVERTISSEMENT LÉGAL ET RESPONSABILITÉ / LEGAL DISCLAIMER :**
> - **100% Généré par Intelligence Artificielle (IA) :** L'ensemble du code, de l'architecture et des patchs présents sur ce dépôt ont été conçus et rédigés intégralement par une IA.
> - **Aucune Responsabilité :** L'auteur / créateur de ce dépôt GitHub ne saurait en aucun cas être tenu responsable de l'utilisation directe ou indirecte de ce projet, d'éventuels dysfonctionnements, de pertes de données, de sanctions ou de bannissements de comptes par des éditeurs tiers.
> - **But Strictement Éducatif :** Ce dépôt est proposé **exclusivement à des fins éducatives et de recherche** en sécurité logicielle, afin d'étudier le fonctionnement interne du bytecode Dalvik/Dex, de l'architecture Smali et des mécanismes d'injection de code sur Android.

---

Bundle de patchs pour le framework [Morphe](https://github.com/morpheapp), incluant le patch dédié à **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).

## ❓ À propos / About

Ce projet fournit un patch modulaire permettant d'étudier et de débloquer les flux de récompenses publicitaires (réanimations gratuites lors d'un Game Over, doublement des pièces d'or et des gemmes, coffres de boutique et spins quotidiens) sans avoir à charger ni visionner les vidéos publicitaires.

---

### 📲 Comment utiliser ce patch dans Morphe Manager

Pour ajouter cette source de patchs à **Morphe Manager** :

👉 **[Ajouter D-moniak Patches à Morphe Manager (1-Clic)](https://morphe.software/add-source?github=SatanMerde/D-moniakPatches)**

Ou manuellement dans l'application :
1. Lancez **Morphe Manager**.
2. Rendez-vous dans **Settings** (Paramètres) > **Patch Sources** (Sources de patchs).
3. Ajoutez la source : `SatanMerde/D-moniakPatches`.
4. Sélectionnez **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).
5. Cochez le patch **Bypass Rewarded Ads**.
6. Cliquez sur **Patcher** puis procédez à l'installation.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.15](https://github.com/SatanMerde/D-moniakPatches/releases/tag/v1.1.15)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Hungry Shark World&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Rewarded Ads](#bypass-rewarded-ads) | Bypasses rewarded video ads in Hungry Shark World by emulating ad completion events. |  |
| [Free Shopping](#free-shopping) | Unlocks shop items and in-app purchases in Hungry Shark World by cleanly replacing GoogleBillingService purchase methods and receipt validation. |  |

</details>

<!-- PATCHES_END -->

---

## 🛠️ Développement & Publication

Ce dépôt utilise le système de publication automatisé **Semantic Release** avec GitHub Actions :

- **Branche `dev`** : Utilisée pour le développement et la génération automatique de pré-releases.
- **Branche `main`** : Branche stable de production.
- **Commits conventionnels** :
  - `feat:` Nouvelle fonctionnalité (déclenche une release mineure).
  - `fix:` Correction de bug (déclenche une release corrective).
  - `chore:` Maintenance interne sans création de release.

### Compilation locale

```bash
./gradlew :patches:buildAndroid
```
Le fichier résultant `.mpp` est généré dans `patches/build/libs/patches-*.mpp`.

## 📄 Licence

Ce projet est distribué sous licence [GNU General Public License v3.0](LICENSE).
Ce logiciel est fourni « tel quel », sans garantie d'aucune sorte.
