# Morphe Upstream Baseline

Pinned **2026-09-29**. Read this before version-sensitive CLI or patcher work.

## Installed toolchain

- Local jar: `morphe-cli.jar` (or configured `cliJar` / `MORPHE_CLI`).
- Observed version: **Morphe Desktop v1.17.0**.
- CLI runtime: **JRE 21+**.
- Patch workspace: JDK 21 recommended because the current template CI uses Java 21.

## Official revisions

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

The plugin is self-contained and does not require those checkouts.

## Precedence

1. Installed CLI output for the local jar's command behavior.
2. Pinned implementation source for API/default ambiguities.
3. Official documentation for supported workflows.
4. This plugin's references for local orchestration conventions.

Known discrepancy: v1.17.0 `PatchCommand` help has a stale sentence saying the keystore defaults
beside the input APK. `PatchCommand.call()`, `MorpheData`, and full desktop docs use the data-root
keystore; implementation wins.

## CLI contract

- Commands: `patch`, `list-patches`, `list-versions`, `options-create`, and `utility`.
- `patch -p/--patches` is required/repeatable; local MPP and GitHub/GitLab sources are accepted.
- Patching signs by default; `--unsigned` opts out.
- `patch --mount` is a boolean combined with `-i`; `utility install -m/--mount` takes a package.
- `--exclusive`, `-e/-d`, `--ei/--di`, `-O`, `--options-file`, `--options-update`, `-f`,
  `--striplibs`, `--bytecode-mode`, `--verify-with-sdk`, `--continue-on-error`,
  `--disable-purge`, `--prerelease`, and `-r/--result-file` are supported.
- Bytecode modes are `FULL`, `STRIP_SAFE`, and `STRIP_FAST` (default).
- A missing `--options-file` is generated. `options-create` requires `-p` and `-o`.
- Name/option selectors are scoped after their `-p` bundle; installed help describes index
  selectors as positions in the combined list.
- APK/APKM/XAPK/APKS inputs are supported. Use the complete split container for validation;
  do not substitute an extracted base APK when splits contain required resources or libraries.

## Data root and signing

Resolution order: writable `MORPHE_DATA_DIR`; jar-adjacent `morphe-data/`; then the documented
home/XDG fallback. The data root includes `patches/`, `logs/`, `tmp/`, and the default
`morphe.keystore` (plus GUI/config content when used).

The desktop key is stable across desktop runs but is not automatically copied to Morphe Manager
on a phone. Export/import it, or explicitly provide a custom key, when both must share an identity.
Custom BKS, PKCS12, and JKS files are byte-detected; PKCS12/JKS are converted to a BKS working
copy without modifying the source.

## Safe version detection

```bash
java -jar "$MORPHE_CLI" -V
```

If the jar is missing or Java is below 21, report the prerequisite and stop.

## Never probe clear-cache by executing it

`utility clear-cache` has no required arguments and executes immediately. It deletes downloaded
bundles, logs, and temporary files. Inspect it only with:

```bash
java -jar "$MORPHE_CLI" utility clear-cache --help
```

The automated plugin pipeline must never invoke `utility clear-cache`, device install/uninstall,
or mount operations.
