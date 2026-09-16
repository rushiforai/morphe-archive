from pathlib import Path

catalog = Path("gradle/libs.versions.toml").read_text()
settings = Path("settings.gradle.kts").read_text()
build = Path("patches/build.gradle.kts").read_text()
workflow = Path(".github/workflows/release.yml").read_text()
generator = Path("patches/src/main/kotlin/util/PatchListGenerator.kt").read_text()

assert 'morphe-patcher = "1.13.0"' in catalog
assert 'morphe-patcher = { module = "app.morphe:morphe-patcher", version.ref = "morphe-patcher" }' in catalog
assert 'id("app.morphe.patches") version "1.3.4"' in settings
assert 'includeBuild(localMorphePlugin)' in settings
assert 'name = "Gboard AMOLED Theme Studio"' in build
assert 'contact = "https://github.com/thrkingunknown"' in build
assert 'mainClass.set("util.PatchListGeneratorKt")' in build
assert 'patchListGeneratorClasspath(libs.gson)' in build
assert 'package util' in generator
assert 'fun main()' in generator
assert "cache: 'npm'" in workflow
assert 'cache-dependency-path: package-lock.json' in workflow
assert 'gradle/actions/setup-gradle@v6' in workflow
assert "gradle-version: '9.7.1'" in workflow
assert 'gradle wrapper --gradle-version 9.7.1' not in workflow
assert 'cp morphe-deps/morphe-patcher/gradle/wrapper/gradle-wrapper.jar gradle/wrapper/gradle-wrapper.jar' in Path('.github/scripts/bootstrap_morphe.sh').read_text()
print("Build configuration verification passed")
