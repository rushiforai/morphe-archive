# 🦈 D-moniak Patches

<p align="center">
  <a href="#-français"><b>🇫🇷 Français</b></a> &nbsp;•&nbsp; <a href="#-english"><b>🇬🇧 English</b></a>
</p>

<p align="center">
  <a href="https://morphe.software/add-source?github=SatanMerde/D-moniakPatches">
    <img src="https://img.shields.io/badge/Morphe_Manager-Ajouter_la_source_%2F_Add_Source-007ACC?style=for-the-badge&logo=android" alt="Add Source to Morphe Manager">
  </a>
</p>

---

> [!IMPORTANT]
> ### ⚠️ AVERTISSEMENT LÉGAL ET RESPONSABILITÉ / LEGAL DISCLAIMER
>
> **🇫🇷 Français :**
> - **100% Généré par Intelligence Artificielle (IA) :** L'ensemble du code, de l'architecture et des patchs présents sur ce dépôt ont été conçus et rédigés intégralement par une IA.
> - **Aucune Responsabilité :** L'auteur / créateur de ce dépôt GitHub ne saurait en aucun cas être tenu responsable de l'utilisation directe ou indirecte de ce projet, d'éventuels dysfonctionnements, de pertes de données, de sanctions ou de bannissements de comptes par des éditeurs tiers.
> - **But Strictement Éducatif :** Ce dépôt est proposé **exclusivement à des fins éducatives et de recherche** en sécurité logicielle, afin d'étudier le fonctionnement interne du bytecode Dalvik/Dex, de l'architecture Smali et des mécanismes d'injection de code sur Android.
>
> <br>
>
> **🇬🇧 English :**
> - **100% AI-Generated:** All code, architecture, and patches in this repository were entirely designed and written by Artificial Intelligence (AI).
> - **No Liability:** The author / maintainer of this GitHub repository shall not be held liable under any circumstances for any direct or indirect use of this project, malfunctions, data loss, penalties, or account bans by third-party publishers.
> - **Strictly Educational Purpose:** This repository is provided **strictly for educational and software security research purposes**, to study the internal workings of Dalvik/Dex bytecode, Smali architecture, and code injection techniques on Android.

---

## 🩹 Liste des patchs / Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.17](https://github.com/SatanMerde/D-moniakPatches/releases/tag/v1.1.17)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
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

## 🇫🇷 Français

### ❓ À propos
Bundle de patchs modulaires pour le framework [Morphe](https://github.com/morpheapp), ciblant actuellement **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).

Ce projet permet d'étudier et de débloquer :
- Les flux de récompenses publicitaires (réanimations gratuites lors d'un Game Over, doublement des pièces d'or et des gemmes, coffres de boutique et tirages quotidiens) sans charger de vidéos publicitaires.
- Les articles et achats intégrés dans la boutique du jeu (Free Shopping).

### 📲 Comment utiliser dans Morphe Manager

👉 **[Ajouter D-moniak Patches à Morphe Manager (1-Clic)](https://morphe.software/add-source?github=SatanMerde/D-moniakPatches)**

Ou manuellement dans l'application :
1. Lancez **Morphe Manager**.
2. Rendez-vous dans **Settings** (Paramètres) > **Patch Sources** (Sources de patchs).
3. Ajoutez la source : `SatanMerde/D-moniakPatches`.
4. Sélectionnez **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).
5. Cochez les patchs souhaités (**Bypass Rewarded Ads**, **Free Shopping**).
6. Cliquez sur **Patcher** puis procédez à l'installation.

### 💬 Signaler un bug ou demander un patch
Vous rencontrez un problème ou vous souhaitez le support d'un nouveau jeu / patch ?
- 🐛 **[Signaler un bug ou un problème](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=bug_report.yml)** : si un patch ne fonctionne pas correctement ou fait planter l'application.
- ✨ **[Demander un nouveau patch](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=patch_request.yml)** : pour proposer l'ajout de nouvelles fonctionnalités ou le support d'un autre jeu / application.

### 🛠️ Développement & Publication
Ce dépôt utilise le système de publication automatisé **Semantic Release** avec GitHub Actions :
- **Branche `dev`** : Utilisée pour le développement et la génération automatique de pré-releases.
- **Branche `main`** : Branche stable de production.
- **Commits conventionnels** :
  - `feat:` Nouvelle fonctionnalité (déclenche une release mineure).
  - `fix:` Correction de bug (déclenche une release corrective).
  - `chore:` Maintenance interne sans création de release.

#### Compilation locale
```bash
./gradlew :patches:buildAndroid
```
Le fichier résultant `.mpp` est généré dans `patches/build/libs/patches-*.mpp`.

### 📄 Licence
Ce projet est distribué sous licence [GNU General Public License v3.0](LICENSE).  
Ce logiciel est fourni « tel quel », sans garantie d'aucune sorte.

---

## 🇬🇧 English

### ❓ About
Modular patch bundle for the [Morphe](https://github.com/morpheapp) framework, currently targeting **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).

This project allows studying and unlocking:
- Rewarded video ad flows (free revives on Game Over, doubling gold and gems, shop chests, daily spins) without loading or watching video ads.
- In-game shop items and in-app purchases (Free Shopping).

### 📲 How to Use in Morphe Manager

👉 **[Add D-moniak Patches to Morphe Manager (1-Click)](https://morphe.software/add-source?github=SatanMerde/D-moniakPatches)**

Or manually in the app:
1. Open **Morphe Manager**.
2. Navigate to **Settings** > **Patch Sources**.
3. Add source: `SatanMerde/D-moniakPatches`.
4. Select **Hungry Shark World** (`com.ubisoft.hungrysharkworld`).
5. Check the desired patches (**Bypass Rewarded Ads**, **Free Shopping**).
6. Tap **Patch** and install the modified APK.

### 💬 Report a Bug or Request a Patch
Experiencing an issue or want support for a new game / patch?
- 🐛 **[Report a Bug or Issue](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=bug_report.yml)**: if a patch is not working properly or crashes the application.
- ✨ **[Request a New Patch](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=patch_request.yml)**: to propose new features or support for another game / application.

### 🛠️ Development & Release
This repository uses automated **Semantic Release** with GitHub Actions:
- **`dev` branch**: Used for ongoing development and automated pre-releases.
- **`main` branch**: Production stable branch.
- **Conventional Commits**:
  - `feat:` New feature (triggers a minor release).
  - `fix:` Bug fix (triggers a patch release).
  - `chore:` Internal maintenance without release.

#### Local Build
```bash
./gradlew :patches:buildAndroid
```
The resulting `.mpp` file is generated in `patches/build/libs/patches-*.mpp`.

### 📄 License
This project is distributed under the [GNU General Public License v3.0](LICENSE).  
This software is provided "as is", without warranty of any kind.
