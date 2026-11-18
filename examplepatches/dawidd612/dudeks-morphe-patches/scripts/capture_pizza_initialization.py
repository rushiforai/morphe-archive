"""Capture initialization on an already installed ORIGINAL disposable test app.

No app data is cleared, no credentials are entered, and no gameplay is performed.
Use only a disposable emulator: this force-stops and instruments the app twice.
APKs, captures, system libraries and raw diagnostics stay outside Git.
Requires matching Frida client/server, pyelftools and the verified Morphe CLI.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import threading
import time
import zipfile

import frida
from elftools.elf.elffile import ELFFile

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = "com.tapblaze.pizzabusiness"

AGENT = r"""
const segments = __SEGMENTS__;
const holders = __HOLDERS__;
const header = __HEADER__;
let captured = false;
function maps() { return File.readAllText('/proc/self/maps'); }
function nativeBase(text) {
  // APK-backed mappings use APK file offsets, not ELF offsets. Match the exact
  // original ELF header instead of subtracting an APK offset from its address.
  for (const row of text.split('\n')) {
    const a = row.trim().split(/\s+/);
    if (a.length < 5 || !a[1].startsWith('r')) continue;
    const start = ptr('0x' + a[0].split('-')[0]);
    try {
      const bytes = new Uint8Array(start.readByteArray(header.length));
      if (header.every((v, i) => bytes[i] === v)) return start;
    } catch (_) {}
  }
  return null;
}
function dump(base, prefix) {
  for (let i = 0; i < segments.length; i++) {
    const s = segments[i];
    for (let offset = 0; offset < s.p_filesz; offset += 1024 * 1024) {
      const count = Math.min(1024 * 1024, s.p_filesz - offset);
      send({kind: 'dump', name: prefix + '-' + i, bytes: s.p_filesz, offset: offset},
        base.add(s.p_vaddr + offset).readByteArray(count));
    }
  }
}
function strings() {
  const out = {};
  for (const owner of holders) {
    const c = Java.use(owner.slice(1, -1).replace(/\//g, '.'));
    const row = {};
    for (const f of c.class.getDeclaredFields()) {
      f.setAccessible(true);
      const v = f.get(null);
      if (v === null) throw new Error('Uninitialized captured field: ' + owner + '->' + f.getName());
      row[f.getName().toString()] = v.toString();
    }
    out[owner] = row;
  }
  send({kind: 'strings', values: out});
}
Java.perform(function () {
  const VM = Java.use('com.pairip.VMRunner');
  const invoke = VM.invoke.overload('java.lang.String', '[Ljava.lang.Object;');
  invoke.implementation = function (name, args) {
    const m = maps(), base = nativeBase(m);
    let take = base !== null && !captured;
    send({kind: 'invoke', program: String(name), nativeBase: base === null ? null : base.toString()});
    if (take) {
      captured = true;
      send({kind: 'native-base', base: base.toString()});
      send({kind: 'all-maps', maps: m});
      try { dump(base, 'native-before'); }
      catch (e) { send({kind: 'capture-error', stage: 'before', error: String(e)}); take = false; }
    }
    const result = invoke.call(this, name, args);
    if (take) {
      try {
        dump(base, 'native-after');
        strings();
        send({kind: 'native-complete'});
      } catch (e) { send({kind: 'capture-error', stage: 'after', error: String(e)}); }
    }
    return result;
  };
  send({kind: 'ready-vm'});
});
"""


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--morphe-cli", required=True, type=Path)
    parser.add_argument("--serial", required=True)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    adb = ["adb", "-s", args.serial]

    def run(*command, timeout=60):
        return subprocess.run(command, check=True, capture_output=True, text=True, timeout=timeout).stdout

    # Verify the installed package matches the input before instrumentation.
    with tempfile.TemporaryDirectory() as temp:
        base = Path(temp) / "base.apk"
        native = None
        with zipfile.ZipFile(args.input) as bundle:
            for entry in bundle.infolist():
                if not entry.filename.endswith(".apk"):
                    continue
                split = Path(temp) / "split.apk"
                split.write_bytes(bundle.read(entry))
                with zipfile.ZipFile(split) as archive:
                    if "classes.dex" in archive.namelist():
                        base.write_bytes(split.read_bytes())
                    name = "lib/arm64-v8a/libcocos2dcpp.so"
                    if name in archive.namelist():
                        native = archive.read(name)
        if not base.exists() or native is None:
            raise ValueError("Complete base and ARM64 input required")
        run("javac", "-cp", str(args.morphe_cli), "-d", temp,
            str(ROOT / "scripts/InspectPizzaUpdate.java"))
        info = json.loads(run("java", "-cp", temp + os.pathsep + str(args.morphe_cli),
                              "InspectPizzaUpdate", str(base)))
        installed = run(*adb, "shell", "dumpsys", "package", PACKAGE)
        if f"versionName={info['version']}" not in installed or f"versionCode={info['version_code']} " not in installed:
            raise ValueError("Installed manifest does not match the inspected original input")
        (out / "input.json").write_text(json.dumps(info, indent=2))
        (out / "libcocos2dcpp.so").write_bytes(native)
    with (out / "libcocos2dcpp.so").open("rb") as source:
        elf = ELFFile(source)
        if elf["e_machine"] != "EM_AARCH64":
            raise ValueError("ARM64 library required")
        segments = [dict(s.header) for s in elf.iter_segments() if s["p_type"] == "PT_LOAD"]
        if segments[0]["p_offset"] != 0 or segments[0]["p_vaddr"] != 0:
            raise ValueError("ELF header mapping needs explicit review")
    script_source = (AGENT.replace("__SEGMENTS__", json.dumps(segments))
                     .replace("__HOLDERS__", json.dumps(info["string_holder_classes"]))
                     .replace("__HEADER__", json.dumps(list(native[:256]))))
    run(*adb, "forward", "tcp:27042", "tcp:27042")
    device = frida.get_device_manager().add_remote_device("127.0.0.1:27042")
    for label in ("first", "second"):
        run(*adb, "shell", "am", "force-stop", PACKAGE)
        done = threading.Event()
        failure = []
        print(f"{label}: spawning original package", flush=True)
        pid = device.spawn([PACKAGE])
        session = device.attach(pid)
        print(f"{label}: attached; loading VM observer", flush=True)
        with (out / f"capture-{label}.jsonl").open("w") as log:
            def message(item, data):
                log.write(json.dumps(item, ensure_ascii=False) + "\n")
                log.flush()
                p = item.get("payload", {})
                if item.get("type") == "error":
                    failure.append(item.get("description", "Agent error"))
                    done.set()
                if p.get("kind") == "capture-error":
                    failure.append(p.get("stage", "") + ": " + p.get("error", "Capture failed"))
                    done.set()
                if p.get("kind") == "dump":
                    target = out / f"{p['name']}-{label}.bin"
                    offset = p["offset"]
                    expected = min(1024 * 1024, p["bytes"] - offset)
                    if data is None or len(data) != expected or (target.stat().st_size if target.exists() else 0) != offset:
                        failure.append("Truncated or out-of-order native segment")
                        done.set()
                    else:
                        with target.open("ab") as destination:
                            destination.write(data)
                elif p.get("kind") == "strings":
                    (out / f"string-values-{label}.json").write_text(
                        json.dumps(p["values"], ensure_ascii=False, sort_keys=True))
                elif p.get("kind") == "native-complete":
                    done.set()
            agent = session.create_script(script_source)
            agent.on("message", message)
            try:
                agent.load()
                print(f"{label}: observer loaded; resuming app", flush=True)
                device.resume(pid)
                if not done.wait(180):
                    raise TimeoutError("No completed native initialization capture")
                if failure:
                    raise ValueError("; ".join(failure))
                for index, segment in enumerate(segments):
                    for prefix in ("native-before", "native-after"):
                        if (out / f"{prefix}-{index}-{label}.bin").stat().st_size != segment["p_filesz"]:
                            raise ValueError("Incomplete native capture")
                print(f"Captured {label}: {len(segments)} complete native segments", flush=True)
            finally:
                session.detach()
        time.sleep(1)
    a = (out / "string-values-first.json").read_bytes()
    if a != (out / "string-values-second.json").read_bytes():
        raise ValueError("Independent string snapshots differ")
    values = json.loads(a)
    if sum(len(row) for row in values.values()) != info["uninitialized_strings"]:
        raise ValueError("Captured string count differs from inspected input")
    paths = set()
    bases = []
    for label in ("first", "second"):
        items = [json.loads(line).get("payload", {}) for line in (out / f"capture-{label}.jsonl").read_text().splitlines()]
        base = {p["base"] for p in items if p.get("kind") == "native-base"}
        if len(base) != 1:
            raise ValueError("Expected exactly one native base")
        bases.extend(base)
        mapping = next(p["maps"] for p in items if p.get("kind") == "all-maps")
        for row in mapping.splitlines():
            parts = row.split()
            if len(parts) >= 6 and "/arm64/" in parts[-1] and parts[-1].endswith(".so"):
                paths.add(parts[-1])
    if bases[0] == bases[1]:
        raise ValueError("Independent captures must have distinct ASLR bases")
    system = out / "system-arm64"
    system.mkdir(exist_ok=True)
    for path in sorted(paths):
        run(*adb, "pull", path, str(system / Path(path).name))
    hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in system.iterdir()}
    (out / "system-hashes.json").write_text(json.dumps(hashes, indent=2))
    (out / "capture-status.json").write_text(json.dumps({
        "status": "captured_not_yet_reconstructed_or_runtime_verified",
        "native_sha256": hashlib.sha256(native).hexdigest(), "strings": info["uninitialized_strings"],
        "bases": bases, "system_libraries": len(hashes)}, indent=2))
    print("Two independent captures complete; reconstruction and runtime validation remain required.")


if __name__ == "__main__":
    main()
