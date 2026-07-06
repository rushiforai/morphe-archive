# ProGuard Patches

This repository contains research patches to find instructions not used in the app and to test them.

This can be helpful for writing ProGaurd rules.

## Usage

[![Add to Morphe Manager](https://img.shields.io/badge/Add%20to-Morphe%20Manager-blue?style=for-the-badge)](https://morphe.software/add-source?gitlab=inotia00/proguard-patches)

1. Install [Morphe Manager](https://morphe.software) on your Android device.
2. Click the badge above or add `https://gitlab.com/inotia00/proguard-patches` as a patch source.
3. Select the APK of the app you want to analyze (usually your app).
4. The `Find dummy classes` patch finds unused instructions and saves them to `input.json`.
5. [Download LSPosed template](https://gitlab.com/inotia00/JavaInspector) and select the app.
6. The `Assemble LSPosed module` patch assembles an LSPosed module based on `input.json`.
7. When you enable the assembled LSPosed module and launch your app, the module checks whether the instructions are actually used and saves the result to `output.json`.
8. You can edit ProGuard rules by referring to `output.json`.

## Building

To build ProGuard Patches, follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).