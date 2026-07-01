# 👋🧩 T2C App Patches

Patches for T2C App.

&nbsp;
## ❓ About

T2C App Patches is a collection of patches for the T2C App, maintained by [dumb-software](https://github.com/dumb-software).

This project is based on the [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template).


## 🚀 Get started

To use these patches, you can add them to Morphe Manager.

#### How to use these patches

Click here to add these patches to Morphe: [https://morphe.software/add-source?github=dumb-software/T2C-App-Patch-Morphe](https://morphe.software/add-source?github=dumb-software/T2C-App-Patch-Morphe)

Or manually add this repository url as a patch source in Morphe: [https://github.com/dumb-software/T2C-App-Patch-Morphe](https://github.com/dumb-software/T2C-App-Patch-Morphe)

## 🧑‍💻 Usage

To develop and release T2C App Patches:

- Development starts in feature branches. Once a feature branch is ready, it is squashed and merged into the `dev` branch.
- The `dev` branch is merged into the `main` branch once it is ready for release.
- Semantic versioning is used to version the patches.
- Semantic commit messages are used for commits.
- Commits on the `dev` and `main` branches are automatically released via the `release.yml` workflow.

## 🛠️ Building

To build T2C App Patches, run:
```shell
./gradlew :patches:build
```

To generate the patches list:
```shell
./gradlew :patches:generatePatchesList
```

### 📙 Contributing

Thank you for considering contributing to T2C App Patches.  
You can find the contribution guidelines [here](CONTRIBUTING.md).

## 📜 License

T2C App Patches are licensed under the [MIT License](LICENSE).
