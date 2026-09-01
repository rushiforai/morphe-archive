package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ecg {
    public static final ecg b = new ecg("SHA1");
    public static final ecg c = new ecg("SHA224");
    public static final ecg d = new ecg("SHA256");
    public static final ecg e = new ecg("SHA384");
    public static final ecg f = new ecg("SHA512");
    public final String a;

    public ecg(String str) {
        this.a = str;
    }

    public final String toString() {
        return this.a;
    }
}
