package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum kpf {
    REFRESH_TOKEN("refresh_token"),
    /* JADX INFO: Fake field, exist only in values array */
    AUTHORIZATION_CODE("authorization_code");

    public final String a;

    kpf(String str) {
        this.a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.a;
    }
}
