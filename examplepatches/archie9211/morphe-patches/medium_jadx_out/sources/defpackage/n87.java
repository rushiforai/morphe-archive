package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum n87 {
    SUCCESS("success"),
    CANCEL("cancel"),
    ERROR("error");

    public final String a;

    n87(String str) {
        this.a = str;
    }

    public final String getLoggingValue() {
        return this.a;
    }
}
