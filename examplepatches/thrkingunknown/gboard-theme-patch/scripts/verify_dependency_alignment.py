from pathlib import Path

catalog = Path("gradle/libs.versions.toml").read_text()
settings = Path("settings.gradle.kts").read_text()
build = Path("patches/build.gradle.kts").read_text()
generator = Path("patches/src/main/kotlin/util/PatchListGenerator.kt").read_text()
workflow = Path(".github/workflows/release.yml").read_text()

assert 'morphe-patcher = "1.13.0"' in catalog
assert 'id("app.morphe.patches") version "1.3.4"' in settings
assert 'includeBuild(localMorphePlugin)' in settings
assert 'mavenLocal()' not in settings
assert 'maven.pkg.github.com/MorpheApp/registry' in settings
assert 'packages: read' in workflow
assert 'Bootstrap pinned Morphe toolchain' in workflow

assert '-Xcontext-parameters' not in build
assert 'patch.category' not in generator
assert 'targets = emptyList()' in generator
assert 'publishToMavenLocal' not in workflow
assert 'publishToMavenLocal' not in Path('.github/scripts/bootstrap_morphe.sh').read_text()
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings
assert 'v1.3.4 1.3.4' in Path('.github/scripts/bootstrap_morphe.sh').read_text()
assert 'v1.13.0 1.13.0' in Path('.github/scripts/bootstrap_morphe.sh').read_text()
print("Dependency alignment verification passed")
