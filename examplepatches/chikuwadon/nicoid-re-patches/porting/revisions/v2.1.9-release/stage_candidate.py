#!/usr/bin/env python3
"""Rebuild the reviewed dev.7 payload and promote only its version."""
import argparse
from copy import copy
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
REVIEWED = HERE.parent / "v2.1.9-dev.7"
DEV = b"2.1.9-dev.7"
STABLE = b"2.1.9"
MANIFEST = "META-INF/MANIFEST.MF"
PINNED = {
    "stage_verified.py": "5329e192ce3dbb2f79f6e07d899fa429860de5359d6435b377ad156cb6348daf",
    "approved-layout.json": "7c363a24feb86bd9d9ffa6de0edf6f95b6d2d278cd3dcb431bdb7317b221346a",
    "approved-manifest.txt": "6c2ecf3c8409c2713fd26d343a8c4846d0b3552d3377bd204d1bb9cf0673b241",
    "helpers.mpe.diff": "9cef7b348ee2ed56ec3df20a545226fdb9e3fa6617c25ba08967ace98cc0b140",
    "extension.mpe.diff": "44f6e50ac899439eda0398cec1e30ed9a38d2debaf80a214e9cc404d31660d68",
    "method-delta.dex.diff": "67fdf2dd0e30e727b036710a9153c7b4309b951d7064472f99985d5d94f32a46",
    "runtime-dependencies.lock.json": "ee65054e315335b506bc6a4db26f4d1c5b101f11224192d7e1632f3ac1afcf93",
}
STABLE_SMALI = {
    "helpers.mpe": (7688, "b3d566aa0df60da29c7307773fbf828fba6f6fc596365e93b532cc3692343d54"),
    "extension.mpe": (2015, "c5a85474cb60b8c0476b2f8ec4cf43cf1e5deb02800253f6b19c85e0f37dbc68"),
    "method-delta.dex": (160, "d63f4d221efb63c90c15f05c39ad51a66d886d6636ded868520fe46bd9845f36"),
}
CHANGES = {
    "helpers.mpe": {"e/e/a/ModernShorts.smali": 2, "e/e/a/PatchVersion237.smali": 1},
    "extension.mpe": {"e/e/a/ModernShorts.smali": 2},
    "method-delta.dex": {},
}

def require(ok, message):
    if not ok:
        raise ValueError(message)

def digest(data):
    return hashlib.sha256(data).hexdigest()

def verify_inputs():
    for name, sha in PINNED.items():
        require(digest((REVIEWED / name).read_bytes()) == sha, "Reviewed input changed: " + name)
    for name, sha in {
        "porting/revisions/v2.0.0-dev.1/tool-dependencies.lock.json": "070100b5ce951087cbea28a99eada6d9edf0cd6dabfcdc748d15c06f29488f78",
        "porting/revisions/v2.1.0-release/prepare_smali_tools.py": "3b90e3c2d1ddf9ea0b357958029010610d88746bc8f8cf0a6fed7bd3c47fe880",
    }.items():
        require(digest((ROOT / name).read_bytes()) == sha, "Reviewed tool source changed: " + name)

def load_reviewed():
    verify_inputs()
    spec = importlib.util.spec_from_file_location("reviewed_219_dev7", REVIEWED / "stage_verified.py")
    require(spec is not None and spec.loader is not None, "Cannot load reviewed staging")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

def tree_hash(root):
    h = hashlib.sha256()
    files = sorted((p.relative_to(root).as_posix(), p) for p in root.rglob("*.smali"))
    for name, path in files:
        h.update(name.encode() + b"\0" + hashlib.sha256(path.read_bytes()).digest())
    return len(files), h.hexdigest()

def toolchain(mod, tools):
    root = ROOT / "porting/revisions/v2.0.0-dev.1"
    if tools is None:
        tools = root / "tools"
        if not all((tools / name).is_file() for name in (*mod.TOOL_PATHS, "guava.jar")):
            mod.run(sys.executable, ROOT / "porting/revisions/v2.1.0-release/prepare_smali_tools.py")
    lock = {x["path"]: x["sha256"] for x in json.loads((root / "tool-dependencies.lock.json").read_text())}
    jars = [str(mod.verified_file(tools / name, lock["tools/" + name]))
            for name in (*mod.TOOL_PATHS, "guava.jar")]
    return ["java", "-Xmx2g", "-cp", os.pathsep.join(jars)]

