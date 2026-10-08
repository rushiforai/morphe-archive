## [0.8.0](https://github.com/Santodan/santodan-patches/compare/v0.7.0...v0.8.0) (2026-10-07)

### 🐛 Bug Fixes

* **nuvio:** restore merged watched badges without delaying startup ([f53abfa](https://github.com/Santodan/santodan-patches/commit/f53abfa9271461759f9bd6d7c80f7ba6a0c51462))

### ✨ New Features

* **nuvio:** add finale dates in library and collections [skip ci] ([66233a7](https://github.com/Santodan/santodan-patches/commit/66233a7b0253662e7c05c7a78b7964b49708b7b4))
* **nuvio:** group patch settings under Layout menu [skip ci] ([744d480](https://github.com/Santodan/santodan-patches/commit/744d4807083f494a10ebcbbb56cdc1ac6dec7d6e))

## [0.7.0](https://github.com/Santodan/santodan-patches/compare/v0.6.0...v0.7.0) (2026-10-06)

### 🐛 Bug Fixes

* **nuvio:** support beta4 and correct progress flow mapping [skip ci] ([7c3d025](https://github.com/Santodan/santodan-patches/commit/7c3d025d4afce7fd7803e0616ca5197c74b21bda))

### ✨ New Features

* **nuvio:** keep airing series in Upcoming with finale date badges ([1fcf816](https://github.com/Santodan/santodan-patches/commit/1fcf8165a15e29e102628135c10f2939dbde4fa5))

## [0.6.0](https://github.com/Santodan/santodan-patches/compare/v0.5.0...v0.6.0) (2026-10-01)

### ✨ New Features

* **meo:** add side-by-side and device compatibility patches [skip ci] ([cd28017](https://github.com/Santodan/santodan-patches/commit/cd28017e4f3890ee27d99e917a9d0668cda0d274))

### 🚀 Updated App Support

* **pillo:** support version 0.6.20 ([33da858](https://github.com/Santodan/santodan-patches/commit/33da8586e0cbe7fadbf5dae595fee8512f438794))

## [0.5.0](https://github.com/Santodan/santodan-patches/compare/v0.4.1...v0.5.0) (2026-09-28)

### 🐛 Bug Fixes

* **nuviotv:** preserve and refresh merged progress ([3e7595b](https://github.com/Santodan/santodan-patches/commit/3e7595bc1a830c88136ec0e068dfeae9a203172a))

### ✨ New Features

* **nuviotv:** add merged tracking progress [skip ci] ([be772fe](https://github.com/Santodan/santodan-patches/commit/be772fe379f73156595e1f4def5546e83525b417))
* **nuviotv:** configure side-by-side installation ([1cfc77e](https://github.com/Santodan/santodan-patches/commit/1cfc77e21814eed47a5035053d096950227622cf))

## [0.4.1](https://github.com/Santodan/santodan-patches/compare/v0.4.0...v0.4.1) (2026-09-25)

### 🐛 Bug Fixes

* **nuviotv:** support beta2 remaining count and side-by-side install ([b5976a1](https://github.com/Santodan/santodan-patches/commit/b5976a107bca80fab4f7860ff965b0b8caeb32a9))

## [0.4.0](https://github.com/Santodan/santodan-patches/compare/v0.3.2...v0.4.0) (2026-09-25)

### ✨ New Features

* **nuviotv:** publish remaining episode count patch ([99f6ea2](https://github.com/Santodan/santodan-patches/commit/99f6ea28a4b6c3974a662a8f21ac7790073d9eae))

## Unreleased

### Improvements

* **nuviotv:** open Home without waiting for merged tracking refresh; restore per-profile cached progress, watched items, episode history, and catalog aliases in the background, then refresh connected providers every two minutes
* **nuviotv:** cache reflection lookups, index next-up seeds by show, and reuse a single worker for incremental Watched badge updates; log provider-read and total merge times
* **nuviotv:** emulator validation reduced fully drawn startup from approximately 17 seconds to 2.725 seconds while merged synchronization completed in the background

### New Features

* **nuviotv:** group beta.4 runtime patch settings under the expandable Layout > Santodan-Patches menu, including merged progress and its strategy; preserve existing preferences and show only installed patches
* **nuviotv:** add the independent beta.4 Finale dates in library and collections patch, with separate disabled-by-default switches under Layout > Santodan-Patches
* **nuviotv:** display the latest known catalog episode date on library and collection series posters as a blue `dd-MMM-yy` badge, including past dates; retain each location during recomposition and skip movies, unknown dates, and unrelated catalog rows
* **nuviotv:** add an independent beta4 setting to keep airing library series in Upcoming until their latest scheduled episode airs, preserving native labels
* **nuviotv:** show scheduled finale dates in Poster, Card, and Wide displays using a blue bottom-center badge with white `dd-MMM` text above captions
* **meo:** add configurable side-by-side installation for MEO Android TV 5.7.0
* **meo:** spoof a supported provisioning identity and skip the non-fatal device-verification warning
* **nuviotv:** add selectable merged tracking progress for Continue Watching
* **nuviotv:** make the side-by-side package and app names configurable for multiple test installations

### Updated App Support

* **pillo:** support version 0.6.20 while retaining 0.6.19 compatibility

### Bug Fixes

* **nuviotv:** retry beta.4 merged badge metadata after interrupted batches and publish Watched labels incrementally instead of waiting for all shows; preserve ambiguous sibling markers without treating them as title IDs
* **nuviotv:** publish merged watched-show history and alternate catalog IDs to the shared badge pipeline, fixing library and collection Watched labels depending on the carrier provider until opening show details
* **nuviotv:** match Nuvio's watched-count coverage rule for remaining episodes when tracking providers and catalogs use different episode numbering, fixing caught-up anime such as Bleach showing hundreds of unwatched episodes; invalidate previous cached counts
* **nuviotv:** resolve the lazy watch-progress coordinator from the Santodan-Patches menu, fixing merged-progress settings failing before the native tracking settings page is opened
* **nuviotv:** count beta4 aired episodes instead of provider aliases, preventing remaining counts from changing to `6` after synchronization
* **meo:** rename the app-owned permission, task affinity, and all provider authorities, including the bare package authority
* **nuviotv:** preserve merged Continue Watching during startup and refresh providers before publishing updates

## [0.3.2](https://github.com/Santodan/santodan-patches/compare/v0.3.1...v0.3.2) (2026-09-24)

### 🐛 Bug Fixes

* **reddit:** make home flair patch independent ([cace58c](https://github.com/Santodan/santodan-patches/commit/cace58ceded9cc7b9b693335d68f311e03a04aa8))

## [0.3.1](https://github.com/Santodan/santodan-patches/compare/v0.3.0...v0.3.1) (2026-09-24)

### 🐛 Bug Fixes

* **reddit:** show flairs consistently in home feed ([a4cad27](https://github.com/Santodan/santodan-patches/commit/a4cad273aa8a6200d309386d80003ddd79f719ea))

## [0.3.0](https://github.com/Santodan/santodan-patches/compare/v0.2.2...v0.3.0) (2026-09-22)

### 🐛 Bug Fixes

* **reddit:** improve flair filtering [skip ci] ([4910af1](https://github.com/Santodan/santodan-patches/commit/4910af1e24a9e44e6f857fe9193a1fbd777aee6b))

### ✨ New Features

* **reddit:** show post flairs in home feed [skip ci] ([fe99628](https://github.com/Santodan/santodan-patches/commit/fe996280f3e0c39adfa1847072215848939a0eff))

## [0.2.2](https://github.com/Santodan/santodan-patches/compare/v0.2.1...v0.2.2) (2026-09-16)

### 🐛 Bug Fixes

* include metadata files in release assets ([91b54b0](https://github.com/Santodan/santodan-patches/commit/91b54b041df044361f8456fb01ef26aa599221f6))

## [0.2.1](https://github.com/Santodan/santodan-patches/compare/v0.2.0...v0.2.1) (2026-09-16)

### 🐛 Bug Fixes

* correct patch bundle metadata ([6ef1215](https://github.com/Santodan/santodan-patches/commit/6ef1215f2d605913b114991b425c73693c560734))
