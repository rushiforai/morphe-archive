from pathlib import Path

workflow = Path(".github/workflows/release.yml").read_text()
bootstrap = Path(".github/scripts/bootstrap_morphe.sh").read_text()
settings = Path("settings.gradle.kts").read_text()

assert "publishToMavenLocal" not in workflow, "CI must not publish Patcher to Maven Local"
assert "publishToMavenLocal" not in bootstrap, "Bootstrap must not publish Patcher to Maven Local"
assert "signMorphe-patcher-publicationPublication" not in workflow, "CI must not depend on GPG signing tasks"
assert "gpg" not in bootstrap.lower(), "Bootstrap must not invoke GPG"
assert 'substitute(module("app.morphe:morphe-patcher")).using(project(":"))' in settings
print("CI bootstrap signing audit passed")
