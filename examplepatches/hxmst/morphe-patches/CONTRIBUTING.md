# Contributing to Morphe Patches

Thank you for your interest in contributing to **Hxmst Morphe Patches**! Contributions from the community help keep patches up to date, reliable, and useful for everyone.

Please take a moment to review these guidelines before contributing.

---

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features & New Patches](#suggesting-features--new-patches)
  - [Contributing Code](#contributing-code)
- [Development Setup](#development-setup)
  - [Prerequisites](#prerequisites)
  - [Building the Project](#building-the-project)
- [Patch Design & Guidelines](#patch-design--guidelines)
  - [Structure](#structure)
  - [Coding Standards](#coding-standards)
  - [Acceptable Patches](#acceptable-patches)
- [Commit Message Conventions](#commit-message-conventions)
- [Submitting a Pull Request](#submitting-a-pull-request)

---

## Code of Conduct

Please be respectful, constructive, and collaborative in all issues, pull requests, and discussions.

---

## How Can I Contribute?

### Reporting Bugs

If you find a bug, crash, or broken patch:

1. Search existing [open and closed issues](https://github.com/hxmst/morphe-patches/issues) to ensure it hasn't already been reported.
2. If no duplicate exists, submit a new report using the [Bug Report template](https://github.com/hxmst/morphe-patches/issues/new?template=bug_report.yml).
3. Include all necessary details:
   - Target app name and exact version (e.g. `5.4.1`)
   - Patch bundle version
   - Device model and Android version
   - Relevant `adb logcat` output or stack traces

### Suggesting Features & New Patches

Have an idea for a new patch or an enhancement to an existing one?

1. Check existing [feature requests](https://github.com/hxmst/morphe-patches/issues?q=label%3A%22Feature+request%22) to avoid duplicates.
2. Submit a request using the [Feature Request template](https://github.com/hxmst/morphe-patches/issues/new?template=feature_request.yml).
3. Clearly explain what the patch should do, why it is useful, and any technical findings (e.g. decompiled class names, API endpoints, or fingerprints).

### Contributing Code

We welcome pull requests for:
- Supporting newer versions of target applications
- Adding new patches
- Fixing broken bytecode/resource hooks
- Improving performance or documentation

---

## Development Setup

### Prerequisites

- **Java Development Kit (JDK)**: JDK 21 or higher
- **Android SDK**: Build tools and platform SDK installed
- **Git**

### Building the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/hxmst/morphe-patches.git
   cd morphe-patches
   ```

2. Build the Android patch bundle (`.mpp`):
   ```bash
   ./gradlew buildAndroid
   ```
   The generated patch bundle will be located at:
   `patches/build/libs/patches-<version>.mpp`

3. Generate the patch list (updates `patches-list.json`):
   ```bash
   ./gradlew generatePatchesList
   ```

---

## Patch Design & Guidelines

### Structure

- **Patches (`patches/`)**: Contains patch definitions using the Morphe Patcher DSL (`bytecodePatch`, `resourcePatch`).
  - Keep patches modular: one file per patch or feature domain.
  - Group patches logically by target package (e.g., `app/<packagename>/patches/<domain>/`).
- **Extensions (`extensions/`)**: Contains runtime code (Java/Kotlin) bundled into the patched APK when bytecode patches require helper classes.
  - Keep extension code minimal and performant.

### Coding Standards

- **Resilient Fingerprints**: Use robust fingerprints based on method signatures, string literals, and opcodes rather than hardcoded register offsets that easily break across app updates.
- **Fail Gracefully**: Wrap fragile bytecode modifications in safe checks or informative exceptions so a failed hook does not crash the patching process silently.
- **Clean Smali / Bytecode**: Prefer concise Smali instructions and verify register usage to prevent `VerifyError` at runtime.
- **Licensing**: All contributed code must adhere to the [GPLv3 License](LICENSE).

### Acceptable Patches

- ✅ Enhancements, customization, usability improvements
- ✅ Privacy protections and analytics blocking
- ✅ Local routing / self-hosting companion features
- ❌ Payment circumvention or piracy features

---

## Commit Message Conventions

This repository uses **Semantic Release** with the **Conventional Commits** specification to manage automated versioning and changelogs.

Format:
```text
<type>(<scope>): <short summary>
```

### Types & Release Impact

| Type | Release Type | Description |
| :--- | :--- | :--- |
| `feat` | Minor release (`vX.Y.0`) | Adds a new patch or new functionality |
| `fix` | Patch release (`vX.X.Z`) | Fixes a bug in an existing patch |
| `bump` | Patch release (`vX.X.Z`) | Updates compatibility for newer app versions |
| `perf` | Patch release (`vX.X.Z`) | Improves patch performance |
| `docs` | **No release** | Documentation updates only (e.g. `README`, `CONTRIBUTING`) |
| `chore` | **No release** | Maintenance tasks, tooling, or config changes |
| `style` | **No release** | Code style / formatting changes without logic changes |
| `refactor` | **No release** | Code refactoring without behavioral change |

> [!NOTE]
> If you are updating documentation, issue templates, or tooling and do not want to trigger an automated release, use `docs:` or `chore:`.

---

## Submitting a Pull Request

1. Fork the repository and create your feature branch:
   ```bash
   git checkout -b feature/my-new-patch
   ```
2. Commit your changes following the [Commit Message Conventions](#commit-message-conventions).
3. Test your patch thoroughly by building locally (`./gradlew buildAndroid`) and applying the bundle to a test device.
4. Push your branch to GitHub and open a Pull Request against `main`.
5. Provide a clear PR description explaining the changes and how you verified them.
