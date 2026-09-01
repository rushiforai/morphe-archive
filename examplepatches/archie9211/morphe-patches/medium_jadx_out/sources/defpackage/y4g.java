package defpackage;

import com.google.android.gms.internal.play_billing.zzik;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class y4g implements Cloneable {
    public final h5g a;
    public h5g b;

    public y4g(h5g h5gVar) {
        this.a = h5gVar;
        if (h5gVar.h()) {
            ay0.e("Default instance must be immutable.");
            throw null;
        }
        this.b = h5gVar.n();
    }

    public final h5g a() {
        boolean zH = this.b.h();
        h5g h5gVar = this.b;
        if (zH) {
            h5gVar.getClass();
            w7g.c.a(h5gVar.getClass()).b(h5gVar);
            h5gVar.e();
            h5gVar = this.b;
        }
        h5gVar.getClass();
        if (h5g.i(h5gVar, true)) {
            return h5gVar;
        }
        throw new zzik();
    }

    public final void b() {
        if (this.b.h()) {
            return;
        }
        c();
    }

    public final void c() {
        h5g h5gVarN = this.a.n();
        w7g.c.a(h5gVarN.getClass()).e(h5gVarN, this.b);
        this.b = h5gVarN;
    }

    public final Object clone() {
        y4g y4gVar = (y4g) this.a.j(5);
        boolean zH = this.b.h();
        h5g h5gVar = this.b;
        if (zH) {
            h5gVar.getClass();
            w7g.c.a(h5gVar.getClass()).b(h5gVar);
            h5gVar.e();
            h5gVar = this.b;
        }
        y4gVar.b = h5gVar;
        return y4gVar;
    }
}
