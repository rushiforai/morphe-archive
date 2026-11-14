#!/usr/bin/env python3
"""
Lusted Patches - Universal App Decompiler Helper
Author: lustx
Project: lusted-patches

Purpose:
  Batch-decompiles Android app packages (.apk, .apks, .xapk, .apkm, .aab, .zip)
  into unified readable Java/Kotlin sources (via JADX) and disassembled Smali
  bytecode / decoded Android resources (via Apktool) for reverse engineering
  and authoring custom Morphe patches.

Supported Formats:
  - .apk   : Standard standalone Android package.
  - .apks  : Split APKs / APK set bundle (bundletool / SAI).
  - .xapk  : APKPure bundle (split APKs + manifest.json + optional OBB).
  - .apkm  : APKMirror bundle (split APKs + info.json).
  - .aab   : Android App Bundle.
  - .zip   : Generic archive containing split APKs or a packaged APK.

Workflow:
  1. Scans 'apks/in/' for all supported app files and processes them all at once.
  2. Unpacks split bundles (.apks, .xapk, .apkm, .zip) to extract all APK splits.
  3. Identifies the base APK and all configuration/feature splits.
  4. Feeds all code-bearing APKs to JADX for a unified Java source tree in 'apks/out/<app>/sources/'.
  5. Decodes base & feature resources and Smali bytecode in 'apks/out/<app>/smali_res/'.
  6. Preserves extracted split APKs in 'apks/out/<app>/splits/' for patch inspection.
  7. Generates comprehensive metadata summary in 'apks/out/<app>/apk_info.json'.
  8. Upon successful decompilation and verification, deletes the input file from 'apks/in/'.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.request
import zipfile
from pathlib import Path

# Paths relative to repository root
ROOT_DIR = Path(__file__).resolve().parent.parent
APKS_IN_DIR = ROOT_DIR / "apks" / "in"
APKS_OUT_DIR = ROOT_DIR / "apks" / "out"
TOOLS_DIR = ROOT_DIR / "tools"
APKTOOL_JAR = TOOLS_DIR / "apktool" / "apktool.jar"
JADX_BAT = TOOLS_DIR / "jadx" / "bin" / ("jadx.bat" if os.name == "nt" else "jadx")

APKTOOL_URL = "https://github.com/iBotPeaches/Apktool/releases/download/v3.0.3/apktool_3.0.3.jar"
JADX_URL = "https://github.com/skylot/jadx/releases/download/v1.5.6/jadx-1.5.6.zip"

SUPPORTED_EXTENSIONS = {".apk", ".apks", ".xapk", ".apkm", ".aab", ".zip"}


def print_banner():
    banner = r"""
===========================================================
  🧩 LUSTED PATCHES - APP DECOMPILATION HELPER (by lustx)
     Supports: .apk, .apks, .xapk, .apkm, .aab, .zip
