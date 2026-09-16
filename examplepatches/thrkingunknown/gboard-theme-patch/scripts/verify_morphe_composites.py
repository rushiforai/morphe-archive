from pathlib import Path

settings = Path("settings.gradle.kts").read_text()
bootstrap = Path(".github/scripts/bootstrap_morphe.sh").read_text()
workflow = Path(".github/workflows/release.yml").read_text()

assert 'val localMorphePlugin = rootDir.resolve("morphe-deps/morphe-patches-gradle-plugin")' in settings
assert 'includeBuild(localMorphePlugin)' in settings
assert 'val localMorphePatcher = rootDir.resolve("morphe-deps/morphe-patcher")' in settings
assert 'includeBuild(localMorphePatcher)' in settings
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings
assert 'cp morphe-deps/morphe-patcher/gradle/wrapper/gradle-wrapper.jar gradle/wrapper/gradle-wrapper.jar' in bootstrap
assert 'publishToMavenLocal' not in bootstrap
assert 'publishToMavenLocal' not in workflow
print("Morphe composite-build verification passed")
