# Gryphou's Morphe Patches

Morphe patch bundle for Crunchyroll, De'Longhi Comfort, and PETKIT.

## About

This repository contains Morphe patches that:

- Enable Android Picture-in-Picture for Crunchyroll (`com.crunchyroll.crunchyroid`).
- Hide the `GetReceivedShares-003` incident popup, remove the login location requirement, and suppress notification permission and app review prompts in De'Longhi Comfort (`com.ddsx_ayla_android`).
- Remove the Explore (Explorer) section from the home page in PETKIT (`com.petkit.oversea`, version `13.10.1`).

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/NekoGryphou/gryphous-morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 De'Longhi Comfort&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 5.1.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable login location requirement](#disable-login-location-requirement) | Allows login and registration without granting location permission. |  |
| [Disable notification permission prompt](#disable-notification-permission-prompt) | Prevents De'Longhi Comfort from asking to enable notifications. |  |
| [Disable review request dialog](#disable-review-request-dialog) | Prevents De'Longhi Comfort from asking to rate the app. |  |
| [Hide shared-devices incident popup](#hide-shared-devices-incident-popup) | Prevents the GetReceivedShares-003 incident popup from appearing. |  |

</details>

<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.125.0 | 3.112.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Picture-in-Picture](#enable-picture-in-picture) | Enables automatic Android Picture-in-Picture when leaving Crunchyroll playback. |  |

</details>

<details open>
<summary>📦 PETKIT&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 13.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Explore section](#hide-explore-section) | Removes the Explore (Explorer) section from the PETKIT home page. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=NekoGryphou/gryphous-morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/NekoGryphou/gryphous-morphe-patches

### Building

To build Gryphou's Morphe Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## License

Gryphou's Patches are licensed under the [GNU General Public License v3.0](LICENSE)
