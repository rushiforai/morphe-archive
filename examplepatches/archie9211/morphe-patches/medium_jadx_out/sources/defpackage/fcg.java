package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fcg {
    public static final fcg b = new fcg("NIST_P256");
    public static final fcg c = new fcg("NIST_P384");
    public static final fcg d = new fcg("NIST_P521");
    public static final fcg e = new fcg("X25519");
    public final String a;

    public fcg(String str) {
        this.a = str;
    }

    public final String toString() {
        return this.a;
    }
}
