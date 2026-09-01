package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b3g {
    public static final b3g c;
    public static final b3g d;
    public static final b3g e;
    public static final b3g f;
    public static final b3g g;
    public static final b3g h;
    public static final b3g i;
    public final /* synthetic */ int a;
    public final String b;

    static {
        int i2 = 0;
        c = new b3g("TINK", i2);
        d = new b3g("CRUNCHY", i2);
        e = new b3g("NO_PREFIX", i2);
        int i3 = 1;
        f = new b3g("TINK", i3);
        g = new b3g("CRUNCHY", i3);
        h = new b3g("LEGACY", i3);
        i = new b3g("NO_PREFIX", i3);
    }

    public /* synthetic */ b3g(String str, int i2) {
        this.a = i2;
        this.b = str;
    }

    public final String toString() {
        int i2 = this.a;
        return this.b;
    }
}
