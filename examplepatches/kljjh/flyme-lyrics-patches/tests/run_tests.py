"""Run the real add-on runtime against Android boundary doubles (not a Flyme emulator)."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
runtime = ROOT / "extensions/flyme/src/main/java/io/github/kljjh/flymelyrics/FlymeLyrics.java"
work = ROOT / "work"
work.mkdir(exist_ok=True)
with tempfile.TemporaryDirectory(prefix="bridge-tests-", dir=work) as temp:
    sources = [str(p) for p in (ROOT / "tests/android-boundary").rglob("*.java")]
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", temp, str(runtime), *sources], check=True)
    for mode in ([], ["unsupported"]):
        subprocess.run(["java", "-cp", temp, "BridgeTest", *mode], check=True)
