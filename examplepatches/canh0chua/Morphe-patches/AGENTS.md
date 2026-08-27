# Repository Guidelines

## Project Overview

This is a **Morphe Patches template repository** for creating custom Android app modifications. It uses the **Morphe Patcher** framework to compile Kotlin/Java bytecode patches into `.mpp` (Morphe Patch Package) files that users install via Morphe Manager. The project follows a **Gradle + Kotlin DSL** build system with **semantic-release** for automated versioning and GitHub Actions for CI/CD.

**Key outputs:** compiled `.mpp` patch bundles, `patches-list.json` metadata, `patches-bundle.json` release manifest, auto-generated `CHANGELOG.md`, and dynamic README patches section.

## Architecture & Data Flow

```
┌─────────────────────────────────────────────────────────────────────┐
│                        MORPHE PATCHER FRAMEWORK                     │
├─────────────────────────────────────────────────────────────────────┤
│  ┌──────────────┐    ┌─────────────┐    ┌───────────────────────┐  │
│  │ Kotlin Patches│    │ Java Extensions│   │ Compatibility Defs  │  │
│  │ (bytecodePatch│───▶│ (runtime logic)│   │ (AppTarget, versions)│  │
│  │  + Fingerprint)│    └─────────────┘    └───────────────────────┘  │
│  └──────┬───────┘                                             │
│         │                                                     │
│         ▼                                                     ▼
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │              GRADLE BUILD (./gradlew buildAndroid)          │ │
│  │  1. Compile Kotlin patches + Java extensions                │ │
│  │  2. Run PatchListGenerator → patches-list.json              │ │
│  │  3. Package → patches/build/libs/patches-*.mpp              │ │
│  └─────────────────────────────────────────────────────────────┘ │
│         │                                                     │
│         ▼                                                     ▼
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │              SEMANTIC-RELEASE PIPELINE                       │ │
│  │  • Conventional commits → version bump (fix=Patch, feat=Minor)│ │
│  │  • Generates patches-bundle.json (download URLs, signatures) │ │
│  │  • Injects version into patches-list.json                    │ │
│  │  • Runs generate_patches_readme.py → updates README.md       │ │
│  │  • Updates CHANGELOG.md, commits all generated files         │ │
│  │  • Publishes GitHub Release with .mpp artifact               │ │
│  │  • Attests build provenance (SLSA)                           │ │
│  │  • Backmerges main → dev                                     │ │
│  └─────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────────┘
```

**Branch Strategy:**
- `main` — stable releases only (merge dev → main, no squash)
- `dev` — all development, pre-releases on every `feat:`/`fix:` commit
- Pre-releases available via "pre-release" toggle in Morphe Manager

## Key Directories

| Path | Purpose |
|------|---------|
| `patches/` | Main module: patch definitions, fingerprints, compatibility, util |
| `patches/src/main/kotlin/app/canh0chua/patches/example/` | Template patches (replace with your app-specific patches) |
| `patches/src/main/kotlin/app/canh0chua/patches/shared/` | Shared compatibility constants (`Constants.kt`) |
| `patches/src/main/kotlin/util/` | Build-time utilities (`PatchListGenerator.kt`) |
| `extensions/extension/` | Java runtime extensions (invoked from patches via `invoke-static`) |
| `.github/workflows/` | CI/CD: `release.yml`, `open_pull_request.yml` |
| `.github/scripts/` | `generate_patches_readme.py` — README injection |
| `gradle/` | Wrapper + version catalog (`libs.versions.toml`) |

## Development Commands

| Task | Command |
|------|---------|
| Build patches locally | `./gradlew :patches:buildAndroid` |
| Clean build | `./gradlew :patches:buildAndroid clean` |
| Generate patch list | `./gradlew generatePatchesList` |
| Install dependencies | `npm install` (for release tooling) |
| Test release dry-run | `npx semantic-release --dry-run` |

**Requirements:** Java 21, Android SDK (for `buildAndroid` task). The Gradle wrapper (`gradlew`) is committed.

## Code Conventions & Common Patterns

### Patch Definition Pattern (`patches/src/main/kotlin/.../example/ExamplePatch.kt`)

```kotlin
// 1. Fingerprint locates target method in target app
object AdLoaderFingerprint : Fingerprint(
    definingClass = "Lcom/target/app/AdsLoader;",
    name = "showAds",
    accessFlags = listOf(PUBLIC, FINAL),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "I", "L"),
    filters = listOf(/* instruction sequence matchers */)
)

// 2. Internal patch (reusable, not shown in UI)
val internalPatch = bytecodePatch {
    execute {
        Fingerprint(classFingerprint = AdLoaderFingerprint, ...).method.addInstruction(...)
    }
}

// 3. User-facing patch (depends on internal, uses extension)
val examplePatch = bytecodePatch(
    name = "Example Patch",
    description = "Description shown in Morphe Manager",
    default = true
) {
    compatibleWith(COMPATIBILITY_EXAMPLE)  // from Constants.kt
    dependsOn(internalPatch)
    extendWith("extensions/extension.mpe")
    execute {
        AdLoaderFingerprint.method.addInstructions(0, """
            invoke-static {}, $EXTENSION_CLASS;->showAds()Z
            move-result v0
            return v0
        """)
    }
}
```

### Fingerprint Matching (`Fingerprints.kt`)

- **`definingClass`**: Target class (full `Lpkg/Class;`, package-only `:pkg/`, or class-only `/Class;`)
- **`filters`**: Chain of instruction matchers — `fieldAccess`, `string`, `methodCall`, `opcode`, `literal`
- **`MatchAfterImmediately()`**: Forces next filter to match immediately after previous
- **`string("literal")`**: Matches `const-string` or string literal in bytecode
- **Obfuscation-safe**: Use `"L"` for obfuscated class types in parameters

