import sys
import logging, json; logging.disable(logging.CRITICAL)
from loguru import logger; logger.remove()
from androguard.misc import AnalyzeAPK
a, d, dx = AnalyzeAPK(sys.argv[1] if len(sys.argv) > 1 and sys.argv[1].endswith(".apk") else "mmc.apk")
P="Lcom/appsomniacs/"
DA2=P+"mmc/DA2Activity;"; PIT=P+"c2/PitBoss;"; IMP=P+"core/adminion/AdsImperator;"; BASE=P+"core/adminion/AdNetworkAdapterBase;"
AL=P+"core/adminion/adnetworkadapter/AppLovinMaxAdNetworkAdapter;"; AM=P+"core/adminion/adnetworkadapter/AdMobAdNetworkAdapter;"; CM=P+"core/compliance/ComplianceManager;"
classes={c.name:c for c in dx.get_classes() if not c.is_external()}
def meths(cls):
    return classes[cls].get_vm_class().get_methods() if cls in classes else []
def strs(m):
    return [i.get_output().split(", ",1)[-1].strip('"') for i in m.get_instructions() if i.get_name().startswith("const-string")] if m.get_code() else []
res=[]
def rec(layer, cls, m, why):
    code=m.get_code(); ret=m.get_descriptor().split(")")[-1]
    res.append(dict(layer=layer, method=f"{cls}->{m.get_name()}{m.get_descriptor().replace(' ','')}", ret=ret,
        regs=code.get_registers_size() if code else 0, stub=("return-void" if ret=="V" else "const/4 v0, 0x0; return v0") if code else "SKIP (abstract)", why=why))
# fingerprints by string across ALL classes
fps={"ShowAdBannerBridge":"ActivityNull%sshowAdBanner","PrepareInterstitialBridge":"ActivityNull%sprepareInterstitial","ShowInterstitialBridge":"ActivityNull%sshowInterstitial","ShowRewardedAdBridge":"ActivityNull%sshowRewardedAd"}
for fp,s in fps.items():
    hits=[(c,m) for c in classes for m in meths(c) if "static" in m.get_access_flags_string() and "public" in m.get_access_flags_string() and m.get_descriptor().replace(' ','')=="()V" and s in strs(m)]
    assert len(hits)>=1, fp
    c,m=hits[0]; rec("1 JNI bridge", c, m, f"{fp}Fingerprint ({len(hits)} match)")
for n in ["prepareRewardedAd","isRewardedAdReady"]:
    m=[m for m in meths(DA2) if m.get_name()==n][0]; rec("1 JNI bridge", DA2, m, "name fingerprint")
disp={"showBannerAd","doShowBannerAd","showAppLovinBannerAd","showAdMobBannerAd","initializeInterstitialAd","prepareInterstitialAd","showInterstitialAd"}
for c in [PIT,IMP,BASE,AL,AM]:
    for m in meths(c):
        if m.get_name() in disp: rec("2 ad display", c, m, "AD_DISPLAY_METHODS")
for c in [AL,AM]:
    for m in meths(c):
        if m.get_name()=="onInitializingComponent": rec("3 SDK init", c, m, "disableAdSdkInit")
for m in meths(IMP):
    if m.get_name()=="initialize": rec("3 SDK init", IMP, m, "disableAdSdkInit")
for m in meths(PIT):
    if m.get_name() in {"lambda$onCreate$0","showPrivacyConsentForm","canShowPrivacyConsentForm"}: rec("4 consent", PIT, m, "skipConsentForm")
for m in meths(CM):
    if m.get_name()=="onInitializingComponent": rec("4 consent", CM, m, "skipConsentForm")
# adapter class fallback fingerprints
for lbl,s in [("AppLovinShowInterstitial","tryShowInterstitial(): Call to show an AppLovin interstitial"),("AdMobInitializingComponent","AdMob SDK onInitializingComponent startup call completed")]:
    hits=[c for c in classes for m in meths(c) if any(x.startswith(s) for x in strs(m))]
    print(lbl, "->", hits)
prov=[p for p in a.get_providers() if p in ("com.google.android.gms.ads.MobileAdsInitProvider","com.applovin.sdk.AppLovinInitProvider")]
bad=[r for r in res if r["stub"]!="SKIP (abstract)" and r["ret"]!="V" and r["regs"]<1]
print("methods patched:", sum(1 for r in res if not r["stub"].startswith("SKIP")), "skipped abstract:", sum(1 for r in res if r["stub"].startswith("SKIP")), "register problems:", bad)
print("manifest providers removed:", prov)
for r in res: print(f"  [{r['layer']}] {r['method']}  regs={r['regs']}  -> {r['stub']}")
json.dump(dict(app=dict(package=a.get_package(), version=a.get_androidversion_name(), code=a.get_androidversion_code(), minSdk=a.get_min_sdk_version(), targetSdk=a.get_target_sdk_version()), methods=res, providers=prov), open("verify.json","w"), indent=1)
