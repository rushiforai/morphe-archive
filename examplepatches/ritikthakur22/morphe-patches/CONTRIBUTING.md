# Contributing to CRDY Patches

Thank you for your interest in contributing to **CRDY Patches**! We welcome bug reports, feature suggestions, documentation improvements, and code contributions.

Please review this guide before submitting issues or pull requests.

---

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please report any unacceptable behavior to [ritikthakur22](https://github.com/ritikthakur22).

---

## Repository Structure

- **`patches/`**: Kotlin module implementing patch definitions, bytecode instructions, and hooks for target applications.
- **`extensions/`**: Java/Kotlin runtime extensions injected into the target APKs at runtime (e.g. `shared`, `shared-youtube`, `youtube`, `music`, `reddit`).
- **`.github/`**: Issue templates, PR templates, and automation workflows.

---

## Getting Started & Building Locally

### Prerequisites

- **Java Development Kit (JDK)**: JDK 21 or newer.
- **Android SDK**: Build tools and platform API 34+.
- **Git**

### Build Commands

To build the patches and extensions:

```bash
# Clone the repository
git clone https://github.com/ritikthakur22/crdy-yt.git
cd crdy-yt

# Build Android patch bundle
./gradlew :patches:buildAndroid
```

---

## Submitting Pull Requests

1. **Fork & Branch**: Create a feature branch off `main` (e.g., `feature/my-patch` or `fix/potoken-error`).
2. **Follow Conventions**:
   - Write clear, concise commit messages following [Conventional Commits](https://www.conventionalcommits.org/) (e.g., `feat: ...`, `fix: ...`, `chore: ...`).
   - Follow existing code style in `patches/` and `extensions/`.
3. **Verify Locally**: Ensure that code compiles cleanly and does not introduce regressions.
4. **Licensing**: All contributions are licensed under the **GNU General Public License v3.0** (GPL-3.0). Ensure any new files retain appropriate copyright and license notices.

---

## Reporting Issues & Requesting Features

- Search the [Issue Tracker](https://github.com/ritikthakur22/crdy-yt/issues) first to avoid duplicate reports.
- Use the provided issue templates:
  - [Bug Report](https://github.com/ritikthakur22/crdy-yt/issues/new?template=bug_report.yml)
  - [Feature Request](https://github.com/ritikthakur22/crdy-yt/issues/new?template=feature_request.yml)
- When reporting bugs, please include the patched application version, patch bundle version, device Android version, and logcat logs where relevant.
