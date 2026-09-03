import sys, os, pathlib, zipfile, subprocess, struct, capstone, shutil, re

WORK_DIR = pathlib.Path(r"D:\DiskWala\work_build")
DECODED_DIR = WORK_DIR / "decoded"
XAPK_PATH = pathlib.Path(r"D:\DiskWala\com.diskwalaapp_24.5.xapk")
KEYSTORE_PATH = WORK_DIR / "diskwala.keystore"
APKTOOL_JAR = pathlib.Path(r"C:\Users\Pikazu\jadx\apktool.jar")
BUILD_TOOLS = pathlib.Path(r"C:\Users\Pikazu\AppData\Local\Android\Sdk\build-tools\37.0.0")
KEYTOOL_EXE = pathlib.Path(r"C:\Program Files\Java\jdk-21.0.10\bin\keytool.exe")

def run(cmd, cwd=None):
    print(f">> Running: {cmd}")
    res = subprocess.run(cmd, cwd=cwd, shell=True, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"FAILED: {res.stderr}\n{res.stdout}")
        sys.exit(1)
    return res.stdout

def encode_bl(pc, target):
    imm26 = ((target - pc) >> 2) & 0x3FFFFFF
    return 0x94000000 | imm26

def encode_adr(rd, pc, target):
    offset = target - pc
    immlo = (offset & 3) << 29
    immhi = ((offset >> 2) & 0x7FFFF) << 5
    return 0x10000000 | immlo | immhi | rd

def encode_adrp(rd, pc, target):
    pc_page = pc >> 12
    target_page = target >> 12
    offset = target_page - pc_page
    immlo = (offset & 3) << 29
    immhi = ((offset >> 2) & 0x7FFFF) << 5
    return 0x90000000 | immlo | immhi | rd

def encode_add_imm(rd, rn, imm):
    return 0x91000000 | ((imm & 0xFFF) << 10) | (rn << 5) | rd

def encode_cbz(rt, pc, target):
    offset = ((target - pc) >> 2) & 0x7FFFF
    return 0x34000000 | (offset << 5) | rt

