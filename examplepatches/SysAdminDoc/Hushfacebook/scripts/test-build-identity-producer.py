"""Exercise buildAndroid's real source snapshot in a private Git fixture.

Run with the build's JAVA_HOME and registry credentials. --work-dir retains logs and
the fixture for diagnosis; without it, scratch files stay in the system temp directory.
"""

import argparse
import json
import os
import shutil
import subprocess
import tempfile
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--work-dir", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    work = args.work_dir.resolve() if args.work_dir else Path(tempfile.mkdtemp(prefix="hushfacebook-identity-"))
    work.mkdir(parents=True, exist_ok=True)
    fixture = work / "fixture"
    fixture.mkdir()  # Never reuse or mutate the caller's checkout.

    def git(*arguments, cwd=fixture):
        return subprocess.check_output(["git", "--no-optional-locks", *arguments], cwd=cwd)

    paths = git("ls-files", "-z", "--cached", "--others", "--exclude-standard", cwd=root).decode("utf-8").split("\0")
    for name in filter(None, paths):
        source = root / name
        if source.is_file():
            target = fixture / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
    if (root / "local.properties").is_file():
        shutil.copyfile(root / "local.properties", fixture / "local.properties")

    probes = {
        "source": "extensions/facebook/src/main/java/ProducerIdentityFixture.java",
        "l10n": "extensions/shared/library/src/main/l10n/producer-identity-fixture.tsv",
        "proguard": "extensions/producer-identity-fixture.pro",
    }
    for name in [*probes.values(), "patches/src/main/resources/build/identity-fixture.txt",
                 "extensions/src/main/identity-fixture.txt", "gradle/CVS/identity-fixture.txt"]:
        path = fixture / name
        path.parent.mkdir(parents=True, exist_ok=True)
        prefix = b"//" if path.suffix == ".java" else b"#"
        path.write_bytes(prefix + b" unused producer identity fixture\n")
    git("init", "--quiet")
    git("config", "user.name", "SysAdminDoc")
    git("config", "user.email", "matt_parker@outlook.com")
    git("config", "core.autocrlf", "false")
    git("add", "--all")
    git("add", "--force", "--", "patches/src/main/resources/build/identity-fixture.txt")
    git("commit", "--quiet", "-m", "test: establish producer identity fixture")
    source_commit = git("rev-parse", "HEAD").decode().strip()
    source_tree = git("rev-parse", "HEAD^{tree}").decode().strip()

    init = work / "producer-snapshot.gradle"
    init.write_text("""gradle.projectsEvaluated {
    def producer = rootProject.project(':patches').tasks.named('buildAndroid').get()
    println('HUSH_IDENTITY_SNAPSHOT=' + producer.inputs.properties['identitySource'].join('|'))
    println('HUSH_IDENTITY_PATHS=' + producer.inputs.files.files.findAll { it.isFile() }
        .collect { rootProject.relativePath(it).replace('\\\\', '/') }.sort().join('|'))
}
""", encoding="utf-8")
    java_home = os.environ.get("JAVA_HOME")
    java = str(Path(java_home) / "bin" / ("java.exe" if os.name == "nt" else "java")) if java_home else "java"
    records = []
    failures = []

    def snapshot(label, expected, status_empty, baseline=None, digest_changed=False):
        status = git("status", "--porcelain").decode().strip()
        if (not status) != status_empty:
            raise AssertionError(f"{label}: unexpected Git status {status!r}")
        log = work / f"{label}.log"
        with log.open("wb") as output:
            result = subprocess.run([java, "-Dorg.gradle.appname=gradlew", "-classpath",
                "gradle/wrapper/gradle-wrapper.jar", "org.gradle.wrapper.GradleWrapperMain",
                # These configuration probes need no Kotlin telemetry file collection.
                "-Pkotlin.internal.collectFUSMetrics=false", "--console=plain",
                "--no-configuration-cache", "-I", str(init), "help"],
                cwd=fixture, stdout=output, stderr=subprocess.STDOUT, check=False)
        if result.returncode:
            raise AssertionError(f"{label}: Gradle failed; see {log}")
        lines = log.read_text(encoding="utf-8", errors="replace").splitlines()
        values = next(line.split("=", 1)[1].split("|") for line in lines if line.startswith("HUSH_IDENTITY_SNAPSHOT="))
        actual_paths = next(line.split("=", 1)[1].split("|") for line in lines if line.startswith("HUSH_IDENTITY_PATHS="))
        record = {"case": label, "expected": expected, "actual": values[2], "gitStatusEmpty": not status,
                  "commit": values[0], "tree": values[1], "inputsSha256": values[3]}
        records.append(record)
        errors = []
        if values[:2] != [source_commit, source_tree]:
            errors.append("source commit or tree changed")
        if values[2] != expected:
            errors.append(f"expected {expected}, got {values[2]}")
        if baseline is not None and (values[3] != baseline[3]) != digest_changed:
            errors.append("unexpected input digest comparison")
        if errors:
            failures.append(f"{label}: {', '.join(errors)}")
            if label == "clean":
                raise AssertionError(f"Invalid clean control: {', '.join(errors)}")
        print(f"{label}: source={values[2]}, git status {'empty' if not status else 'changed'}", flush=True)
        return values, actual_paths

    clean, included = snapshot("clean", "clean", True)
    assert all(name in included for name in probes.values())
    assert "patches/src/main/resources/build/identity-fixture.txt" in included
    assert "extensions/src/main/identity-fixture.txt" in included
    assert "gradle/CVS/identity-fixture.txt" not in included
    for kind, name in probes.items():
        path = fixture / name
        original = path.read_bytes()
        for flag in ["skip-worktree", "assume-unchanged", "ordinary"]:
            if flag != "ordinary":
                git("update-index", f"--{flag}", "--", name)
            path.unlink()
            try:
                snapshot(f"{kind}-{flag}-deleted", "dirty", flag != "ordinary", clean, True)
            finally:
                path.write_bytes(original)
                if flag != "ordinary":
                    git("update-index", f"--no-{flag}", "--", name)
    path = fixture / probes["source"]
    original = path.read_bytes()
    for flag in ["skip-worktree", "assume-unchanged"]:
        git("update-index", f"--{flag}", "--", probes["source"])
        path.write_bytes(original.replace(b"unused", b"edited"))
        try:
            snapshot(f"source-{flag}-modified", "dirty", True, clean, True)
        finally:
            path.write_bytes(original)
            git("update-index", f"--no-{flag}", "--", probes["source"])
    for ignored in [False, True]:
        name = "extensions/facebook/src/main/java/ExtraIdentityFixture.java"
        path = fixture / name
        if ignored:
            (fixture / ".git/info/exclude").write_text(name + "\n", encoding="utf-8")
        path.write_bytes(original)
        try:
            snapshot("ignored-extra-source" if ignored else "untracked-extra-source", "dirty", ignored, clean, True)
        finally:
            path.unlink()
    excluded = fixture / "extensions/facebook/build/src/main/ExcludedIdentityFixture.java"
    excluded.parent.mkdir(parents=True, exist_ok=True)
    excluded.write_bytes(original)
    snapshot("excluded-build-source", "clean", True, clean)
    snapshot("restored-clean", "clean", True, clean)
    (work / "results.json").write_text(json.dumps({"cases": records, "failures": failures}, indent=2) + "\n", encoding="utf-8")
    if failures:
        raise AssertionError("\n".join(failures))
    print(f"All {len(records)} actual producer cases passed.", flush=True)


if __name__ == "__main__":
    main()
