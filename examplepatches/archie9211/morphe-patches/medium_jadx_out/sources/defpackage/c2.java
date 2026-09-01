package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c2 {
    public static final c2 c;
    public static final c2 d;
    public final boolean a;
    public final Throwable b;

    static {
        if (j2.d) {
            d = null;
            c = null;
        } else {
            d = new c2(null, false);
            c = new c2(null, true);
        }
    }

    public c2(Throwable th, boolean z) {
        this.a = z;
        this.b = th;
    }
}
