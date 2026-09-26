## [1.0.4](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.3...v1.0.4) (2026-09-24)

### 🐛 Bug Fixes

* **ci:** retire dev — release on main, and validate dependabot against it ([198e670](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/198e670d8f861b0a6cb9a955fc1a78aa0bd1a553))

## [1.0.3](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.2...v1.0.3) (2026-09-24)

### 🐛 Bug Fixes

* **patches:** say what the remaining workaround is for, and link its report ([4ca50d5](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/4ca50d5881c7b59fc01143d9801aa434deded49a))

## [1.0.2](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.1...v1.0.2) (2026-09-24)

### 🐛 Bug Fixes

* **ci:** dispatch the release on main, because semantic-release reads the event ref ([d7d2ad4](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/d7d2ad4133e78cead0c59fd7764a75dd3e737192))
* **ci:** let the release job see dev, which semantic-release asks about ([f67ebf0](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/f67ebf0732612637ba3d05c23a6200f4c1d58032))
* **ci:** merge dev into main and release in one workflow, without a pull request ([f650628](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/f65062813b057ae3b975b7c867cfc939f2fb0d33))
* **ci:** release from main only, so a dev push yields a stable version ([a4676fa](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/a4676fa34a0b37968ca0b7bae867423478f82ccb))

## [1.0.2-dev.1](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.1...v1.0.2-dev.1) (2026-09-24)

### 🐛 Bug Fixes

* **ci:** let the release job see dev, which semantic-release asks about ([f67ebf0](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/f67ebf0732612637ba3d05c23a6200f4c1d58032))
* **ci:** merge dev into main and release in one workflow, without a pull request ([f650628](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/f65062813b057ae3b975b7c867cfc939f2fb0d33))

## [1.0.1](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0...v1.0.1) (2026-09-24)

### 🐛 Bug Fixes

* **patches:** remove the workarounds the released server made unnecessary ([eccf02e](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/eccf02e30429270579c6d2bdfea052d0384a5316))

## [1.0.1-dev.1](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0...v1.0.1-dev.1) (2026-09-24)

### 🐛 Bug Fixes

* **patches:** remove the workarounds the released server made unnecessary ([eccf02e](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/eccf02e30429270579c6d2bdfea052d0384a5316))

## 1.0.0 (2026-09-24)

### 🐛 Bug Fixes

* **ci:** let the release workflow reach the API and the PR workflow open its pull request ([0e640ab](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/0e640abfdb441cfbfba5be73c3850fd69fd1fc6a))
* **ci:** skip build attestation on a private repository ([03b1b12](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/03b1b1279edf68cdd583de82cbf84474def01d47)), closes [#2](https://github.com/raphaelbahat/zotero-self-hosted-sync/issues/2)
* **patches:** open the server login URL verbatim and send the documented precondition header ([a6acda1](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/a6acda14c38e7ffa6edae1eb543f28f0bc107b98))
* **upload:** complete an upload authorization that carries no form ([382dea6](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/382dea61860ccea94bf07100443564e23b2918f8)), closes [eseifert/altero#13](https://github.com/eseifert/altero/issues/13)

### ✨ New Features

* **patches:** add on-demand logging and attachment upload recovery ([01b0fc2](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/01b0fc25f6922bd71e88955a26c988ce47b77943))

## [1.0.0-dev.5](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0-dev.4...v1.0.0-dev.5) (2026-09-24)

### 🐛 Bug Fixes

* **ci:** skip build attestation on a private repository ([03b1b12](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/03b1b1279edf68cdd583de82cbf84474def01d47)), closes [#2](https://github.com/raphaelbahat/zotero-self-hosted-sync/issues/2)

## [1.0.0-dev.4](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0-dev.3...v1.0.0-dev.4) (2026-09-24)

### 🐛 Bug Fixes

* **ci:** let the release workflow reach the API and the PR workflow open its pull request ([0e640ab](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/0e640abfdb441cfbfba5be73c3850fd69fd1fc6a))

## [1.0.0-dev.3](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-09-24)

### 🐛 Bug Fixes

* **upload:** complete an upload authorization that carries no form ([382dea6](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/382dea61860ccea94bf07100443564e23b2918f8)), closes [eseifert/altero#13](https://github.com/eseifert/altero/issues/13)

## [1.0.0-dev.2](https://github.com/raphaelbahat/zotero-self-hosted-sync/compare/v1.0.0-dev.1...v1.0.0-dev.2) (2026-09-24)

### ✨ New Features

* **patches:** add on-demand logging and attachment upload recovery ([01b0fc2](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/01b0fc25f6922bd71e88955a26c988ce47b77943))

## 1.0.0-dev.1 (2026-09-24)

### 🐛 Bug Fixes

* **patches:** open the server login URL verbatim and send the documented precondition header ([a6acda1](https://github.com/raphaelbahat/zotero-self-hosted-sync/commit/a6acda14c38e7ffa6edae1eb543f28f0bc107b98))
