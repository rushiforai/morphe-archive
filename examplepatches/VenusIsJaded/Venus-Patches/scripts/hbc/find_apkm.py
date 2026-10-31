#!/usr/bin/env python3
"""Print the Discord .apkm the developer tools should use, from ~/uploaded_files (or the folder given).

    python3 scripts/hbc/find_apkm.py [folder]       # path of the best APKM
    python3 scripts/hbc/find_apkm.py --list [folder] # every APKM found, and why it was or wasn't picked

Only complete files count: one that opens as a ZIP and has base.apk, so a half-uploaded file is skipped instead of
failing later inside unzip. Among those, an APKM whose info.json is the Discord build Venus supports (versionCode from
AppTarget in DiscordPatches.kt) wins over any other version; ties go to the newest upload. Uploading the same file
twice (Discord.apkm, "Discord (2).apkm") is harmless: either copy is fine.
"""
import json, pathlib, re, sys, zipfile

ROOT = pathlib.Path(__file__).resolve().parents[2]


def supported_code():
    source = (ROOT / "patches/src/main/kotlin/app/venus/patches/DiscordPatches.kt").read_text()
    match = re.search(r"versionCode\s*=\s*(\d+)", source)
    return match.group(1) if match else None


def describe(path):
    """(complete, versionCode or None, release name or None, note)"""
    try:
        with zipfile.ZipFile(path) as z:
            names = set(z.namelist())
            if "base.apk" not in names:
                return False, None, None, "no base.apk"
            info = json.loads(z.read("info.json")) if "info.json" in names else {}
            if info and info.get("pname") not in (None, "com.discord"):
                return False, None, None, f"not Discord ({info.get('pname')})"
            return True, str(info.get("versioncode") or "") or None, info.get("release_version"), ""
    except (zipfile.BadZipFile, OSError, ValueError) as error:
        return False, None, None, f"incomplete ({error.__class__.__name__})"


def main():
    args = [a for a in sys.argv[1:] if a != "--list"]
    folder = pathlib.Path(args[0] if args else pathlib.Path.home() / "uploaded_files")
    want = supported_code()
    found = []
    for path in folder.glob("*.apkm"):
        complete, code, release, note = describe(path)
        found.append((path, complete, code, release, note))
    usable = [f for f in found if f[1]]
    # Supported build first, then newest upload.
    usable.sort(key=lambda f: (f[2] == want, f[0].stat().st_mtime), reverse=True)
    best = usable[0][0] if usable else None
    if "--list" in sys.argv:
        for path, complete, code, release, note in sorted(found, key=lambda f: f[0].name):
            state = "picked" if path == best else ("supported" if code == want else f"other version {release or code}") if complete else note
            print(f"{state:>24}  {path.name}")
        return
    for path, complete, code, release, note in found:
        if not complete:
            print(f"Skipping {path.name}: {note}", file=sys.stderr)
    if best is None:
        sys.exit(f"No complete Discord .apkm in {folder}; pass its path")
    if usable[0][2] != want:
        print(f"Warning: {best.name} is Discord {usable[0][3] or usable[0][2]}, Venus supports versionCode {want}", file=sys.stderr)
    print(best)


if __name__ == "__main__":
    main()
