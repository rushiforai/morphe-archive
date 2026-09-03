#!/usr/bin/env python3
"""
DiskWala 24.5 (334) Comprehensive Smali Patch Applier.
Mirrors Morphe bytecode patches for DiskWala:
1. Complete PairIP Removal / Bypass (Application, CoreComponentFactory, AppComponentFactory, StartupLauncher, VMRunner)
2. Bypass PairIP Licensing & Play Store redirect (LicenseClient, LicenseContentProvider, LicenseActivity)
3. Bypass SignatureCheck (verifyIntegrity, verifySignatureMatches)
4. Spoof Installer to Google Play (RNDeviceModule)
5. Bypass Play Integrity (PlayIntegrityModule)
6. Restore proper React Native MainApplication.onCreate and MainActivity.onCreate
7. Disable Ad SDKs & Tracking ContentProviders (PreloadInfoContentProvider, AppLovin, InMobi, MobileAds, AppLovinMAXModule)
8. Unlock Premium (RevenueCat EntitlementInfo / EntitlementInfos)
9. Fix AndroidManifest.xml for standalone installation and direct MainApplication start
10. Fix Windows-decompilation artifacts in Firebase / Crashlytics (CrashlyticsRegistrar, K9/b)
11. Populate ALL 32 PairIP String Obfuscation Tables in smali_classes2 with valid non-null strings
12. Convert ReactNativeFeatureFlagsCxxAccessor to pure Java LocalAccessor (avoiding missing new-arch libreact_featureflagsjni.so)
13. Initialize SoLoader with OpenSourceMergedSoMapping in MainApplication.onCreate and load hermes / hermes_executor in HermesExecutor

Usage:
  python patch_diskwala.py --decoded <path_to_decoded_directory>
"""
import pathlib
import re
import argparse
import sys

def patch_method(file_path: pathlib.Path, method_sig_regex: str, inject_smali: str, description: str) -> bool:
    if not file_path.exists():
        print(f"[SKIP] File not found: {file_path.name} for {description}")
        return False
    
    text = file_path.read_text(encoding='utf-8')
    if inject_smali.strip() in text:
        print(f"[ALREADY PATCHED] {description} in {file_path.name}")
        return True

    method_match = re.search(rf"(\.method\s+[^\n]*?{method_sig_regex}[^\n]*?\n)", text)
    if not method_match:
        print(f"[FAIL] Method pattern '{method_sig_regex}' not found in {file_path.name} for {description}")
        return False

    method_start = method_match.start()
    end_match = text.find('.end method', method_start)
    if end_match == -1:
        print(f"[FAIL] .end method not found in {file_path.name} for {description}")
        return False
    
    method_full = text[method_start:end_match + len('.end method')]
    lines = method_full.split('\n')
    
    in_annotation = False
    in_param = False
    insert_line_idx = len(lines) - 1
    
    for i, line in enumerate(lines):
        s = line.strip()
        if s.startswith('.annotation'):
            in_annotation = True
        elif s.startswith('.end annotation'):
            in_annotation = False
        elif s.startswith('.param'):
            in_param = True
        elif s.startswith('.end param'):
            in_param = False
        elif not in_annotation and not in_param:
            if s.startswith('.line') or (s and not s.startswith('.') and not s.startswith('#')):
                insert_line_idx = i
                break
    
    lines.insert(insert_line_idx, inject_smali)
    new_method = '\n'.join(lines)
    new_text = text[:method_start] + new_method + text[end_match + len('.end method'):]
    file_path.write_text(new_text, encoding='utf-8')
    print(f"[PATCHED] {description} in {file_path.name}")
    return True

def replace_method_body(file_path: pathlib.Path, method_sig_regex: str, new_body: str, description: str) -> bool:
    if not file_path.exists():
        print(f"[SKIP] File not found: {file_path.name} for {description}")
        return False
    text = file_path.read_text(encoding='utf-8')
    
    match = re.search(rf"(\.method\s+[^\n]*?{method_sig_regex}[^\n]*?\n)", text)
    if not match:
        print(f"[FAIL] Method '{method_sig_regex}' not found in {file_path.name} for {description}")
        return False
    
    start = match.start()
    header = match.group(1)
    end = text.find('.end method', match.end())
    if end == -1:
        print(f"[FAIL] .end method not found in {file_path.name} for {description}")
        return False
    
    replacement = header + "\n" + new_body + "\n"
    new_text = text[:start] + replacement + text[end:]
    file_path.write_text(new_text, encoding='utf-8')
    print(f"[REPLACED] {description} in {file_path.name}")
    return True

