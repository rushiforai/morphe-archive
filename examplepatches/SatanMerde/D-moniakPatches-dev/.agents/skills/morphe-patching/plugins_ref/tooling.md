# Android Analysis Tooling

Use installed tools only. `doctor.sh` reports prerequisites; it never installs them.

## Core tools

| Tool | Purpose |
|---|---|
| `file` | Basic input validation |
| `unzip` | Container and DEX inventory |
| `aapt` | Badging and manifest tree |
| `jadx` | Readable decompilation |
| `baksmali` | Exact DEX disassembly |
| `rg` | Text search |
| `sha256sum` or `shasum` | Input identity |

Optional tools include `uvx apkid`, ADB, `gh`, and the separately installed `jadx-decompiler-gui` Kaggle provider.

## Container handling

- APK: inspect directly.
- APKM/APKS/XAPK/ZIP: enumerate nested APKs and choose a base-named APK for metadata/source/smali. If no base-named member exists, stop or document a deterministic fallback.
- Preserve the original container for Morphe CLI application.
- Extract into a temporary directory and clean only that directory.

## Search guidance

Use `rg`, not recursive `grep`, for source and smali searching. Start broad enough to identify architecture/SDK, then narrow to call chains. Limit output and read complete target methods before deciding.

## Remote provider

Remote decompilation is optional. Disclose provider and transmitted data, obtain explicit approval, and use environment credentials without displaying them. A stopped local monitor does not necessarily stop a remote Kaggle run.
