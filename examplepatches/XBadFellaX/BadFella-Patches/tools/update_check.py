#!/usr/bin/env python3
"""Read-only TickTick update triage. A report is evidence for review, never release approval."""
import argparse
import ast
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
from collections import Counter

ROOT = Path(__file__).resolve().parents[1]
FLAGS = {"PUBLIC": 1, "PRIVATE": 2, "PROTECTED": 4, "STATIC": 8, "FINAL": 16}
MAX_APK_BYTES = 512 * 1024 * 1024


def digest(data):
    return hashlib.sha256(data).hexdigest()


def file_digest(path):
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""): value.update(block)
    return value.hexdigest()


def uncomment(text):
    return re.sub(r'"(?:\\.|[^"\\])*"|//[^\n]*|/\*.*?\*/',
                  lambda m: m[0] if m[0].startswith('"') else " ", text, flags=re.S)


def balanced(text, start):
    """Read a parenthesized expression without treating quoted parentheses as syntax."""
    depth, quoted, escape = 0, False, False
    for end in range(start, len(text)):
        c = text[end]
        if quoted:
            if escape: escape = False
            elif c == "\\": escape = True
            elif c == '"': quoted = False
        elif c == '"': quoted = True
        elif c == "(": depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0: return text[start + 1:end], end + 1
    raise ValueError("Unbalanced source expression")


def arguments(text):
    parts, start, depth, quoted, escape = [], 0, 0, False, False
    for pos, c in enumerate(text):
        if quoted:
            if escape: escape = False
            elif c == "\\": escape = True
            elif c == '"': quoted = False
        elif c == '"': quoted = True
        elif c in "([": depth += 1
        elif c in ")]": depth -= 1
        elif c == "," and depth == 0:
            if text[start:pos].strip(): parts.append(text[start:pos].strip())
            start = pos + 1
    if text[start:].strip(): parts.append(text[start:].strip())
    return parts


def named(text, allowed):
    result = {}
    for arg in arguments(text):
        key, separator, value = arg.partition("=")
        key = key.strip()
        if not separator or key not in allowed or key in result:
            raise ValueError("Unsupported fingerprint syntax: " + key)
        result[key] = value.strip()
    return result


def literal(value):
    result = json.loads(value)
    if not isinstance(result, str): raise ValueError("Expected literal string")
    return result


def string_list(value):
    if value in ("emptyList()", "listOf()"): return []
    if not value.startswith("listOf("): raise ValueError("Expected literal listOf(...) or emptyList()")
    body, _ = balanced(value, value.index("("))
    return [literal(x) for x in arguments(body)]