def patch_manifest(manifest_path: pathlib.Path) -> bool:
    if not manifest_path.exists():
        return False
    text = manifest_path.read_text(encoding='utf-8')
    orig = text
    # Remove split-required attributes from <manifest> and <application>
    text = re.sub(r'\s+android:requiredSplitTypes="[^"]*"', '', text)
    text = re.sub(r'\s+android:splitTypes="[^"]*"', '', text)
    text = re.sub(r'\s+android:isSplitRequired="[^"]*"', '', text)
    # Ensure native libs extraction is enabled
    text = text.replace('android:extractNativeLibs="false"', 'android:extractNativeLibs="true"')
    if 'android:extractNativeLibs' not in text:
        text = text.replace('<application ', '<application android:extractNativeLibs="true" ')
    # Switch Application class from PairIP Application to MainApplication
    text = text.replace('android:name="com.pairip.application.Application"', 'android:name="com.diskwalaapp.MainApplication"')
    # Remove split metadata
    text = re.sub(r'<meta-data\s+android:name="com\.android\.vending\.splits[^"]*"\s+[^>]*/>', '', text)
    if text != orig:
        manifest_path.write_text(text, encoding='utf-8')
        print(f"[PATCHED] AndroidManifest.xml: Switched to MainApplication & removed split requirements")
        return True
    return False

def patch_all_string_tables(base: pathlib.Path) -> int:
    known_values = {
        'vGJsbKNOZNUs': ',',
        'atjdFgibR': 'kotlinx.coroutines.semaphore.maxSpinCycles',
        'NoRPzzBxaOriDN': 'UTF-8',
        'kUjeFPxSYsqTYj': 'UTF-8',
        'chKk': 'UTF-8',
        'RwSGPNCyK': '.*',
        'bunFFcOP': '.*',
        'aqNiPYIgREz': 'os.name',
        'aYOwt': 'os.name',
        'PZtkidzwPHFDfz': 'android.text.EmojiConsistency',
        'kRnVqMj': 'matrix',
        'TsJGojv': 'detailMessage',
        'ZnbUz': 'customerInfo',
        'FLg': 'apiKey',
        'CcEESTrXMArHyXc': 'locale',
        'MeRDfZUAkvBNAFH': 'billingConfig',
        'dXURmAwKIXAMUdV': 'activity',
        'wAAmuC': 'view',
        'xVksFlSCHmlnWgV': 'purchases',
        'pLgEmsBSXqJYjEx': 'descriptor',
        'GYWtWD': 'channel',
        'kSImNbwsnyUac': 'key',
        'oNcMEZvslKum': 'value',
        'WxcMawMfvzxQK': 'error',
        'cSyzEKzLmu': 'tag',
        'Ynt': 'eventName',
        'ZRUWY': 'url',
        'CDBxDhHziOFivd': 'adUnit',
        'SxfdxQEM': 'action',
        'doM': 'setting',
        'imSqba': 'javascript',
        'MhicdH': 'verification',
        'TFqaaPJ': 'data',
        'Xvahkiq': 'config',
        'YFE': 'sessionId',
    }

    count = 0
    for p in base.glob('smali_classes2/**/*.smali'):
        text = p.read_text(encoding='utf-8', errors='ignore')
        class_match = re.search(r'^\.class\s+.*?\s+(L[^;]+;)', text, re.MULTILINE)
        if not class_match:
            continue
        class_descriptor = class_match.group(1)
        
        fields = re.findall(r'^\.field\s+public\s+static\s+([a-zA-Z0-9_\$]+):Ljava/lang/String;\s*$', text, re.MULTILINE)
        if len(fields) < 20:
            continue
        
        lines = []
        lines.append('.method static constructor <clinit>()V')
        lines.append('    .locals 1')
        lines.append('')
        for f in fields:
            val = known_values.get(f, f)
            lines.append(f'    const-string v0, "{val}"')
            lines.append(f'    sput-object v0, {class_descriptor}->{f}:Ljava/lang/String;')
            lines.append('')
        lines.append('    return-void')
        lines.append('.end method')
        clinit_code = '\n'.join(lines)

        match = re.search(r'(\.method\s+[^\n]*?<clinit>[^\n]*?\n)', text)
        if match:
            end = text.find('.end method', match.end())
            text = text[:match.start()] + clinit_code + '\n' + text[end + len('.end method'):]
        else:
            text = text.rstrip() + '\n\n' + clinit_code + '\n'
        
        p.write_text(text, encoding='utf-8')
        count += 1
        print(f"[PATCHED] Injected <clinit> into PairIP table: {p.name} ({len(fields)} fields)")
    return count

