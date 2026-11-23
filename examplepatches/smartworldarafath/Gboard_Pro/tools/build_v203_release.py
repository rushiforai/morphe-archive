import os
import shutil
import subprocess
import sys

SDK_BUILD_TOOLS = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\build-tools\35.0.0"
D8_BAT = os.path.join(SDK_BUILD_TOOLS, "d8.bat")
ZIPALIGN_EXE = os.path.join(SDK_BUILD_TOOLS, "zipalign.exe")
APKSIGNER_BAT = os.path.join(SDK_BUILD_TOOLS, "apksigner.bat")
ANDROID_JAR = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\platforms\android-35\android.jar"
KEYSTORE = r"tools\patcher-data\pixelboard.keystore"
KEYSTORE_PASS = "pixelboard"
APKTOOL_JAR = os.path.abspath(r"tools\apktool.jar")

def run_cmd(cmd, desc):
    print(f"\n--- {desc} ---")
    print("Running:", cmd if isinstance(cmd, str) else ' '.join(cmd))
    res = subprocess.run(cmd, shell=isinstance(cmd, str), capture_output=True, text=True)
    if res.stdout:
        print("STDOUT:", res.stdout[:500] + ("..." if len(res.stdout) > 500 else ""))
    if res.stderr:
        print("STDERR:", res.stderr[:500] + ("..." if len(res.stderr) > 500 else ""))
    if res.returncode != 0:
        print(f"FAILED: {desc} (code {res.returncode})")
        sys.exit(res.returncode)
    print(f"SUCCESS: {desc}")

# 1. Compile Java
run_cmd([sys.executable, 'tools/compile_extension.py'], "Compiling Java sources")

# 2. Package JAR
if os.path.exists("build_classes/classes.jar"):
    os.remove("build_classes/classes.jar")
if os.path.exists("build_classes/classes.dex"):
    os.remove("build_classes/classes.dex")
if os.path.exists("build_classes/dex.zip"):
    os.remove("build_classes/dex.zip")

run_cmd('jar cf build_classes/classes.jar -C build_classes com', "Packaging compiled classes to JAR")

# 3. D8 DEX compilation
run_cmd(f'"{D8_BAT}" --output build_classes --lib "{ANDROID_JAR}" --min-api 28 build_classes/classes.jar', "Compiling JAR to DEX with D8")

# 4. Package classes.dex into a zip for apktool disassembly
run_cmd('jar cf build_classes/dex.zip -C build_classes classes.dex', "Packaging classes.dex into dex.zip")

# 5. Decode DEX with apktool to get fresh smali
if os.path.exists("temp_smali"):
    shutil.rmtree("temp_smali", ignore_errors=True)

run_cmd(f'java -jar "{APKTOOL_JAR}" d -f build_classes/dex.zip -o temp_smali', "Baksmaling classes.dex to Smali")

# 6. Merge Smali into temp_decompiled
src_smali = "temp_smali/smali/com/akshaykadam/pixelboard/extension"
dst_smali = "temp_decompiled/smali/com/akshaykadam/pixelboard/extension"

count = 0
for root, dirs, files in os.walk(src_smali):
    rel = os.path.relpath(root, src_smali)
    target_root = os.path.join(dst_smali, rel)
    os.makedirs(target_root, exist_ok=True)
    for f in files:
        if f.endswith('.smali'):
            shutil.copy2(os.path.join(root, f), os.path.join(target_root, f))
            count += 1
print(f"Merged {count} updated smali files into {dst_smali}")

# 7. Build unsigned APK with apktool
os.makedirs("output", exist_ok=True)
unsigned_apk = "output/unsigned_2.0.3.apk"
if os.path.exists(unsigned_apk):
    os.remove(unsigned_apk)

run_cmd(f'java -jar "{APKTOOL_JAR}" b temp_decompiled -o {unsigned_apk}', "Rebuilding APK with apktool")

# 8. Zipalign APK
aligned_apk = "output/aligned_2.0.3.apk"
if os.path.exists(aligned_apk):
    os.remove(aligned_apk)

run_cmd(f'"{ZIPALIGN_EXE}" -p -f -v 4 {unsigned_apk} {aligned_apk}', "Zipaligning APK (4-byte page alignment)")

# 9. Sign APK with apksigner (v2/v3 signing)
final_apk = "output/Gboard_Pro.apk"
if os.path.exists(final_apk):
    os.remove(final_apk)

run_cmd(f'"{APKSIGNER_BAT}" sign --ks "{KEYSTORE}" --ks-pass pass:{KEYSTORE_PASS} --key-pass pass:{KEYSTORE_PASS} --out {final_apk} {aligned_apk}', "Signing APK with apksigner")

# 10. Verify signature
run_cmd(f'"{APKSIGNER_BAT}" verify --verbose {final_apk}', "Verifying APK Signature Scheme")

apk_size = os.path.getsize(final_apk)
print(f"\n==================================================")
print(f"Gboard Pro v2.0.3 (Beta 3.3) BUILD SUCCESS!")
print(f"Final Signed APK: {final_apk} ({apk_size:,} bytes)")
print(f"==================================================")
