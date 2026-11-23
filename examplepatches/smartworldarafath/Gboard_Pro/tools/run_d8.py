import os
import subprocess

d8_path = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\build-tools\35.0.0\d8.bat"
android_jar = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"
build_dir = "build_classes"

classes = []
for root, dirs, files in os.walk(build_dir):
    for f in files:
        if f.endswith('.class'):
            classes.append(os.path.join(root, f))

print(f"Running d8 on {len(classes)} classes...")

cmd = [
    d8_path,
    "--output", build_dir,
    "--lib", android_jar,
    "--min-api", "28"
] + classes

res = subprocess.run(cmd, capture_output=True, text=True)
print("d8 return code:", res.returncode)
if res.stdout:
    print("STDOUT:", res.stdout[:500])
if res.stderr:
    print("STDERR:", res.stderr[:500])

dex_file = os.path.join(build_dir, "classes.dex")
if os.path.exists(dex_file):
    print("classes.dex successfully generated! Size:", os.path.getsize(dex_file), "bytes")
else:
    print("Error: classes.dex was NOT generated!")