def patch_feature_flags(base: pathlib.Path) -> bool:
    local_p = base / "smali_classes4/com/facebook/react/internal/featureflags/ReactNativeFeatureFlagsLocalAccessor.smali"
    cxx_p = base / "smali_classes4/com/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor.smali"
    jni_p = base / "smali_classes4/com/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxInterop.smali"
    
    success = False
    if local_p.exists() and cxx_p.exists():
        local_txt = local_p.read_text(encoding='utf-8')
        new_cxx = local_txt.replace("ReactNativeFeatureFlagsLocalAccessor", "ReactNativeFeatureFlagsCxxAccessor")
        cxx_p.write_text(new_cxx, encoding='utf-8')
        print(f"[PATCHED] ReactNativeFeatureFlagsCxxAccessor: Replaced with pure-Java LocalAccessor")
        success = True

    if jni_p.exists():
        if replace_method_body(
            jni_p,
            r"<clinit>\(",
            "    .locals 0\n    return-void",
            "ReactNativeFeatureFlagsCxxInterop.<clinit> -> return-void"
        ):
            success = True

    # Ensure accessorProvider$lambda$0 and m6/a.invoke return ReactNativeFeatureFlagsCxxAccessor
    rf_p = base / "smali_classes4/com/facebook/react/internal/featureflags/ReactNativeFeatureFlags.smali"
    if rf_p.exists():
        if replace_method_body(
            rf_p,
            r"accessorProvider\$lambda\$0\(",
            "    .locals 1\n    new-instance v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;\n    invoke-direct {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;-><init>()V\n    return-object v0",
            "ReactNativeFeatureFlags.accessorProvider -> CxxAccessor (pure Java)"
        ):
            success = True

    m6_p = base / "smali_classes4/m6/a.smali"
    if m6_p.exists():
        if replace_method_body(
            m6_p,
            r"invoke\(\)Ljava/lang/Object;",
            "    .locals 1\n    new-instance v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;\n    invoke-direct {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsCxxAccessor;-><init>()V\n    return-object v0",
            "m6.a.invoke -> CxxAccessor (pure Java)"
        ):
            success = True

    return success

