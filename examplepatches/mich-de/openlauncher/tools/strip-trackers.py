#!/usr/bin/env python3
"""Neutralizza i tracker/analytics presenti nell'APK decodificato (apk-full).

Uso:
    apktool d opennovalauncher.apk -o apk-full
    python3 tools/strip-trackers.py apk-full
    apktool b apk-full -o stripped-unsigned.apk

Interventi:
- manifest: rimozione ContentProvider/Service di Branch, Meta Audience Network,
  Vungle, Instabridge; rimozione permessi AD_ID / INSTALL_REFERRER / ADSERVICES
- smali: no-op dei metodi di invio eventi di zy/c (Firebase facade) e yx/b (Amplitude)
- smali: disattivazione inizializzazione Amplitude, Crashlytics e analytics Firebase
- smali: Instabridge isEligibleForMobile -> false

Nota: le classi SDK restano nel dex (R8 ha fuso classi eterogenee negli stessi file,
rimuoverle rompe l'app). Vengono disattivate, non eliminate.
"""
import re
import sys
from pathlib import Path

root = Path(sys.argv[1] if len(sys.argv) > 1 else "apk-full")

# ---------------------------------------------------------------- manifest
bad_providers = [
    "com.facebook.ads.AudienceNetworkContentProvider",
    "io.branch.search.internal.multiprocess.BncContentProvider",
    "io.branch.search.internal.multiprocess.UserAgentProvider",
    "io.branch.search.internal.control.BranchAdbProvider",
    "com.vungle.ads.VungleProvider",
    "com.instabridge.ai.account.AiSdkFileProvider",
    "com.instabridge.mobilesdk.internal.MobileSdkFileProvider",
]
bad_services = [
    "com.instabridge.mobilesdk.internal.esim.MobileSdkCarrierConfig",
    "io.branch.search.internal.multiprocess.BranchSearchService",
    "io.branch.search.internal.services.stub.android.AndroidBundleUpdateService",
    "io.branch.search.internal.rawsqlite.SQLUpdaterService",
    "io.branch.search.internal.services.stub.android.AndroidScheduledQueryService",
    "io.branch.search.internal.services.stub.android.AndroidCacheUpdateService",
    "io.branch.search.internal.services.stub.android.AndroidPingService",
    "io.branch.search.internal.rawsqlite.BundleUpdateService",
    "io.branch.search.internal.services.ScheduledQueryService",
    "io.branch.search.internal.services.CacheUpdateService",
    "io.branch.search.internal.services.PingService",
]
bad_permissions = [
    "com.google.android.gms.permission.AD_ID",
    "BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
]

manifest = root / "AndroidManifest.xml"
s = manifest.read_text("utf-8")
for name in bad_providers + bad_services:
    tag = "provider" if name in bad_providers else "service"
    pat = re.compile(
        r'\n\s*<' + tag + r'[^>]*android:name="' + re.escape(name) + r'"[^>]*?(/>|>.*?</' + tag + r'>)',
        re.S,
    )
    s, n = pat.subn("", s)
    print(f"manifest {tag} {name}: {n}")
for perm in bad_permissions:
    pat = re.compile(r'\n\s*<uses-permission android:name="' + re.escape(perm) + r'"[^>]*/>')
    s, n = pat.subn("", s)
    print(f"manifest perm {perm}: {n}")
manifest.write_text(s, "utf-8")


# ------------------------------------------------------------------- smali
def noop_methods(path: Path, signatures):
    s = path.read_text("utf-8")
    for sig in signatures:
        pat = re.compile(r"(\.method " + re.escape(sig) + r"\n)(.*?)(\n\.end method)", re.S)
        s, n = pat.subn(lambda m: m.group(1) + "    .locals 0\n\n    return-void" + m.group(3), s, count=1)
        print(f"{path.name} {sig.split('(')[0]}: {'ok' if n else 'MISS'}")
    path.write_text(s, "utf-8")


noop_methods(
    root / "smali/zy/c.smali",
    [
        "public static i(Ljava/lang/String;Ljava/util/Map;)V",
        "public static j(Ljava/lang/Throwable;)V",
        "public static k(Ljava/lang/String;Ljava/util/Map;)V",
        "public static l(ZZZZ)V",
        "public static m(Ljava/lang/String;Ljava/lang/String;)V",
    ],
)

noop_methods(
    root / "smali_classes4/yx/b.smali",
    [
        "public static a(Ljava/lang/String;)V",
        "public static c(Ljava/lang/String;)V",
        "public static d(Ljava/lang/Object;Ljava/lang/String;)V",
        "public static g(Ljava/lang/String;Ljava/util/Map;)V",
        "public static synthetic h(Ljava/lang/String;)V",
        "public final declared-synchronized b(Landroid/content/Context;ZLyx/a;)V",
        "public final declared-synchronized e(Ljava/lang/String;D)V",
        "public final declared-synchronized f()V",
    ],
)

app = root / "smali/com/teslacoilsw/launcher/NovaApplication.smali"
s = app.read_text("utf-8")

pairs = [
    (
        """    invoke-virtual {v2, v1}, Lcom/instabridge/mobilesdk/MobileSdk;->isEligibleForMobile(Landroid/content/Context;)Z

    move-result v2""",
        """    const/4 v2, 0x0""",
    ),
    (
        """    invoke-static {v1}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v0

    sput-object v0, Lzy/c;->b:Lcom/google/firebase/analytics/FirebaseAnalytics;""",
        """    const/4 v0, 0x0

    sput-object v0, Lzy/c;->b:Lcom/google/firebase/analytics/FirebaseAnalytics;""",
    ),
    (
        """    invoke-static {}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->getInstance()Lcom/google/firebase/crashlytics/FirebaseCrashlytics;

    move-result-object v0

    sput-object v0, Lzy/c;->d:Lcom/google/firebase/crashlytics/FirebaseCrashlytics;""",
        """    const/4 v0, 0x0

    sput-object v0, Lzy/c;->d:Lcom/google/firebase/crashlytics/FirebaseCrashlytics;""",
    ),
    ("    sput-boolean v4, Lzy/c;->e:Z", "    sput-boolean v5, Lzy/c;->e:Z"),
    (
        "    invoke-virtual {v0, v4}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCrashlyticsCollectionEnabled(Z)V",
        "    invoke-virtual {v0, v5}, Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCrashlyticsCollectionEnabled(Z)V",
    ),
]
for old, new in pairs:
    print(f"NovaApplication patch: {s.count(old)}")
    s = s.replace(old, new)
app.write_text(s, "utf-8")
print("done")
