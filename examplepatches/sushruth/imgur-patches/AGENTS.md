# imgur-patches

Morphe patch bundle that removes ads from the Imgur Android app (`com.imgur.mobile`).

## Repo layout

- `patches/` — Morphe patch sources (Kotlin). Build produces `patches/build/libs/patches-<version>.mpp`
- `extensions/extension/` — Java "extension" code, compiled to a DEX bundle (`.mpe`) and injected at patch time. Only needed when a patch needs complex logic; simple smali overrides don't use it.
- `work/` — gitignored artifacts: `work/apktool/` (apktool decode), `work/jadx/` (jadx decompile), `work/imgur.apk` (copy of the source APK), `work/imgur-patched.apk` (output)
- `com.imgur...apk` — the original APK downloaded from APKMirror (gitignored via `*.apk`)

## Toolchain: devbox only

Every tool command MUST run through devbox — the host has no Java/Android tooling.

- `devbox run <cmd>` (or `devbox shell`). Never invoke `java`, `gradle`, `jadx`, or `apktool` outside devbox.
- Packages (see `devbox.json`): `jdk21` (JDK 21 — required by the Morphe Gradle build), `gradle`, `jadx`, `apktool`.
- The Gradle wrapper (`./gradlew`) downloads its own Gradle 9.6.1; `devbox run ./gradlew ...` is the canonical build invocation.

## Common commands (all via `devbox run`)

- Decode for analysis:
  - `devbox run apktool d -f -o work/apktool work/imgur.apk`
  - `devbox run jadx -d work/jadx work/imgur.apk`
- Build patches → `patches/build/libs/patches-*.mpp`:
  - `devbox run build`
- Patch an APK with the Morphe CLI (fat jar in `tools/`):
  - `devbox run patch -- work/imgur.apk work/imgur-patched.apk`
- The `patch` script (in `devbox.json`) wraps:
  - `java -Xms1024m -jar tools/morphe-desktop-1.13.0-all.jar patch --patches patches/build/libs/patches-*.mpp --out <out> <in>`

## GitHub Packages auth (REQUIRED to build)

Morphe dependencies (`app.morphe.patches` Gradle plugin, `morphe-patcher`) live on GitHub Packages (`maven.pkg.github.com/MorpheApp/registry`), not Maven Central. Anonymous access returns 401, so the build fails at plugin resolution without credentials.

- Preferred: `~/.gradle/gradle.properties` (never in this repo):
  ```
  gpr.user=<github username>
  gpr.key=<PAT with read:packages scope>
  ```
- Or export `GITHUB_ACTOR` and `GITHUB_TOKEN` in the environment.
- NEVER commit tokens or `gradle.properties` (both gitignored).

## Patch workflow

1. Edit/add patches in `patches/src/main/kotlin/app/imgur/patches/`.
2. `devbox run build`, then `devbox run patch -- work/imgur.apk work/imgur-patched.apk`.
3. Verify the output installs and ads are gone (install via `adb install` / `--install` flag, or inspect the output).
4. Bump `version` in `gradle.properties` when publishing. Release flow uses semantic-release via GitHub Actions (`release.yml`); never hand-create releases.
