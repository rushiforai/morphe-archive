from pathlib import Path

required = [
    "settings.gradle.kts",
    "build.gradle.kts",
    "gradle.properties",
    "gradle/libs.versions.toml",
    "patches/build.gradle.kts",
    "gradlew",
    "gradlew.bat",
    "gradle/wrapper/gradle-wrapper.properties",
    ".releaserc",
    ".github/workflows/release.yml",
    ".github/scripts/generate_patches_readme.py",
    "package.json",
    "README.md",
    "patches-bundle.json",
    "patches-list.json",
]
for p in required:
    assert Path(p).exists(), p

settings = Path("settings.gradle.kts").read_text(encoding="utf-8")
catalog = Path("gradle/libs.versions.toml").read_text(encoding="utf-8")
build = Path("patches/build.gradle.kts").read_text(encoding="utf-8")
release = Path(".github/workflows/release.yml").read_text(encoding="utf-8")
releaserc = Path(".releaserc").read_text(encoding="utf-8")
readme = Path("README.md").read_text(encoding="utf-8")

assert 'id("app.morphe.patches") version "1.3.4"' in settings
assert 'includeBuild(localMorphePlugin)' in settings
assert 'includeBuild(localMorphePatcher)' in settings
assert "maven.pkg.github.com/MorpheApp/registry" in settings
assert "mavenLocal()" not in settings
assert 'morphe-patcher = "1.13.0"' in catalog
assert 'morphe-patcher = { module = "app.morphe:morphe-patcher", version.ref = "morphe-patcher" }' in catalog
assert 'name = "Gboard AMOLED Theme Studio"' in build
assert 'generatePatchesList' in build
assert 'cycjimmy/semantic-release-action@v6' in release
assert 'actions/setup-java@v6.0.0' in release
assert 'actions/setup-node@v7' in release
assert "gradle-version: '9.7.1'" in release
assert 'Bootstrap pinned Morphe toolchain' in release
assert 'Verify Morphe Gradle plugin resolution' in release
assert 'publishToMavenLocal' not in release
assert 'bootstrap_morphe.sh' in release
assert 'gradle-semantic-release-plugin' in releaserc
assert 'patches-bundle.json' in releaserc
assert 'patches-list.json' in releaserc
assert "<!-- PATCHES_START -->" in readme and "<!-- PATCHES_END -->" in readme
print("Morphe template compatibility verification passed")