===========================================================
"""
    print(banner.strip())
    print()


def ensure_tools():
    """Ensure Apktool and JADX are installed and ready."""
    TOOLS_DIR.mkdir(parents=True, exist_ok=True)
    (TOOLS_DIR / "apktool").mkdir(parents=True, exist_ok=True)
    (TOOLS_DIR / "jadx").mkdir(parents=True, exist_ok=True)

    # Check Apktool
    if not APKTOOL_JAR.exists():
        print(f"[*] Apktool not found. Downloading from {APKTOOL_URL}...")
        req = urllib.request.Request(APKTOOL_URL, headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(req) as resp, open(APKTOOL_JAR, "wb") as f:
            shutil.copyfileobj(resp, f)
        print(f"[+] Apktool installed successfully to {APKTOOL_JAR}")

    # Check JADX
    if not JADX_BAT.exists():
        print(f"[*] JADX not found. Downloading from {JADX_URL}...")
        zip_path = TOOLS_DIR / "jadx_temp.zip"
        req = urllib.request.Request(JADX_URL, headers={"User-Agent": "Mozilla/5.0"})
        with urllib.request.urlopen(req) as resp, open(zip_path, "wb") as f:
            shutil.copyfileobj(resp, f)
        print("[*] Extracting JADX...")
        with zipfile.ZipFile(zip_path, "r") as zf:
            zf.extractall(TOOLS_DIR / "jadx")
        if zip_path.exists():
            zip_path.unlink()
        if os.name != "nt":
            JADX_BAT.chmod(0o755)
        print(f"[+] JADX installed successfully to {JADX_BAT}")


def find_java():
    """Locate java binary."""
    java_cmd = shutil.which("java")
    if not java_cmd:
        raise RuntimeError("Java executable not found on PATH. Please install Java (JDK 17 or newer).")
    return java_cmd


def extract_apktool_metadata(apktool_dir: Path) -> dict:
    """Extract metadata from apktool.yml without external dependencies."""
    yml_path = apktool_dir / "apktool.yml"
    meta = {}
    if not yml_path.exists():
        return meta

    try:
        content = yml_path.read_text(encoding="utf-8", errors="ignore")
        pkg_match = re.search(r"package:\s*['\"]?([^\r\n'\"]+)", content)
        if pkg_match:
            meta["package_name"] = pkg_match.group(1).strip()
        version_code_match = re.search(r"versionCode:\s*['\"]?([^\r\n'\"]+)", content)
        if version_code_match:
            meta["version_code"] = version_code_match.group(1).strip()
        version_name_match = re.search(r"versionName:\s*['\"]?([^\r\n'\"]+)", content)
        if version_name_match:
            meta["version_name"] = version_name_match.group(1).strip()
        min_sdk_match = re.search(r"minSdkVersion:\s*['\"]?([^\r\n'\"]+)", content)
        if min_sdk_match:
            meta["min_sdk"] = min_sdk_match.group(1).strip()
        target_sdk_match = re.search(r"targetSdkVersion:\s*['\"]?([^\r\n'\"]+)", content)
        if target_sdk_match:
            meta["target_sdk"] = target_sdk_match.group(1).strip()
    except Exception as e:
        meta["meta_error"] = str(e)

    return meta


def apk_has_dex(apk_path: Path) -> bool:
    """Check if an APK file contains any classes*.dex files."""
    try:
        with zipfile.ZipFile(apk_path, "r") as z:
            return any(name.lower().endswith(".dex") for name in z.namelist())
    except Exception:
        return False


def inspect_archive(archive_path: Path):
    """
    Inspects a ZIP/bundle archive (.apks, .xapk, .apkm, .zip, .aab).
    Returns (is_bundle_with_apks, is_direct_apk, inner_apk_names).
    """
    if not zipfile.is_zipfile(archive_path):
        return False, False, []

    with zipfile.ZipFile(archive_path, "r") as z:
        names = z.namelist()
        apks = [n for n in names if n.lower().endswith(".apk") and not n.startswith("__MACOSX")]
        has_dex = any(n.lower().startswith("classes") and n.lower().endswith(".dex") for n in names)
        has_manifest = "AndroidManifest.xml" in names

    is_bundle_with_apks = len(apks) > 0
    is_direct_apk = (has_dex and has_manifest) or archive_path.suffix.lower() == ".apk"
    return is_bundle_with_apks, is_direct_apk, apks


def select_base_apk(apk_paths: list[Path]) -> Path:
    """Select the primary/base APK from a list of split APKs."""
    if len(apk_paths) == 1:
        return apk_paths[0]

    # 1. Look for explicit 'base' naming
    for apk in apk_paths:
        name_lower = apk.stem.lower()
        if name_lower in ("base", "base-master", "standalone") or name_lower.startswith("base-"):
            return apk

    # 2. Look for APK that does not have 'config.' or 'split_' in name
    non_splits = [a for a in apk_paths if not any(k in a.stem.lower() for k in ("config.", "split_"))]
    if len(non_splits) == 1:
        return non_splits[0]

    # 3. Fallback: Choose largest APK by file size (base contains majority of dex/resources)
    return max(apk_paths, key=lambda a: a.stat().st_size)


def decompile_app(input_path: Path, output_base: Path, keep_input: bool = False,
                  java_only: bool = False, smali_only: bool = False) -> bool:
    """
    Decompiles any supported app package (.apk, .apks, .xapk, .apkm, .aab, .zip)
    into readable Java sources and Smali/resources, then removes input file upon finish.
    """
    stem = input_path.stem
    ext = input_path.suffix.lower()
    target_out = output_base / stem
    sources_out = target_out / "sources"
    smali_res_out = target_out / "smali_res"
    splits_storage_out = target_out / "splits"

    print(f"\n{'=' * 65}")
    print(f"📦 Processing: {input_path.name}")
    print(f"   Format: {ext.upper()} | Size: {input_path.stat().st_size / (1024 * 1024):.2f} MB")
    print(f"   Destination: {target_out}")
    print(f"{'=' * 65}")

    start_time = time.time()
    target_out.mkdir(parents=True, exist_ok=True)

    temp_extract_dir = None
    all_apk_paths: list[Path] = []
    base_apk_path: Path = None
    extra_bundle_metadata: dict = {}

    try:
        # Step 1: Detect package format and extract if bundle
        if ext == ".apk":
            all_apk_paths = [input_path]
            base_apk_path = input_path
        else:
            is_bundle, is_direct, inner_apks = inspect_archive(input_path)

            if is_bundle:
                print(f"[*] Detected split package bundle containing {len(inner_apks)} inner APK(s).")
                temp_extract_dir = Path(tempfile.mkdtemp(prefix=f"split_{stem}_"))
                with zipfile.ZipFile(input_path, "r") as z:
                    z.extractall(temp_extract_dir)

                # Collect all extracted APKs
                all_apk_paths = sorted(list(temp_extract_dir.rglob("*.apk")), key=lambda p: p.name)
                if not all_apk_paths:
                    print("❌ Error: No APK files found inside bundle archive.")
                    return False

                base_apk_path = select_base_apk(all_apk_paths)
                print(f"   🎯 Base APK: {base_apk_path.name} ({base_apk_path.stat().st_size / (1024 * 1024):.2f} MB)")
                
                # Copy raw split APKs to target_out/splits/ so patch devs have easy access to the splits
                splits_storage_out.mkdir(parents=True, exist_ok=True)
                for apk in all_apk_paths:
                    shutil.copy2(apk, splits_storage_out / apk.name)
                print(f"   💾 Preserved {len(all_apk_paths)} extracted APK split(s) in {splits_storage_out.name}/")

                # Check for bundle manifest or info files
                xapk_manifest = temp_extract_dir / "manifest.json"
                if xapk_manifest.exists():
                    try:
                        extra_bundle_metadata["xapk_manifest"] = json.loads(xapk_manifest.read_text(encoding="utf-8"))
                        shutil.copy2(xapk_manifest, target_out / "manifest.json")
                    except Exception:
                        pass

                apkm_info = temp_extract_dir / "info.json"
                if apkm_info.exists():
                    try:
                        extra_bundle_metadata["apkm_info"] = json.loads(apkm_info.read_text(encoding="utf-8"))
                        shutil.copy2(apkm_info, target_out / "info.json")
                    except Exception:
                        pass

                # Check for OBB files in XAPK
                obb_dirs = list(temp_extract_dir.rglob("*.obb"))
                if obb_dirs:
                    obb_out = target_out / "obb"
                    obb_out.mkdir(parents=True, exist_ok=True)
                    for obb in obb_dirs:
                        shutil.copy2(obb, obb_out / obb.name)
                    print(f"   💾 Extracted {len(obb_dirs)} OBB data file(s) to {obb_out}")

            elif is_direct or ext == ".aab":
                print(f"[*] Package contains direct code/manifest (treating as single application package).")
                all_apk_paths = [input_path]
                base_apk_path = input_path
            else:
                print(f"❌ Error: {input_path.name} does not appear to contain Android bytecode or APKs.")
                return False

        java_success = False
        smali_success = False

        # Step 2: Java Decompilation with JADX
        if not smali_only:
            print("[1/2] ☕ Decompiling Java/Kotlin source code with JADX...")
            sources_out.mkdir(parents=True, exist_ok=True)

            # Pass base and all splits containing DEX to JADX for complete unified sources
            code_apks = [a for a in all_apk_paths if a == base_apk_path or apk_has_dex(a)]
            jadx_cmd = [
                str(JADX_BAT),
                "-d", str(sources_out),
                "--show-bad-code",
                "--no-res",
                "--log-level", "error"
            ]
            for apk in code_apks:
                jadx_cmd.append(str(apk))

            try:
                res = subprocess.run(jadx_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
                java_count = sum(1 for _ in sources_out.rglob("*.java"))
                if res.returncode == 0 or java_count > 0:
                    print(f"   ✅ JADX decompilation finished! Generated {java_count} Java source file(s).")
                    java_success = True
                else:
                    print(f"   ❌ JADX failed with code {res.returncode}: {res.stderr[:500]}")
            except Exception as e:
                print(f"   ❌ Error executing JADX: {e}")
        else:
            java_success = True

        # Step 3: Resources & Smali Disassembly with Apktool
        if not java_only:
            print("[2/2] 📱 Decoding resources & disassembling Smali bytecode with Apktool...")
            if smali_res_out.exists():
                shutil.rmtree(smali_res_out, ignore_errors=True)

            # Decode Base APK
            apktool_cmd = [
                find_java(),
                "-jar", str(APKTOOL_JAR),
                "d", "-f",
                "-o", str(smali_res_out),
                str(base_apk_path)
            ]
            try:
                res = subprocess.run(apktool_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
                manifest = smali_res_out / "AndroidManifest.xml"
                if res.returncode == 0 and manifest.exists():
                    smali_dirs = [p.name for p in smali_res_out.glob("smali*") if p.is_dir()]
                    print(f"   ✅ Base APK decoded! Manifest verified, found {len(smali_dirs)} smali root folder(s).")
                    smali_success = True
                else:
                    print(f"   ❌ Apktool failed on base APK (code {res.returncode}): {res.stderr[:500]}")
            except Exception as e:
                print(f"   ❌ Error executing Apktool: {e}")

            # Decode any feature splits that contain DEX bytecode
            feature_splits = [a for a in all_apk_paths if a != base_apk_path and apk_has_dex(a)]
            if smali_success and feature_splits:
                splits_out = smali_res_out / "splits"
                splits_out.mkdir(parents=True, exist_ok=True)
                print(f"[*] Decoding {len(feature_splits)} feature split(s) containing DEX bytecode...")
                for s_apk in feature_splits:
                    s_out = splits_out / s_apk.stem
                    sub_cmd = [
                        find_java(),
                        "-jar", str(APKTOOL_JAR),
                        "d", "-f",
                        "-o", str(s_out),
                        str(s_apk)
                    ]
                    subprocess.run(sub_cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                print(f"   ✅ Feature split bytecode decoded into {splits_out.name}/.")
        else:
            smali_success = True

        elapsed = time.time() - start_time

        # Step 4: Verification and Metadata Extraction
        if java_success and smali_success:
            metadata = {
                "input_file": input_path.name,
                "input_format": ext.lstrip("."),
                "file_size_bytes": input_path.stat().st_size if input_path.exists() else 0,
                "decompiled_at": time.strftime("%Y-%m-%d %H:%M:%S"),
                "duration_seconds": round(elapsed, 2),
                "is_split_bundle": len(all_apk_paths) > 1,
                "base_apk": base_apk_path.name if base_apk_path else None,
                "splits_count": len(all_apk_paths),
                "splits": [
                    {"name": a.name, "size_bytes": a.stat().st_size, "has_dex": apk_has_dex(a)}
                    for a in all_apk_paths
                ],
                "paths": {
                    "java_sources": str(sources_out.relative_to(ROOT_DIR)),
                    "smali_and_resources": str(smali_res_out.relative_to(ROOT_DIR))
                }
            }

            if splits_storage_out.exists():
                metadata["paths"]["splits"] = str(splits_storage_out.relative_to(ROOT_DIR))

            if smali_res_out.exists():
                parsed_meta = extract_apktool_metadata(smali_res_out)
                metadata.update(parsed_meta)

            if extra_bundle_metadata:
                metadata["bundle_info"] = extra_bundle_metadata

            info_file = target_out / "apk_info.json"
            with open(info_file, "w", encoding="utf-8") as f:
                json.dump(metadata, f, indent=2)

            print(f"\n🎉 Decompilation verified successfully in {elapsed:.1f}s!")
            if "package_name" in metadata:
                print(f"   📦 Package: {metadata.get('package_name')}")
                print(f"   🏷️  Version: {metadata.get('version_name')} (code: {metadata.get('version_code')})")
                print(f"   🎯 Min SDK: {metadata.get('min_sdk')} | Target SDK: {metadata.get('target_sdk')}")

            # Step 5: Delete input app file upon finish
            if not keep_input:
                try:
                    input_path.unlink()
                    print(f"   🗑️  Deleted input {ext.upper()}: {input_path.name}")
                except Exception as e:
                    print(f"   ⚠️  Could not delete input file ({input_path.name}): {e}")
            else:
                print(f"   ℹ️  Input file preserved (--keep-input enabled): {input_path.name}")

            return True
        else:
            print(f"\n❌ Decompilation failed for {input_path.name}. Input file was NOT deleted.")
            return False

    finally:
        # Cleanup temporary split extraction directory
        if temp_extract_dir and os.path.exists(temp_extract_dir):
            shutil.rmtree(temp_extract_dir, ignore_errors=True)


def main():
    parser = argparse.ArgumentParser(
        description="Lusted Patches - Universal App Decompiler Helper for Morphe Patch Development"
    )
    parser.add_argument(
        "--file", "--apk",
        dest="target_file",
        type=str,
        help="Path to a specific app file (.apk, .apks, .xapk, .apkm, .aab, .zip) to decompile"
    )
    parser.add_argument(
        "--apks-dir",
        type=str,
        default=str(APKS_IN_DIR),
        help="Directory containing input app files (default: apks/in/)"
    )
    parser.add_argument(
        "--output",
        type=str,
        default=str(APKS_OUT_DIR),
        help="Output directory for decompiled code (default: apks/out/)"
    )
    parser.add_argument(
        "--keep-input", "--keep-apk",
        dest="keep_input",
        action="store_true",
        help="Do not delete input app file after successful decompilation"
    )
    parser.add_argument(
        "--setup-only",
        action="store_true",
        help="Only verify/download tool binaries and exit"
    )
    parser.add_argument(
        "--java-only",
        action="store_true",
        help="Only decompile Java/Kotlin source code (JADX)"
    )
    parser.add_argument(
        "--smali-only",
        action="store_true",
        help="Only decode Smali & Android resources (Apktool)"
    )

    args = parser.parse_args()
    print_banner()

    # 1. Verify tools
    print("[*] Verifying decompilation toolchains (JADX & Apktool)...")
    ensure_tools()
    print("[+] Toolchains ready.")

    if args.setup_only:
        print("[+] Setup completed successfully.")
        return 0

    output_dir = Path(args.output).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    # 2. Gather targets across all supported formats
    targets: list[Path] = []
    if args.target_file:
        t_path = Path(args.target_file).resolve()
        if not t_path.exists() or t_path.suffix.lower() not in SUPPORTED_EXTENSIONS:
            print(f"[!] Target file does not exist or has an unsupported format: {t_path}")
            print(f"    Supported formats: {', '.join(sorted(SUPPORTED_EXTENSIONS))}")
            return 1
        targets.append(t_path)
    else:
        input_dir = Path(args.apks_dir).resolve()
        input_dir.mkdir(parents=True, exist_ok=True)
        for item in sorted(input_dir.iterdir()):
            if item.is_file() and item.suffix.lower() in SUPPORTED_EXTENSIONS:
                targets.append(item)

    if not targets:
        print(f"[!] No app packages found in '{Path(args.apks_dir).resolve()}'.")
        print(f"    Supported formats: {', '.join(sorted(SUPPORTED_EXTENSIONS))}")
        print("    👉 Drop your app files into 'apks/in/' and run:")
        print("       python scripts/decompile.py")
        return 0

    print(f"[*] Found {len(targets)} app package(s) to process all at once:")
    for idx, t in enumerate(targets, 1):
        print(f"    {idx}. {t.name} ({t.stat().st_size / (1024 * 1024):.2f} MB) [{t.suffix.lower().lstrip('.')}]")

    # 3. Process all files
    success_count = 0
    fail_count = 0

    for app_file in targets:
        ok = decompile_app(
            input_path=app_file,
            output_base=output_dir,
            keep_input=args.keep_input,
            java_only=args.java_only,
            smali_only=args.smali_only
        )
        if ok:
            success_count += 1
        else:
            fail_count += 1

    print(f"\n{'=' * 65}")
    print(f"📊 SUMMARY: Processed {len(targets)} app package(s) | {success_count} succeeded | {fail_count} failed")
    print(f"📂 Decompiled output directory: {output_dir}")
    print(f"{'=' * 65}\n")

    return 0 if fail_count == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
