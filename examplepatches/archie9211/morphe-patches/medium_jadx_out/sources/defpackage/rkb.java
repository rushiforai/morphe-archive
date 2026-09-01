package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rkb {
    public static final sn3 a = new sn3(0, new lg9(17));
    public static final tkb b;
    public static final tkb c;
    public static final kkb d;
    public static final kkb e;
    public static final kkb f;

    static {
        long j = uu1.h;
        b = new tkb(Float.NaN, j, true);
        c = new tkb(Float.NaN, j, false);
        d = new kkb(0.16f, 0.24f, 0.08f, 0.24f);
        e = new kkb(0.08f, 0.12f, 0.04f, 0.12f);
        f = new kkb(0.08f, 0.12f, 0.04f, 0.1f);
    }

    public static tkb a(int i, long j, boolean z) {
        if ((i & 1) != 0) {
            z = true;
        }
        float f2 = (i & 2) != 0 ? Float.NaN : 24.0f;
        if ((i & 4) != 0) {
            j = uu1.h;
        }
        return (vj3.b(f2, Float.NaN) && ezd.a(j, uu1.h)) ? z ? b : c : new tkb(f2, j, z);
    }
}
