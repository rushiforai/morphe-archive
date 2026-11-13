# Morphe Local Validation (Desktop v1.17.0)

Read `upstream-baseline.md` first. Resolve the configured patch repository, CLI jar, original
input container, expected patch, and output path. Never hardcode a personal repository.

## Required gates

```text
BUILD → LIST EXPECTED PATCH → APPLY TO ORIGINAL CONTAINER → RECORD OUTPUT
```

```bash
# Safe version check.
java -jar "$MORPHE_CLI" -V

# Build the configured bundle.
(cd "$PATCHES_DIR" && ./gradlew buildAndroid)

# Resolve its exact MPP from version metadata.
VER=$(grep '^version' "$PATCHES_DIR/gradle.properties" | cut -d= -f2 | tr -d ' ')
MPP="$PATCHES_DIR/patches/build/libs/patches-${VER}.mpp"
test -f "$MPP"

# Prove registration and compatibility metadata.
java -jar "$MORPHE_CLI" list-patches \
  --patches "$MPP" --with-packages --with-versions --with-options

# Apply only the intended patch to a new local artifact.
java -jar "$MORPHE_CLI" patch \
  --patches "$MPP" --exclusive --enable "$PATCH_NAME" \
  --out "$OUTPUT" "$INPUT"
```

`$INPUT` is the preserved original `.apk`, `.apkm`, `.xapk`, or `.apks`. For split packages,
patch the complete container rather than the base member extracted only for analysis. The CLI
merges supported containers. A standalone base APK cannot supply omitted splits.

## Signing and data root

Patching signs by default with `morphe.keystore` in the resolved Morphe data root. Resolution is:

1. Writable `MORPHE_DATA_DIR`.
2. `morphe-data/` beside the real jar.
3. The documented home/XDG fallback.

No `--keystore` flag is needed for the default key. It remains stable for desktop re-patching but
is not automatically copied to a phone. Use a user-configured custom key only when requested.
BKS is used directly; PKCS12/JKS are byte-detected and converted to a separate BKS working copy.
The source file is not modified. Never guess key passwords or print credentials.

## Options and multiple bundles

```bash
# Both arguments are required.
java -jar "$MORPHE_CLI" options-create --patches "$MPP" --out options.json

# A missing options-file path is generated automatically.
java -jar "$MORPHE_CLI" patch --patches "$MPP" --options-file options.json \
  --out "$OUTPUT" "$INPUT"
```

With several `--patches` groups, name and option selectors follow their preceding bundle. The
installed v1.17.0 help defines `--ei`/`--di` against the combined list; use `list-patches` with the
same bundle order before selecting by index.

## Evidence contract

For each gate record working directory, sanitized command, exit status, relevant output, and
artifact path. A nonzero command leaves the stage failed even if a partial output exists.

- Compile failure → patch writer, with file/line/error context.
- Fingerprint or compatibility failure → target hunter, with patch/fingerprint/input details.
- Missing dependency/authentication → user prerequisite; never expose a token.

## Safety

- Write only to a new path under `analysis/<app>/builds/`.
- Never add `-i`, `--install`, `--mount`, a device serial, or utility install/uninstall to local
  validation.
- Never run `utility clear-cache`; it deletes cache/log/temp data immediately. If flags must be
  inspected, use `utility clear-cache --help` exactly.
- Do not use ADB, Git write commands, `gh`, remote upload, or release commands.
- `--force` skips app-version compatibility only. Use it solely with explicit evidence and record
  why; it is not an overwrite flag.
- `--continue-on-error` is diagnostic, not success. Any failed intended patch keeps validation
  failed.

## MPP resolution

Prefer the version-derived path above. If a repository differs from the official template,
inspect its Gradle output and require one unambiguous MPP. Do not select with a broad wildcard
when multiple sources/javadocs/versions exist.
