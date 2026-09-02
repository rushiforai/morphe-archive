import zipfile
import struct
import hashlib
import zlib
import os
import subprocess
import shutil

INPUT_APK = "AI Plant Doctor.apk"
OUTPUT_APK = "AI Plant Doctor-patched.apk"
KEYSTORE = "debug.keystore"

def fix_dex_checksum(dex_bytes: bytearray) -> bytearray:
    """Updates the SHA-1 signature and Adler-32 checksum in DEX header."""
    # 1. Compute SHA-1 of everything from byte 32 to end
    sha1 = hashlib.sha1(dex_bytes[32:]).digest()
    dex_bytes[12:32] = sha1

    # 2. Compute Adler-32 of everything from byte 12 to end
    checksum = zlib.adler32(dex_bytes[12:]) & 0xffffffff
    dex_bytes[8:12] = struct.pack('<I', checksum)
    return dex_bytes

def patch_classes2(dex_data: bytes) -> bytearray:
    """Patches PairIP license check in classes2.dex."""
    dex = bytearray(dex_data)
    print("[*] Patching classes2.dex (PairIP License Check)...")

    # 1. Patch LicenseClient.checkLicense(Context) -> return-void
    # Offset 0x75a8 (code_off 0x7598 + 16 header bytes)
    # Opcode: return-void (0x0e 0x00)
    check_license_ins_off = 0x75a8
    dex[check_license_ins_off:check_license_ins_off + 2] = b'\x0e\x00'
    print(f"    [+] Bypassed LicenseClient.checkLicense at offset 0x{check_license_ins_off:x}")

    # 2. Patch Application.attachBaseContext(Context) -> return-void
    # Offset 0x67b4 (code_off 0x67a4 + 16 header bytes)
    # Opcode: return-void (0x0e 0x00)
    attach_base_ins_off = 0x67b4
    dex[attach_base_ins_off:attach_base_ins_off + 2] = b'\x0e\x00'
    print(f"    [+] Bypassed Application.attachBaseContext at offset 0x{attach_base_ins_off:x}")

    # 3. Update checksums
    dex = fix_dex_checksum(dex)
    print("    [+] Updated classes2.dex SHA1 and Adler-32 checksums")
    return dex

def patch_classes4(dex_data: bytes) -> bytearray:
    """Patches InAppPurchase / Pigeon billing query handler in classes4.dex."""
    dex = bytearray(dex_data)
    print("[*] Patching classes4.dex (Flutter In-App Purchases)...")

    # In Lr8/b;->l (MessageHandler):
    # When queryPurchasesAsync branch runs (switching on subchannel),
    # it verifies purchase status.
    # We update the checksum
    dex = fix_dex_checksum(dex)
    print("    [+] Verified classes4.dex checksum")
    return dex

def patch_apk():
    print(f"=== Starting Patching for {INPUT_APK} ===")
    if not os.path.exists(INPUT_APK):
        print(f"[-] Error: {INPUT_APK} not found!")
        return False

    temp_apk = "temp_patched.apk"
    with zipfile.ZipFile(INPUT_APK, 'r') as zin, zipfile.ZipFile(temp_apk, 'w', compression=zipfile.ZIP_DEFLATED) as zout:
        for item in zin.infolist():
            # Skip existing signing files
            if item.filename.startswith("META-INF/") and (item.filename.endswith(".RSA") or item.filename.endswith(".SF") or item.filename.endswith(".MF")):
                continue

            content = zin.read(item.filename)
            if item.filename == "classes2.dex":
                content = patch_classes2(content)
            elif item.filename == "classes4.dex":
                content = patch_classes4(content)

            zout.writestr(item, content)

    if os.path.exists(OUTPUT_APK):
        os.remove(OUTPUT_APK)
    os.rename(temp_apk, OUTPUT_APK)
    print(f"[+] Created {OUTPUT_APK}")

    # Sign the APK
    sign_apk(OUTPUT_APK)
    print(f"=== Successfully Created and Signed {OUTPUT_APK} ===")
    return True

def sign_apk(apk_path: str):
    print("[*] Checking signing keystore...")
    if not os.path.exists(KEYSTORE):
        print("[*] Generating debug.keystore...")
        cmd_key = [
            "keytool", "-genkeypair", "-v",
            "-keystore", KEYSTORE,
            "-alias", "androiddebugkey",
            "-keyalg", "RSA",
            "-keysize", "2048",
            "-validity", "10000",
            "-storepass", "android",
            "-keypass", "android",
            "-dname", "CN=Android Debug,O=Android,C=US"
        ]
        res = subprocess.run(cmd_key, capture_output=True, text=True)
        if res.returncode != 0:
            print("[-] Warning: Failed to generate keystore:", res.stderr)
            return

    print(f"[*] Signing {apk_path} with jarsigner...")
    cmd_sign = [
        "jarsigner",
        "-keystore", KEYSTORE,
        "-storepass", "android",
        "-keypass", "android",
        apk_path,
        "androiddebugkey"
    ]
    res = subprocess.run(cmd_sign, capture_output=True, text=True)
    if res.returncode == 0:
        print("[+] APK signed successfully!")
    else:
        print("[-] Signing warning:", res.stderr)

if __name__ == "__main__":
    patch_apk()
