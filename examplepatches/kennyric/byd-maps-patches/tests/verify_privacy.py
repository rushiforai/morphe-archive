"""Check actual privacy-patch output, preserving weather and consent storage APIs."""
import argparse
from pathlib import Path
import re
import xml.etree.ElementTree as ET

ANDROID = "{http://schemas.android.com/apk/res/android}"


def method(root: Path, cls: str, signature: str) -> list[str]:
    paths = list(root.glob(f"smali*/{cls}.smali"))
    assert len(paths) == 1, cls
    match = re.search(r"^\.method[^\n]* " + re.escape(signature) + r"\n(.*?)^\.end method", paths[0].read_text(), re.M | re.S)
    assert match, f"Missing {cls}->{signature}"
    lines = []
    annotations = 0
    for raw in match[1].splitlines():
        line = raw.strip()
        if line.startswith(".annotation"):
            annotations += 1
        if line.startswith(".end annotation"):
            annotations -= 1
            continue
        if annotations or not line or line.startswith((".", ":", "#")):
            continue
        lines.append(line)
    return lines


def verify(root: Path, original: Path, skip_consent: bool) -> None:
    manifest = ET.parse(root / "AndroidManifest.xml")
    metadata = {e.get(ANDROID + "name"): e.get(ANDROID + "value") for e in manifest.iter("meta-data")}
    assert metadata.get("firebase_analytics_collection_deactivated") == "true", "Hard-disable analytics before persisted/API enablement"
    assert metadata.get("firebase_sessions_enabled") == "false"
    assert metadata.get("google_analytics_sgtm_upload_enabled") == "false"
    for asset in ["containers/GTM-P87V6J8.json", "audience_network/classes.dex", "omsdk-v1.js", "openwrapsdk.js", "gdpr-mobile-liveramp.json"]:
        assert not (root / "assets" / asset).exists(), "Remove identified tracking/ad payload " + asset
    assert (root / "assets/webview/web_sdk.html").exists(), "Keep manual privacy WebView assets"
    assert "com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar" not in metadata
    assert "com.google.maps.android.utils.attribution.AttributionIdInitializer" not in metadata
    for prefix in ["com.google.firebase.crashlytics.", "com.google.firebase.sessions.", "com.google.firebase.inappmessaging."]:
        assert not any(name.startswith("com.google.firebase.components:" + prefix) for name in metadata if name)
    for registrar in ["com.google.firebase.installations.FirebaseInstallationsRegistrar", "com.google.firebase.remoteconfig.RemoteConfigRegistrar", "com.google.firebase.messaging.FirebaseMessagingRegistrar"]:
        assert "com.google.firebase.components:" + registrar in metadata, f"Preserve functional {registrar}"
    providers = {e.get(ANDROID + "name"): e for e in manifest.iter("provider")}
    components = {e.get(ANDROID + "name"): e for tag in ["receiver", "service", "activity"] for e in manifest.iter(tag)}
    for name in ["com.google.android.gms.measurement.AppMeasurementReceiver", "com.google.android.gms.measurement.AppMeasurementService", "com.google.android.gms.measurement.AppMeasurementJobService", "com.google.android.gms.ads.AdService", "com.google.firebase.analytics.GoogleAnalyticsServerPreviewActivity"]:
        assert components[name].get(ANDROID + "enabled") == "false", name
    for name in ["com.google.android.gms.ads.MobileAdsInitProvider", "com.facebook.internal.FacebookInitProvider", "com.facebook.ads.AudienceNetworkContentProvider", "infoplaza.network.ads.ppid.PPIDContentProvider"]:
        assert providers[name].get(ANDROID + "enabled") == "false", name
    assert providers["com.google.firebase.provider.FirebaseInitProvider"].get(ANDROID + "enabled", "true") == "true"
    permissions = {e.get(ANDROID + "name", "") for e in manifest.iter("uses-permission")}
    assert "com.google.android.gms.permission.AD_ID" not in permissions
    assert "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE" not in permissions
    assert "com.amazon.privacypass.ATTEST" not in permissions
    assert not any(p.startswith("infoplaza.network.ads.ppid.") for p in permissions)
    assert not any(p.startswith("android.permission.ACCESS_ADSERVICES_") for p in permissions)
    assert {"android.permission.INTERNET", "android.permission.ACCESS_FINE_LOCATION", "android.permission.POST_NOTIFICATIONS"} <= permissions
    for cls, signature in [
        ("bk2", "a(Lny2;Ljava/lang/String;)V"),
        ("du3", "c(Lze8;)V"),
        ("xe8", "invoke()V"),
        ("zf2", "invoke()V"),
        ("io", "b(Lsoa;Lvq6;)V"),
        ("gk2", "b(Ljava/lang/String;)V"),
        ("gk2", "c(Ljava/lang/Throwable;)V"),
        ("gk2", "d(Ljava/lang/String;Ljava/lang/String;)V"),
        ("q43", "a(Ljava/lang/String;Landroid/os/Bundle;)V"),
        ("u20", "d(ILjava/lang/String;Ljava/lang/String;ZZ)V"),
    ]:
        assert method(root, cls, signature)[0] == "return-void", f"Stop {cls}->{signature}"
    ppid = method(root, "xq5", "a()Ljava/lang/String;")
    assert re.fullmatch(r'const-string(?:/jumbo)? v0, ""', ppid[0]) and ppid[1] == "return-object v0"
    metrics = method(root, "io/didomi/sdk/e9", "a(Ljava/lang/String;Ljava/lang/String;)Z")
    assert metrics[:2] == ["const/4 v0, 0x0", "return v0"]
    assert method(root, "qa1", "p()Z")[:2] == ["const/4 v0, 0x0", "return v0"], "Stop cached FCM delivery-metrics opt-in"
    facebook = method(root, "com/facebook/appevents/k", "<init>(Landroid/content/Context;I)V")
    assert facebook[:2] == ["invoke-direct {p0}, Ljava/lang/Object;-><init>()V", "return-void"], "Construct inert Facebook logger without SDK initialization"
    assert method(root, "rf2", "a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lv38;Lbr7;)Ljava/lang/Object;")[:2] == ["sget-object v0, Lvb8;->a:Lvb8;", "return-object v0"]
    rc = "com/revenuecat/purchases/"
    for getter in ["getAutomaticDeviceIdentifierCollectionEnabled()Z", "getDiagnosticsEnabled()Z"]:
        code = method(root, rc + "PurchasesConfiguration", getter)
        register = re.fullmatch(r"const/4 ([vp]\d+), 0x0", code[0])
        assert register and code[1] == "return " + register[1], "Disable optional SDK collection regardless of register alias"
    for cls, signature in [
        ("PurchasesOrchestrator", "setFirebaseAppInstanceID(Ljava/lang/String;)V"),
        ("PurchasesOrchestrator", "setAttributes(Ljava/util/Map;)V"),
        ("subscriberattributes/SubscriberAttributesManager", "collectDeviceIdentifiers(Ljava/lang/String;Landroid/app/Application;)V"),
        ("common/events/EventsManager", "track(Lcom/revenuecat/purchases/common/events/FeatureEvent;)V"),
        ("common/events/EventsManager", "flushEvents(Lcom/revenuecat/purchases/common/Delay;)V"),
        ("common/events/EventsManager", "flushLegacyEvents()V"),
        ("common/events/EventsManager", "performPriorityFlush()V"),
        ("common/diagnostics/DiagnosticsSynchronizer", "syncDiagnosticsFileIfNeeded()V"),
    ]:
        assert method(root, rc + cls, signature)[0] == "return-void", "Block optional RevenueCat telemetry " + signature
    for signature in ["getUnsyncedSubscriberAttributes()Ljava/util/Map;", "getUnsyncedSubscriberAttributes(Ljava/lang/String;)Ljava/util/Map;"]:
        assert method(root, rc + "subscriberattributes/caching/SubscriberAttributesCache", signature)[:3] == ["invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;", "move-result-object v0", "return-object v0"], "Do not upload previously cached optional attributes"
    crash = method(root, "gk2", "a()Lgk2;")
    assert crash[:4] == ["new-instance v0, Lgk2;", "const/4 v1, 0x0", "invoke-direct {v0, v1}, Lgk2;-><init>(Lzd1;)V", "return-object v0"], "Keep Crashlytics callers null-safe without initializing its SDK"
    ads = method(root, "com/meteoplaza/android/mpbannerview/MPInitProvider", "create(Landroid/content/Context;)Ljava/lang/Object;")
    assert ads[:2] == ["sget-object v0, Lvb8;->a:Lvb8;", "return-object v0"]
    gate = method(root, "a51", "a()Z")
    assert (gate[:2] == ["const/4 v0, 0x0", "return v0"]) == skip_consent
    step = method(root, "org/yoki/android/buienalarm/activity/FirstRunActivity", "D()V")
    assert ("const/4 v0, 0x5" not in step) == skip_consent
    for signature in ["setUserAgreeToAll()Z", "setUserDisagreeToAll()Z", "setCurrentUserStatus(Lio/didomi/sdk/models/CurrentUserStatus;)Z"]:
        assert method(root, "io/didomi/sdk/Didomi", signature) == method(original, "io/didomi/sdk/Didomi", signature), "Do not alter consent choices or SDK storage"
    assert method(root, "w77", "o(Landroidx/preference/Preference;)Z") == method(original, "w77", "o(Landroidx/preference/Preference;)Z"), "Keep manual Privacy settings"
    for resource in ["res/xml/network_security_config.xml", "res/xml/remote_config_defaults.xml"]:
        assert ET.tostring(ET.parse(root / resource).getroot()) == ET.tostring(ET.parse(original / resource).getroot()), "Keep TLS and weather routing intact"
    for cls in ["com/revenuecat/purchases/identity/IdentityManager", "com/revenuecat/purchases/PostReceiptHelper", "com/meteoplaza/api/android/a"]:
        current = list(root.glob(f"smali*/{cls}.smali"))
        baseline = list(original.glob(f"smali*/{cls}.smali"))
        assert len(current) == len(baseline) == 1
        assert current[0].read_text() == baseline[0].read_text(), "Preserve identity, receipts and weather implementation: " + cls
    print(f"PASS: tracking initialization, events, IDs and targeting blocked; consent storage/manual privacy retained; skip_consent={skip_consent}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("decoded", type=Path)
    parser.add_argument("original", type=Path)
    parser.add_argument("--skip-consent", action="store_true")
    args = parser.parse_args()
    verify(args.decoded, args.original, args.skip_consent)