def source_contracts(root=ROOT):
    config = json.loads((root / "tools/update_contracts.json").read_text())
    if config["schema"] != 1: raise ValueError("Unsupported contract schema")
    fingerprints, source_hashes = [], {}
    for path in sorted((root / "patches/src/main/kotlin").rglob("*.kt")):
        # This preflight tracks TickTick; other apps have independent update contracts.
        relative = path.relative_to(root / "patches/src/main/kotlin").as_posix()
        if not relative.startswith(("app/badfella/patches/ticktick/", "util/")):
            continue
        raw = path.read_text(encoding="utf-8"); text = uncomment(raw)
        source_hashes[path.relative_to(root).as_posix()] = digest(raw.encode())
        found = list(re.finditer(r"object\s+(\w+)\s*:\s*Fingerprint\s*\(", text))
        if len(found) != len(re.findall(r"\bFingerprint\s*\(", text)):
            raise ValueError("Unsupported fingerprint declaration in " + path.name)
        for match in found:
            body, _ = balanced(text, match.end() - 1)
            attrs = named(body, {"definingClass", "name", "returnType", "parameters", "filters", "accessFlags"})
            spec = {"id": match[1], "source": path.relative_to(root).as_posix(), "calls": [], "fields": []}
            for key, target in [("definingClass", "owner"), ("name", "name"), ("returnType", "return")]:
                if key in attrs: spec[target] = literal(attrs[key])
            if "parameters" not in attrs: raise ValueError("Fingerprint parameters must be explicit")
            spec["params"] = string_list(attrs["parameters"])
            spec["flags"] = 0
            if "accessFlags" in attrs:
                flags_body, _ = balanced(attrs["accessFlags"], attrs["accessFlags"].index("("))
                for flag in arguments(flags_body): spec["flags"] |= FLAGS[flag.removeprefix("AccessFlags.")]
            if "filters" in attrs:
                value = attrs["filters"]
                if not value.startswith("listOf("): raise ValueError("Unsupported filter list")
                filters, _ = balanced(value, value.index("("))
                for entry in arguments(filters):
                    kind = entry.split("(", 1)[0]
                    if kind not in ("methodCall", "fieldAccess"): raise ValueError("Unsupported filter: " + kind)
                    inner, end = balanced(entry, entry.index("("))
                    if entry[end:].strip(): raise ValueError("Unsupported filter suffix")
                    fields = named(inner, {"definingClass", "name", "type"})
                    spec["calls" if kind == "methodCall" else "fields"].append(
                        {k: literal(v) for k, v in fields.items()})
            fingerprints.append(spec)
    bridge = uncomment((root / config["bridge_source"]).read_text(encoding="utf-8")) if config.get("bridge_source") else ""
    reflection = {}
    for match in re.finditer(r'\b(invoke|tryCall|invokeNoArg|requiredNoArg|tryInvoke)\(\s*(\w+)\s*,\s*"(\w+)"', bridge):
        operation, receiver, name = match.groups()
        if receiver not in config["receivers"]: raise ValueError("Unmapped bridge receiver: " + receiver)
        params, _ = balanced(bridge, bridge.index("(", match.start()))
        arity = len(arguments(params)) - 2
        owner = config["receivers"][receiver]
        key = owner + "->" + name + "/" + str(arity)
        spec = {"id": key, "owner": owner, "name": name, "arity": arity,
                "optional": operation == "tryCall",
                "declared": operation == "invoke" or (operation == "tryCall" and arity > 0),
                "source": config["bridge_source"]}
        # A required use takes precedence over a best-effort read of the same method.
        spec["optional"] = spec["optional"] and reflection.get(key, {"optional": True})["optional"]
        reflection[key] = spec
    for owner, name, arity in config["extra_methods"]:
        key = owner + "->" + name + "/" + str(arity)
        reflection[key] = {"id": key, "owner": owner, "name": name, "arity": arity,
                           "optional": False, "source": "tools/update_contracts.json"}
    for path in sorted((root / "extensions/extension/src/main/java/app/badfella/extension/ticktick").rglob("*.java")):
        source_hashes[path.relative_to(root).as_posix()] = digest(path.read_text(encoding="utf-8").encode())
    source_hashes["tools/update_contracts.json"] = digest((root / "tools/update_contracts.json").read_text(encoding="utf-8").encode())
    for name in ("DexInventory.java", "update_check.py"):
        source_hashes["tools/" + name] = digest((root / "tools" / name).read_text(encoding="utf-8").encode())
    privacy = (root / "patches/src/main/kotlin/app/badfella/patches/ticktick/misc/DisableAnalyticsPatch.kt").read_text()
    removals = {}
    for key in ("permissions", "components"):
        match = re.search(r"val " + key + r" = setOf\(", privacy)
        body, _ = balanced(privacy, match.end() - 1)
        removals[key] = [literal(v) for v in arguments(body)]
    retained = []
    for node in ast.walk(ast.parse((root / "tests/verify_output.py").read_text())):
        if isinstance(node, ast.For) and isinstance(node.target, ast.Name) and node.target.id == "retained":
            retained = ast.literal_eval(node.iter)
    if not retained: raise ValueError("No retained capability contract found")
    push = (root / "patches/src/main/kotlin/app/badfella/patches/ticktick/misc/RestorePushPatch.kt").read_text()
    certificate = re.search(r'const-string v0, "([0-9A-F]{40})"', push)[1]
    versions = re.findall(r'AppTarget\(version\s*=\s*"([^"]+)"', (root / "patches/src/main/kotlin/app/badfella/patches/ticktick/shared/Constants.kt").read_text())
    return {"schema": 1, "fingerprints": fingerprints, "reflection": list(reflection.values()),
            "config": config, "source_hashes": source_hashes, "retained": retained,
            "removals": removals, "certificate_sha1": certificate, "supported_versions": versions}


