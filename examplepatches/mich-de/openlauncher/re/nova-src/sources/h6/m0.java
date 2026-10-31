package h6;

import android.os.Looper;

/* loaded from: classes.dex */
public class m0 extends j0 {
    @Override // h6.j0
    public void j(Object obj) {
        j0.a("setValue");
        this.f59393g++;
        this.f59391e = obj;
        c(null);
    }

    public final void k(Object obj) {
        boolean z11;
        synchronized (this.f59387a) {
            z11 = this.f59392f == j0.f59386k;
            this.f59392f = obj;
        }
        if (z11) {
            s.a aVarB0 = s.a.b0();
            f0 f0Var = this.f59396j;
            s.b bVar = aVarB0.f86500b;
            if (bVar.f86503d == null) {
                synchronized (bVar.f86501b) {
                    try {
                        if (bVar.f86503d == null) {
                            bVar.f86503d = s.b.b0(Looper.getMainLooper());
                        }
                    } finally {
                    }
                }
            }
            bVar.f86503d.post(f0Var);
        }
    }
}
