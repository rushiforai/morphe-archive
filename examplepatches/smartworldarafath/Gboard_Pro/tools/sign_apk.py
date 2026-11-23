import os
import subprocess

build_tools = r"C:\Users\HP Omnibook X Flip\AppData\Local\Android\Sdk\build-tools\35.0.0"
zipalign = os.path.join(build_tools, "zipalign.exe")
apksigner = os.path.join(build_tools, "apksigner.bat")

unsigned_apk = "output/unsigned.apk"
aligned_apk = "output/aligned.apk"
final_apk = "output/Gboard_Pro.apk"
keystore = "tools/patcher-data/pixelboard.keystore"

if os.path.exists(aligned_apk):
    os.remove(aligned_apk)
if os.path.exists(final_apk):
    os.remove(final_apk)

# 1. Zipalign
print("Running zipalign...")
cmd_align = [zipalign, "-p", "-f", "4", unsigned_apk, aligned_apk]
res_align = subprocess.run(cmd_align, capture_output=True, text=True)
print("Zipalign return code:", res_align.returncode)
if res_align.stderr:
    print("Zipalign error:", res_align.stderr)

# 2. Sign
print("Signing APK...")
cmd_sign = [
    apksigner, "sign",
    "--ks", keystore,
    "--ks-pass", "pass:pixelboard",
    "--ks-key-alias", "pixelboard",
    "--key-pass", "pass:pixelboard",
    "--out", final_apk,
    aligned_apk
]
res_sign = subprocess.run(cmd_sign, capture_output=True, text=True)
print("Apksigner return code:", res_sign.returncode)
if res_sign.stdout:
    print("Apksigner stdout:", res_sign.stdout)
if res_sign.stderr:
    print("Apksigner error:", res_sign.stderr)

# 3. Verify
print("Verifying APK...")
cmd_verify = [apksigner, "verify", "--verbose", final_apk]
res_verify = subprocess.run(cmd_verify, capture_output=True, text=True)
print("Apksigner verify return code:", res_verify.returncode)
for line in res_verify.stdout.split("\n")[:10]:
    print(line)

if os.path.exists(final_apk):
    print("FINAL APK READY! Size:", os.path.getsize(final_apk), "bytes")