def run(command, env=None):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True,
                            encoding="utf-8", errors="replace", timeout=240, env=env)
    if result.returncode:
        # Do not echo entire third-party output: it can contain unrelated embedded values.
        raise ValueError(f"Tool failed ({Path(command[0]).name}, exit {result.returncode}); check its installation/input")
    return result.stdout


def apk_input(path, work):
    with zipfile.ZipFile(path) as archive:
        if "classes.dex" in archive.namelist():
            if sum(i.file_size for i in archive.infolist() if i.filename.endswith(".dex")) > MAX_APK_BYTES:
                raise ValueError("DEX contents exceed size limit")
            return path
        apks = [i for i in archive.infolist() if i.filename.endswith(".apk")]
        if len(apks) > 128 or sum(i.file_size for i in apks) > 1024 * 1024 * 1024:
            raise ValueError("APK bundle contents exceed size limit")
        code = []
        for info in apks:
            if info.file_size > MAX_APK_BYTES: raise ValueError("Nested APK exceeds size limit")
            import io
            data = archive.read(info)
            with zipfile.ZipFile(io.BytesIO(data)) as nested:
                if sum(i.file_size for i in nested.infolist() if i.filename.endswith(".dex")) > MAX_APK_BYTES:
                    raise ValueError("DEX contents exceed size limit")
                if any(re.fullmatch(r"classes\d*\.dex", n) for n in nested.namelist()):
                    target = work / ("code-" + str(len(code)) + ".apk")
                    target.write_bytes(data); code.append(target)
        if len(code) != 1:
            raise ValueError("Expected one code-bearing base APK. Use a developer-signed universal stock APK or extend scanning for all code modules")
        return code[0]


