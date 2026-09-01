package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x95 extends o95 {
    public final String d;
    public final boolean e;
    public final boolean f;

    public x95(String str, boolean z, boolean z2) {
        super(yi2.V(str, z, z2), yi2.V(str, z, z2), z2, ny3.a, 500);
        this.d = str;
        this.e = z;
        this.f = z2;
        if (str.length() > 0) {
            return;
        }
        ay0.e("serverClientId should not be empty");
        throw null;
    }
}
