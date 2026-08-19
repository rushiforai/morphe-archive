# T2C App Patches

[![Release](https://img.shields.io/github/v/release/dumb-software/T2C-App-Patch-Morphe?logo=github&style=flat-square)](https://github.com/dumb-software/T2C-App-Patch-Morphe/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)
[![Target App](https://img.shields.io/badge/Target%20App-T2C%20(fr.t2c.t2c)-blue?style=flat-square)](https://play.google.com/store/apps/details?id=fr.t2c.t2c)

Collection of patches for the official **T2C** mobile application (Transports en commun de Clermont-Ferrand - `fr.t2c.t2c`), maintained by [dumb-software](https://github.com/dumb-software).

This project is built using [Morphe Patcher](https://github.com/MorpheApp/morphe-patches) and follows the [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template).

---

## Available Patches

| Patch | Type | Description | Configurable Options |
| :--- | :---: | :--- | :--- |
| **`Change API endpoint`** | `RawResource` | Redirects all backend microservices (`URL_EDITORIAL`, `URL_SIV`, `URL_NOTIFICATIONS`, `URL_FAVORITES`, `URL_STATUS`) to a custom base URL. | `api_url` *(default: `https://api.t2c.fr`)* |
| **`Force environment`** | `RawResource` | Replaces the production environment variables with the developer (`staging.t2c.fr`) or local (`localhost`) ones. | `environment` *(`dev` or `local`)* |
| **`Remove Firebase tracking`** | `Resource` | Disables Google Firebase tracking by wiping `google_app_id`, `google_crash_reporting_api_key`, and `google_api_key`. | *None* |
| **`Remove Google Maps API key`** | `Resource` | Removes the Google Maps API key (`com.google.android.geo.API_KEY`) from `AndroidManifest.xml`. | *None* |
| **`Remove Umami tracking`** | `RawResource` | Disables Umami telemetry safely by redirecting endpoints to loopback (`127.0.0.1`) and clearing website ID. | *None* |
| **`Custom Umami endpoint`** | `RawResource` | Points Umami analytics to a custom server instance. | `umami_endpoint`, `umami_website` |

---

## Compatibility

| App Name | Package Name | Supported Versions |
| :--- | :--- | :--- |
| **T2C** | `fr.t2c.t2c` | **`3.2.0`**, **`3.2.2`** *(Latest)* |

---

## Get Started

### Using Morphe Manager

You can easily import these patches directly into Morphe Manager:

1. **One-click Import**: [Click here to add to Morphe](https://morphe.software/add-source?github=dumb-software/T2C-App-Patch-Morphe)
2. **Manual Import**: Open **Morphe Manager** > **Settings** > **Sources** > **Add Source** and enter:
   ```text
   https://github.com/dumb-software/T2C-App-Patch-Morphe
   ```

---

## Development & Usage

- Development is conducted on feature branches, squashed and merged into the `dev` branch.
- The `dev` branch is merged into `main` for stable releases.
- Versioning is strictly governed by **Semantic Versioning** and [Conventional Commits](https://www.conventionalcommits.org/).
- Commits on `dev` and `main` automatically trigger builds and releases via GitHub Actions ([`.github/workflows/release.yml`](.github/workflows/release.yml)).

---

## Building from Source

### Prerequisites
- **JDK 17** or **JDK 21**
- Gradle (provided wrapper `gradlew`)

### Build commands
To build the `.mpp` patch bundle:
```bash
./gradlew :patches:build
```

To update and generate the patches list ([`patches-list.json`](patches-list.json)):
```bash
./gradlew :patches:generatePatchesList
```

---

## Related Resources

- [T2C API Documentation](https://dumb-software.github.io/T2C-API-Documentation/)
- [Contribution Guidelines](CONTRIBUTING.md)
- [Changelog](CHANGELOG.md)

---

## License

T2C App Patches are licensed under the [MIT License](LICENSE).