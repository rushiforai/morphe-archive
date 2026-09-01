package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum h5b {
    IGNORE("ignore"),
    WARN("warn"),
    STRICT("strict");

    public static final g5b Companion = new g5b();
    public final String a;

    h5b(String str) {
        this.a = str;
    }

    public final String getDescription() {
        return this.a;
    }

    public final boolean isIgnore() {
        return this == IGNORE;
    }

    public final boolean isWarning() {
        return this == WARN;
    }
}
