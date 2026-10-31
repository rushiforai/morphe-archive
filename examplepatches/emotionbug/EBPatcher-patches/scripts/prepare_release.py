#!/usr/bin/env python3
"""Validate a built Morphe bundle and describe its immutable release asset."""
import argparse
import datetime
import hashlib
import json
import pathlib
import re
import zipfile


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--binary", type=pathlib.Path, required=True)
    parser.add_argument("--tag", required=True)
    parser.add_argument("--output", type=pathlib.Path, required=True)
    parser.add_argument("--patch-list", type=pathlib.Path, default=pathlib.Path("patches-list.json"))
    parser.add_argument("--created-at")
    args = parser.parse_args()
    root = pathlib.Path(__file__).resolve().parents[1]
    locked = json.loads((root / "upstream.lock.json").read_text())
    version = args.tag.removeprefix("v")
    if args.tag != "v" + version or not re.fullmatch(r"\d+\.\d+\.\d+(?:-[A-Za-z0-9.-]+)?", version):
        raise SystemExit("Expected a version tag such as v0.3.0")
    if args.binary.name != f"patches-{version}.mpp":
        raise SystemExit("Bundle filename does not match release version")
    with zipfile.ZipFile(args.binary) as archive:
        names = archive.namelist()
        if len(names) != len(set(names)):
            raise SystemExit("Duplicate bundle entry")
        if any(n.startswith("/") or "\\" in n or ".." in pathlib.PurePosixPath(n).parts
               or n.lower().endswith((".apk", ".apkm", ".p12", ".jks", ".litertlm", ".gguf", ".ggml"))
               or (pathlib.PurePosixPath(n).name.startswith("ggml-") and n.lower().endswith(".bin")) for n in names):
            raise SystemExit("Unsafe/private bundle entry")
        manifest = archive.read("META-INF/MANIFEST.MF").decode("utf-8")
        manifest = re.sub(r"\r?\n ", "", manifest)
        fields = dict(line.split(": ", 1) for line in manifest.splitlines() if ": " in line)
        if fields.get("Version") != version or fields.get("Patcher-Version") != locked["morphePatcher"]:
            raise SystemExit("Bundle version or patcher API mismatch")
        if fields.get("Name") != "EBPatcher patches":
            raise SystemExit("Unexpected bundle identity")
        dex_entries = [n for n in names if re.fullmatch(r"classes(?:\d+)?\.dex", n)]
        if not dex_entries or not any(n.endswith(".class") for n in names):
            raise SystemExit("Bundle must contain both Android DEX and JVM classes; build Android LAST")
        for name in dex_entries:
            with archive.open(name) as stream:
                if not stream.read(8).startswith(b"dex\n"):
                    raise SystemExit("Invalid Android patch bytecode")
        for name in ("extensions/music.mpe", "extensions/shared.mpe", "extensions/shared-youtube.mpe",
                     "payload/recorder.dex", "payload/manifest.axml", "payload/THIRD-PARTY-NOTICES.txt",
                     "payload/summary/engine.zip", "payload/summary/engine-files.json", "payload/summary/model.json",
                     "payload/summary/whisper-model.json",
                     "license/EBPATCHER_NOTICE.txt", "license/EBPATCHER_APACHE_2_0.txt"):
            if name not in names or archive.getinfo(name).file_size == 0:
                raise SystemExit(f"Missing executable payload or notice: {name}")
    catalog = json.loads(args.patch_list.read_text())
    if catalog["version"].removeprefix("v") != version:
        raise SystemExit("Stale generated patch list")
    grouped = {"com.skt.prod.dialer": [], "com.google.android.apps.youtube.music": []}
    for patch in catalog["patches"]:
        targets = patch.get("compatiblePackages") or []
        if len(targets) != 1 or targets[0]["packageName"] not in grouped:
            raise SystemExit(f"Unexpected exported patch: {patch['name']}")
        grouped[targets[0]["packageName"]].append(patch)
    music = grouped["com.google.android.apps.youtube.music"]
    if sorted(p["name"] for p in music) != locked["musicPatchNames"]:
        raise SystemExit("YouTube Music stable patch inventory changed or is incomplete")
    if any(p["compatiblePackages"] != locked["musicCompatibility"] for p in music):
        raise SystemExit("Upstream Music target/signer/experimental metadata was changed")
    if len(grouped["com.skt.prod.dialer"]) != 9:
        raise SystemExit("Expected nine ACall patches")
    digest = hashlib.sha256()
    with args.binary.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    created_time = (datetime.datetime.fromisoformat(args.created_at.replace("Z", "+00:00"))
                    if args.created_at else datetime.datetime.now(datetime.timezone.utc))
    if created_time.tzinfo is not None:
        created_time = created_time.astimezone(datetime.timezone.utc)
    # External sources decode this as kotlinx.datetime.LocalDateTime, not Instant.
    created = created_time.replace(tzinfo=None).isoformat(timespec="seconds")
    metadata = {
        "version": version,
        "download_url": f"https://github.com/emotionbug/EBPatcher-patches/releases/download/{args.tag}/{args.binary.name}",
        "created_at": created,
        "description": "EBPatcher patches for Morphe: nine ACall 14.4.0 (14409) patches and 49 editable YouTube Music patches based on Morphe v1.48.0. Recording, native call-history summary persistence, Compose settings entry, banner and privacy hooks match the original APK. Existing Whisper turbo and Gemma E4B models and interactive CPU/noninteractive GPU policy are unchanged. Requires Morphe 2.1.0+ (patcher 2.0.0). Device calls and server acceptance are unverified. Independent EB branding; see release notes and notices.",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(metadata, ensure_ascii=False, indent=2) + "\n")
    checksum = args.binary.with_name(args.binary.name + ".sha256")
    checksum.write_text(f"{digest.hexdigest()}  {args.binary.name}\n")
    print(f"{args.output}: {version}, {args.binary.stat().st_size} bytes, SHA-256 {digest.hexdigest()}, 9 ACall + 49 Music")


if __name__ == "__main__":
    main()
