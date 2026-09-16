from pathlib import Path

settings = Path("settings.gradle.kts").read_text()
catalog = Path("gradle/libs.versions.toml").read_text()
workflow = Path(".github/workflows/release.yml").read_text()
bootstrap = Path(".github/scripts/bootstrap_morphe.sh").read_text()

assert 'id("app.morphe.patches") version "1.3.4"' in settings
assert 'morphe-patcher = "1.13.0"' in catalog
assert 'includeBuild(localMorphePlugin)' in settings
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings
assert 'MorpheApp/morphe-patches-gradle-plugin' in bootstrap
assert 'MorpheApp/morphe-patcher' in bootstrap
assert 'publishToMavenLocal' not in bootstrap
assert 'publishToMavenLocal' not in workflow
assert 'maven.pkg.github.com/MorpheApp/registry' in settings
assert 'packages: read' in workflow
assert 'Bootstrap pinned Morphe toolchain' in workflow

print("Morphe toolchain alignment verification passed")