def promote(candidate, output, tools=None):
    mod = load_reviewed()
    java = toolchain(mod, tools)
    layout = json.loads((REVIEWED / "approved-layout.json").read_text())
    approved = {x["name"]: x for x in layout["members"]}
    output.parent.mkdir(parents=True, exist_ok=True)
    require(candidate.resolve() != output.resolve(), "Input and output must differ")
    with TemporaryDirectory(prefix="nicoid-219-stable-") as tmp, ZipFile(candidate) as old:
        work = Path(tmp)
        require(old.testzip() is None and len(old.namelist()) == len(approved)
                and set(old.namelist()) == set(approved), "Unexpected candidate ZIP")
        for name in approved:
            if name not in mod.MEMBERS.values():
                require(digest(old.read(name)) == approved[name]["sha256"], "Unreviewed member: " + name)
        payload = {}
        for name, member in mod.MEMBERS.items():
            dex = work / name
            dex.write_bytes(old.read(member))
            mod.check_dex(dex.read_bytes(), member)
            smali = work / (name + ".smali")
            mod.run(*java, "org.jf.baksmali.Main", "disassemble", "--sequential-labels", dex, "-o", smali)
            mod.check_tree(smali, name)
            actual = {}
            for path in smali.rglob("*.smali"):
                data = path.read_bytes()
                count = data.count(DEV)
                if count:
                    actual[path.relative_to(smali).as_posix()] = count
                    path.write_bytes(data.replace(DEV, STABLE))
            require(actual == CHANGES[name], "Unexpected version markers: " + name)
            require(tree_hash(smali) == STABLE_SMALI[name], "Stable source equivalence failure: " + name)
            if actual:
                rebuilt = work / (name + ".stable")
                mod.run(*java, "org.jf.smali.Main", "assemble", "-a", "28", smali, "-o", rebuilt)
                checked = work / (name + ".checked")
                mod.run(*java, "org.jf.baksmali.Main", "disassemble", "--sequential-labels", rebuilt, "-o", checked)
                require(tree_hash(checked) == STABLE_SMALI[name], "Stable DEX equivalence failure: " + name)
                data = rebuilt.read_bytes()
                mod.check_dex(data, member)
                payload[member] = data
        manifest = old.read(MANIFEST)
        require(manifest.count(b"Version: " + DEV + b"\r\n") == 1, "Wrong reviewed version")
        payload[MANIFEST] = manifest.replace(b"Version: " + DEV + b"\r\n", b"Version: " + STABLE + b"\r\n")
        tmpout = output.with_name(output.name + ".staging")
        try:
            with ZipFile(tmpout, "w") as new:
                for info in old.infolist():
                    new.writestr(copy(info), payload.get(info.filename, old.read(info)))
            with ZipFile(tmpout) as new:
                require(new.testzip() is None and new.namelist() == old.namelist(), "Invalid staged ZIP")
                require(all(new.read(n) == old.read(n) for n in old.namelist()
                            if n not in payload), "Unchanged package member differs")
            sys.path.insert(0, str(ROOT / ".github/scripts"))
            from verify_android_mpp import validate_mpp
            validate_mpp(tmpout, STABLE.decode())
            tmpout.replace(output)
        finally:
            tmpout.unlink(missing_ok=True)
    print("PASS: reviewed runtime classes match except exact version literals; all other members unchanged")
    print("Stable MPP SHA-256:", digest(output.read_bytes()))

def stage(compiled, output):
    mod = load_reviewed()
    with TemporaryDirectory(prefix="nicoid-219-rebuild-") as tmp:
        work = Path(tmp)
        dev_compiled = work / "compiled-dev7.mpp"
        with ZipFile(compiled) as old, ZipFile(dev_compiled, "w") as new:
            require(old.testzip() is None, "Invalid compiled MPP")
            for info in old.infolist():
                data = old.read(info)
                if info.filename == MANIFEST:
                    require(data.count(b"Version: " + STABLE + b"\r\n") == 1, "Wrong compiled stable version")
                    data = data.replace(b"Version: " + STABLE + b"\r\n", b"Version: " + DEV + b"\r\n")
                new.writestr(copy(info), data)
        candidate = work / "reviewed-dev7.mpp"
        mod.stage(dev_compiled, candidate)
        promote(candidate, output)

if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    group = p.add_mutually_exclusive_group(required=True)
    group.add_argument("--compiled", type=Path)
    group.add_argument("--candidate", type=Path)
    p.add_argument("--output", required=True, type=Path)
    p.add_argument("--tools", type=Path)
    a = p.parse_args()
    if a.compiled:
        require(a.tools is None, "Custom tools not permitted for official rebuild")
        stage(a.compiled.resolve(), a.output.resolve())
    else:
        promote(a.candidate.resolve(), a.output.resolve(), a.tools and a.tools.resolve())
