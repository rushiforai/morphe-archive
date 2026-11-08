"""Disassemble all input DEX files with the installed Android SDK dexdump."""
import argparse
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dexdump", type=Path)
    args = parser.parse_args()
    sdk = Path(os.environ.get("ANDROID_HOME", str(Path(os.environ["LOCALAPPDATA"]) / "Android/Sdk")))
    candidates = sorted((sdk / "build-tools").glob("*/dexdump.exe"))
    tool = args.dexdump or (candidates[-1] if candidates else None)
    if tool is None:
        raise SystemExit("Pass --dexdump PATH or install Android SDK build-tools")
    output = ROOT / "analysis/dexdump"
    output.mkdir(parents=True, exist_ok=True)
    for dex in sorted((ROOT / "analysis/dex").glob("*.dex")):
        # Android's Windows dexdump -o fails fopen on this installation.
        # Direct stdout redirection preserves bytes without PowerShell transcoding.
        with (output / (dex.stem + ".txt")).open("wb") as stream:
            subprocess.run([str(tool), "-d", str(dex)], stdout=stream, check=True)
        print(dex.name, flush=True)


if __name__ == "__main__":
    main()
