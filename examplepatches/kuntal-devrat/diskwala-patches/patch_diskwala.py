#!/usr/bin/env python3
"""
Manual patch applier for DiskWala 24.5 (334) - mirrors Morphe patches logic.
Applies the same stubbing as the Kotlin patches to decoded smali for quick verification
without needing Morphe build (which requires GitHub Packages auth).

Usage:
  python patch_diskwala.py --decoded C:/Users/Pikazu/AppData/Local/Temp/opencode/diskwala/decoded_base
"""
import pathlib
import re
import argparse

def patch_file(path: pathlib.Path, old: str, new: str, description: str):
    text = path.read_text(encoding='utf-8', errors='ignore')
    if old in text:
        print(f"[PATCH] {description}: {path.name}")
        text = text.replace(old, new)
        path.write_text(text, encoding='utf-8')
        return True
    else:
        # Try regex fallback
        if re.search(re.escape(old[:40]), text):
            print(f"[WARN] partial match for {description}")
        else:
            print(f"[SKIP] {description} - pattern not found in {path.name}")
        return False

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--decoded", required=True, help="apktool decoded dir")
    args = parser.parse_args()
    base = pathlib.Path(args.decoded)

    patches_applied = 0

    # 1) StartupLauncher.launch -> return-void
    p = base / "smali_classes2/com/pairip/StartupLauncher.smali"
    if p.exists():
        txt = p.read_text(encoding='utf-8')
        # Replace method body between .method ... launch()V and .end method to just return-void
        # Simpler: inject at 0 via replacing first instruction after prolog
        # Find ".locals" and insert return-void before monitor-enter?
        # Easiest: patch the method to immediately return: find "monitor-enter v0" and prepend return
        # Instead we replace entire method logic: find "sput-boolean v1, Lcom/pairip/StartupLauncher;->launchCalled:Z" pattern
        # Better to do simple early return insertion: after ".locals 3" insert return-void
        old = ".locals 3\n\n    const-class v0, Lcom/pairip/StartupLauncher;"
        new = ".locals 3\n\n    return-void\n\n    const-class v0, Lcom/pairip/StartupLauncher;"
        if patch_file(p, old, new, "StartupLauncher.launch stub"):
            patches_applied += 1

    # 2) SignatureCheck.verifyIntegrity -> return-void
    p = base / "smali_classes2/com/pairip/SignatureCheck.smali"
    if p.exists():
        txt = p.read_text(encoding='utf-8')
        old = ".method public static verifyIntegrity(Landroid/content/Context;)V\n    .locals 2"
        new = ".method public static verifyIntegrity(Landroid/content/Context;)V\n    .locals 2\n    return-void"
        if patch_file(p, old, new, "SignatureCheck.verifyIntegrity"):
            patches_applied += 1
        # Also patch verifySignatureMatches -> return true
        old2 = ".method public static verifySignatureMatches(Ljava/lang/String;)Z\n    .locals 1"
        new2 = ".method public static verifySignatureMatches(Ljava/lang/String;)Z\n    .locals 1\n    const/4 v0, 0x1\n    return v0"
        if patch_file(p, old2, new2, "SignatureCheck.verifySignatureMatches"):
            patches_applied += 1

    # 3) PlayIntegrityModule.requestToken -> resolve stub token
    p = base / "smali_classes4/com/diskwalaapp/integrity/PlayIntegrityModule.smali"
    if p.exists():
        old = ".method public final requestToken(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V\n    .locals 3"
        new = ".method public final requestToken(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V\n    .locals 3\n    const-string v0, \"diskwala_stub_integrity_token\"\n    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void"
        if patch_file(p, old, new, "PlayIntegrity.requestToken"):
            patches_applied += 1

    # 4) AppLovinInitProvider.onCreate -> const/4 v0, 0x1; return v0
    p = base / "smali_classes3/com/applovin/sdk/AppLovinInitProvider.smali"
    if p.exists():
        old = ".method public onCreate()Z\n    .locals 1\n\n    .line 1\n    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;"
        new = ".method public onCreate()Z\n    .locals 1\n    const/4 v0, 0x1\n    return v0\n\n    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;"
        if patch_file(p, old, new, "AppLovinInitProvider.onCreate"):
            patches_applied += 1

    # 5) InMobiInitProvider.onCreate
    p = base / "smali_classes6/com/inmobi/sdk/InMobiInitProvider.smali"
    if p.exists():
        old = ".method public final onCreate()Z\n    .locals 1\n\n    .line 1\n    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;"
        new = ".method public final onCreate()Z\n    .locals 1\n    const/4 v0, 0x1\n    return v0\n\n    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;"
        if patch_file(p, old, new, "InMobiInitProvider.onCreate"):
            patches_applied += 1

    # 6) AppLovinMAXModule stubs
    p = base / "smali_classes3/com/applovin/reactnative/AppLovinMAXModule.smali"
    if p.exists():
        txt = p.read_text(encoding='utf-8')
        # Patch initialize to resolve promise
        # Find "method public initialize"
        # We'll do simple replacements for each method
        methods_to_stub = [
            ("createBanner", "return-void"),
            ("createMRec", "return-void"),
            ("loadInterstitial", "return-void"),
            ("showInterstitial", "return-void"),
            ("loadRewardedAd", "return-void"),
            ("showRewardedAd", "return-void"),
            ("loadAppOpenAd", "return-void"),
            ("showAppOpenAd", "return-void"),
        ]
        for m, body in methods_to_stub:
            # Find method definition and insert return at top
            # Use regex to find method header and locals
            pattern = rf"(\.method public {m}\(.*?\)V.*?\.locals \d+)"
            # Add return-void after locals
            def repl(match):
                return match.group(1) + "\n    return-void"
            new_txt, n = re.subn(pattern, repl, txt, flags=re.DOTALL)
            if n > 0:
                print(f"[PATCH] AppLovinMAXModule.{m} -> stub")
                txt = new_txt
                patches_applied += 1
        # For isInterstitialReady etc, need to resolve promise with false
        # isInterstitialReady(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)V
        for m in ["isInterstitialReady", "isRewardedAdReady", "isAppOpenAdReady"]:
            pattern = rf"(\.method public {m}\(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;\)V.*?\.locals \d+)"
            repl = r'\1' + "\n    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void"
            new_txt, n = re.subn(pattern, repl, txt, flags=re.DOTALL)
            if n > 0:
                print(f"[PATCH] AppLovinMAXModule.{m} -> resolve false")
                txt = new_txt
                patches_applied += 1
        # initialize has 3 params with Promise
        pattern = r"(\.method public initialize\(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/react/bridge/Promise;\)V.*?\.locals \d+)"
        repl = r'\1' + "\n    const-string v0, \"stub_initialized\"\n    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V\n    return-void"
        new_txt, n = re.subn(pattern, repl, txt, flags=re.DOTALL)
        if n > 0:
            print(f"[PATCH] AppLovinMAXModule.initialize -> stub resolve")
            txt = new_txt
            patches_applied += 1

        pathlib.Path(p).write_text(txt, encoding='utf-8')

    # 7) EntitlementInfo.isActive -> return true
    p = base / "smali_classes7/com/revenuecat/purchases/EntitlementInfo.smali"
    if p.exists():
        old = ".method public final isActive()Z\n    .locals 1\n\n    .line 1\n    iget-boolean v0, p0, Lcom/revenuecat/purchases/EntitlementInfo;->isActive:Z"
        new = ".method public final isActive()Z\n    .locals 1\n    const/4 v0, 0x1\n    return v0\n\n    iget-boolean v0, p0, Lcom/revenuecat/purchases/EntitlementInfo;->isActive:Z"
        if patch_file(p, old, new, "EntitlementInfo.isActive"):
            patches_applied += 1

    # 8) EntitlementInfos.getActive -> return all
    p = base / "smali_classes7/com/revenuecat/purchases/EntitlementInfos.smali"
    if p.exists():
        old = ".method public final getActive()Ljava/util/Map;\n    .locals 1\n\n    .line 1\n    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->active:Ljava/util/Map;"
        new = ".method public final getActive()Ljava/util/Map;\n    .locals 1\n    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;\n    return-object v0\n\n    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->active:Ljava/util/Map;"
        if patch_file(p, old, new, "EntitlementInfos.getActive"):
            patches_applied += 1

    print(f"\nTotal patches applied: {patches_applied}")

if __name__ == "__main__":
    main()
