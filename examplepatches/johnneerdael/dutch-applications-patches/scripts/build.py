"""Run the official template build with an optional local, Git-ignored PAT file."""
from pathlib import Path
import os
import subprocess
import sys

root = Path(__file__).resolve().parents[1]
environment = os.environ.copy()
if not environment.get("GITHUB_TOKEN"):
    for path in [root / ".pat", root.parent / ".pat"]:
        if path.is_file():
            token = path.read_text().strip()
            if not token:
                raise SystemExit("PAT file is empty")
            environment["GITHUB_TOKEN"] = token
            environment.setdefault("GITHUB_ACTOR", "johnneerdael")
            break
arguments = sys.argv[1:] or ["buildAndroid"]
wrapper = "gradlew.bat" if os.name == "nt" else "./gradlew"
raise SystemExit(subprocess.call([wrapper, *arguments], cwd=root, env=environment))
