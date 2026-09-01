package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jgg extends bzf {
    public final String a;
    public final ntg b;

    public jgg(String str, ntg ntgVar) {
        this.a = str;
        this.b = ntgVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.b != ntg.RAW;
    }

    public final String toString() {
        int i = pgg.a[this.b.ordinal()];
        return ev6.y("(typeUrl=", this.a, ", outputPrefixType=", i != 1 ? i != 2 ? i != 3 ? i != 4 ? "UNKNOWN" : "CRUNCHY" : "RAW" : "LEGACY" : "TINK", ")");
    }
}
