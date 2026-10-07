# Attribution

**AnghamiPlus Patches is based on the Anghami patch set by Mohamed Amr Nady.**

| | |
| :--- | :--- |
| **Original project** | [mohamedamrnady/anghami-patches](https://github.com/mohamedamrnady/anghami-patches) |
| **Original author** | Mohamed Amr Nady ([@mohamedamrnady](https://github.com/mohamedamrnady)) |
| **Original licence** | GNU General Public License v3.0 |
| **Changed by** | Kero309x ([@Kero309x](https://github.com/Kero309x)) |
| **Changes started** | 2026-10-05 (see below) |

The Anghami patch set in `patches/` — the selection of target methods, the bytecode signatures and
the injected instruction sequences — is derived from the original project. The changes listed below
did not change what the patches do: the same 17 patches target the same methods in Anghami 8.0.28
and inject the same instructions.

## Changes

| Date | Change |
| :--- | :--- |
| 2026-10-05 | Initial import of the Anghami patch set; bundle metadata, README and release automation reworked. |
| 2026-10-05 | Bytecode signatures renamed (`*Fingerprint` → `*Signature`); comment text rewritten. |
| 2026-10-06 | Sources restructured to one file per feature in domain packages (`ads/`, `playback/`, `download/`, `entitlement/`, `store/`, `ui/`, `lyrics/`, `privacy/`, `system/`, `integrity/`); the target matrix consolidated in `core/AnghamiTarget.kt`; the repeated smali payloads replaced by the shared `core/Bytecode.kt` stubs (`forceTrue`, `forceFalse`, `forceNull`, `forceVoid`); the bundled extension renamed to `app.anghamiplus.extension.LyricsUrlHook`; README, contribution guide, issue and pull request templates rewritten. |
| 2026-10-06 | This attribution file added, together with the credits in `README.md` and in the bundle metadata (`patches/build.gradle.kts`). |
| 2026-10-06 | Bytecode signatures corrected: 57 of them carried match criteria that did not describe the real methods in Anghami 8.0.28 (wrong return types, a renamed method, wrong parameters and missing disambiguating filters). They now use the criteria verified in the original project. |

## Third-party components

* The Gradle scaffolding published by the Morphe patches template
  (<https://github.com/MorpheApp/morphe-patches-template>), including
  `patches/src/main/kotlin/util/PatchListGenerator.kt`, is Copyright 2025 Morphe and licensed under
  the GPLv3.
* The terms in [NOTICE](NOTICE) are kept verbatim, as that licence requires.

## License

This project is distributed under the **GNU General Public License v3.0** — see [LICENSE](LICENSE).
Anyone redistributing this project or a derivative work must keep this attribution, the licence and
the branding terms in [NOTICE](NOTICE).
