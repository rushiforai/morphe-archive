package defpackage;

import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum kv2 {
    US1("us1", "browser-intake-datadoghq.com"),
    US3("us3"),
    US5("us5"),
    EU1("eu1", "browser-intake-datadoghq.eu"),
    AP1(eoLmc.kONHKPL),
    AP2("ap2"),
    US1_FED("us1_fed", "browser-intake-ddog-gov.com"),
    US2_FED("us2_fed", "browser-intake-us2-ddog-gov.com"),
    STAGING("staging", "browser-intake-datad0g.com");

    public final String a;
    public final String b;

    kv2(String str, String str2) {
        this.a = str;
        this.b = "https://".concat(str2);
    }

    public final String getIntakeEndpoint() {
        return this.b;
    }

    public final String getSiteName$dd_sdk_android_core_release() {
        return this.a;
    }

    kv2(String str) {
        this(str, ev6.x("browser-intake-", str, "-datadoghq.com"));
    }
}
