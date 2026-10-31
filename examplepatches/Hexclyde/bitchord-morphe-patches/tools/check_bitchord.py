#!/usr/bin/env python3
"""Try the patch on another BitChord build and record whether it still applies.

Unlike validate_apks.py this accepts any BitChord version: it skips Morphe's
version check (-f) so a new release or branch build shows which hooks still
fit. Run build.py first.

    python3 tools/check_bitchord.py --label v1.8.2 --out build/compat app.apk [...]
"""

import argparse
import json
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from buildenv import BUNDLE_NAME, MORPHE_JAR, PATCHES, ROOT, jdk  # noqa: E402


def tail(text, lines=40):
    return "\n".join(text.strip().splitlines()[-lines:])


def patch_reason(error):
    """First line of a patch error plus the TelegramPatch.kt line that raised it."""
    lines = error.strip().splitlines()
    reason = lines[0].split("Exception: ", 1)[-1] if lines else "unknown error"
    frame = next((l.strip() for l in lines if "TelegramPatch.kt:" in l), "")
    if frame:
        reason += " (" + frame[frame.rfind("(") + 1 : frame.rfind(")")] + ")"
    return reason


def check_reason(output):
    """The failed assertion from a checker's output."""
    for line in output.splitlines():
        if "AssertionError" in line or "FAIL" in line:
            return line.split("AssertionError: ", 1)[-1].strip()
    return tail(output, 1) or "unknown error"


def run(command, log):
    result = subprocess.run(command, capture_output=True, text=True)
    output = result.stdout + result.stderr
    output = "\n".join(line for line in output.splitlines() if "Picked up" not in line)
    log.write_text(output)
    return result.returncode == 0, output


def check_apk(apk, out, java, checks):
    name = apk.stem
    patched = out / f"{name}-patched.apk"
    report = out / f"{name}-report.json"
    result = {"apk": apk.name}
    ok, output = run(
        [java, "-Xmx4g", "-jar", MORPHE_JAR, "patch", "-f", "--validate"]
        + ["-p", ROOT / "build" / BUNDLE_NAME]
        + [arg for patch in PATCHES for arg in ("-e", patch)]
        + ["-r", report, "-o", patched, apk],
        out / f"{name}-patch.log",
    )
    if report.exists():
        details = json.loads(report.read_text())
        result["version"] = details.get("packageVersion")
        failed = details.get("failedPatches", [])
        result["failed_patches"] = [
            {"name": f.get("name"), "reason": patch_reason(f.get("error", ""))}
            for f in failed
        ]
        ok = ok and details.get("success", False) and not failed
    result["patched"] = ok
    if not ok:
        reasons = [
            f"{f['name']}: {f['reason']}" for f in result.get("failed_patches", [])
        ]
        result["reason"] = "; ".join(reasons) or check_reason(output)
        result["details"] = tail(output)
        return result
    for checker, args in [
        ("VerifyDexControlFlow", [patched]),
        ("VerifyApk", [apk, patched]),
    ]:
        ok, output = run(
            [java, "-Xmx3g", "-cp", f"{checks}:{MORPHE_JAR}", checker, *args],
            out / f"{name}-{checker}.log",
        )
        result[checker] = ok
        if not ok:
            result["reason"] = f"{checker}: {check_reason(output)}"
            result["details"] = tail(output)
            break
    return result


def summary(label, results):
    passed = all(r["patched"] and r.get("VerifyApk") for r in results)
    lines = [
        f"**{label}: {'patch applies and all checks pass' if passed else 'patch does not apply cleanly'}**",
        "",
    ]
    lines += [
        "| APK | Version | Patched | DEX control flow | APK checks |",
        "| --- | --- | --- | --- | --- |",
    ]
    mark = {True: "pass", False: "FAIL", None: "-"}
    for r in results:
        lines.append(
            f"| {r['apk']} | {r.get('version') or '?'} | {mark[r['patched']]} "
            f"| {mark[r.get('VerifyDexControlFlow')]} | {mark[r.get('VerifyApk')]} |"
        )
    for r in results:
        if r.get("reason"):
            lines += ["", f"- **{r['apk']}:** {r['reason']}"]
    for r in results:
        if r.get("details"):
            lines += [
                "",
                f"<details><summary>{r['apk']}</summary>",
                "",
                "```",
                r["details"],
                "```",
                "</details>",
            ]
    return passed, "\n".join(lines) + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument(
        "--label", required=True, help="Name for the report, e.g. a tag or branch"
    )
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("apks", type=Path, nargs="+")
    args = parser.parse_args()
    if not (ROOT / "build" / BUNDLE_NAME).exists():
        sys.exit("Run build.py first.")
    args.out.mkdir(parents=True, exist_ok=True)
    java = str(jdk() / "bin/java")
    checks = ROOT / "build/apk-check-classes"
    checks.mkdir(parents=True, exist_ok=True)
    subprocess.run(
        [str(jdk() / "bin/javac"), "--release", "21", "-cp", MORPHE_JAR, "-d", checks]
        + sorted((ROOT / "checks").glob("Verify*.java")),
        check=True,
    )
    results = [check_apk(apk.resolve(), args.out, java, checks) for apk in args.apks]
    passed, text = summary(args.label, results)
    (args.out / "result.json").write_text(
        json.dumps(
            {"label": args.label, "passed": passed, "results": results}, indent=2
        )
        + "\n"
    )
    (args.out / "summary.md").write_text(text)
    print(text)


if __name__ == "__main__":
    main()
