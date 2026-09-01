package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qkb {
    public static final sn3 a = new sn3(0, new lg9(16));
    public static final skb b;
    public static final skb c;

    static {
        long j = uu1.h;
        b = new skb(Float.NaN, j, true);
        c = new skb(Float.NaN, j, false);
    }

    public static skb a(float f, int i, long j, boolean z) {
        if ((i & 1) != 0) {
            z = true;
        }
        if ((i & 2) != 0) {
            f = Float.NaN;
        }
        if ((i & 4) != 0) {
            j = uu1.h;
        }
        return (vj3.b(f, Float.NaN) && ezd.a(j, uu1.h)) ? z ? b : c : new skb(f, j, z);
    }
}
