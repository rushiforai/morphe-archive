# Morphe Upstream Baseline

Verified snapshot recorded **2026-09-29**. Use it to resolve ambiguities in command behavior,
API surface, and source structure.

## Installed CLI

| Item | Value |
|---|---|
| Binary | `morphe-cli.jar` in the workspace root |
| Version | **Morphe Desktop v1.17.0** |
| Runtime | **JRE 21+** |

## Pinned official revisions

| Repository | SHA |
|---|---|
| `morphe-desktop` | `4eadc2dca5e5bcdfef3ae2671440eca411c30dea` |
| `morphe-patcher` | `6f189f9ffb448ae32ceaf6c136c9d84d9a7ed274` |
| `morphe-patches` | `92dd0ef86d12e1806152b454486269983b8db139` |
| `morphe-patches-template` | `0bbf39c4ff24c7799104f510b165e67c55b9d9cf` |
| `morphe-patches-gradle-plugin` | `0a2c1971e2913a6ea5e8fd192d359765169a6a06` |
| `morphe-patches-library` | `6501aee56d423c409e2e50ab1d5606b3704c49ee` |
| `morphe-library` | `e06c58f7ab029d55750e60aa9dd17aadf83e82a9` |
| `morphe-documentation` | `cdedd95c227ed6e6a2249ef307c34df7606b087c` |

## Source precedence

1. **Installed CLI help/runtime output** for behavior of the local v1.17.0 jar.
2. **Pinned implementation source** above when help text and docs disagree.
3. **Official Morphe documentation** for supported workflows.
4. **Local steering and community examples** for workspace conventions and ideas.

Known discrepancy: v1.17.0 `PatchCommand` help says the keystore defaults beside the input APK,
but its implementation uses `MorpheData.defaultKeystoreFile`; the implementation and full desktop
documentation agree on the data-root keystore and therefore win.

## Verified v1.17.0 CLI facts

- Commands: `patch`, `list-patches`, `list-versions`, `options-create`, `utility install`,
  `utility uninstall`, and `utility clear-cache`.
- `patch --patches` / `-p` is required and repeatable. It accepts local MPP files and
  GitHub/GitLab sources; official docs also describe release URLs.
- Patching signs by default with the data-root keystore. `--unsigned` disables signing.
- `patch --mount` is a **boolean** used with `--install` / `-i` for root mounting.
- `utility install --mount` / `-m` is different: it **takes a package name**.
- `--exclusive` disables every patch except explicitly enabled patches.
- `--force` / `-f` skips the app-version compatibility check only.
- `--striplibs` keeps comma-separated ABIs.
- `--bytecode-mode`: `FULL`, `STRIP_SAFE`, `STRIP_FAST` (default `STRIP_FAST`).
- `--options-file` is generated with defaults when its path does not exist;
  `options-create` requires both `--patches` and `--out`.
- `--result-file` records a JSON patching report.
- `list-patches` can show packages, versions, options, descriptions, universal patches,
  indexes, and experimental targets.
- For multiple bundles, name/option selectors follow their preceding `--patches` group;
  installed help documents `--ei`/`--di` as indexes in the combined list.
- APK, APKM, XAPK, and APKS inputs are supported. Pass the complete split container when one
  exists; an extracted base APK alone cannot provide omitted split resources or libraries.

## Data and signing

Resolution order for the Morphe data root:

1. Writable `MORPHE_DATA_DIR`, when set.
2. `morphe-data/` beside the real jar.
3. Existing `~/morphe/`; otherwise explicit Linux `XDG_DATA_HOME/morphe` or `~/morphe/`.

The root contains downloaded bundles under `patches/`, `logs/`, `tmp/`, GUI-only `libs/`,
optional icons/config, and `morphe.keystore`. The default key is stable across desktop CLI runs,
but it is not automatically the same key stored on a phone. Export/import the key or pass a
custom `--keystore` when desktop and Manager must share a signing identity.

Custom BKS, PKCS12, and JKS inputs are detected by bytes. PKCS12/JKS are converted to a BKS
working copy; the source file is not modified.

## Critical safety warning

`utility clear-cache` executes immediately when called without options and clears downloaded
patch bundles, logs, and temporary files. Never invoke it to discover usage. Use only:

```bash
java -jar morphe-cli.jar utility clear-cache --help
```

Run the mutating command itself only after an explicit user request.

## Workspace conventions

- Save outputs under `analysis/<app>/builds/` using explicit `--out` paths.
- Use the default data-root key unless the user explicitly configures a custom key.
- Resolve patches with `PATCHES_DIR="${MORPHE_PATCHES_DIR:-morphe-patches}"`.
- Develop on `dev`; merge to `main` only after verification.
- Template semantic-release commits `CHANGELOG.md`, `gradle.properties`,
  `patches-bundle.json`, `patches-list.json`, and `README.md`, then back-merges `main` to `dev`.
  Released MPP files receive build-provenance attestations.