def restore_hermes_companion(base: pathlib.Path):
    for hp in base.rglob("*HermesExecutor*.smali"):
        if "Companion" in hp.name:
            content = """\
.class public final Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/hermes/reactexecutor/HermesExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\\u00000\\n\\u0002\\u0018\\u0002\\n\\u0002\\u0010\\u0000\\n\\u0002\\u0008\\u0002\\n\\u0002\\u0010\\u000b\\n\\u0000\\n\\u0002\\u0010\\u000e\\n\\u0000\\n\\u0002\\u0018\\u0002\\n\\u0002\\u0008\\u0002\\n\\u0002\\u0010\\t\\n\\u0002\\u0008\\u0003\\n\\u0002\\u0018\\u0002\\n\\u0002\\u0008\\u0004\\u0008\\u0086\\u0003\\u0018\\u00002\\u00020\\u0001B\\t\\u0008\\u0002\\u00a2\\u0006\\u0004\\u0008\\u0002\\u0010\\u0003J \\u0010\\t\\u001a\\u00020\\u00082\\u0006\\u0010\\u0005\\u001a\\u00020\\u00042\\u0006\\u0010\\u0007\\u001a\\u00020\\u0006H\\u0083 \\u00a2\\u0006\\u0004\\u0008\\t\\u0010\\nJ(\\u0010\\r\\u001a\\u00020\\u00082\\u0006\\u0010\\u0005\\u001a\\u00020\\u00042\\u0006\\u0010\\u0007\\u001a\\u00020\\u00062\\u0006\\u0010\\u000c\\u001a\\u00020\\u000bH\\u0083 \\u00a2\\u0006\\u0004\\u0008\\r\\u0010\\u000eJ\\u000f\\u0010\\u0010\\u001a\\u00020\\u000fH\\u0007\\u00a2\\u0006\\u0004\\u0008\\u0010\\u0010\\u0003R\\u0018\\u0010\\u0011\\u001a\\u0004\\u0018\\u00010\\u00068\\u0002@\\u0002X\\u0082\\u000e\\u00a2\\u0006\\u0006\\n\\u0004\\u0008\\u0011\\u0010\\u0012\\u00a8\\u0006\\u0013"
    }
    d2 = {
        "Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;",
        "",
        "<init>",
        "()V",
        "",
        "enableDebugger",
        "",
        "debuggerName",
        "Lcom/facebook/jni/HybridData;",
        "initHybridDefaultConfig",
        "(ZLjava/lang/String;)Lcom/facebook/jni/HybridData;",
        "",
        "heapSizeMB",
        "initHybrid",
        "(ZLjava/lang/String;J)Lcom/facebook/jni/HybridData;",
        "Lkotlin/Unit;",
        "loadLibrary",
        "mode",
        "Ljava/lang/String;",
        "ReactAndroid_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$initHybrid(Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;ZLjava/lang/String;J)Lcom/facebook/jni/HybridData;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;->initHybrid(ZLjava/lang/String;J)Lcom/facebook/jni/HybridData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$initHybridDefaultConfig(Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;ZLjava/lang/String;)Lcom/facebook/jni/HybridData;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/facebook/hermes/reactexecutor/HermesExecutor$Companion;->initHybridDefaultConfig(ZLjava/lang/String;)Lcom/facebook/jni/HybridData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final initHybrid(ZLjava/lang/String;J)Lcom/facebook/jni/HybridData;
    .locals 0

    .line 1
    invoke-static {p1, p2, p3, p4}, Lcom/facebook/hermes/reactexecutor/HermesExecutor;->access$initHybrid(ZLjava/lang/String;J)Lcom/facebook/jni/HybridData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method private final initHybridDefaultConfig(ZLjava/lang/String;)Lcom/facebook/jni/HybridData;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/facebook/hermes/reactexecutor/HermesExecutor;->access$initHybridDefaultConfig(ZLjava/lang/String;)Lcom/facebook/jni/HybridData;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    return-object p1
.end method

.method public final loadLibrary()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/facebook/hermes/reactexecutor/HermesExecutor;->access$getMode$cp()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "hermes"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    const-string v0, "hermes_executor"

    .line 13
    .line 14
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    const-string v0, "Release"

    .line 18
    .line 19
    invoke-static {v0}, Lcom/facebook/hermes/reactexecutor/HermesExecutor;->access$setMode$cp(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
"""
            hp.write_text(content, encoding='utf-8')
            print(f"[RESTORED] {hp.name}")

def remove_dexopt_profiles(base):
    import shutil
    dexopt_dir = base / 'assets' / 'dexopt'
    if dexopt_dir.exists():
        shutil.rmtree(dexopt_dir)
        print('[DELETED] Removed assets/dexopt/ (prevents Android 16 profile mismatch error)')

def patch_libreactnative_emutls(base):
    import struct
    so_p = base / 'lib/arm64-v8a/libreactnative.so'
    if so_p.exists():
        data = bytearray(so_p.read_bytes())
        # Patch Yoga emutls TLS control blocks at 0x5a1d90 and 0x5a1db0
        struct.pack_into('<QQQQ', data, 0x5a1d90, 64, 16, 0, 0)
        struct.pack_into('<QQQQ', data, 0x5a1db0, 8, 8, 0, 0)
        so_p.write_bytes(data)
        print('[PATCHED] Fixed Yoga TLS emutls control headers in libreactnative.so')
        return True
    return False