def main():
    if not DECODED_DIR.exists():
        WORK_DIR.mkdir(parents=True, exist_ok=True)
        print("Step 1: Extracting XAPK...")
        with zipfile.ZipFile(XAPK_PATH, 'r') as zf:
            zf.extract("com.diskwalaapp.apk", WORK_DIR)
            zf.extract("config.arm64_v8a.apk", WORK_DIR)

        print("Step 2: Merging APKs & Decoding with Apktool...")
        run(f'java -jar "{APKTOOL_JAR}" d "{WORK_DIR / "com.diskwalaapp.apk"}" -o "{DECODED_DIR}" -f')
        
        # Merge arm64 native libs from config.arm64_v8a.apk
        with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
            for member in zf.namelist():
                if member.startswith("lib/"):
                    zf.extract(member, DECODED_DIR)

    lib_arm64 = DECODED_DIR / "lib" / "arm64-v8a"

    # Neutralize libpairipcore.so (needed by DT_NEEDED in libcrypto.so & libreactnative.so)
    pairip_so = lib_arm64 / "libpairipcore.so"
    if not pairip_so.exists():
        with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
            pairip_so.write_bytes(zf.read("lib/arm64-v8a/libpairipcore.so"))
    
    pairip_data = bytearray(pairip_so.read_bytes())
    # JNI_OnLoad at 0x8b52c
    struct.pack_into('<I', pairip_data, 0x8b52c, 0x528000c0) # mov w0, #6
    struct.pack_into('<I', pairip_data, 0x8b530, 0x72a00020) # movk w0, #1, lsl #16
    struct.pack_into('<I', pairip_data, 0x8b534, 0xd65f03c0) # ret
    # ExecuteProgram at 0x6bf70
    struct.pack_into('<I', pairip_data, 0x6bf70, 0xd2800000) # mov x0, #0
    struct.pack_into('<I', pairip_data, 0x6bf74, 0xd65f03c0) # ret
    # Neutralize all constructors in init_array
    for target in [0x29c34, 0x29f44, 0x1a7dc, 0x2a34c, 0x2a3b0, 0x2a414, 0x2a430]:
        struct.pack_into('<I', pairip_data, target, 0xd65f03c0) # ret
    pairip_so.write_bytes(pairip_data)
    print("libpairipcore.so sanitized and neutralized!")

    print("Step 2.5: Cleaning AndroidManifest.xml and apktool.yml...")
    manifest_path = DECODED_DIR / "AndroidManifest.xml"
    m_text = manifest_path.read_text(encoding="utf-8")
    m_text = re.sub(r'\s+android:requiredSplitTypes="[^"]*"', '', m_text)
    m_text = re.sub(r'\s+android:splitTypes="[^"]*"', '', m_text)
    m_text = re.sub(r'\s+android:isSplitRequired="[^"]*"', '', m_text)
    m_text = re.sub(r'<meta-data\s+android:name="com\.android\.vending\.splits\.required"[^>]*/>', '', m_text)
    m_text = re.sub(r'<meta-data\s+android:name="com\.android\.vending\.splits"[^>]*/>', '', m_text)
    m_text = m_text.replace('android:extractNativeLibs="false"', 'android:extractNativeLibs="true"')
    m_text = m_text.replace('android:name="com.pairip.application.Application"', 'android:name="com.diskwalaapp.MainApplication"')
    m_text = re.sub(r'\s+android:zygotePreloadName="[^"]*"', '', m_text)
    m_text = re.sub(r'<service[^>]*androidx\.security\.ConnectorService[^>]*/>', '', m_text)
    
    # Remove ad/analytics providers
    ad_providers = [
        "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
        "com.inmobi.sdk.InMobiInitProvider",
        "com.applovin.sdk.AppLovinInitProvider",
        "com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider",
        "com.yandex.mobile.ads.features.debugpanel.data.local.DebugPanelFileProvider",
        "com.google.android.gms.ads.MobileAdsInitProvider",
        "com.facebook.ads.AudienceNetworkContentProvider",
        "io.bidmachine.BidMachineInitProvider",
        "com.vungle.ads.VungleProvider",
        "com.ironsource.lifecycle.IronsourceLifecycleProvider",
        "com.ironsource.lifecycle.LevelPlayActivityLifecycleProvider",
        "sg.bigo.ads.controller.provider.BigoAdsProvider",
        "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider"
    ]
    for prov in ad_providers:
        m_text = re.sub(rf'<provider[^>]*{re.escape(prov)}[^>]*/>', '', m_text)
        m_text = re.sub(rf'<provider[^>]*{re.escape(prov)}[^>]*>.*?</provider>', '', m_text, flags=re.DOTALL)

    manifest_path.write_text(m_text, encoding="utf-8")

    apktool_yml_path = DECODED_DIR / "apktool.yml"
    if apktool_yml_path.exists():
        y_text = apktool_yml_path.read_text(encoding="utf-8")
        y_text = re.sub(r'isFeatureSplit:\s*true', 'isFeatureSplit: false', y_text)
        apktool_yml_path.write_text(y_text, encoding="utf-8")

    print("Step 2.8: Neutralizing PairIP StartupLauncher & VMRunner...")
    for p in DECODED_DIR.rglob("StartupLauncher.smali"):
        p.write_text("""
.class public final Lcom/pairip/StartupLauncher;
.super Ljava/lang/Object;
.source "StartupLauncher.java"

.method public static launch()V
    .locals 0
    return-void
.end method
""".strip(), encoding="utf-8")

    for p in DECODED_DIR.rglob("VMRunner.smali"):
        p.write_text("""
.class public Lcom/pairip/VMRunner;
.super Ljava/lang/Object;
.source "VMRunner.java"

.method public static invoke(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    const/4 p0, 0x0
    return-object p0
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    return-void
.end method
""".strip(), encoding="utf-8")

    print("Step 2.9: Patching dd/G.smali SystemProps null safety...")
    for p in DECODED_DIR.rglob("G.smali"):
        if "dd" in str(p):
            p.write_text("""
.class abstract synthetic Ldd/G;
.super Ljava/lang/Object;
.source "SourceFile"

# static fields
.field private static final a:I

# direct methods
.method static constructor <clinit>()V
    .locals 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
    sput v0, Ldd/G;->a:I
    return-void
.end method

.method public static final a()I
    .locals 1
    sget v0, Ldd/G;->a:I
    return v0
.end method

.method public static final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p0, :cond_0
    const/4 p0, 0x0
    return-object p0

    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0
    return-object p0
.end method
""".strip(), encoding="utf-8")

    print("Step 2.10: Stubbing PreloadInfoContentProvider.smali...")
    for p in DECODED_DIR.rglob("PreloadInfoContentProvider.smali"):
        p.write_text("""
.class public Lio/appmetrica/analytics/internal/PreloadInfoContentProvider;
.super Landroid/content/ContentProvider;
.source "SourceFile"

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V
    return-void
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0
    const/4 p1, 0x0
    return p1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0
    const/4 p1, 0x0
    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0
    const/4 p1, 0x0
    return-object p1
.end method

.method public onCreate()Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0
    const/4 p1, 0x0
    return-object p1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0
    const/4 p1, 0x0
    return-object p1
.end method
""".strip(), encoding="utf-8")

    print("Step 2.11: Patching OpenSourceMergedSoMapping.smali invokeJniOnload...")
    for p in DECODED_DIR.rglob("OpenSourceMergedSoMapping.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(r'\.method public invokeJniOnload\(Ljava/lang/String;\)V.*?\.end method',
                      '.method public invokeJniOnload(Ljava/lang/String;)V\n    .locals 0\n    return-void\n.end method',
                      text, flags=re.DOTALL)
        p.write_text(text, encoding="utf-8")

    print("Step 2.12: Patching DefaultNewArchitectureEntryPoint.smali load...")
    for p in DECODED_DIR.rglob("DefaultNewArchitectureEntryPoint.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(r'\.method public static final load\(ZZZ\)V.*?\.end method',
                      '.method public static final load(ZZZ)V\n    .locals 0\n    sput-boolean p1, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->privateFabricEnabled:Z\n    sput-boolean p0, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->privateTurboModulesEnabled:Z\n    sput-boolean p1, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->privateConcurrentReactEnabled:Z\n    sput-boolean p2, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->privateBridgelessEnabled:Z\n    return-void\n.end method',
                      text, flags=re.DOTALL)
        p.write_text(text, encoding="utf-8")

    print("Step 2.13: Patching MainActivity.smali onCreate...")
    for p in DECODED_DIR.rglob("MainActivity.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(r'\.method protected onCreate\(Landroid/os/Bundle;\)V.*?\.end method',
                      '.method protected onCreate(Landroid/os/Bundle;)V\n    .locals 1\n    const/4 v0, 0x0\n    invoke-super {p0, v0}, Lcom/facebook/react/ReactActivity;->onCreate(Landroid/os/Bundle;)V\n    return-void\n.end method',
                      text, flags=re.DOTALL)
        p.write_text(text, encoding="utf-8")

    print("Step 2.14: Patching ReactNativeFeatureFlagsCxxInterop.smali...")
    for p in DECODED_DIR.rglob("ReactNativeFeatureFlagsCxxInterop.smali"):
        content = p.read_text(encoding="utf-8")
        def repl(m):
            sig = m.group(1)
            ret = m.group(2)
            sig_clean = sig.replace(' native ', ' ')
            if ret == 'Z':
                body = '    .locals 1\n    const/4 v0, 0x0\n    return v0\n'
            elif ret == 'D':
                body = '    .locals 2\n    const-wide/16 v0, 0x0\n    return-wide v0\n'
            elif ret == 'V':
                body = '    .locals 0\n    return-void\n'
            else:
                body = '    .locals 1\n    const/4 v0, 0x0\n    return-object v0\n'
            return f'{sig_clean}\n{body}.end method'

        content = re.sub(r'(\.method public static final native [^\n]+?\)([^\n]+?))\n\.end method', repl, content)
        p.write_text(content, encoding="utf-8")

    print("Step 2.15: Neutralizing all mbridge, N3, and RevenueCat iQO static string traps...")
    for p in DECODED_DIR.rglob("*.smali"):
        if "com" + os.sep + "mbridge" + os.sep + "msdk" in str(p) or "N3" + os.sep in str(p) or "eCotowdYCPggDU" in str(p):
            continue
        try:
            content = p.read_text(encoding="utf-8")
            if "Lcom/mbridge/msdk/" in content or "LN3/" in content or "eCotowdYCPggDU" in content:
                def repl_mb(m):
                    reg = m.group(1)
                    target = m.group(2)
                    if "vGJsbKNOZNUs" in target:
                        return f'const-string {reg}, ","'
                    if "ssjuriNGqs" in target:
                        return f'const-string {reg}, "io.grpc.internal.DnsNameResolverProvider.enable_service_config"'
                    if "NoRPzzBxaOriDN" in target:
                        return f'const-string {reg}, "UTF-8"'
                    return f'const-string {reg}, "diskwala.dummy.prop"'
                new_content = re.sub(r'sget-object\s+([vp]\d+),\s+(L(?:com/mbridge/msdk|N3|com/revenuecat/purchases/ui/revenuecatui/customercenter/extensions/iQO)/[^;]+;->[^:]+:Ljava/lang/String;)', repl_mb, content)
                if new_content != content:
                    p.write_text(new_content, encoding="utf-8")
        except Exception:
            pass

    print("Step 2.16: Adding null-safety to Arguments.addEntry & WritableNativeMap...")
    for p in DECODED_DIR.rglob("Arguments.smali"):
        text = p.read_text(encoding="utf-8")
        if "cond_null_key_safe" not in text and ".method private static addEntry(Lcom/facebook/react/bridge/WritableNativeMap;Ljava/lang/String;Ljava/lang/Object;)V" in text:
            text = text.replace(
                ".method private static addEntry(Lcom/facebook/react/bridge/WritableNativeMap;Ljava/lang/String;Ljava/lang/Object;)V\n    .locals 2",
                ".method private static addEntry(Lcom/facebook/react/bridge/WritableNativeMap;Ljava/lang/String;Ljava/lang/Object;)V\n    .locals 2\n    if-nez p1, :cond_null_key_safe\n    return-void\n    :cond_null_key_safe"
            )
            p.write_text(text, encoding="utf-8")

    for p in DECODED_DIR.rglob("WritableNativeMap.smali"):
        text = p.read_text(encoding="utf-8")
        if "cond_putmap_null_safe" not in text:
            text = text.replace(
                ".method public putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V\n    .locals 2",
                ".method public putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V\n    .locals 2\n    if-nez p1, :cond_putmap_null_safe\n    return-void\n    :cond_putmap_null_safe"
            )
            text = text.replace(
                ".method public putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V\n    .locals 2",
                ".method public putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V\n    .locals 2\n    if-nez p1, :cond_putarray_null_safe\n    return-void\n    :cond_putarray_null_safe"
            )
            p.write_text(text, encoding="utf-8")

    for p in DECODED_DIR.rglob("ReadableNativeMap.smali"):
        text = p.read_text(encoding="utf-8")
        # Safe getValue
        text = re.sub(
            r'\.method private final getValue\(Ljava/lang/String;\)Ljava/lang/Object;.*?\.end method',
            '''.method private final getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    if-nez p1, :cond_has_key
    const/4 v0, 0x0
    return-object v0
    :cond_has_key
    invoke-direct {p0}, Lcom/facebook/react/bridge/ReadableNativeMap;->getLocalMap()Ljava/util/HashMap;
    move-result-object v0
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    return-object v0
.end method''',
            text,
            flags=re.DOTALL
        )
        # Safe getDouble
        text = re.sub(
            r'\.method public getDouble\(Ljava/lang/String;\)D.*?\.end method',
            '''.method public getDouble(Ljava/lang/String;)D
    .locals 3
    if-nez p1, :cond_d_ok
    const-wide/16 v0, 0x0
    return-wide v0
    :cond_d_ok
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReadableNativeMap;->getNullableValue(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Ljava/lang/Number;
    if-eqz v1, :cond_d_def
    check-cast v0, Ljava/lang/Number;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D
    move-result-wide v0
    return-wide v0
    :cond_d_def
    const-wide/16 v0, 0x0
    return-wide v0
.end method''',
            text,
            flags=re.DOTALL
        )
        # Safe getInt
        text = re.sub(
            r'\.method public getInt\(Ljava/lang/String;\)I.*?\.end method',
            '''.method public getInt(Ljava/lang/String;)I
    .locals 2
    if-nez p1, :cond_i_ok
    const/4 v0, 0x0
    return v0
    :cond_i_ok
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReadableNativeMap;->getNullableValue(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Ljava/lang/Number;
    if-eqz v1, :cond_i_def
    check-cast v0, Ljava/lang/Number;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I
    move-result v0
    return v0
    :cond_i_def
    const/4 v0, 0x0
    return v0
.end method''',
            text,
            flags=re.DOTALL
        )
        # Safe getBoolean
        text = re.sub(
            r'\.method public getBoolean\(Ljava/lang/String;\)Z.*?\.end method',
            '''.method public getBoolean(Ljava/lang/String;)Z
    .locals 2
    if-nez p1, :cond_b_ok
    const/4 v0, 0x0
    return v0
    :cond_b_ok
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReadableNativeMap;->getNullableValue(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Ljava/lang/Boolean;
    if-eqz v1, :cond_b_def
    check-cast v0, Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v0
    return v0
    :cond_b_def
    const/4 v0, 0x0
    return v0
.end method''',
            text,
            flags=re.DOTALL
        )
        # Safe getMap
        text = re.sub(
            r'\.method public getMap\(Ljava/lang/String;\)Lcom/facebook/react/bridge/ReadableNativeMap;.*?\.end method',
            '''.method public getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableNativeMap;
    .locals 2
    if-nez p1, :cond_m_ok
    const/4 v0, 0x0
    return-object v0
    :cond_m_ok
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReadableNativeMap;->getNullableValue(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Lcom/facebook/react/bridge/ReadableNativeMap;
    if-eqz v1, :cond_m_def
    check-cast v0, Lcom/facebook/react/bridge/ReadableNativeMap;
    return-object v0
    :cond_m_def
    const/4 v0, 0x0
    return-object v0
.end method''',
            text,
            flags=re.DOTALL
        )
        # Safe getArray
        text = re.sub(
            r'\.method public getArray\(Ljava/lang/String;\)Lcom/facebook/react/bridge/ReadableArray;.*?\.end method',
            '''.method public getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;
    .locals 2
    if-nez p1, :cond_a_ok
    const/4 v0, 0x0
    return-object v0
    :cond_a_ok
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReadableNativeMap;->getNullableValue(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Lcom/facebook/react/bridge/ReadableArray;
    if-eqz v1, :cond_a_def
    check-cast v0, Lcom/facebook/react/bridge/ReadableArray;
    return-object v0
    :cond_a_def
    const/4 v0, 0x0
    return-object v0
.end method''',
            text,
            flags=re.DOTALL
        )
        p.write_text(text, encoding="utf-8")

    print("Step 2.17: Stubbing BlobCollector.smali nativeInstall...")
    for p in DECODED_DIR.rglob("BlobCollector.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(r'\.method private final native nativeInstall\(Ljava/lang/Object;J\)V\s*\.end method',
                      '.method private final nativeInstall(Ljava/lang/Object;J)V\n    .locals 0\n    return-void\n.end method',
                      text)
        p.write_text(text, encoding="utf-8")

    print("Step 2.18: Patching ReactTextInputShadowNode.smali createInternalEditText...")
    for p in DECODED_DIR.rglob("ReactTextInputShadowNode.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(
            r'\.method private final createInternalEditText\(\)Landroid/widget/EditText;.*?\.end method',
            '''.method private final createInternalEditText()Landroid/widget/EditText;
    .locals 4

    invoke-virtual {p0}, Lcom/facebook/react/uimanager/ReactShadowNodeImpl;->getThemedContext()Lcom/facebook/react/uimanager/ThemedReactContext;
    move-result-object v0

    new-instance v1, Landroid/widget/EditText;
    const/4 v2, 0x0
    const/4 v3, 0x0
    invoke-direct {v1, v0, v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-object v1
.end method''',
            text,
            flags=re.DOTALL
        )
        p.write_text(text, encoding="utf-8")

    print("Step 2.19: Patching ReactSwitchShadowNode.smali measure...")
    for p in DECODED_DIR.rglob("ReactSwitchShadowNode.smali"):
        text = p.read_text(encoding="utf-8")
        text = re.sub(
            r'\.method public measure\(Lcom/facebook/yoga/YogaNode;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;\)J.*?\.end method',
            '''.method public measure(Lcom/facebook/yoga/YogaNode;FLcom/facebook/yoga/YogaMeasureMode;FLcom/facebook/yoga/YogaMeasureMode;)J
    .locals 2
    const/16 v0, 0x80
    const/16 v1, 0x48
    invoke-static {v0, v1}, Lcom/facebook/yoga/YogaMeasureOutput;->make(II)J
    move-result-wide v0
    return-wide v0
.end method''',
            text,
            flags=re.DOTALL
        )
        p.write_text(text, encoding="utf-8")

    print("Step 2.20: Sanitizing all XML drawables with @null...")
    for p in (DECODED_DIR / "res").rglob("*.xml"):
        content = p.read_text(encoding="utf-8", errors="ignore")
        orig = content
        content = content.replace('@null', '@android:color/transparent')
        if content != orig:
            p.write_text(content, encoding="utf-8")

    print("Step 3: Patching libhermestooling.so...")
    ht_path = lib_arm64 / "libhermestooling.so"
    with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
        ht_path.write_bytes(zf.read("lib/arm64-v8a/libhermestooling.so"))

    ht_data = bytearray(ht_path.read_bytes())
    
    # Neutralize 0x17400 trap
    for offset in range(0x17400, 0x17440, 4):
        struct.pack_into('<I', ht_data, offset, 0xd503201f)
    struct.pack_into('<I', ht_data, 0x17400, 0xd65f03c0)

    # Patch JNI_OnLoad (0x1eab4) in libhermestooling.so
    ht_onload_addr = 0x1eab4
    ht_onload = bytearray()
    ht_onload.extend(struct.pack('<I', 0xd10083ff)) # sub sp, sp, #0x20
    ht_onload.extend(struct.pack('<I', 0xa9017bfd)) # stp x29, x30, [sp, #0x10]
    
    pc = ht_onload_addr + len(ht_onload)
    ht_onload.extend(struct.pack('<I', encode_bl(pc, 0x175dc))) # bl HermesExecutor::registerNatives
    pc = ht_onload_addr + len(ht_onload)
    ht_onload.extend(struct.pack('<I', encode_bl(pc, 0x1ee00))) # bl HermesSamplingProfiler::registerNatives

    ht_onload.extend(struct.pack('<I', 0x528000c0)) # mov w0, #6
    ht_onload.extend(struct.pack('<I', 0x72a00020)) # movk w0, #1, lsl #16
    ht_onload.extend(struct.pack('<I', 0xa9417bfd)) # ldp x29, x30, [sp, #0x10]
    ht_onload.extend(struct.pack('<I', 0x910083ff)) # add sp, sp, #0x20
    ht_onload.extend(struct.pack('<I', 0xd65f03c0)) # ret

    ht_data[ht_onload_addr : ht_onload_addr + len(ht_onload)] = ht_onload
    for offset in range(ht_onload_addr + len(ht_onload), 0x1eb20, 4):
        struct.pack_into('<I', ht_data, offset, 0xd503201f)
    ht_path.write_bytes(ht_data)

    print("Step 3.5: Patching libhermes.so...")
    hermes_path = lib_arm64 / "libhermes.so"
    with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
        hermes_path.write_bytes(zf.read("lib/arm64-v8a/libhermes.so"))
    hermes_data = bytearray(hermes_path.read_bytes())
    # Bypass stack canary check at 0xc0044..0xc0050 to avoid corrupted x29 dereference
    for offset in range(0xc0044, 0xc0054, 4):
        struct.pack_into('<I', hermes_data, offset, 0xd503201f)
    hermes_path.write_bytes(hermes_data)

    print("Step 4: Patching libreactnative.so...")
    rn_path = lib_arm64 / "libreactnative.so"
    with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
        rn_path.write_bytes(zf.read("lib/arm64-v8a/libreactnative.so"))

    rn_data = bytearray(rn_path.read_bytes())
    
    # Neutralize DT_INIT trap at file offset 0x5c0000 (vaddr 0x5d0000) in libreactnative.so
    struct.pack_into('<I', rn_data, 0x5c0000, 0xd65f03c0)

    rn_funcs = [
        0x44ea14, # CatalystInstanceImpl
        0x47ba28, # WritableNativeMap
        0x479778, # WritableNativeArray
        0x47296c, # ReadableNativeMap
        0x47124c, # ReadableNativeArray
        0x46e5fc, # NativeArray
        0x46f0c0, # NativeMap
        0x46e1bc, # JReactMarker
        0x473148, # TransformHelper
        0x46a014, # ReactInstanceManagerInspectorTarget
        0x3b9530, # DefaultComponentsRegistry
        0x3bab4c, # DefaultTurboModuleManagerDelegate
        0x523d30, # TurboModuleManager
        0x5294b0, # ComponentNameResolverBinding
        0x52a960, # UIConstantsProviderBinding
        0x27388c, # ComponentFactory
        0x299934, # EventBeatManager
        0x29ad54, # EventEmitterWrapper
        0x2ad3bc, # FabricUIManagerBinding
        0x2b35f4, # StateWrapperImpl
        0x2b46b0, # SurfaceHandlerBinding
    ]

    rn_onload_addr = 0x2b5bf8
    rn_callback_addr = 0x2b5c5c
    rn_code = bytearray()
    rn_code.extend(struct.pack('<I', 0xd10243ff)) # sub sp, sp, #0x90
    rn_code.extend(struct.pack('<I', 0xa9087bfd)) # stp x29, x30, [sp, #0x80]
    rn_code.extend(struct.pack('<I', 0xf9003bf3)) # str x19, [sp, #0x70]
    rn_code.extend(struct.pack('<I', 0xaa0003f3)) # mov x19, x0
    
    # Store JavaVM* to 0x5b0b38 so Yoga & React can obtain JNIEnv
    pc = rn_onload_addr + len(rn_code)
    rn_code.extend(struct.pack('<I', encode_adrp(8, pc, 0x5b0b38)))
    rn_code.extend(struct.pack('<I', 0xf9059d00)) # str x0, [x8, #0xb38]

    rn_code.extend(struct.pack('<I', 0xa9007fff)) # stp xzr, xzr, [sp]
    rn_code.extend(struct.pack('<I', 0xa9017fff)) # stp xzr, xzr, [sp, #0x10]
    rn_code.extend(struct.pack('<I', 0xa9027fff)) # stp xzr, xzr, [sp, #0x20]
    rn_code.extend(struct.pack('<I', 0xa9037fff)) # stp xzr, xzr, [sp, #0x30]
    pc = rn_onload_addr + len(rn_code)
    rn_code.extend(struct.pack('<I', encode_adr(3, pc, rn_callback_addr)))
    rn_code.extend(struct.pack('<I', 0xf9001be3)) # str x3, [sp, #0x30]
    rn_code.extend(struct.pack('<I', 0x910003e2)) # mov x2, sp
    rn_code.extend(struct.pack('<I', 0xf90023e2)) # str x2, [sp, #0x40]
    rn_code.extend(struct.pack('<I', 0x910103e2)) # add x2, sp, #0x40
    rn_code.extend(struct.pack('<I', 0xf90033e2)) # str x2, [sp, #0x60]
    rn_code.extend(struct.pack('<I', 0xaa1303e0)) # mov x0, x19
    rn_code.extend(struct.pack('<I', 0x910103e1)) # add x1, sp, #0x40
    pc = rn_onload_addr + len(rn_code)
    rn_code.extend(struct.pack('<I', encode_bl(pc, 0x5716f0))) # bl facebook::jni::initialize
    rn_code.extend(struct.pack('<I', 0x528000c0)) # mov w0, #6
    rn_code.extend(struct.pack('<I', 0x72a00020)) # movk w0, #1, lsl #16
    rn_code.extend(struct.pack('<I', 0xf9403bf3)) # ldr x19, [sp, #0x70]
    rn_code.extend(struct.pack('<I', 0xa9487bfd)) # ldp x29, x30, [sp, #0x80]
    rn_code.extend(struct.pack('<I', 0x910243ff)) # add sp, sp, #0x90
    rn_code.extend(struct.pack('<I', 0xd65f03c0)) # ret

    # Callback
    rn_cb = bytearray()
    rn_cb.extend(struct.pack('<I', 0xd10083ff)) # sub sp, sp, #0x20
    rn_cb.extend(struct.pack('<I', 0xa9017bfd)) # stp x29, x30, [sp, #0x10]
    rn_cb.extend(struct.pack('<I', 0xf90003f3)) # str x19, [sp]

    for f in rn_funcs:
        pc = rn_callback_addr + len(rn_cb)
        rn_cb.extend(struct.pack('<I', encode_bl(pc, f)))

    # YogaNative (117 methods)
    pc = rn_callback_addr + len(rn_cb)
    rn_cb.extend(struct.pack('<I', encode_bl(pc, 0x570c70))) # bl Environment::current
    rn_cb.extend(struct.pack('<I', 0xaa0003f3)) # mov x19, x0
    rn_cb.extend(struct.pack('<I', 0xf9400268)) # ldr x8, [x19]
    rn_cb.extend(struct.pack('<I', 0xf9401908)) # ldr x8, [x8, #0x30] (FindClass)
    rn_cb.extend(struct.pack('<I', 0xaa1303e0)) # mov x0, x19
    pc = rn_callback_addr + len(rn_cb)
    rn_cb.extend(struct.pack('<I', encode_adrp(1, pc, 0x15c4a4)))
    rn_cb.extend(struct.pack('<I', encode_add_imm(1, 1, 0x15c4a4 & 0xFFF)))
    rn_cb.extend(struct.pack('<I', 0xd63f0100)) # blr x8
    
    skip_pc = rn_callback_addr + len(rn_cb) + 9 * 4
    pc = rn_callback_addr + len(rn_cb)
    rn_cb.extend(struct.pack('<I', encode_cbz(0, pc, skip_pc)))
    rn_cb.extend(struct.pack('<I', 0xaa0003e1)) # mov x1, x0
    rn_cb.extend(struct.pack('<I', 0xaa1303e0)) # mov x0, x19
    pc = rn_callback_addr + len(rn_cb)
    rn_cb.extend(struct.pack('<I', encode_adrp(2, pc, 0x5a1dd0)))
    rn_cb.extend(struct.pack('<I', encode_add_imm(2, 2, 0x5a1dd0 & 0xFFF)))
    rn_cb.extend(struct.pack('<I', 0x52800ea3)) # mov w3, #117
    rn_cb.extend(struct.pack('<I', 0xf9400268)) # ldr x8, [x19]
    rn_cb.extend(struct.pack('<I', 0xf9435d08)) # ldr x8, [x8, #0x6b8] (RegisterNatives)
    rn_cb.extend(struct.pack('<I', 0xd63f0100)) # blr x8

    rn_cb.extend(struct.pack('<I', 0xf94003f3)) # ldr x19, [sp]
    rn_cb.extend(struct.pack('<I', 0xa9417bfd)) # ldp x29, x30, [sp, #0x10]
    rn_cb.extend(struct.pack('<I', 0x910083ff)) # add sp, sp, #0x20
    rn_cb.extend(struct.pack('<I', 0xd65f03c0)) # ret

    rn_code.extend(rn_cb)
    rn_data[rn_onload_addr : rn_onload_addr + len(rn_code)] = rn_code
    for offset in range(rn_onload_addr + len(rn_code), 0x2b5d9c, 4):
        struct.pack_into('<I', rn_data, offset, 0xd503201f)

    # Clean encrypted .data section and set valid __emutls_control structures
    # Zero out encrypted .data segment from 0x599940 to 0x599dc0
    rn_data[0x599940:0x599dc0] = b'\x00' * (0x599dc0 - 0x599940)
    
    # 1. 0x5a1a28 (file 0x599a28): useRuntimeShadowNodeReferenceUpdateOnThread (bool)
    struct.pack_into('<QQQQ', rn_data, 0x599a28, 1, 1, 0, 0)
    # 2. 0x5a1ab0 (file 0x599ab0): threadLocalTransactionTelemetry (8 bytes)
    struct.pack_into('<QQQQ', rn_data, 0x599ab0, 8, 8, 0, 0x17fe50)
    # 3. 0x5a1cd0 (file 0x599cd0): threadLocalLayoutContext (32 bytes)
    struct.pack_into('<QQQQ', rn_data, 0x599cd0, 32, 8, 0, 0x18e220)
    # 4. 0x5a1d90 (file 0x599d90): Yoga layout context stack (48 bytes)
    struct.pack_into('<QQQQ', rn_data, 0x599d90, 48, 8, 0, 0)
    # 5. 0x5a1db0 (file 0x599db0): Yoga layout context bool (1 byte)
    struct.pack_into('<QQQQ', rn_data, 0x599db0, 1, 1, 0, 0)

    rn_path.write_bytes(rn_data)

    print("Step 5: Patching libreactnativequickcrypto.so...")
    qc_path = lib_arm64 / "libreactnativequickcrypto.so"
    with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
        qc_path.write_bytes(zf.read("lib/arm64-v8a/libreactnativequickcrypto.so"))

    qc_data = bytearray(qc_path.read_bytes())
    qc_onload_addr = 0x4f160
    qc_cb_addr = 0x4f364
    qc_code = bytearray()
    qc_code.extend(struct.pack('<I', 0xd10243ff))
    qc_code.extend(struct.pack('<I', 0xa9087bfd))
    qc_code.extend(struct.pack('<I', 0xf9003bf3))
    qc_code.extend(struct.pack('<I', 0xaa0003f3))
    qc_code.extend(struct.pack('<I', 0xa9007fff))
    qc_code.extend(struct.pack('<I', 0xa9017fff))
    qc_code.extend(struct.pack('<I', 0xa9027fff))
    qc_code.extend(struct.pack('<I', 0xa9037fff))
    pc = qc_onload_addr + len(qc_code)
    qc_code.extend(struct.pack('<I', encode_adr(3, pc, qc_cb_addr)))
    qc_code.extend(struct.pack('<I', 0xf9001be3))
    qc_code.extend(struct.pack('<I', 0x910003e2))
    qc_code.extend(struct.pack('<I', 0xf90023e2))
    qc_code.extend(struct.pack('<I', 0x910103e2))
    qc_code.extend(struct.pack('<I', 0xf90033e2))
    qc_code.extend(struct.pack('<I', 0xaa1303e0))
    qc_code.extend(struct.pack('<I', 0x910103e1))
    pc = qc_onload_addr + len(qc_code)
    qc_code.extend(struct.pack('<I', encode_bl(pc, 0x9e3b0)))
    qc_code.extend(struct.pack('<I', 0x528000c0))
    qc_code.extend(struct.pack('<I', 0x72a00020))
    qc_code.extend(struct.pack('<I', 0xf9403bf3))
    qc_code.extend(struct.pack('<I', 0xa9487bfd))
    qc_code.extend(struct.pack('<I', 0x910243ff))
    qc_code.extend(struct.pack('<I', 0xd65f03c0)) # ret
    qc_data[qc_onload_addr : qc_onload_addr + len(qc_code)] = qc_code
    for offset in range(qc_onload_addr + len(qc_code), 0x4f1f0, 4):
        struct.pack_into('<I', qc_data, offset, 0xd503201f)

    # Patch MGLSmartHostObject::get (0x6507c) -> return jsi::Value::undefined() (stp xzr, xzr, [x8]; ret)
    struct.pack_into('<II', qc_data, 0x6507c, 0xa9007d1f, 0xd65f03c0)

    # Patch MGLSmartHostObject::getPropertyNames (0x64bd4) -> return empty vector (stp xzr, xzr, [x8]; str xzr, [x8, #0x10]; ret)
    struct.pack_into('<III', qc_data, 0x64bd4, 0xa9007d1f, 0xf900091f, 0xd65f03c0)

    qc_path.write_bytes(qc_data)

    print("Step 6: Sanitizing libcrypto.so traps...")
    crypto_path = lib_arm64 / "libcrypto.so"
    with zipfile.ZipFile(WORK_DIR / "config.arm64_v8a.apk", 'r') as zf:
        crypto_path.write_bytes(zf.read("lib/arm64-v8a/libcrypto.so"))

    crypto_data = bytearray(crypto_path.read_bytes())
    # In libcrypto.so:
    # LOAD vaddr 0x234000..0x467c70 -> file offset 0x230000..0x463c70 (diff = 0x4000)
    # vaddr 0x466b7c -> file offset 0x462b7c
    # vaddr 0x4671d4 -> file offset 0x4631d4
    # vaddr 0x35d14c -> file offset 0x35914c
    # LOAD vaddr 0x4dc000..0x4dd000 -> file offset 0x4c8000..0x4c9000 (diff = 0x14000)
    # vaddr 0x4dc000 (DT_INIT) -> file offset 0x4c8000
    struct.pack_into('<I', crypto_data, 0x462b7c, 0xd65f03c0) # ret at 0x466b7c
    struct.pack_into('<I', crypto_data, 0x4631d4, 0xd65f03c0) # ret at 0x4671d4
    struct.pack_into('<I', crypto_data, 0x35914c, 0xd65f03c0) # ret at 0x35d14c
    struct.pack_into('<I', crypto_data, 0x4c8000, 0xd65f03c0) # ret at 0x4dc000 (DT_INIT)

    # OPENSSL_init_crypto at vaddr 0x362054 (file 0x35e054) -> return 1
    struct.pack_into('<II', crypto_data, 0x35e054, 0x52800020, 0xd65f03c0)
    # ossl_init_base at vaddr 0x3624e0 (file 0x35e4e0) -> return 1
    struct.pack_into('<II', crypto_data, 0x35e4e0, 0x52800020, 0xd65f03c0)
    # EVP_get_digestbyname at vaddr 0x3441a0 (file 0x3401a0) -> branch to EVP_sha256 (0x341698)
    struct.pack_into('<I', crypto_data, 0x3401a0, 0x17fff53e)
    # EVP_get_digestbyname at vaddr 0x3441ac (file 0x3401ac) -> branch to EVP_sha256 (0x341698)
    struct.pack_into('<I', crypto_data, 0x3401ac, 0x17fff53b)

    # CRYPTO_THREAD_run_once at vaddr 0x375d58 (file 0x371d58)
    run_once_code = struct.pack('<14I',
        0xa9be7bfd, # stp x29, x30, [sp, #-0x20]!
        0xa90153f3, # stp x19, x20, [sp, #0x10]
        0x910003fd, # mov x29, sp
        0xaa0003f3, # mov x19, x0
        0xaa0103f4, # mov x20, x1
        0xb9400268, # ldr w8, [x19]
        0x35000088, # cbnz w8, #0x10 (to mov w0, #1)
        0x52800028, # mov w8, #1
        0xb9000268, # str w8, [x19]
        0xd63f0280, # blr x20
        0x52800020, # mov w0, #1
        0xa94153f3, # ldp x19, x20, [sp, #0x10]
        0xa8c27bfd, # ldp x29, x30, [sp], #0x20
        0xd65f03c0  # ret
    )
    crypto_data[0x371d58 : 0x371d58 + len(run_once_code)] = run_once_code

    # CRYPTO_THREAD_init_local at vaddr 0x375d74 (file 0x371d74) -> return 1
    struct.pack_into('<II', crypto_data, 0x371d74, 0x52800020, 0xd65f03c0)
    # CRYPTO_THREAD_cleanup_local at vaddr 0x375d90 (file 0x371d90) -> return 1
    struct.pack_into('<II', crypto_data, 0x371d90, 0x52800020, 0xd65f03c0)
    # CRYPTO_THREAD_get_local at vaddr 0x375db0 (file 0x371db0) -> return 0
    struct.pack_into('<II', crypto_data, 0x371db0, 0xaa1f03e0, 0xd65f03c0)
    # CRYPTO_THREAD_set_local at vaddr 0x375db4 (file 0x371db4) -> return 1
    struct.pack_into('<II', crypto_data, 0x371db4, 0x52800020, 0xd65f03c0)
    # CRYPTO_THREAD_lock_free at vaddr 0x375e58 (file 0x371e58) -> ret
    struct.pack_into('<I', crypto_data, 0x371e58, 0xd65f03c0)

    # Patch all 141 un-relocated PLT slots from 0x4673a0 to 0x467c60 (file 0x4633a0 to 0x463c60) with default safe return 0
    for plt_vaddr in range(0x4673a0, 0x467c70, 16):
        fo = plt_vaddr - 0x4000
        struct.pack_into('<IIII', crypto_data, fo, 0x52800000, 0xd65f03c0, 0xd503201f, 0xd503201f)

    # 1. memcpy at 0x4673c0 (file 0x4633c0)
    memcpy_code = struct.pack('<8I',
        0xaa0003e3, # mov x3, x0
        0xb40000c2, # cbz x2, 2f (+24 bytes -> ret)
        0x38401424, # 1: ldrb w4, [x1], #1
        0x38001464, # strb w4, [x3], #1
        0x51000442, # sub x2, x2, #1
        0x17fffffc, # b 1b (-16 bytes)
        0xd65f03c0, # 2: ret
        0xd503201f  # nop
    )
    crypto_data[0x4633c0 : 0x4633c0 + len(memcpy_code)] = memcpy_code

    # 2. memset at 0x4673d0 (file 0x4633d0)
    memset_code = struct.pack('<8I',
        0xaa0003e3, # mov x3, x0
        0xb40000c2, # cbz x2, 2f (+24 bytes -> ret)
        0x38001461, # 1: strb w1, [x3], #1
        0x51000442, # sub x2, x2, #1
        0x35ffffc2, # cbnz w2, 1b (-8 bytes)
        0xd65f03c0, # 2: ret
        0xd503201f, 0xd503201f
    )
    crypto_data[0x4633d0 : 0x4633d0 + len(memset_code)] = memset_code

    # 3. memcmp at 0x4673e0 (file 0x4633e0)
    memcmp_code = struct.pack('<10I',
        0xb4000102, # cbz x2, 3f (+32 bytes -> mov w0, 0; ret)
        0x38401403, # 1: ldrb w3, [x0], #1
        0x38401424, # ldrb w4, [x1], #1
        0x6b04007f, # subs w5, w3, w4
        0x540000a1, # b.ne 2f (+20 bytes -> mov w0, w5; ret)
        0x51000442, # sub x2, x2, #1
        0x35ffff62, # cbnz w2, 1b (-20 bytes)
        0x52800000, # 3: mov w0, wzr
        0xd65f03c0, # ret
        0x2a0503e0  # 2: mov w0, w5; ret (at next insn 0xd65f03c0)
    )
    crypto_data[0x4633e0 : 0x4633e0 + len(memcmp_code)] = memcmp_code

    # 4. strlen at 0x4673f0 (file 0x4633f0)
    strlen_code = struct.pack('<8I',
        0xaa0003e1, # mov x1, x0
        0x38401422, # 1: ldrb w2, [x1], #1
        0x35ffffc2, # cbnz w2, 1b (-8 bytes)
        0xcb000020, # sub x0, x1, x0
        0x51000400, # sub x0, x0, #1
        0xd65f03c0, # ret
        0xd503201f, 0xd503201f
    )
    crypto_data[0x4633f0 : 0x4633f0 + len(strlen_code)] = strlen_code

    # 5. strncmp at 0x467400 (file 0x463400)
    strncmp_code = struct.pack('<10I',
        0xb4000102, # cbz x2, 3f (+32 bytes -> mov w0, 0; ret)
        0x38401403, # 1: ldrb w3, [x0], #1
        0x38401424, # ldrb w4, [x1], #1
        0x6b04007f, # subs w5, w3, w4
        0x540000a1, # b.ne 2f (+20 bytes)
        0x34000083, # cbz w3, 3f (+16 bytes)
        0x51000442, # sub x2, x2, #1
        0x35ffff42, # cbnz w2, 1b (-24 bytes)
        0x52800000, # 3: mov w0, wzr
        0xd65f03c0  # ret
    )
    crypto_data[0x463400 : 0x463400 + len(strncmp_code)] = strncmp_code

    # 6. strcmp at 0x467410 (file 0x463410)
    strcmp_code = struct.pack('<8I',
        0x38401402, # 1: ldrb w2, [x0], #1
        0x38401423, # ldrb w3, [x1], #1
        0x6b03005f, # subs w4, w2, w3
        0x54000081, # b.ne 2f (+16 bytes)
        0x35ffff82, # cbnz w2, 1b (-16 bytes)
        0x52800000, # mov w0, wzr
        0xd65f03c0, # ret
        0x2a0403e0  # 2: mov w0, w4; ret
    )
    crypto_data[0x463410 : 0x463410 + len(strcmp_code)] = strcmp_code

    # 7. time at 0x467430 (file 0x463430)
    time_code = struct.pack('<6I',
        0xb4000040, # cbz x0, 1f (+8 bytes)
        0xd2900008, # mov x8, #0x8000
        0xf9000008, # str x8, [x0]
        0xd2900000, # 1: mov x0, #0x8000
        0xd65f03c0, # ret
        0xd503201f  # nop
    )
    crypto_data[0x463430 : 0x463430 + len(time_code)] = time_code

    # 8. memmove at 0x467490 (file 0x463490) -> branch to memcpy (0x4673c0)
    struct.pack_into('<IIII', crypto_data, 0x463490, 0x17ffffcc, 0xd503201f, 0xd503201f, 0xd503201f)

    # 9. __errno at 0x4674b0 (file 0x4634b0)
    errno_code = struct.pack('<4I',
        0x90000320, # adrp x0, #0x4cb000
        0x91226000, # add x0, x0, #0x898
        0xd65f03c0, # ret
        0xd503201f  # nop
    )
    crypto_data[0x4634b0 : 0x4634b0 + len(errno_code)] = errno_code

    # 10. calloc at 0x467770 (file 0x463770) -> mul x0, x0, x1; b malloc (0x467890)
    calloc_code = struct.pack('<4I',
        0x9b017c00, # mul x0, x0, x1
        0x14000047, # b #0x467890
        0xd503201f, 0xd503201f
    )
    crypto_data[0x463770 : 0x463770 + len(calloc_code)] = calloc_code

    # 11. free at 0x467790 (file 0x463790) and 0x4678a0 (file 0x4638a0)
    struct.pack_into('<IIII', crypto_data, 0x463790, 0xd65f03c0, 0xd503201f, 0xd503201f, 0xd503201f)
    struct.pack_into('<IIII', crypto_data, 0x4638a0, 0xd65f03c0, 0xd503201f, 0xd503201f, 0xd503201f)

    # 12. malloc at 0x467890 (file 0x463890) - Bump-pointer allocator in mapped .bss arena (0x4cb100)
    malloc_code = struct.pack('<11I',
        0x91003c00, # add x0, x0, #15
        0x927cec00, # and x0, x0, #~15
        0x90000328, # adrp x8, #0x4cb000
        0xf9404109, # ldr x9, [x8, #0x80] (current heap ptr)
        0xb5000069, # cbnz x9, 1f (+12 bytes)
        0x91040109, # add x9, x8, #0x100 (initial heap base = 0x4cb100)
        0x8b00012a, # 1f: add x10, x9, x0 (next heap ptr)
        0xf900410a, # str x10, [x8, #0x80] (save next ptr)
        0xaa0903e0, # mov x0, x9 (return allocated ptr)
        0xd65f03c0, # ret
        0xd503201f  # nop
    )
    crypto_data[0x463890 : 0x463890 + len(malloc_code)] = malloc_code

    # 13. realloc at 0x4678b0 (file 0x4638b0) -> b malloc
    struct.pack_into('<IIII', crypto_data, 0x4638b0, 0x17ffff78, 0xd503201f, 0xd503201f, 0xd503201f)

    # 14. clock_gettime at 0x467ad0 (file 0x463ad0)
    clock_code = struct.pack('<6I',
        0xb4000040, # cbz x0, 1f (+8 bytes)
        0xd2800028, # mov x8, #1
        0xf9000008, # str x8, [x0]
        0xf900041f, # str xzr, [x0, #8]
        0x52800000, # mov w0, #0
        0xd65f03c0  # ret
    )
    crypto_data[0x463ad0 : 0x463ad0 + len(clock_code)] = clock_code

    crypto_path.write_bytes(crypto_data)

    print("Step 7: Neutralizing FreeRASP / Ea/i.smali...")
    for p in DECODED_DIR.rglob("i.smali"):
        if "Ea" in str(p):
            p.write_text("""
.class public final LEa/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/react/ReactPackage;

# direct methods
.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public createNativeModules(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    return-object v0
.end method

.method public createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    return-object v0
.end method
""".strip(), encoding="utf-8")

    print("Step 8: Patching ReactMarker.smali...")
    for p in DECODED_DIR.rglob("ReactMarker.smali"):
        text = p.read_text(encoding="utf-8")
        if ".method private static native notifyNativeMarker" in text:
            text = text.replace(".method private static native notifyNativeMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;Ljava/lang/String;I)V\n.end method",
                                ".method private static notifyNativeMarker(Lcom/facebook/react/bridge/ReactMarkerConstants;Ljava/lang/String;I)V\n    .locals 0\n    return-void\n.end method")
            p.write_text(text, encoding="utf-8")

    print("Step 9: Patching InspectorFlags.smali...")
    for p in DECODED_DIR.rglob("InspectorFlags.smali"):
        p.write_text("""
.class public final Lcom/facebook/react/devsupport/InspectorFlags;
.super Ljava/lang/Object;
.source "SourceFile"

# static fields
.field public static final INSTANCE:Lcom/facebook/react/devsupport/InspectorFlags;

# direct methods
.method static constructor <clinit>()V
    .locals 1
    new-instance v0, Lcom/facebook/react/devsupport/InspectorFlags;
    invoke-direct {v0}, Lcom/facebook/react/devsupport/InspectorFlags;-><init>()V
    sput-object v0, Lcom/facebook/react/devsupport/InspectorFlags;->INSTANCE:Lcom/facebook/react/devsupport/InspectorFlags;
    return-void
.end method

.method private constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static final getFuseboxEnabled()Z
    .locals 1
    const/4 v0, 0x0
    return v0
.end method

.method public static final getIsProfilingBuild()Z
    .locals 1
    const/4 v0, 0x0
    return v0
.end method
""".strip(), encoding="utf-8")

    print("Step 10: Patching MainApplication.smali...")
    for p in DECODED_DIR.rglob("MainApplication.smali"):
        text = p.read_text(encoding="utf-8")
        
        # Remove static clinit pairip invocation
        text = re.sub(r'\.method static constructor <clinit>\(\)V.*?\.end method', '', text, flags=re.DOTALL)
        
        idx = text.find(".method public onCreate()V")
        new_on_create = """
.method public onCreate()V
    .locals 3

    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    const-string v0, "STARTUP_TRACE"
    const-string v1, "MainApplication.onCreate: loading libraries..."
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;->INSTANCE:Lcom/facebook/react/soloader/OpenSourceMergedSoMapping;
    invoke-static {p0, v0}, Lcom/facebook/soloader/SoLoader;->init(Landroid/content/Context;Lcom/facebook/soloader/ExternalSoMapping;)V

    :try_start_0
    const-string v0, "reactnative"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    const-string v0, "STARTUP_TRACE"
    const-string v1, "Loaded reactnative successfully!"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0
    const-string v1, "STARTUP_TRACE"
    const-string v2, "Failed to load reactnative!"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    :try_start_1
    const-string v0, "hermestooling"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    const-string v0, "STARTUP_TRACE"
    const-string v1, "Loaded hermestooling successfully!"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0
    const-string v1, "STARTUP_TRACE"
    const-string v2, "Failed to load hermestooling!"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    :try_start_2
    const-string v0, "appmodules"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    const-string v0, "STARTUP_TRACE"
    const-string v1, "Loaded appmodules successfully!"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0
    const-string v1, "STARTUP_TRACE"
    const-string v2, "Failed to load appmodules!"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    :try_start_3
    const-string v0, "reactnativequickcrypto"
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    const-string v0, "STARTUP_TRACE"
    const-string v1, "Loaded reactnativequickcrypto successfully!"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0
    const-string v1, "STARTUP_TRACE"
    const-string v2, "Failed to load reactnativequickcrypto!"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    invoke-static {}, Lcom/facebook/react/bridge/ReactNativeJniCommonSoLoader;->staticInit()V
    invoke-static {}, Lcom/facebook/react/bridge/BridgeSoLoader;->staticInit()V

    const/4 v0, 0x0
    invoke-static {v0, v0, v0}, Lcom/facebook/react/defaults/DefaultNewArchitectureEntryPoint;->load(ZZZ)V

    return-void
.end method
""".strip()
        text = text[:idx] + new_on_create + "\n"
        p.write_text(text, encoding="utf-8")

    print("Step 11: Restoring clean JS bundle (HBC) and mapping QuickBase64 -> ImageLoader...")
    bundle_path = DECODED_DIR / "assets" / "index.android.bundle"
    with zipfile.ZipFile(WORK_DIR / "com.diskwalaapp.apk", 'r') as zf:
        bundle_data = zf.read("assets/index.android.bundle")
    
    # Replace b"QuickBase64" (11 bytes) with b"ImageLoader" (11 bytes) so TurboModuleRegistry.getEnforcing succeeds and JS uses safe base64 polyfill
    bundle_data = bundle_data.replace(b'QuickBase64', b'ImageLoader')
    bundle_path.write_bytes(bundle_data)
    print("Hermes Bytecode bundle configured successfully!")

    print("Step 12: Building APK with Apktool...")
    out_apk = WORK_DIR / "diskwala_master.apk"
    run(f'java -jar "{APKTOOL_JAR}" b "{DECODED_DIR}" -o "{out_apk}" --use-aapt2')

    print("Step 13: Generating Keystore, Aligning & Signing...")
    if not KEYSTORE_PATH.exists():
        run(f'"{KEYTOOL_EXE}" -genkey -v -keystore "{KEYSTORE_PATH}" -alias diskwala -keyalg RSA -keysize 2048 -validity 10000 -storepass diskwala123 -keypass diskwala123 -dname "CN=DiskWala, OU=DiskWala, O=DiskWala, L=DiskWala, S=DiskWala, C=US"')

    aligned_apk = WORK_DIR / "diskwala_aligned.apk"
    signed_apk = WORK_DIR / "diskwala_master_signed.apk"
    zipalign_exe = BUILD_TOOLS / "zipalign.exe"
    apksigner_bat = BUILD_TOOLS / "apksigner.bat"

    run(f'"{zipalign_exe}" -f 4 "{out_apk}" "{aligned_apk}"')
    run(f'powershell -Command "& \'{apksigner_bat}\' sign --ks \'{KEYSTORE_PATH}\' --ks-pass pass:diskwala123 --key-pass pass:diskwala123 --out \'{signed_apk}\' \'{aligned_apk}\'"')

    print("Step 14: Installing on Device...")
    subprocess.run('adb uninstall com.diskwalaapp', shell=True)
    run(f'adb install "{signed_apk}"')
    print("SUCCESS! Master patched APK installed on device!")

if __name__ == "__main__":
    main()
