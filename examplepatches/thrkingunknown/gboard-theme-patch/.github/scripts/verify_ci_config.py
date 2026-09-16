from pathlib import Path
import json
import re

release = Path(".github/workflows/release.yml").read_text(encoding="utf-8")
props = Path("gradle.properties").read_text(encoding="utf-8")
releaserc = Path(".releaserc").read_text(encoding="utf-8")
package_json = json.loads(Path("package.json").read_text(encoding="utf-8"))

json.loads(releaserc)

checks = [
    ("actions/setup-node@v7", release),
    ("cache: 'npm'", release),
    ("cache-dependency-path: package-lock.json", release),
    ("npm ci --no-audit --no-fund", release),
    ("gradle/actions/setup-gradle@v6", release),
    ("cache-read-only: false", release),
    ("org.gradle.caching=true", props.replace(" ", "")),
    ("org.gradle.parallel=true", props.replace(" ", "")),
    ("gradle-semantic-release-plugin", json.dumps(package_json)),
    ("downloadUrlTemplate", releaserc),
    ("prepareCmd", releaserc),
    ("mainClass.set(\"util.PatchListGeneratorKt\")", Path("patches/build.gradle.kts").read_text(encoding="utf-8")),
    ("Ensure Morphe dev branch exists", release),
    ("Verify published Morphe metadata", release),
    ("git push origin HEAD:refs/heads/dev", release),
    ("Bootstrap pinned Morphe toolchain", release),
    ("Verify Morphe Gradle plugin resolution", release),
    ("includeBuild(localMorphePlugin)", Path("settings.gradle.kts").read_text(encoding="utf-8")),
]
for needle, haystack in checks:
    assert needle in haystack, needle
assert "npm install" not in release
assert "github.ref_name == 'main' || github.ref_name == 'dev'" in release
assert "actions/cache@" not in release
assert Path("patches/src/main/kotlin/util/PatchListGenerator.kt").exists()
for metadata in ("patches-bundle.json", "patches-list.json"):
    assert Path(metadata).exists(), metadata
json.loads(Path("patches-bundle.json").read_text(encoding="utf-8"))
json.loads(Path("patches-list.json").read_text(encoding="utf-8"))
bundle = json.loads(Path("patches-bundle.json").read_text(encoding="utf-8"))
version_match = re.search(r"(?m)^version\s*=\s*(.+)$", props)
assert version_match, "gradle.properties must define version"
project_version = version_match.group(1).strip()
assert bundle["version"] == project_version
assert bundle["download_url"].endswith(f"/v{project_version}/patches-{project_version}.mpp")
assert json.loads(Path("patches-list.json").read_text(encoding="utf-8"))["version"] == project_version

settings_text = Path("settings.gradle.kts").read_text(encoding="utf-8")
assert 'id("app.morphe.patches") version "1.3.4"' in settings_text
assert 'includeBuild(localMorphePlugin)' in settings_text
assert 'includeBuild(localMorphePatcher)' in settings_text
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings_text
assert "bootstrap_morphe.sh" in release
assert "maven.pkg.github.com/MorpheApp/registry" in settings_text
assert "packages: read" in release
assert "publishToMavenLocal" not in release
assert "bash .github/scripts/bootstrap_morphe.sh" in release
wrapper_step = release.index("Bootstrap pinned Morphe toolchain")
release_action = release.index("uses: cycjimmy/semantic-release-action@v6")
assert wrapper_step < release_action
print("CI/release/cache/generator/Morphe registry configuration passed")
