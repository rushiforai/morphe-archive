package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bz4 implements yy4 {
    public final mp a;
    public final np b;
    public final a1a c;
    public final gz4 d;
    public final md5 e;
    public final ff4 f;

    public bz4(mp mpVar, np npVar) {
        a1a a1aVar = cz4.a;
        gz4 gz4Var = new gz4(cz4.b);
        md5 md5Var = new md5(27);
        this.a = mpVar;
        this.b = npVar;
        this.c = a1aVar;
        this.d = gz4Var;
        this.e = md5Var;
        this.f = new ff4(9, this);
    }

    public final gyd a(dyd dydVar) {
        a1a a1aVar = this.c;
        si3 si3Var = new si3(this, 13, dydVar);
        synchronized (((dq1) a1aVar.b)) {
            gyd gydVar = (gyd) ((bd7) a1aVar.c).h(dydVar);
            if (gydVar != null) {
                if (gydVar.a()) {
                    return gydVar;
                }
            }
            try {
                gyd gydVar2 = (gyd) si3Var.invoke(new vrd(a1aVar, 6, dydVar));
                synchronized (((dq1) a1aVar.b)) {
                    if (((bd7) a1aVar.c).h(dydVar) == null && gydVar2.a()) {
                        ((bd7) a1aVar.c).l(dydVar, gydVar2);
                    }
                }
                return gydVar2;
            } catch (Exception e) {
                throw new IllegalStateException("Could not load font", e);
            }
        }
    }

    public final gyd b(az4 az4Var, d05 d05Var, int i, int i2) {
        int i3 = this.b.a;
        return a(new dyd(az4Var, (i3 == 0 || i3 == Integer.MAX_VALUE) ? d05Var : new d05(iq7.v(d05Var.a + i3, 1, PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE)), i, i2, null));
    }
}