def inspect_artifact(path, contracts, java, jar, build_tools, old=None):
    if not path.is_file() or path.stat().st_size > 1024 * 1024 * 1024:
        raise ValueError("Input must be an APK/APKM/XAPK file smaller than 1 GiB")
    with tempfile.TemporaryDirectory(prefix="badfella-update-") as directory:
        work = Path(directory).resolve()
        if work.parent != Path(tempfile.gettempdir()).resolve(): raise ValueError("Unexpected temporary directory")
        apk = apk_input(path, work)
        badging = run([build_tools / ("aapt2.exe" if os.name == "nt" else "aapt2"), "dump", "badging", apk])
        match = re.search(r"package: name='([^']+)' versionCode='([^']+)' versionName='([^']+)'", badging)
        if not match or match[1] != contracts["config"]["package"]: raise ValueError("APK package does not match TickTick")
        manifest = run([build_tools / ("aapt2.exe" if os.name == "nt" else "aapt2"), "dump", "xmltree", "--file", "AndroidManifest.xml", apk])
        names = set(re.findall(r'android:name\([^)]*\)="([^"]+)"', manifest))
        # Reject both current branding and older patched inputs.
        if any(n.startswith(("app.badfella.extension.", "app.paresh.extension.")) for n in names):
            raise ValueError("Use an unmodified stock artifact, not an already patched APK")
        signers = run([java, "-jar", build_tools / "lib/apksigner.jar", "verify", "--print-certs", apk])
        certs = sorted(set(x.upper() for x in re.findall(r"^Signer #\d+ certificate SHA-1 digest: ([0-9a-fA-F]{40})\s*$", signers, re.M)))
        if not certs: raise ValueError("Could not verify the APK signing certificate")
        with zipfile.ZipFile(apk) as package:
            resource = contracts["config"]["preference_xml"]
            prefs = ""
            if resource in package.namelist():
                prefs = run([build_tools / ("aapt2.exe" if os.name == "nt" else "aapt2"), "dump", "xmltree", "--file", resource, apk])
        owners = {f["owner"] for f in contracts["fingerprints"] if "owner" in f}
        owners.update(f["owner"] for f in contracts["reflection"])
        shapes = {"(" + "".join(f["params"]) + ")" + f["return"] for f in contracts["fingerprints"]}
        if old:
            shapes.update("(" + "".join(m["params"]) + ")" + m["return"] for m in old["methods"].values())
        selection = work / "selection.txt"
        selection.write_text("\n".join([*("owner " + v for v in sorted(owners)),
                                         *("shape " + v for v in sorted(shapes)),
                                         *("deep " + v for v in contracts["config"]["deep_methods"])]), encoding="utf-8")
        command = [java, "-Xmx2g", "-Dfile.encoding=UTF-8", "--class-path", jar,
                   ROOT / "tools/DexInventory.java", apk, selection]
        # Stream rows so a full APK inventory is not duplicated as one giant stdout string.
        classes, methods = {}, {}
        rows = work / "inventory.jsonl"
        with (work / "scanner-error.txt").open("w", encoding="utf-8") as errors, rows.open("w", encoding="utf-8") as output:
            process = subprocess.Popen([str(x) for x in command], stdout=output, stderr=errors)
            try:
                if process.wait(timeout=240):
                    raise ValueError("DEX inventory failed; use JDK 21+ and a compatible dexlib2-containing Morphe Desktop JAR")
            finally:
                if process.poll() is None: process.kill(); process.wait()
        with rows.open(encoding="utf-8") as output:
            for line in output:
                item = json.loads(line)
                if item.pop("kind") == "class": classes[item["owner"]] = item
                else: methods[item["id"]] = item
        if not classes or not methods: raise ValueError("DEX scanner returned an incomplete inventory")
        return {"artifact": {"name": path.name, "sha256": file_digest(path),
                              "base_sha256": file_digest(apk), "package": match[1],
                              "version_code": match[2], "version": match[3], "certificate_sha1": certs,
                              "signer_scope": "code-bearing base APK only"},
                "classes": classes, "methods": methods, "manifest_names": sorted(names),
                "preference_keys": [key for key in contracts["config"]["preference_keys"] if f'"{key}"' in prefs]}


def ref_matches(reference, spec, field=False):
    owner, rest = reference.split("->", 1)
    name = rest.split(":" if field else "(", 1)[0]
    return (("definingClass" not in spec or owner == spec["definingClass"])
            and ("name" not in spec or name == spec["name"])
            and ("type" not in spec or rest.rsplit(":", 1)[-1] == spec["type"]))


def fingerprint_matches(method, spec):
    return (all(method[k] == spec[k] for k in ("owner", "name", "return", "params") if k in spec)
            and method["flags"] & spec["flags"] == spec["flags"]
            and all(any(ref_matches(c, rule) for c in method["calls"]) for rule in spec["calls"])
            and all(any(ref_matches(c, rule, True) for c in method["fields"]) for rule in spec["fields"]))