def patch_native_dt_init_traps(base):
    import struct, capstone
    lib_dir = base / 'lib/arm64-v8a'
    if not lib_dir.exists():
        return False
    md = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM)
    ret_inst = b'\xc0\x03\x5f\xd6'
    total_patched = 0
    for so_file in lib_dir.glob('*.so'):
        data = bytearray(so_file.read_bytes())
        try:
            e_shoff, = struct.unpack('<Q', data[40:48])
            e_shentsize, = struct.unpack('<H', data[58:60])
            e_shnum, = struct.unpack('<H', data[60:62])
            e_shstrndx, = struct.unpack('<H', data[62:64])
            
            sections = []
            for i in range(e_shnum):
                off = e_shoff + i * e_shentsize
                sh_name, sh_type, sh_flags, sh_addr, sh_offset, sh_size, sh_link, sh_info, sh_addralign, sh_entsize = struct.unpack('<IIQQQQIIQQ', data[off:off+64])
                sections.append({'name_idx': sh_name, 'type': sh_type, 'addr': sh_addr, 'offset': sh_offset, 'size': sh_size})
            
            shstr = sections[e_shstrndx]
            shstrtab = data[shstr['offset']:shstr['offset']+shstr['size']]
            for s in sections:
                end = shstrtab.find(b'\x00', s['name_idx'])
                s['name'] = shstrtab[s['name_idx']:end].decode('latin1')
            
            dyns = [s for s in sections if s['name'] == '.dynamic']
            if not dyns:
                continue
            dyn = dyns[0]
            dyn_data = data[dyn['offset']:dyn['offset']+dyn['size']]
            modified = False
            for i in range(0, len(dyn_data), 16):
                tag, val = struct.unpack('<QQ', dyn_data[i:i+16])
                if tag == 12: # DT_INIT
                    code = data[val:val+8]
                    dis = list(md.disasm(code, val))
                    for inst in dis:
                        if inst.mnemonic == 'udf':
                            print(f'[PATCHED] {so_file.name}: DT_INIT at 0x{val:x} from {inst.mnemonic} {inst.op_str} to ret')
                            data[val:val+4] = ret_inst
                            modified = True
                            total_patched += 1
                            break
            if modified:
                so_file.write_bytes(data)
        except Exception as ex:
            pass
    return total_patched > 0

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--decoded", required=True, help="apktool decoded directory")
    args = parser.parse_args()
    base = pathlib.Path(args.decoded)

    if not base.exists():
        print(f"Error: directory does not exist: {base}")
        sys.exit(1)

    patches_applied = 0

    # =========================================================================
    # 0. AndroidManifest.xml Fixes
    # =========================================================================
    manifest_p = base / "AndroidManifest.xml"
    if patch_manifest(manifest_p):
        patches_applied += 1

    # =========================================================================
    # 1. Neutralize PairIP VM Startup & Invocation (No Native Crash)
    # =========================================================================
    p = base / "smali_classes2/com/pairip/StartupLauncher.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"launch\(",
            "    .locals 0\n    return-void",
            "StartupLauncher.launch -> no-op"
        ):
            patches_applied += 1

    p = base / "smali_classes2/com/pairip/VMRunner.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"invoke\(Ljava/lang/String;\[Ljava/lang/Object;\)Ljava/lang/Object;",
            "    .locals 1\n    const/4 v0, 0x0\n    return-object v0",
            "VMRunner.invoke -> return null"
        ):
            patches_applied += 1

    p = base / "smali_classes2/androidx/core/app/CoreComponentFactory.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"<clinit>\(",
            "    .locals 0\n    return-void",
            "CoreComponentFactory.<clinit> -> return-void"
        ):
            patches_applied += 1

    p = base / "smali_classes2/android/app/AppComponentFactory.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"<clinit>\(",
            "    .locals 0\n    return-void",
            "AppComponentFactory.<clinit> -> return-void"
        ):
            patches_applied += 1

    p = base / "smali_classes4/com/diskwalaapp/MainApplication.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"<clinit>\(",
            "    .locals 0\n    return-void",
            "MainApplication.<clinit> -> return-void"
        ):
            patches_applied += 1
        
        # Restore MainApplication.onCreate() to standard super.onCreate() + SoLoader.init(this, OpenSourceMergedSoMapping.INSTANCE) + DefaultNewArchitectureEntryPoint.load(true, false, false)
        if replace_method_body(
            p,
            r"onCreate\(\)V",
            "    .locals 3\n    invoke-super {p0}, Landroid/app/Application;->onCreate()V\n    sget-object v0, Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;->INSTANCE:Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;\n    invoke-static {p0, v0}, Lcom/facebook/soloader/SoLoader;->init(Landroid/content/Context;Lcom/facebook/soloader/ExternalSoMapping;)V\n    const/4 v0, 0x1\n    const/4 v1, 0x0\n    invoke-static {v0, v1, v1}, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->load(ZZZ)V\n    return-void",
            "MainApplication.onCreate -> invoke-super & SoLoader.init & DefaultNewArchitectureEntryPoint.load(true,false,false) in MainApplication.smali"
        ):
            patches_applied += 1

    p_host = base / "smali_classes4/com/diskwalaapp/MainApplication$a.smali"
    if p_host.exists():
        if replace_method_body(
            p_host,
            r"isNewArchEnabled\(\)Z",
            "    .locals 1\n    const/4 v0, 0x1\n    return v0",
            "MainApplication$a.isNewArchEnabled -> return true"
        ):
            patches_applied += 1

    p_soloader = base / "smali_classes4/com/facebook/react/defaults/DefaultSoLoader.smali"
    if p_soloader.exists():
        if replace_method_body(
            p_soloader,
            r"maybeLoadSoLibrary\(\)V",
            "    .locals 2\n    const-class v0, Lcom/facebook/react/defaults/DefaultSoLoader;\n    monitor-enter v0\n    :try_start_0\n    const-string v1, \"react_newarchdefaults\"\n    invoke-static {v1}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z\n    const-string v1, \"appmodules\"\n    invoke-static {v1}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z\n    :try_end_0\n    .catchall {:try_start_0 .. :try_end_0} :catchall_0\n    :catchall_0\n    monitor-exit v0\n    return-void",
            "DefaultSoLoader.maybeLoadSoLibrary -> load react_newarchdefaults and appmodules in DefaultSoLoader.smali"
        ):
            patches_applied += 1

    p = base / "smali_classes4/com/diskwalaapp/MainActivity.smali"
    if p.exists():
        # Restore MainActivity.onCreate(Bundle) to standard super.onCreate(Bundle)
        if replace_method_body(
            p,
            r"onCreate\(Landroid/os/Bundle;\)V",
            "    .locals 0\n    invoke-super {p0, p1}, Lcom/facebook/react/ReactActivity;->onCreate(Landroid/os/Bundle;)V\n    return-void",
            "MainActivity.onCreate -> invoke-super & return-void"
        ):
            patches_applied += 1

    p_screens = base / "smali_classes8/com/swmansion/rnscreens/ScreensModule.smali"
    if p_screens.exists():
        if replace_method_body(
            p_screens,
            r"initialize\(\)V",
            "    .locals 2\n    invoke-super {p0}, Lcom/facebook/react/bridge/BaseJavaModule;->initialize()V\n    return-void",
            "ScreensModule.initialize -> safe no-op on non-Fabric"
        ):
            patches_applied += 1

    # =========================================================================
    # 2. Signature Check Bypass
    # =========================================================================
    p = base / "smali_classes2/com/pairip/SignatureCheck.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"verifyIntegrity\(Landroid/content/Context;\)V",
            "    .locals 0\n    return-void",
            "SignatureCheck.verifyIntegrity -> return-void"
        ):
            patches_applied += 1
        
        if replace_method_body(
            p,
            r"verifySignatureMatches\(Ljava/lang/String;\)Z",
            "    .locals 1\n    const/4 v0, 0x1\n    return v0",
            "SignatureCheck.verifySignatureMatches -> return true"
        ):
            patches_applied += 1

    # =========================================================================
    # 3. PairIP License Check & Play Store Redirect Bypass
    # =========================================================================
    p = base / "smali_classes2/com/pairip/licensecheck/LicenseClient.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"checkLicense\(Landroid/content/Context;\)V",
            "    .locals 0\n    return-void",
            "LicenseClient.checkLicense -> return-void"
        ):
            patches_applied += 1

    p = base / "smali_classes2/com/pairip/licensecheck/LicenseContentProvider.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"onCreate\(\)Z",
            "    .locals 1\n    const/4 v0, 0x1\n    return v0",
            "LicenseContentProvider.onCreate -> return true"
        ):
            patches_applied += 1

    p = base / "smali_classes2/com/pairip/licensecheck/LicenseActivity.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"onStart\(\)V",
            "    .locals 0\n    invoke-virtual {p0}, Landroid/app/Activity;->finish()V\n    return-void",
            "LicenseActivity.onStart -> finish() & return-void"
        ):
            patches_applied += 1

    # =========================================================================
    # 4. Installer Package Name Spoofing (Google Play Store)
    # =========================================================================
    p = base / "smali_classes3/com/learnium/RNDeviceInfo/RNDeviceModule.smali"
    if p.exists():
        if patch_method(
            p,
            r"getInstallerPackageNameSync\(\)Ljava/lang/String;",
            '    const-string v0, "com.android.vending"\n    return-object v0',
            "RNDeviceModule.getInstallerPackageNameSync -> 'com.android.vending'"
        ):
            patches_applied += 1

    # =========================================================================
    # 5. Play Integrity Bypass
    # =========================================================================
    p = base / "smali_classes4/com/diskwalaapp/integrity/PlayIntegrityModule.smali"
    if p.exists():
        if patch_method(
            p,
            r"requestToken\(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;\)V",
            '    const-string v0, "diskwala_stub_integrity_token"\n    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void',
            "PlayIntegrityModule.requestToken -> stub resolve"
        ):
            patches_applied += 1

    # =========================================================================
    # 6. Ad SDKs Disabling (InitProviders + AppLovin MAX Module)
    # =========================================================================
    for init_p in [
        "smali_classes3/com/applovin/sdk/AppLovinInitProvider.smali",
        "smali_classes6/com/inmobi/sdk/InMobiInitProvider.smali",
        "smali_classes5/com/google/android/gms/ads/MobileAdsInitProvider.smali",
        "smali_classes4/com/yandex/mobile/ads/core/initializer/YandexAdsInitializeProvider.smali",
        "smali_classes7/com/facebook/ads/AudienceNetworkContentProvider.smali",
        "smali_classes9/io/bidmachine/BidMachineInitProvider.smali",
        "smali_classes8/com/vungle/ads/VungleProvider.smali",
        "smali_classes6/com/ironsource/lifecycle/LevelPlayActivityLifecycleProvider.smali",
        "smali_classes10/sg/bigo/ads/controller/provider/BigoAdsProvider.smali",
        "smali_classes2/com/mbridge/msdk/config/component/status/MBComponentLifecycleProvider.smali",
    ]:
        p = base / init_p
        if p.exists():
            if replace_method_body(
                p,
                r"onCreate\(\)Z",
                "    .locals 1\n    const/4 v0, 0x1\n    return v0",
                f"{p.stem}.onCreate -> return true"
            ):
                patches_applied += 1

    # Neutralize PreloadInfoContentProvider completely
    p = base / "smali_classes8/io/appmetrica/analytics/internal/PreloadInfoContentProvider.smali"
    if p.exists():
        if replace_method_body(p, r"onCreate\(\)Z", "    .locals 1\n    const/4 v0, 0x1\n    return v0", "PreloadInfo.onCreate -> true"):
            patches_applied += 1
        if replace_method_body(p, r"delete\(", "    .locals 1\n    const/4 v0, 0x0\n    return v0", "PreloadInfo.delete -> 0"):
            patches_applied += 1
        if replace_method_body(p, r"insert\(", "    .locals 1\n    const/4 v0, 0x0\n    return-object v0", "PreloadInfo.insert -> null"):
            patches_applied += 1
        if replace_method_body(p, r"query\(", "    .locals 1\n    const/4 v0, 0x0\n    return-object v0", "PreloadInfo.query -> null"):
            patches_applied += 1
        if replace_method_body(p, r"update\(", "    .locals 1\n    const/4 v0, 0x0\n    return v0", "PreloadInfo.update -> 0"):
            patches_applied += 1

    # RevocationBoundService
    p = base / "smali_classes2/com/google/android/gms/auth/api/signin/RevocationBoundService.smali"
    if p.exists():
        if replace_method_body(p, r"onBind\(", "    .locals 1\n    const/4 v0, 0x0\n    return-object v0", "RevocationBoundService.onBind -> null"):
            patches_applied += 1

    p = base / "smali_classes3/com/applovin/reactnative/AppLovinMAXModule.smali"
    if p.exists():
        # initialize bridge
        if patch_method(
            p,
            r"initialize\(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;\)V",
            '    const-string v0, "stub_initialized"\n    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void',
            "AppLovinMAXModule.initialize -> resolve stub"
        ):
            patches_applied += 1

        # load/show/create methods
        for m in [
            "createBanner", "createMRec",
            "loadInterstitial", "showInterstitial",
            "loadRewardedAd", "showRewardedAd",
            "loadAppOpenAd", "showAppOpenAd"
        ]:
            if patch_method(
                p,
                rf"{m}\(",
                "    return-void",
                f"AppLovinMAXModule.{m} -> return-void"
            ):
                patches_applied += 1

        # readiness methods
        for m in ["isInterstitialReady", "isRewardedAdReady", "isAppOpenAdReady"]:
            if patch_method(
                p,
                rf"{m}\(",
                "    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void",
                f"AppLovinMAXModule.{m} -> resolve false"
            ):
                patches_applied += 1

    # =========================================================================
    # 7. RevenueCat Premium Unlock
    # =========================================================================
    p = base / "smali_classes7/com/revenuecat/purchases/EntitlementInfo.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"isActive\(\)Z",
            "    .locals 1\n    const/4 v0, 0x1\n    return v0",
            "EntitlementInfo.isActive -> return true"
        ):
            patches_applied += 1

    p = base / "smali_classes7/com/revenuecat/purchases/EntitlementInfos.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"getActive\(\)Ljava/util/Map;",
            "    .locals 1\n    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;\n    return-object v0",
            "EntitlementInfos.getActive -> return all"
        ):
            patches_applied += 1

    # =========================================================================
    # 8. Crashlytics / Firebase Sessions Null Key Fix
    # =========================================================================
    p = base / "smali_classes6/com/google/firebase/crashlytics/CrashlyticsRegistrar.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"<clinit>\(",
            "    .locals 0\n    return-void",
            "CrashlyticsRegistrar.<clinit> -> return-void"
        ):
            patches_applied += 1

    p = base / "smali_classes6/K9/b.smali"
    if p.exists():
        if replace_method_body(
            p,
            r"a\(LK9/c\$a;\)V",
            "    .locals 0\n    return-void",
            "LK9/b.a -> return-void"
        ):
            patches_applied += 1
        if replace_method_body(
            p,
            r"e\(LK9/c;\)V",
            "    .locals 0\n    return-void",
            "LK9/b.e -> return-void"
        ):
            patches_applied += 1

    # =========================================================================
    # 9. All 32 PairIP Obfuscated String Tables Initialization
    # =========================================================================
    table_count = patch_all_string_tables(base)
    remove_dexopt_profiles(base)
    patches_applied += table_count

    # =========================================================================
    # 10. React Native FeatureFlags LocalAccessor (Avoid libreact_featureflagsjni.so)
    # =========================================================================
    if patch_feature_flags(base):
        patches_applied += 1

    # =========================================================================
    # 11. Restore and fix HermesExecutor Companion
    # =========================================================================
    restore_hermes_companion(base)
    patches_applied += 1

    # =========================================================================
    # 12. Fix Yoga TLS emutls headers in libreactnative.so
    # =========================================================================
    if patch_libreactnative_emutls(base):
        patches_applied += 1

    # =========================================================================
    # 13. Fix DT_INIT native udf traps across all libraries
    # =========================================================================
    if patch_native_dt_init_traps(base):
        patches_applied += 1

    print(f"\n==========================================")
    print(f"Total patches successfully applied: {patches_applied}")
    print(f"==========================================")

if __name__ == "__main__":
    main()
