#!/usr/bin/env python3
"""Checks Steam Link scene libraries against the pose time profiles and prints their hashes.

The layer and the Morphe patch match a scene library by SHA-256 of three code regions, so other
patches may change unrelated bytes of the file. Each region is listed with its file offset and
length; in both supported libraries the executable segment starts at file offset 0, so a
function's virtual address equals its file offset. The two JUMP_SLOT entries the layer rewrites
must resolve to the listed functions.

  python3 -I profiles.py --readelf <ndk>/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-readelf \
      --scene 5001712=<libvrlink_scene.so> --scene 5002363=<libvrlink_scene.so>
"""
import argparse
import hashlib
import pathlib
import subprocess

# state: GetControllerState(QSVLControllerState&, int); send: QSVLClient::SendPoses (identity
# only); submit: SVLDataLink::SubmitMessage(dataset*, bool, bool); clock: the vendor microsecond
# clock whose low 32 bits are the packet header time. *_got: JUMP_SLOTs of state and submit.
PROFILES = {
    "5001712": dict(version="2.0.20", state=(0x1070CC, 0xA78), state_got=0x21BA70,
                    send=(0xF4E74, 0x514), submit=0x15A43C, submit_got=0x21B130, clock=(0x155BF4, 0x40)),
    "5002363": dict(version="2.0.23", state=(0x107D30, 0xA9C), state_got=0x22FB90,
                    send=(0xF4DA4, 0x550), submit=0x16128C, submit_got=0x22F238, clock=(0x15CB78, 0x40)),
    "5002395": dict(version="2.0.24", state=(0x108F88, 0xA9C), state_got=0x232038,
                    send=(0xF5FF4, 0x550), submit=0x1629CC, submit_got=0x2316B8, clock=(0x15E2B8, 0x40)),
}


def check(readelf: str, code: str, path: pathlib.Path) -> dict:
    profile = PROFILES[code]
    data = path.read_bytes()
    first = next(line.split() for line in subprocess.check_output([readelf, "-lW", str(path)], text=True).splitlines()
                 if line.strip().startswith("LOAD"))
    assert int(first[1], 16) == 0 and int(first[2], 16) == 0 and "E" in first[6:-1], f"{code}: executable segment must start at 0"
    relocs = subprocess.check_output([readelf, "-rW", str(path)], text=True).splitlines()
    for got, target in ((profile["state_got"], profile["state"][0]), (profile["submit_got"], profile["submit"])):
        line = next(l for l in relocs if l.startswith(f"{got:016x} "))
        assert "R_AARCH64_JUMP_SLOT" in line and int(line.split()[3], 16) == target, f"{code}: GOT {got:#x} -> {target:#x}"
    result = dict(profile, size=len(data))
    for key in ("state", "send", "clock"):
        offset, length = profile[key]
        result[key + "_sha256"] = hashlib.sha256(data[offset:offset + length]).hexdigest()
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--readelf", required=True)
    parser.add_argument("--scene", action="append", required=True, help="<versionCode>=<libvrlink_scene.so>")
    options = parser.parse_args()
    for item in options.scene:
        code, path = item.split("=", 1)
        result = check(options.readelf, code, pathlib.Path(path))
        print(code, result["version"], f"size={result['size']}")
        for key in ("state", "send", "clock"):
            offset, length = result[key]
            print(f"  {key:5s} {offset:#x}+{length:#x} {result[key + '_sha256']}")
        print(f"  state_got={result['state_got']:#x} submit={result['submit']:#x} submit_got={result['submit_got']:#x}")


if __name__ == "__main__":
    main()
