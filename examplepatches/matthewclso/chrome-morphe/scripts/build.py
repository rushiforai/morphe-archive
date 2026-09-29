#!/usr/bin/env python3
"""Build using local tools without persisting GitHub tokens in the project."""
import os
from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parents[1]
tools = root.parent / "tools"
env = os.environ.copy()
if not env.get("JAVA_HOME"):
    candidates = sorted((tools / "jdk").glob("jdk-*"))
    if not candidates:
        raise SystemExit("Set JAVA_HOME to a JDK 21 installation.")
    env["JAVA_HOME"] = str(candidates[-1])
env.setdefault("ANDROID_HOME", str((tools / "android-sdk-native").resolve()))
if not env.get("GITHUB_TOKEN"):
    env["GITHUB_TOKEN"] = subprocess.check_output(["gh", "auth", "token"], text=True).strip()
if not env.get("GITHUB_ACTOR"):
    env["GITHUB_ACTOR"] = subprocess.check_output(["gh", "api", "user", "--jq", ".login"], text=True).strip()
tasks = sys.argv[1:] or ["buildAndroid"]
raise SystemExit(subprocess.call(["bash", "gradlew", *tasks, "--console=plain"], cwd=root, env=env))
