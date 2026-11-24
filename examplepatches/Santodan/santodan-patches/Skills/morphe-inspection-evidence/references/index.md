# Retained evidence map

Paths are relative to `E:\Morphe\Skills\inspection-evidence`. Historical reports may
quote old workspace paths; use this directory for filesystem access. Version labels
are discovery hints. Recheck `E:\Morphe\OriginalApps` before choosing a target.
**Bold** marks the folder for the latest local original as of 2026-11-23.

| Folder | Purpose |
| --- | --- |
| **`.inspect-nuvio-111`** | NuvioTV 1.1.1 original `classes*.dex` (also Gradle `111` fixtures source), evidence helpers (`LabelEvidence`, `Inspect111`, `Date*Evidence`), and `*-all-work` rebuild folders for each feature. |
| `.inspect-nuvio-110` | NuvioTV 1.1.0 (preceding target): original DEX, `baseline-dex`, apk validation logs. |
| `.inspect-nuvio-beta13` | Beta.13 original DEX and regenerated `reviewed-*` inventories. Read [nuvio-migrations.md](nuvio-migrations.md) before using its earlier maps. |
| `.inspect-nuvio-beta8` … `-beta12` | Historical Nuvio fixtures and reports; Gradle regression tasks still read them. Comparison dumps archived. |
| `.inspect-nuvio-mobile` | Upstream NuvioMobile checkout; not proof of TV release DEX. |
| `.inspect-nuvio-ui` | Small historical UI contract note and helper. |
| **`.inspect-monet-1.1.1`** | Latest Monet contracts and startup investigation. |
| `.inspect-monet-1.1.0`, `.inspect-monet-1.0.97` | Historical Monet contracts, picker investigation, reports. |
| **`.inspect-pillo-627-play`** | Authoritative Pillo 0.6.27 Google Play base and DEX fixtures. |
| `.inspect-pillo-627` | APKPure-era Pillo notes and comparison tools; dumps archived. |
| `.inspect-pillo-620` | Historical Pillo fixtures used by existing Gradle tasks. |
| **`.inspect-carscanner-2.2.42-arm64`** | Car Scanner 2.2.42 arm64 (current original) AOT/assembly audits and CLI outputs. |
| `.inspect-carscanner-2.2.42` | 2.2.42 x86_64 layout: managed DLLs, audits, stable/experimental CLI runs. |
| `.inspect-carscanner-2.2.42-model-wait` | Arm64 PE-alignment/model-wait hang investigation (device dumps, aligned APKs). |
| `.inspect-carscanner-2.2.21` | Historical Car Scanner managed/native readers and profile resources. |
| **`.inspect-first-descendant-1.1.6`** | TFD 1.1.6 base + splits, manifest, provenance and verification JSON. |
| `.inspect-first-descendant-1.1.5`, `-1.1.5-repro` | 1.1.5 extraction, native libs, reproducible output (diagnostics patch is 1.1.5-only). |
| `.inspect-first-descendant-native-complete` | Canonical native assembly and lifecycle analysis. `-native-trace`/`-native-verified` are reports only. |
| `.inspect-first-descendant-runtime` | Runtime reports, logs, screenshots, installed APK evidence. |
| **`.inspect-fylo-2.6`** | Fylo 2.6 original DEX, billing evidence, stable/experimental APK audits. |
| `.inspect-reddit` | Reddit 2026.37.0 DEX fixtures used by `verifyRedditGuestMode` (guest patch target). |
| `reddit-2026.47.0` | Reddit 2026.47.0 (2647001) base APK and DEX from `OriginalApps`, used by `verifyRedditContentFilter` for content filters and home flairs (current target). |
| `reddit-2026.45.0`, `reddit-2026.46.0` | Previous Reddit 2026.45.0 target DEX and the `E:\Morphe\morphe-patches-santodan` port/PR evidence. |
| `reddit-startup` | Reddit startup investigation and APK snapshots. Review helpers before running; no publishing or device actions implied. |
| `.inspect-classes` | Compiled one-off DEX helpers + `dexlib.jar`; Reddit startup scripts use this path. |
| `.inspect-source` | Sources for those helpers. Some have hardcoded needles; prefer `morphe-inspect-app/scripts/DexQuery.java`. |
| `.inspect-temp` | Miscellaneous notes, helper sources, screenshots, JADX. |
| `inspect-carscanner242*.py`, `nuvio-111-initial-report.log` | Loose top-level helpers/report from the 2.2.42 and 1.1.1 ports. |

App behavior and reviewed contracts live in `santodan-patches/docs` (for example
`Nuvio111.md`, `NuvioLabelCustomization.md`, `Monet111.md`, `Pillo627.md`,
`CarScanner242.md`, `Fylo26.md`, `FirstDescendantCompanion.md`). Originals remain
in `E:\Morphe\OriginalApps`.
