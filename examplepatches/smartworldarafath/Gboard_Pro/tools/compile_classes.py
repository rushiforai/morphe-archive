import os
import subprocess
import glob

android_jar = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"
build_dir = "build_classes"
os.makedirs(build_dir, exist_ok=True)

# Collect all java files in extension
java_files = []
for root, dirs, files in os.walk(r"pixelboard-patches\extensions\extension\src\main\java"):
    for f in files:
        if f.endswith(".java"):
            java_files.append(os.path.join(root, f))

print(f"Compiling {len(java_files)} Java files...")

# Write sources list to a file for javac @sources.txt
with open("tools/sources.txt", "w", encoding="utf-8") as f:
    for jf in java_files:
        normalized = jf.replace("\\", "/")
        f.write(f'"{normalized}"\n')

cmd = [
    "javac",
    "-cp", android_jar,
    "-d", build_dir,
    "-source", "17",
    "-target", "17",
    "@tools/sources.txt"
]

res = subprocess.run(cmd, capture_output=True, text=True)
if res.returncode == 0:
    print("Compilation succeeded with zero errors!")
else:
    print("Compilation returned code:", res.returncode)
    print("STDOUT:", res.stdout)
    print("STDERR:", res.stderr)
