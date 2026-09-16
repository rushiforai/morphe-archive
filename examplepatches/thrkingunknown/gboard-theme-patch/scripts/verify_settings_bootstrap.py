from pathlib import Path

settings = Path("settings.gradle.kts").read_text()
workflow = Path(".github/workflows/release.yml").read_text()
bootstrap = Path(".github/scripts/bootstrap_morphe.sh").read_text()

assert 'pluginManagement {' in settings
assert 'val localMorphePlugin = rootDir.resolve("morphe-deps/morphe-patches-gradle-plugin")' in settings
assert 'includeBuild(localMorphePlugin)' in settings
assert 'id("app.morphe.patches") version "1.3.4"' in settings
assert 'mavenLocal()' not in settings
assert 'maven.pkg.github.com/MorpheApp/registry' in settings
assert 'val localMorphePatcher = rootDir.resolve("morphe-deps/morphe-patcher")' in settings
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings
assert 'Bootstrap pinned Morphe toolchain' in workflow
assert 'publishToMavenLocal' not in workflow
assert 'publishToMavenLocal' not in bootstrap
assert 'gradle/wrapper/gradle-wrapper.jar' in workflow or 'gradle/wrapper/gradle-wrapper.jar' in bootstrap
assert 'gradle wrapper --gradle-version 9.7.1' not in workflow
print("Morphe settings/bootstrap verification passed")