### Compatibility (`Constants.kt`)

```kotlin
val COMPATIBILITY_MYAPP = Compatibility(
    name = "My App",
    packageName = "com.example.myapp",
    apkFileType = ApkFileType.APK,  // or APKM, AAB
    appIconColor = 0xFF6600,
    targets = listOf(
        AppTarget(version = "2.5.1"),           // confirmed working
        AppTarget(version = null, isExperimental = true), // latest, experimental
        AppTarget(version = "2.4.0", versionCodes = mapOf(ARM64_V8A to 12345))
    )
)
```

### Extension Pattern (`extensions/extension/src/main/java/.../ExamplePatch.java`)

```java
package app.canh0chua.patches.extension;

public class ExamplePatch {
    public static boolean showAds() {
        // Complex Java logic runs inside patched app process
        return false;
    }
}
```

Referenced in patch via `$EXTENSION_CLASS = "Lapp/canh0chua/extension/ExamplePatch;"`.

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Package | `app.<github-user>.patches.<app-name>` | `app.canh0chua.patches.youtube` |
| Patch class | PascalCase, descriptive | `RemoveAdsPatch`, `EnableBackgroundPlaybackPatch` |
| Fingerprint object | `<TargetClass>Fingerprint` | `AdLoaderFingerprint` |
| Internal patch | `internal<Feature>Patch` | `internalAdBlockPatch` |
| Constants | `COMPATIBILITY_<APP>_<VARIANT>` | `COMPATIBILITY_YOUTUBE_V2` |

### Semantic Commit Messages

| Type | Release | Example |
|------|---------|---------|
| `fix:` | Patch (x.y.Z) | `fix: YouTube ads reappear on v19.20` |
| `feat:` | Minor (x.Y.0) | `feat: add background playback toggle` |
| `bump:` | Patch | `bump: update YouTube to v19.22` |
| `perf:` | Patch | `perf: optimize fingerprint matching` |
| `build:` | Patch (scope: "Needs bump") | `build(Needs bump): upgrade morphe-patcher` |
| `chore:` | None | `chore: update README` |

**Critical:** Never force-push semantic release commits. Never manually edit `CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`, or `gradle.properties` — `release.yml` manages them.

## Important Files

| File | Role |
|------|------|
| `settings.gradle.kts` | Root config: plugin management (Morphe plugin v1.3.4 from GitHub Packages + JitPack), project name |
| `patches/build.gradle.kts` | Module config: group=`app.canh0chua`, patch metadata (name, author, license), `generatePatchesList` task |
| `gradle/libs.versions.toml` | Version catalog: `morphe-patcher=1.11.0`, `gson=2.14.0` |
| `.releaserc` | Semantic-release plugin chain & rules |
| `.github/workflows/release.yml` | CI: semantic-release, attestation, compile verification |
| `.github/workflows/open_pull_request.yml` | Auto PR dev→main on push to dev |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | Main function: `PatchListGenerator().generate()` → `patches-list.json` |
| `extensions/extension/build.gradle.kts` | Extension config: output `extensions/extension.mpe`, namespace `app.canh0chua.extension` |

## Runtime/Tooling Preferences

| Tool | Version/Config |
|------|----------------|
| Java | 21 (Temurin) — required by `buildAndroid` |
| Gradle | 9.7.1 (wrapper) |
| Kotlin | Official code style (ktlint) |
| Node.js | LTS (for semantic-release tooling) |
| Package Manager | npm (for release deps only) |
| Release Tool | semantic-release v25 via `cycjimmy/semantic-release-action@v6` |
| GitHub Actions | Ubuntu-latest, permissions: contents, packages, id-token, attestations |

**Do not add** project-wide linters/formatters — the template relies on Gradle's built-in Kotlin style and the Morphe plugin conventions.

## Testing & QA

| Level | Approach |
|-------|----------|
| Unit tests | Not in template — add `*Test.kt` alongside patches if needed |
| Integration | Build locally (`./gradlew buildAndroid`), test `.mpp` via **Morphe Desktop** |
| CI verification | `release.yml` runs `./gradlew :patches:buildAndroid clean` on non-release commits |
| Fingerprint validation | Morphe Desktop shows match/fail per fingerprint; iterate locally before pushing |

**Manual verification workflow:**
1. `./gradlew :patches:buildAndroid` → `patches/build/libs/patches-*.mpp`
2. Open **Morphe Desktop** → Load original APK + `.mpp` → Patch
3. Install patched APK on device/emulator → Verify behavior
4. Commit to `dev` with semantic message → auto pre-release

## Adding New Patches

1. Create `patches/src/main/kotlin/app/canh0chua/patches/<app-name>/`
2. Add `Fingerprints.kt` with target app fingerprints
3. Add `<AppName>Patch.kt` with `bytecodePatch` definitions
4. Add compatibility in `shared/Constants.kt` (or inline)
5. (Optional) Add Java logic in `extensions/extension/src/main/java/...`
6. `./gradlew :patches:buildAndroid` to verify compile
7. Test with Morphe Desktop
8. Commit to `dev` with `feat:` or `fix:` message

## Common Pitfalls

- **Fingerprint fails**: Check instruction sequence matches *exact* bytecode; use Morphe Desktop's fingerprint tester
- **Extension not found**: Ensure `extendWith("extensions/extension.mpe")` matches extension build output name
- **Version mismatch**: `AppTarget(version=null, isExperimental=true)` for latest; pin confirmed versions
- **Release stuck**: Don't force-push; create new `fix:`/`feat:` commit instead
- **Gradle sync fails**: Run `./gradlew --refresh-dependencies` to refresh GitHub Packages credentials