"""Check RainViewer privacy behavior in actual emitted DEX and resources."""
import argparse
from pathlib import Path
import xml.etree.ElementTree as ET
from verify_dumpert import Smali, canonicalize, absolute_registers
import re

REMOTE = "Lcom/lucky_apps/data/settings/entity/remote/"
A = "{http://schemas.android.com/apk/res/android}"


def verify(root: Path, original: Path, local_pro=False):
    actual, before = Smali(root), Smali(original)
    def starts(owner, signature, instructions):
        body = actual.body(owner, signature)
        locals_ = int(re.search(r"\.locals (\d+)", body)[1])
        code = [absolute_registers(line, locals_) for line in canonicalize(body)]
        instructions = [absolute_registers(line, locals_) for line in instructions]
        assert code[:len(instructions)] == instructions, (owner, signature, code[:len(instructions)])
    for cls in ("BannerData", "PositionedBannerData", "AdData", "InterstitialBannerData"):
        starts(REMOTE + cls + ";", "isEnabled()Z", ["const/4 v0, 0x0", "return v0"])
    starts(REMOTE + "InHouseBannerData;", "getDisplayAd()Z", ["const/4 v0, 0x0", "return v0"])
    starts(REMOTE + "ChartData;", "isPromoBlockEnabled()Z", ["const/4 v0, 0x0", "return v0"])
    starts(REMOTE + "ABConfigData$Data;", "isUseClarity()Z", ["const/4 v0, 0x0", "return v0"])
    starts("Lb56;", "a(Lsq1;)V", ["return-void"])
    starts("Lb56;", "b(Lsq1;)V", ["return-void"])
    starts("Lb56;", "c()V", ["return-void"])
    starts("Lnr2;", "a(Ljava/lang/String;Ljava/lang/String;)V", ["return-void"])
    starts("Lff4;", "j(Lcom/lucky_apps/data/user/entity/UserEventRequest;Lft0;)Ljava/lang/Object;", ["sget-object v0, Les7;->a:Les7;", "return-object v0"])
    starts("Llq2;", "a(Landroidx/fragment/app/FragmentActivity;)V", ["return-void"])
    starts(REMOTE + "OnboardingData;", "isPaywallDisabled()Z", ["const/4 v0, 0x1", "return v0"])
    starts(REMOTE + "PurchaseData;", "getPurchaseOnStartEnabled()Z", ["const/4 v0, 0x0", "return v0"])
    starts("Lcom/pairip/licensecheck/LicenseClient;", "checkLicense(Landroid/content/Context;)V", ["return-void"])
    for fragment in ("policydata/PolicyDataFragment", "purchaseessential/PurchaseEssentialFragment", "purchasepro/PurchaseProFragment"):
        starts("Lcom/lucky_apps/rainviewer/onboarding/v4/" + fragment + ";", "P(Landroid/view/View;Landroid/os/Bundle;)V", [
            "invoke-virtual {p0}, Landroidx/fragment/app/b;->l()Landroidx/fragment/app/FragmentActivity;", "move-result-object v0"])
    hint = canonicalize(actual.body("Lpu2;", "<init>(ZLou2;)V"))
    assert any("instance-of p1, p2, Lmu2;" == line for line in hint), "Purchase map hint is still visible"
    starts("Lph5;", "<init>(ILsh5;ZLjava/util/List;ILjava/util/List;I)V", ["or-int/lit8 p7, p7, 0x40", "const/4 p3, 0x0"])
    starts("Ls47;", "f(Lcom/lucky_apps/data/startupscreen/entity/StartupScreenModel;Lft0;)Ljava/lang/Object;", ["const/4 p1, 0x0"])
    starts("Lqb9;", "<init>(I)V", ["const/16 v0, 0xf"])
    for context in ("Landroid/content/Context;", "Landroid/app/Activity;"):
        starts("Lcom/microsoft/clarity/Clarity;", "initialize(" + context + "Lcom/microsoft/clarity/ClarityConfig;)Ljava/lang/Boolean;",
               ["sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "return-object v0"])
    starts("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;",
           ["new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;", 'const-string v1, "00000000-0000-0000-0000-000000000000"', "const/4 v2, 0x1"])
    # Entitlement state and billing verification must not be forged by privacy patches.
    for owner in ("Leh5;", "Lcom/lucky_apps/rainviewer/common/user/worker/PremiumWorker;"):
        for signature in re.findall(r"^\.method[^\n]* (\S+\([^\n]+)", before.text(owner), re.M):
            if local_pro and owner == "Leh5;" and signature == "j(Lft0;Lhw7;Z)Ljava/lang/Object;":
                from verify_rainviewer_local_pro import verify as verify_local_pro
                verify_local_pro(root, original)
                continue
            assert canonicalize(actual.body(owner, signature)) == canonicalize(before.body(owner, signature)), "Entitlement method changed: " + owner + signature
    verify_executed_effects(actual)
    manifest = ET.parse(root / "AndroidManifest.xml").getroot()
    app = manifest.find("application")
    registrars = {n.get(A + "name") for n in app.iter("meta-data")}
    assert "com.google.firebase.components:com.google.firebase.crashlytics.CrashlyticsRegistrar" not in registrars, "Crashlytics still starts"
    assert "com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar" not in registrars, "Sessions still starts"
    starts("Lc56;", "i(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V", ["return-void"])
    flags = {n.get(A + "name"): n.get(A + "value") for n in app.findall("meta-data")}
    assert flags["firebase_analytics_collection_deactivated"] == "true"
    assert flags["firebase_performance_collection_deactivated"] == "true"
    assert flags["firebase_crashlytics_collection_enabled"] == "false"
    assert not any(n.get(A + "name", "").endswith("AD_ID") or "ACCESS_ADSERVICES_" in n.get(A + "name", "") for n in manifest.findall("uses-permission"))
    print("RainViewer privacy controls and retained entitlement code verified")


def verify_executed_effects(smali):
    """Execute emitted control bodies with explicit Android/library boundaries."""
    from rtl_vm import Memory, Reference, execute, parse

    # The plan badge and feature data stay authentic to their local UI model;
    # the Manage navigation and offers are hidden, including subsequent refreshes.
    empty=Reference([],"Lyj1;")
    def ui_init(method,args):
        assert method in ["Ljava/lang/Object;->getClass()Ljava/lang/Class;","Ljava/lang/Object;-><init>()V"],method
    for manage in (0,1):
        for mask in (0,32,64,96):
            section=Reference({},"Lph5;");features=Reference(["feature"],"Ljava/util/List;")
            execute(parse(smali.body("Lph5;","<init>(ILsh5;ZLjava/util/List;ILjava/util/List;I)V")),
                    {"p0":section,"p1":123,"p2":0,"p3":manage,"p4":features,"p5":16,"p6":Reference(["offer"],"Ljava/util/List;"),"p7":mask},
                    ui_init,memory=Memory(statics={"Lyj1;->a:Lyj1;":empty}))
            assert section.value["Lph5;->a:I"]==123
            assert section.value["Lph5;->c:Z"]==0
            assert section.value["Lph5;->d:Ljava/util/List;"] is features
            assert section.value["Lph5;->g:Ljava/util/List;"] is empty

    def no_calls(method, args):
        raise AssertionError("Unexpected SDK/network call: " + method)

    for cls in ("BannerData", "PositionedBannerData", "AdData", "InterstitialBannerData"):
        for cached in (False, True):
            receiver = Reference({REMOTE + cls + ";->isEnabled:Z": cached}, REMOTE + cls + ";")
            assert execute(parse(smali.body(REMOTE + cls + ";", "isEnabled()Z")), {"p0": receiver}, no_calls) == 0

    # Purchase hints disappear; a real weather hint keeps the original visibility.
    def object_init(method, args):
        assert method == "Ljava/lang/Object;-><init>()V", method
    for kind in ("Lmu2;", "Lnu2;"):
        for visible in (0, 1):
            receiver, hint = Reference({}, "Lpu2;"), Reference({}, kind)
            execute(parse(smali.body("Lpu2;", "<init>(ZLou2;)V")),
                    {"p0": receiver, "p1": visible, "p2": hint}, object_init, memory=Memory())
            assert receiver.value["Lpu2;->a:Z"] == (0 if kind == "Lmu2;" else visible)
            assert receiver.value["Lpu2;->b:Lou2;"] is hint

    # Queued CCT batches are acknowledged without opening a connection or waiting.
    calls = []
    def cct_init(method, args):
        assert method == "Llb0;-><init>(ILjava/net/URL;J)V", method
        value, status, redirect, delay, high = args
        assert status == 200 and redirect == delay == high == 0
        value.value.update(status=status, delay=delay)
        calls.append(method)
    result = execute(parse(smali.body("Ll9;", "e(Lcya;)Llb0;")), {}, cct_init, memory=Memory())
    assert result.descriptor == "Llb0;" and result.value == {"status": 200, "delay": 0} and len(calls) == 1

    # Variant 15 supplies the inert logger; merged variant 8 still creates its map.
    def construct(method, args):
        if method == "Ljava/lang/Object;-><init>()V" or method == "Ljava/util/LinkedHashMap;-><init>()V":
            return
        assert method == "Ly32;-><init>(Lfv0;)V", method
        assert args[1] == 0
        args[0].value["Ly32;->a:Lfv0;"] = 0
    for variant, descriptor in ((15, "Ly32;"), (8, "Ljava/util/LinkedHashMap;")):
        receiver = Reference({}, "Lqb9;")
        execute(parse(smali.body("Lqb9;", "<init>(I)V")), {"p0": receiver, "p1": variant}, construct, memory=Memory())
        assert receiver.value["Lqb9;->a:Ljava/lang/Object;"].descriptor == descriptor

    # A cached startup offer follows the real no-offer completion, including its coroutine result.
    unit, completion = Reference({}, "Les7;"), Reference({}, "Lp37;")
    emitted = []
    def startup_call(method, args):
        if method == "Lr47;-><init>(Ls47;Lft0;)V":
            args[0].value.update({"Lr47;->c:I": 0, "Lr47;->a:Ljava/lang/Object;": unit})
        elif method == "Lyh8;->A(Ljava/lang/Object;)V":
            return
        elif method == "Lsq6;->a(Ljava/lang/Object;Let0;)Ljava/lang/Object;":
            assert args[1] is completion
            emitted.append(args[1])
            return unit
        else:
            raise AssertionError("Startup offer rendered or called unexpected code: " + method)
    for cached_offer in (None, Reference({}, "Lcom/lucky_apps/data/startupscreen/entity/StartupScreenModel;")):
        receiver = Reference({"Ls47;->e:Lsq6;": Reference({}, "Lsq6;")}, "Ls47;")
        memory = Memory(statics={"Les7;->a:Les7;": unit, "Lp37;->a:Lp37;": completion, "Lbu0;->a:Lbu0;": Reference({}, "Lbu0;")})
        assert execute(parse(smali.body("Ls47;", "f(Lcom/lucky_apps/data/startupscreen/entity/StartupScreenModel;Lft0;)Ljava/lang/Object;")),
                       {"p0": receiver, "p1": cached_offer, "p2": None}, startup_call, memory=memory) is unit
    assert len(emitted) == 2

    # An app log entry must remain harmless with no Firebase crash component installed.
    assert execute(parse(smali.body("Lc56;", "i(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V")),
                   {"p0": Reference({}, "Lc56;"), "p1": 6, "p2": "tag", "p3": "message", "p4": Reference({}, "Ljava/lang/Throwable;")}, no_calls) is None


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("decoded", type=Path)
    p.add_argument("original", type=Path)
    p.add_argument("--local-pro", action="store_true")
    a = p.parse_args()
    verify(a.decoded, a.original, a.local_pro)
