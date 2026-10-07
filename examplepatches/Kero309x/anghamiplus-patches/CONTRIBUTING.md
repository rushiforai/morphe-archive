# Contributing to Anghami Plus Patches

Thanks for your interest in **Anghami Plus Patches**, the Morphe patch bundle for the Anghami Android app. Bug reports, feature requests, documentation fixes and new patches are all welcome.

Please read this guide before opening an issue or a pull request.

---

## 📌 Ground rules

* **Be respectful.** Everyone taking part in this project is expected to follow the [Code of Conduct](CODE_OF_CONDUCT.md).
* **Keep everything client-side.** Patches may change local app behaviour only: interface elements, playback controls, local feature gates and privacy or telemetry handling. Anything aimed at abusing or defeating server-side systems is out of scope.
* **Target the supported version.** Bytecode changes must be verified against Anghami **8.0.28** (`com.anghami`).
* **Report security problems privately.** Use the process described in [SECURITY.md](SECURITY.md) instead of a public issue.

---

## 🚀 Development setup

### Prerequisites

* **JDK 21** or newer.
* **Android SDK** — the command-line tools are enough.
* **Git**, installed and configured.
* A personal access token with the `read:packages` scope, which is required to resolve the Morphe Gradle plugins.

### Get the sources and build

```bash
git clone https://github.com/Kero309x/anghamiplus-patches.git
cd anghamiplus-patches
git checkout dev

./gradlew build                 # compile the patch bundle
./gradlew generatePatchesList   # refresh the generated patch catalogue
```

A successful build produces the patch bundle under `patches/build/libs/`.

---

## 🌿 Branching model

| Branch | Purpose |
| :--- | :--- |
| `dev` | Day-to-day development. Every pull request targets this branch. |
| `main` | Stable releases only. It receives merges from `dev` when a release is cut. |

Releases are automated with semantic-release, which reads the commit history and publishes version bumps, tags and changelog entries. Do not edit the version, the changelog or release tags by hand.

---

## 💬 Commit messages

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) because the release tooling derives versions and changelog sections from them:

| Prefix | Use it for |
| :--- | :--- |
| `feat:` | A new patch or a new user-facing option |
| `fix:` | A bug fix, including fingerprint corrections |
| `docs:` | Documentation only |
| `refactor:` | Internal cleanup with no behaviour change |
| `chore:` | Dependencies, tooling and other maintenance |

Write the subject in the imperative mood and keep it short; use the body to explain the reasoning when it is not obvious.

---

## 🛠️ Adding or changing a patch

1. **Pick the right package.** Patch sources live under `patches/src/main/kotlin/app/anghami/patches/`, grouped by area such as `ads`, `download`, `entitlement`, `integrity`, `lyrics`, `playback`, `privacy`, `store`, `system` and `ui`.
2. **Define the fingerprints.** Use exact method descriptors and strict opcode filters so a patch fails loudly instead of silently doing the wrong thing when the app's bytecode changes.
3. **Declare the patch** with the `bytecodePatch` DSL and give it a clear `name` and `description`, restricted to the supported Anghami version.
4. **Change one thing.** Prefer a new patch or a new patch option over widening the behaviour of an existing one, and keep the default selection sensible for end users.
5. **Test it.** Build the bundle, apply the patch to Anghami `8.0.28` with Morphe Manager, and confirm the patched app behaves as described.
6. **Update the documentation.** Run `./gradlew generatePatchesList` so the generated catalogue stays in sync, and adjust the README when the user-facing behaviour changes.

---

## 🐞 Reporting bugs and requesting features

Use the issue forms in this repository; they ask for the details needed to reproduce a problem, such as the Anghami version, how the APK was obtained, which patches were enabled, your device, your Morphe Manager version and the steps you followed. Search the existing issues first so we do not get duplicates.

---

## 📮 Submitting a pull request

1. Fork the repository and branch off `dev`.
2. Keep the change focused: one patch or one fix per pull request.
3. Make sure the checklist in the pull request template is satisfied, and that CI passes on your branch.
4. Open the pull request against `dev` and describe what you verified manually.

---

## 📜 Licensing of contributions

This project is distributed under the **GNU General Public License v3.0** — see the [LICENSE](LICENSE) file. By submitting a contribution you agree that it is released under the same terms.
