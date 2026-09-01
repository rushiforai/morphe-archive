package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kzf {
    public static final kzf c;
    public static final kzf d;
    public final boolean a;
    public final Throwable b;

    static {
        if (vzf.f) {
            d = null;
            c = null;
        } else {
            d = new kzf(null, false);
            c = new kzf(null, true);
        }
    }

    public kzf(Throwable th, boolean z) {
        this.a = z;
        this.b = th;
    }
}
