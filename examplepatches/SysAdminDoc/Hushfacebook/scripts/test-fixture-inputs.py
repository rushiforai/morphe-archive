"""Exercise the real patch test task's fixture input set and incremental outcomes.

Run with the build's JAVA_HOME and registry credentials. All changes stay in a private
copy; --work-dir retains its project, logs and fixtures for diagnosis.
"""

import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import threading
import xml.etree.ElementTree as ET


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--work-dir", type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    work = args.work_dir.resolve() if args.work_dir else Path(tempfile.mkdtemp(prefix="hushfacebook-fixture-inputs-"))
    work.mkdir(parents=True, exist_ok=True)
    project = work / "project"
    project.mkdir()  # Never reuse or mutate the caller's checkout.
    names = subprocess.check_output(["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"],
                                    cwd=root).decode("utf-8").split("\0")
    for name in filter(None, names):
        source = root / name
        if source.is_file():
            target = project / name
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
    if (root / "local.properties").is_file():
        shutil.copyfile(root / "local.properties", project / "local.properties")

    fixtures = work / "fixtures"
    fixtures.mkdir()
    probe = work / "probe"
    probe.mkdir()
    (probe / "FixtureInputProbeTest.kt").write_text("""package app.morphe

import org.junit.Assert.assertEquals
import org.junit.Test

class FixtureInputProbeTest {
    @Test fun readsTheOriginalFixtureSelector() {
        val expected = System.getenv("HUSH_FIXTURE_EXPECTED_NAMES").split('|').filter { it.isNotEmpty() }
        assertEquals(expected, Fixtures.files { true }.map { it.name })
    }
}
""", encoding="utf-8")
    init = work / "fixture-inputs.gradle"
    init.write_text("""gradle.projectsEvaluated {
    def patches = rootProject.project(':patches')
    patches.extensions.getByName('kotlin').sourceSets.getByName('test').kotlin
        .srcDir(System.getenv('HUSH_FIXTURE_PROBE'))
    def task = patches.tasks.named('test').get()
    task.environment('HUSH_FIXTURE_EXPECTED_NAMES', System.getenv('HUSH_FIXTURE_EXPECTED_NAMES'))
    patches.tasks.register('fixtureInputSnapshot') {
        mustRunAfter(task)
        doLast {
            def configured = System.getenv('HUSHFACEBOOK_FIXTURE_DIR')
            def folder = configured == null || configured.isBlank() ? null : new File(configured).toPath().toAbsolutePath().normalize()
            def declared = task.inputs.files
            def actual = folder == null ? [] : (declared.files + declared.asFileTree.files)
                .findAll { it.isFile() && it.toPath().toAbsolutePath().normalize().startsWith(folder) }
                .collect { folder.relativize(it.toPath().toAbsolutePath().normalize()).toString().replace('\\\\', '/') }.unique().sort()
            println('HUSH_FIXTURE_INPUTS=' + groovy.json.JsonOutput.toJson(actual))
        }
    }
}
""", encoding="utf-8")
    java_home = os.environ.get("JAVA_HOME")
    java = str(Path(java_home) / "bin" / ("java.exe" if os.name == "nt" else "java")) if java_home else "java"
    records = []

    def run(label, configured, expected, outcome, failure=None):
        env = os.environ.copy()
        if configured is None:
            env.pop("HUSHFACEBOOK_FIXTURE_DIR", None)
        else:
            env["HUSHFACEBOOK_FIXTURE_DIR"] = str(configured)
        env["HUSH_FIXTURE_PROBE"] = str(probe)
        env["HUSH_FIXTURE_EXPECTED_NAMES"] = "|".join(expected)
        log = work / (label + ".log")
        with log.open("wb") as output:
            result = subprocess.run([java, "-Dorg.gradle.appname=gradlew", "-classpath",
                "gradle/wrapper/gradle-wrapper.jar", "org.gradle.wrapper.GradleWrapperMain",
                "-Pkotlin.internal.collectFUSMetrics=false", "--console=plain", "--no-configuration-cache",
                "--no-build-cache", "--no-daemon", "-I", str(init), ":patches:test", "--tests", "app.morphe.FixtureInputProbeTest",
                ":patches:fixtureInputSnapshot"],
                cwd=project, env=env, stdout=output, stderr=subprocess.STDOUT, check=False)
        text = log.read_text(encoding="utf-8", errors="replace")
        marker = "HUSH_FIXTURE_INPUTS="
        actual = next((json.loads(line[len(marker):]) for line in text.splitlines() if line.startswith(marker)), None)
        task = next((line for line in text.splitlines() if line.startswith("> Task :patches:test ")
                     or line == "> Task :patches:test"), "not executed")
        reports = list((project / "patches/build/test-results/test").glob("TEST-*.xml"))
        totals = {key: 0 for key in ["tests", "failures", "errors", "skipped"]}
        for report in reports:
            attributes = ET.parse(report).getroot().attrib
            for key in totals:
                totals[key] += int(attributes.get(key, "0"))
        record = {"case": label, "inputs": actual, "task": task, "exit": result.returncode, **totals}
        records.append(record)
        (work / "results.json").write_text(json.dumps(records, indent=2) + "\n", encoding="utf-8")
        print(json.dumps(record), flush=True)
        if failure:
            diagnostic = text + "".join(report.read_text(encoding="utf-8") for report in reports)
            assert result.returncode != 0 and failure in diagnostic, f"{label}: expected setup failure; see {log}"
            return
        assert result.returncode == 0, f"{label}: Gradle failed; see {log}"
        assert actual == expected, f"{label}: actual task inputs {actual}, expected {expected}"
        if outcome == "up-to-date":
            assert task.endswith(" UP-TO-DATE"), f"{label}: task reran instead of reusing its input key"
        else:
            assert task == "> Task :patches:test", f"{label}: changed input reused a cached task result"
        skipped = configured is None or str(configured).strip() == ""
        assert totals == {"tests": 1, "failures": 0, "errors": 0, "skipped": int(skipped)}, record

    first = fixtures / "first.apk"
    bundle = fixtures / "second.apkm"
    first.write_bytes(b"first fixture\n")
    bundle.write_bytes(b"second fixture\n")
    names = [first.name, bundle.name]
    run("top-level-control", fixtures, names, "execute")
    run("unchanged-control", fixtures, names, "up-to-date")
    nested = fixtures / "tmp_splits"
    nested.mkdir()
    split = nested / "split_i18n_zh_TW.apk"
    split.write_bytes(b"transient split\n")
    run("nested-added", fixtures, names, "up-to-date")
    split.write_bytes(b"changed transient split\n")
    run("nested-changed", fixtures, names, "up-to-date")
    split.unlink()
    run("nested-deleted", fixtures, names, "up-to-date")
    stop = threading.Event()

    def churn():
        while not stop.is_set():
            split.write_bytes(b"transient split\n")
            split.unlink()
            stop.wait(0.005)

    worker = threading.Thread(target=churn)
    worker.start()
    try:
        run("nested-churn-during-fingerprint", fixtures, names, "up-to-date")
    finally:
        stop.set()
        worker.join()
    unusual = fixtures / ".#kept.apk"
    unusual.write_bytes(b"ordinary regular fixture\n")
    run("ignored-looking-top-level-added", fixtures, [unusual.name, *names], "execute")
    unusual.write_bytes(b"changed regular fixture\n")
    run("ignored-looking-top-level-changed", fixtures, [unusual.name, *names], "execute")
    unusual.unlink()
    run("ignored-looking-top-level-deleted", fixtures, names, "execute")
    added = fixtures / "added.apk"
    added.write_bytes(b"added fixture\n")
    run("top-level-added", fixtures, [added.name, *names], "execute")
    first.write_bytes(b"changed first fixture\n")
    run("top-level-changed", fixtures, [added.name, *names], "execute")
    added.unlink()
    run("top-level-deleted", fixtures, names, "execute")
    moved = nested / bundle.name
    bundle.rename(moved)
    run("moved-into-subfolder", fixtures, [first.name], "execute")
    moved.rename(bundle)
    run("moved-back-to-top-level", fixtures, names, "execute")
    run("unset", None, [], "skip")
    run("blank", "  ", [], "up-to-date")
    empty = work / "empty-fixtures"
    empty.mkdir()
    run("configured-empty-after-skipped", empty, [], "execute", "holds none of the Facebook files")
    run("missing-folder", work / "missing-fixtures", [], "execute", "not a folder")
    invalid = work / "not-a-folder"
    invalid.write_bytes(b"not a directory\n")
    run("invalid-folder", invalid, [], "execute", "not a folder")
    run("restored-top-level", fixtures, names, "execute")
    run("restored-unchanged", fixtures, names, "up-to-date")
    print(f"All {len(records)} actual patch-task input and execution cases passed.", flush=True)


if __name__ == "__main__":
    main()