def reflection_matches(inventory, spec):
    """Follow superclass/interfaces because Java getMethod includes inherited public methods."""
    owners, pending = [], [spec["owner"]]
    while pending:
        owner = pending.pop(0)
        if owner in owners: continue
        owners.append(owner)
        if spec["name"] == "<init>": continue
        cls = inventory["classes"].get(owner, {})
        pending.append(cls.get("super", ""))
        if not spec.get("declared"): pending.extend(cls.get("interfaces", []))
    matches = [m for m in inventory["methods"].values() if m["owner"] in owners
               and m["name"] == spec["name"] and len(m["params"]) == spec["arity"]
               and (spec.get("declared") or m["flags"] & 1)]
    # An override is one available signature, not an ambiguous inherited overload.
    result = {}
    for m in sorted(matches, key=lambda m: owners.index(m["owner"])):
        result.setdefault((tuple(m["params"]), m["return"]), m)
    return list(result.values())


def capture(inventory, contracts):
    matches, selected = {}, {}
    for kind in ("fingerprints", "reflection"):
        for spec in contracts[kind]:
            found = ([m for m in inventory["methods"].values() if fingerprint_matches(m, spec)]
                     if kind == "fingerprints" else reflection_matches(inventory, spec))
            matches[spec["id"]] = [m["id"] for m in found]
            selected.update((m["id"], m) for m in found)
    selected.update((k, m) for k, m in inventory["methods"].items() if m.get("dependency"))
    return {"schema": 1, "artifact": inventory["artifact"], "contracts": contracts,
            "matches": matches, "methods": selected, "manifest_names": inventory["manifest_names"],
            "preference_keys": inventory["preference_keys"]}


def candidates(old, methods):
    ranked = []
    for method in methods.values():
        if method["params"] != old["params"] or method["return"] != old["return"]: continue
        def overlap(a, b):
            a, b = set(a), set(b)
            return len(a & b) / len(a | b) if a | b else 0
        score = (0.65 * overlap(old["calls"], method["calls"])
                 + 0.2 * overlap(old["fields"], method["fields"])
                 + 0.1 * overlap(old["ops"], method["ops"])
                 + 0.05 * (method["owner"] == old["owner"]))
        if old["body"] and old["body"] == method["body"]: score = 1.0
        if score >= 0.3:
            ranked.append({"method": method["id"], "score": round(score, 3), "callers": method["callers"]})
    return sorted(ranked, key=lambda m: (-m["score"], m["method"]))[:5]


