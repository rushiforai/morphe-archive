"""Check Buienradar and Weeronline patch effects in an independently apktool-decoded APK."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ANDROID = "{http://schemas.android.com/apk/res/android}"
WOL = "Lcom/xs2theworld/weeronline"
FALSE = r"const/4 v0, 0x0\nreturn v0"
TRUE = r"const/4 v0, 0x1\nreturn v0"
UNIT = r"sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0"

# (patch, class or None for "any class", method header prefix, expected start, expected matches)
BUIENRADAR = [
    ("Hide ads", "Lcg;", "public final b(ZLvc;", r"const/16 p1, 0x1", 1),
    ("Hide Premium banner", "Lnl/rtl/buienradar/data/components/notifications/OneTimeNotificationScheduleWorker;",
     "public final c()", r"new-instance v0, Lwq5;\ninvoke-direct \{v0\}, Lwq5;-><init>\(\)V\nreturn-object v0", 1),
    ("Disable tracking", "Ldh9;", "public final a()V", r"return-void", 1),
    ("Disable tracking", "Lso;", "public final c(Lwo;Lema;)V", r"return-void", 1),
    ("Disable tracking", "Lue9;", "public final j(Lx1a;)V", r"return-void", 1),
    ("Disable tracking", "Lcom/bitmovin/player/analytics/internal/AnalyticsConfiguratorKt;",
     "public static final configureAnalytics(", r"return-object p0", 2),
    ("Disable tracking", "Lcom/usabilla/sdk/ubform/telemetry/UbTelemetryRecorder;", "public constructor <init>(I",
     r"const/4 p1, 0x0", 1),
    ("Disable tracking", "Lcom/usabilla/sdk/ubform/Usabilla;", "public final sendEvent(", r"return-void", 1),
    ("Disable tracking", "Lwd2;", "public declared-synchronized d()Z", FALSE, 1),
]
# (patch, class, pattern in normalized class code, matches when patched, matches when not)
BUIENRADAR_SEQUENCES = [
    ("Skip consent screens", "Lzj9;", r'"ONBOARDING_DONE"\ninvoke-interface \{[^}]*\}, \S+getBoolean\S+\nconst/4 v0, 0x1', 1, 0),
    ("Skip consent screens", "Lzj9;", r'"PAY_OR_OK_SEEN_1"\ninvoke-interface \{[^}]*\}, \S+getBoolean\S+\nconst/4 v0, 0x1', 1, 0),
    ("Skip consent screens", "Lzj9;", r"Liu2;->f\(Lqt8;\)Z\nconst/4 v0, 0x1", 1, 0),
    ("Skip consent screens", "Ls67;", r"->shouldShowBanner\(\)Z\nconst/4 v1, 0x0", 1, 0),
    ("Hide Premium banner", "Llm0;", r"Ley7;-><init>\(Lez4;Lgz7;\)V\nsget-object v3, ", 1, 0),
    ("Hide Premium banner", "Lnh7;", r"Ley7;-><init>\(Lez4;Lgz7;\)V\nsget-object v13, ", 1, 0),
]
WEERONLINE = [
    ("Hide ads", f"{WOL}/ui/ads/GoogleAdViewManager;", "public loadAd()V", r"return-void", 1),
    ("Hide ads", f"{WOL}/ui/ads/OpenWrapAdViewManager;", "public loadAd()V", r"return-void", 1),
    ("Hide ads", f"{WOL}/ui/ads/AdStateImpl;", "public loadAd()V", r"return-void", 1),
    ("Hide ads", f"{WOL}/ads/AdViewContainer;", "public final loadAd()V", r"const/16 v0, 0x8", 1),
    ("Hide ads", f"{WOL}/ui/ads/AdContainerKt;", "public static final AdContainer(", r"return-void", 2),
    ("Hide ads", f"{WOL}/screen/main/city/CityFragment;", "public static final access$generateAdCardItems(",
     r"new-instance v0, Ljava/util/ArrayList;\ninvoke-direct \{v0\}, Ljava/util/ArrayList;-><init>\(\)V\nreturn-object v0", 1),
    ("Hide ads", f"{WOL}/screen/main/news/NewsDataSource;", "public constructor <init>(Lcom/xs2theworld/weeronline/"
     "data/repository/NewsRepository;ZLcom/xs2theworld/weeronline/ui/screens/news/NewsTagUiModel;)V", r"const/4 p2, 0x1", 1),
    ("Hide ads", "LD6/b;", "public final f(Lcom/bluebillywig/bbnativeshared/enums/Phase;)Z", FALSE, 1),
    ("Hide ads", "LD6/j;", "public final l(Lcom/bluebillywig/bbnativeshared/enums/Phase;Z)Z", FALSE, 1),
    ("Hide ads", f"{WOL}/mainkmp/ads/interstitial/InterstitialAdVisibility;", "public final shouldShowAd(Z)Z", FALSE, 1),
    ("Hide ads", f"{WOL}/App$initAds$1;", "public final invokeSuspend(", UNIT, 1),
    ("Hide ads", "Lcom/pubmatic/sdk/common/OpenWrapSDK;", "public static setApplicationInfo(", r"return-void", 1),
    ("Hide ads", f"{WOL}/App;", "public static final access$updateOpenWrapUserId(", r"return-void", 1),
    ("Hide ads", f"{WOL}/branded/BrandedActivity;", "public isExpired()Z", TRUE, 1),
    ("Hide ads", f"{WOL}/branded/BrandedActivity$BRANDED_CINEMA;", "public isExpired()Z", TRUE, 1),
    ("Hide Premium banner", f"{WOL}/data/repository/UserRepositoryImpl;", "public shouldShowSubscriptionPushScreen()Z",
     FALSE, 1),
    ("Hide Premium banner", "Linfoplaza/network/billing/paywall/a;", "public final a()Ljava/util/List;",
     r"invoke-static \{\}, Ljava/util/Collections;->emptyList\(\)Ljava/util/List;\nmove-result-object v0\nreturn-object v0", 1),
    ("Unlock Plus", f"{WOL}/data/repository/UserRepositoryImpl;", "public isAdFree()Z", TRUE, 1),
    ("Unlock Plus", f"{WOL}/iap/IAPStatusImpl$2;", "public final invokeSuspend(",
     r"sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object v0", 1),
    ("Disable tracking", "Lgf/a;", "public final a(Ljava/lang/String;Ljava/lang/String;)V", r"return-void", 1),
    ("Disable tracking", "Lgf/a;", "public final d(Lkotlin/jvm/functions/Function1;", r"return-void", 1),
    ("Disable tracking", f"{WOL}/App$CrashlyticsTree;", "public log(", r"return-void", 1),
    ("Disable tracking", "LDa/V;", "public final declared-synchronized a()Z", FALSE, 1),
    ("Disable tracking", f"{WOL}/facebook/FacebookConsentController;", "public final onConsentUpdated(", r"return-void", 1),
    ("Disable tracking", f"{WOL}/facebook/FacebookTrackingConsentEvaluator;", "public isTrackingEnabled(", FALSE, 1),
    ("Disable tracking", f"{WOL}/facebook/FacebookPurchaseLogger;", "public logPurchase(", UNIT, 1),
    ("Disable tracking", "Lcom/facebook/appevents/AppEventsLogger;", "public constructor <init>(Landroid/content/Context;)V",
     r"invoke-direct \{p0\}, Ljava/lang/Object;-><init>\(\)V\nreturn-void", 1),
    ("Disable tracking", "Lio/didomi/sdk/e9;", "private final a(Ljava/lang/String;Ljava/lang/String;)Z", FALSE, 1),
    ("Disable tracking", "Ltb/u;", "public static a()Z", FALSE, 1),
    ("Disable tracking", "Ldf/c;", "public final a()Ljava/lang/String;", r'const-string v0, ""\nreturn-object v0', 1),
    ("Disable tracking", "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
     "public static getAdvertisingIdInfo(", r"new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", 1),
    ("Disable tracking", "LH6/c;", "public final k(Ljava/util/Map;)V", r"return-void", 1),
    ("Disable tracking", "LEc/j;", "public final a(Ljava/lang/Boolean;)V", r"sget-object p1, Ljava/lang/Boolean;->FALSE", 1),
    ("Disable tracking", "Ljf/l;", "public final c(Ljava/lang/String;)V", r"return-void", 1),
    ("Skip consent screens", "Linfoplaza/network/consent/e;", "public final f()Z", FALSE, 1),
]
DECLINED = r"instance-of p1, v0, Linfoplaza/network/consent/ConsentEvent\$a;"
WEERONLINE_SEQUENCES = [
    *[("Hide Premium banner", f"{WOL}/screen/{screen}$observeConsent$2;", DECLINED, 0, 1) for screen in [
        "main/MainFragment", "main/menu/MenuFragment", "details/news/NewsDetailFragment",
        "details/weathertext/WeatherTextFragment"]],
    ("Hide Premium banner", f"{WOL}/screen/onboarding/cookies/CookiesOnBoardingFragment$observeConsent$2;", DECLINED, 1, 1),
    ("Hide Premium banner", f"{WOL}/screen/main/menu/MenuFragment;",
     r"const/4 v([12]), 0x0\ninvoke-static \{p1, v\1\}, \S+setVisible", 4, 1),
    ("Hide Premium banner", f"{WOL}/screen/main/menu/tile/TileSettingsAdapter;", r"xor-int/lit8", 0, 2),
    ("Skip consent screens", f"{WOL}/screen/onboarding/welcome/navigation/WelcomeNavigationUseCase;",
     r"sget v\d+, \S+R\$id;->locationOnBoardingFragment:I", 1, 0),
    ("Unlock Plus", f"{WOL}/ui/screens/myplaces/MyPlacesViewModel$updateState$1;",
     r"Lcom/xs2theworld/weeronline/iap/IAPStatus;->getPlusEnabled\(\)", 2, 2),
    ("Unlock Plus", f"{WOL}/ui/screens/myplaces/MyPlacesViewModel$switchModeAction$1;",
     r"Lcom/xs2theworld/weeronline/iap/IAPStatus;->getPlusEnabled\(\)", 2, 2),
    ("Unlock Plus", f"{WOL}/pushnotif/RegisterDeviceGenerator;",
     r"Lcom/xs2theworld/weeronline/iap/IAPStatus;->getPlusEnabled\(\)", 1, 1),
    ("Unlock Plus", f"{WOL}/pushnotif/RainNotificationsHandler;",
     r"->updateNotificationTypesForPlace\(", 1, 1),
]


def classes(root: Path) -> dict[str, str]:
    found = {}
    for path in root.glob("smali*/**/*.smali"):
        text = path.read_text()
        name = re.match(r"\.class[^\n]* (L[^\n]+;)\n", text)
        if name:
            found[name[1]] = text
    return found


def code(method: str) -> str:
    method = re.sub(r"\n\s*\.(annotation|param)\b.*?\.end \1", "", method, flags=re.S)
    lines = [line.strip() for line in method.splitlines()[1:]]
    return "\n".join(line for line in lines if line and not line.startswith((".", ":")) or line.startswith(".end method"))


def check_methods(smali: dict[str, str], markers, selected: set[str]) -> None:
    for patch, cls, header, expected, count in markers:
        text = smali.get(cls)
        assert text is not None, f"Missing class {cls}"
        methods = [m for m in re.findall(r"(\.method [^\n]*\n.*?\.end method)", text, re.S)
                   if m.startswith(".method " + header)]
        assert len(methods) == count, f"{cls}->{header}: expected {count} methods, found {len(methods)}"
        for method in methods:
            patched = re.match(expected, code(method)) is not None
            assert patched == (patch in selected), f"{patch}: {cls}->{header} patched={patched}"


def check_sequences(smali: dict[str, str], markers, selected: set[str]) -> None:
    for patch, cls, pattern, when_patched, when_original in markers:
        text = smali.get(cls)
        assert text is not None, f"Missing class {cls}"
        found = len(re.findall(pattern, code(text)))
        expected = when_patched if patch in selected else when_original
        assert found == expected, f"{patch}: {cls} {pattern!r} found {found}, expected {expected}"


def manifest(root: Path) -> tuple[ET.Element, dict, set]:
    doc = ET.parse(root / "AndroidManifest.xml").getroot()
    meta = {e.get(ANDROID + "name"): e.get(ANDROID + "value") for e in doc.iter("meta-data")}
    permissions = {e.get(ANDROID + "name") for e in doc.iter("uses-permission")}
    return doc, meta, permissions


def disabled(doc: ET.Element, name: str) -> bool:
    matches = [e for e in doc.iter() if e.get(ANDROID + "name") == name and e.tag != "meta-data"]
    assert len(matches) == 1, f"Expected one component {name}"
    return matches[0].get(ANDROID + "enabled") == "false"


def verify_tracking_manifest(root: Path, tracking: bool, components: list[str], removed_registrars: list[str],
                             permissions: list[str], extra_true: list[str]) -> None:
    doc, meta, granted = manifest(root)
    assert (meta.get("firebase_analytics_collection_deactivated") == "true") == tracking, "Analytics deactivation"
    for flag in extra_true:
        assert (meta.get(flag) == "true") == tracking, flag
    for flag in ["firebase_sessions_enabled", "google_analytics_adid_collection_enabled"]:
        assert (meta.get(flag) == "false") == tracking, flag
    for registrar in removed_registrars:
        key = f"com.google.firebase.components:{registrar}"
        assert (key not in meta) == tracking, registrar
    for component in components:
        assert disabled(doc, component) == tracking, component
    for permission in permissions:
        assert (permission not in granted) == tracking, permission


def verify(app: str, root: Path, selected: set[str]) -> None:
    smali = classes(root)
    tracking = "Disable tracking" in selected
    if app == "buienradar":
        check_methods(smali, BUIENRADAR, selected)
        check_sequences(smali, BUIENRADAR_SEQUENCES, selected)
        app_class = re.sub(r"\n\s*\.line \d+", "", smali["Lnl/rtl/buienradar/app/App;"])
        launch = re.search(r"invoke-direct \{v4, v1, v2, v5\}, Lbd;-><init>\(Ljava/lang/Object;Lb32;I\)V\s+(\S+)", app_class)
        assert launch and (launch[1] == "nop") == ("Hide ads" in selected), "Mobile Ads startup launch"
        swrve = re.search(r"ArrayList;->contains\(Ljava/lang/Object;\)Z\s+move-result v5\s+(const/4 v5, 0x1)?", app_class)
        assert swrve and (swrve[1] is not None) == ("Disable Swrve and location upload" in selected), "Swrve no-op"
        uploads = sum(len(re.findall(r"invoke-interface \{[^}]*\}, L\w+;->a\(Lnl/rtl/buienradar/data/components/li/"
                                     r"BackgroundLocationEntity;", text)) for text in smali.values())
        assert (uploads == 0) == ("Disable Swrve and location upload" in selected), "Background location upload"
        verify_tracking_manifest(root, tracking, [
            "com.google.android.gms.measurement.AppMeasurementReceiver",
            "com.google.android.gms.measurement.AppMeasurementService",
            "com.google.android.gms.measurement.AppMeasurementJobService",
        ], ["com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar"], [
            "com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_AD_ID",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        ], [])
    else:
        check_methods(smali, WEERONLINE, selected)
        check_sequences(smali, WEERONLINE_SEQUENCES, selected)
        layout = ET.parse(root / "res/layout/fragment_two_days.xml").getroot()
        placeholder = [e for e in layout.iter() if e.get(ANDROID + "id") == "@id/ad_placeholder"]
        assert len(placeholder) == 1 and (placeholder[0].get(ANDROID + "visibility") == "gone") == ("Hide ads" in selected)
        doc, _, _ = manifest(root)
        assert disabled(doc, "com.facebook.ads.AudienceNetworkContentProvider") == (tracking or "Hide ads" in selected)
        verify_tracking_manifest(root, tracking, [
            "com.google.android.gms.ads.MobileAdsInitProvider", "infoplaza.network.ads.ppid.PPIDContentProvider",
            "com.google.android.gms.measurement.AppMeasurementService",
            "com.google.android.gms.tagmanager.TagManagerService", "com.facebook.internal.FacebookInitProvider",
            "com.google.firebase.analytics.GoogleAnalyticsServerPreviewActivity",
        ], [
            "com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar",
            "com.google.firebase.inappmessaging.FirebaseInAppMessagingRegistrar",
            "com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayRegistrar",
        ], [
            "com.google.android.gms.permission.AD_ID", "android.permission.ACCESS_ADSERVICES_TOPICS",
            "infoplaza.network.ads.ppid.org.yoki.android.buienalarm.READ_PPID", "com.amazon.privacypass.ATTEST",
            "android.permission.AD_SERVICES_CONFIG",
        ], ["firebase_performance_collection_deactivated"])
        for asset in ["containers/GTM-N696CS.json", "audience_network/classes.dex", "audience_network/classes2.dex"]:
            assert (root / "assets" / asset).exists() != tracking, asset
    print(f"PASS: {app} {sorted(selected) or ['original']}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("app", choices=["buienradar", "weeronline"])
    parser.add_argument("decoded", type=Path)
    parser.add_argument("-e", "--enabled", action="append", default=[], help="Patch selected for this output")
    args = parser.parse_args()
    verify(args.app, args.decoded, set(args.enabled))
