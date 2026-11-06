import os
import subprocess
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8", errors="backslashreplace")

env = os.environ.copy()
workspace_parent = Path(__file__).resolve().parents[2]
if os.name == "nt":
    env.setdefault("JAVA_HOME", r"C:\Program Files\Android\Android Studio\jbr")
    env["MORPHE_LOCAL_PLUGIN_DIR"] = str(workspace_parent / "morphe-patches-gradle-plugin")
    env["MORPHE_LOCAL_PATCHER_DIR"] = str(workspace_parent / "morphe-patcher")
    env.setdefault("ANDROID_HOME", str(Path.home() / "AppData" / "Local" / "Android" / "Sdk"))
    env.setdefault("ANDROID_SDK_ROOT", env["ANDROID_HOME"])
    env["PATH"] = str(Path(env["JAVA_HOME"]) / "bin") + os.pathsep + env.get("PATH", "")
else:
    env.setdefault("MORPHE_LOCAL_PLUGIN_DIR", str(workspace_parent / "morphe-patches-gradle-plugin"))
    env.setdefault("MORPHE_LOCAL_PATCHER_DIR", str(workspace_parent / "morphe-patcher"))

# Required for a local offline-only settings plugin; never passes real credentials.
env.setdefault("GITHUB_ACTOR", "offline-local-test")
env.setdefault("GITHUB_TOKEN", "offline-no-credentials")

args = sys.argv[1:] or [":patches:test"]
command = ["gradlew.bat" if os.name == "nt" else "./gradlew", *args, "--offline", "--no-daemon"]
result = subprocess.run(command, env=env, capture_output=True, text=True,
                        errors="replace", timeout=295)
print((result.stdout + "\n" + result.stderr)[-12000:])
print(f"Gradle exit: {result.returncode}")
raise SystemExit(result.returncode)
