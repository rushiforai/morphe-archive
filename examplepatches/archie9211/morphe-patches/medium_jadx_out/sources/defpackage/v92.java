package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum v92 {
    USER_DATA("user_data"),
    APP_DATA("app_data"),
    CUSTOM_DATA("custom_data"),
    CUSTOM_EVENTS("custom_events");

    public final String a;

    v92(String str) {
        this.a = str;
    }

    public final String getRawValue() {
        return this.a;
    }
}
