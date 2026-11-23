import os
import subprocess

build_dir = "build_classes"
d8_path = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\build-tools\35.0.0\d8.bat"
android_jar = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"
jar_file = os.path.join(build_dir, "classes.jar")

# 1. Package all classes into classes.jar
cmd_jar = ["jar", "cf", jar_file, "-C", build_dir, "com"]
subprocess.run(cmd_jar, check=True)
print(f"Created {jar_file} (size: {os.path.getsize(jar_file)} bytes)")

# 2. Run d8 on the single jar file
dex_file = os.path.join(build_dir, "classes.dex")
if os.path.exists(dex_file):
    os.remove(dex_file)

cmd_d8 = [
    d8_path,
    "--output", build_dir,
    "--lib", android_jar,
    "--min-api", "28",
    jar_file
]

res = subprocess.run(cmd_d8, capture_output=True, text=True)
print("d8 return code:", res.returncode)
if res.stdout:
    print("STDOUT:", res.stdout)
if res.stderr:
    print("STDERR:", res.stderr)

if os.path.exists(dex_file):
    print("classes.dex successfully created! Size:", os.path.getsize(dex_file), "bytes")