def compare(baseline, current, contracts):
    if baseline.get("schema") != 1: raise ValueError("Unsupported baseline schema")
    snapshot = capture(current, contracts)
    findings, notes = [], []
    for kind in ("fingerprints", "reflection"):
        for spec in contracts[kind]:
            previous = baseline["matches"].get(spec["id"], [])
            present = snapshot["matches"][spec["id"]]
            row = {"kind": kind, "contract": spec["id"], "source": spec["source"], "matches": present}
            if not previous and spec.get("optional") and not present:
                row["status"] = "BASELINE_OPTIONAL_ABSENT"; notes.append(row); continue
            if not present: row["status"] = "MISSING"
            elif kind == "fingerprints" and len(present) != 1: row["status"] = "AMBIGUOUS"
            elif not previous: row["status"] = "NEW_CONTRACT"
            elif set(previous) != set(present): row["status"] = "SIGNATURE_CHANGED"
            elif any(baseline["methods"][m]["body"] != snapshot["methods"][m]["body"]
                     or baseline["methods"][m]["flags"] != snapshot["methods"][m]["flags"] for m in present):
                row["status"] = "BODY_CHANGED"
            elif any(baseline["methods"][m].get("callers_hash") != snapshot["methods"][m].get("callers_hash") for m in present):
                row["status"] = "CALLERS_CHANGED"
            else: row["status"] = "UNCHANGED"
            if row["status"] != "UNCHANGED":
                if previous and row["status"] in {"MISSING", "AMBIGUOUS", "SIGNATURE_CHANGED"}:
                    row["candidates_unverified"] = candidates(baseline["methods"][previous[0]], current["methods"])
                row["method_changes"] = []
                for method in set(previous) & set(present):
                    old, new = baseline["methods"][method], snapshot["methods"][method]
                    row["method_changes"].append({"method": method,
                        "removed_calls": sorted(set(old["calls"]) - set(new["calls"])),
                        "added_calls": sorted(set(new["calls"]) - set(old["calls"])),
                        "removed_fields": sorted(set(old["fields"]) - set(new["fields"])),
                        "added_fields": sorted(set(new["fields"]) - set(old["fields"])),
                        "current_callers": new["callers"]})
                findings.append(row)
    tracked = {m for ids in baseline["matches"].values() for m in ids}
    for key, old in baseline["methods"].items():
        if key in tracked: continue
        new = current["methods"].get(key)
        if new is None or old["body"] != new["body"] or old["flags"] != new["flags"]:
            findings.append({"kind": "dependency", "contract": key,
                             "status": "MISSING" if new is None else "BODY_CHANGED"})
    names = set(current["manifest_names"])
    for name in contracts["retained"]:
        if not any(n == name or n.endswith("." + name) for n in names):
            findings.append({"kind": "manifest", "contract": name, "status": "RETAINED_CAPABILITY_MISSING"})
    for key in contracts["config"]["preference_keys"]:
        if key not in current["preference_keys"]: findings.append({"kind": "resource", "contract": key, "status": "PREFERENCE_KEY_MISSING"})
    if (current["artifact"]["certificate_sha1"] != [contracts["certificate_sha1"]]
            or current["artifact"]["certificate_sha1"] != baseline["artifact"]["certificate_sha1"]):
        findings.append({"kind": "certificate", "status": "STOCK_SIGNER_CHANGED", "contract": "RestorePushPatch.kt and PushSignatureSpoof.java"})
    suspicious = re.compile(r"analytics|measurement|crash|bugsnag|tracker|\.ads\.", re.I)
    for name in sorted(names - set(baseline["manifest_names"])):
        if suspicious.search(name): findings.append({"kind": "manifest", "contract": name, "status": "NEW_COLLECTION_COMPONENT_REVIEW"})
    for group, items in contracts["removals"].items():
        for name in items:
            if name not in names: notes.append({"kind": "manifest", "contract": name, "status": "ALREADY_ABSENT", "group": group})
    source_changed = baseline["contracts"]["source_hashes"] != contracts["source_hashes"]
    supported = current["artifact"]["version"] in contracts["supported_versions"]
    if source_changed: findings.append({"kind": "source", "status": "SOURCE_CONTRACTS_CHANGED", "contract": "Review source changes before refreshing the baseline"})
    if not supported: findings.append({"kind": "compatibility", "status": "VERSION_NOT_YET_SUPPORTED", "contract": current["artifact"]["version"]})
    return {"schema": 1, "baseline": baseline["artifact"], "candidate": current["artifact"],
            "static_status": "REVIEW_REQUIRED" if findings else "UNCHANGED_TRACKED_SURFACE",
            "runtime_verified": False, "release_approved": False, "findings": findings, "notes": notes,
            "summary": dict(Counter(item["status"] for item in findings)),
            "limitations": ["Candidate rankings are hints, not validated replacements.",
                            "Reflection is checked by name/arity and baseline prototypes, not Java overload resolution or parameter meaning.",
                            "Method hashes cover local bodies; dependency coverage is two levels of named TickTick calls only.",
                            "Resources cover the tracked preferences and manifest names, not all layouts, metadata values or new trackers.",
                            "For APKM/XAPK, signer verification covers the code-bearing base, not resource split certificates.",
                            "Morphe validation, output assertions and runtime tests remain mandatory."]}


