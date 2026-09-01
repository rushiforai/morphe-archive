package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d2g {
    public static final d2g c;
    public static final d2g d;
    public static final d2g e;
    public static final d2g f;
    public static final d2g g;
    public final /* synthetic */ int a;
    public final String b;

    static {
        int i = 0;
        c = new d2g("TINK", i);
        d = new d2g("CRUNCHY", i);
        e = new d2g("NO_PREFIX", i);
        int i2 = 1;
        f = new d2g("IEEE_P1363", i2);
        g = new d2g("DER", i2);
    }

    public /* synthetic */ d2g(String str, int i) {
        this.a = i;
        this.b = str;
    }

    public final String toString() {
        int i = this.a;
        return this.b;
    }
}