def markdown(report):
    lines = ["# TickTick update check", "", f"**{report['static_status']}**", "",
             f"Baseline: {report['baseline']['version']} → Candidate: {report['candidate']['version']}",
             "", "This is static triage. Runtime verified: **no**. Release approved: **no**.", "",
             "Findings: " + json.dumps(report["summary"], sort_keys=True), "",
             "| Area | Status | Contract / source |", "| --- | --- | --- |"]
    for item in report["findings"][:50]:
        label = (item.get("contract", "") + " " + item.get("source", "")).replace("|", "\\|")
        lines.append(f"| {item['kind']} | {item['status']} | `{label}` |")
    if len(report["findings"]) > 50: lines.extend(["", "First 50 findings shown; the adjacent JSON contains all findings."])
    lines.extend(["", "## Fingerprint candidate hints (unverified)"])
    for item in report["findings"]:
        if item["kind"] != "fingerprints": continue
        for hint in item.get("candidates_unverified", [])[:3]:
            lines.extend(["", f"Unverified candidate ({hint['score']}): `{hint['method']}`",
                          *[f"- Caller: `{caller}`" for caller in hint["callers"]]])
    lines.extend(["", "## Next steps", "", "1. Inspect changed contracts and candidate callers in the stock APK.",
                  "2. Follow the TickTick update guide in BadFella-Patches-Docs; resolve semantics before editing fingerprints.",
                  "3. Build and validate the patch bundle, inspect the actual APK and run runtime gates.",
                  "4. Add compatibility only after the required evidence passes. Publish only when authorized.",
                  "", "## Limits", "", *["- " + x for x in report["limitations"]]])
    return "\n".join(lines) + "\n"


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=["snapshot", "compare"])
    parser.add_argument("apk", type=Path)
    parser.add_argument("--baseline", type=Path)
    parser.add_argument("--out", type=Path, required=True, help="Snapshot JSON or comparison JSON; comparison also writes adjacent Markdown")
    parser.add_argument("--dexlib-jar", type=Path, required=True, help="Morphe Desktop all.jar containing dexlib2; never downloaded")
    parser.add_argument("--build-tools", type=Path, required=True)
    parser.add_argument("--java", default=str(Path(os.environ["JAVA_HOME"]) / "bin/java") if "JAVA_HOME" in os.environ else "java")
    args = parser.parse_args(argv)
    try:
        if args.out.exists() or (args.mode == "compare" and args.out.with_suffix(".md").exists()):
            raise ValueError("Output already exists; choose a new report path to preserve prior evidence")
        contracts = source_contracts()
        baseline = json.loads(args.baseline.read_text()) if args.baseline else None
        if args.mode == "compare" and baseline is None: raise ValueError("compare requires --baseline")
        inventory = inspect_artifact(args.apk.resolve(), contracts, args.java, args.dexlib_jar.resolve(), args.build_tools.resolve(), baseline)
        if args.mode == "snapshot":
            report = capture(inventory, contracts)
            failures = [spec["id"] for spec in contracts["fingerprints"] if len(report["matches"][spec["id"]]) != 1]
            failures += [spec["id"] for spec in contracts["reflection"] if not spec["optional"] and not report["matches"][spec["id"]]]
            if failures: raise ValueError("Baseline has unresolved required contracts: " + ", ".join(failures))
            if inventory["artifact"]["version"] not in contracts["supported_versions"]:
                raise ValueError("Baseline must be an explicitly supported, previously validated stock version")
            self_check = compare(report, inventory, contracts)
            if self_check["findings"]: raise ValueError("Baseline invariant failed: " + json.dumps(self_check["findings"]))
        else: report = compare(baseline, inventory, contracts)
        args.out.parent.mkdir(parents=True, exist_ok=True)
        with args.out.open("x", encoding="utf-8") as output:
            output.write(json.dumps(report, indent=2, sort_keys=True) + "\n")
        if args.mode == "compare":
            with args.out.with_suffix(".md").open("x", encoding="utf-8") as output: output.write(markdown(report))
        print("Saved " + str(args.out) + "; " + (report.get("static_status") or "reviewed stock baseline captured"))
        return 1 if report.get("findings") else 0
    except (ValueError, OSError, KeyError, zipfile.BadZipFile, subprocess.TimeoutExpired) as error:
        print("ERROR: " + str(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
