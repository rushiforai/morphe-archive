package h4;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class j extends o {
    @Override // h4.d
    public final void a(d dVar) {
        g4.a aVar = (g4.a) this.f59133b;
        int i5 = aVar.f57054r0;
        f fVar = this.f59139h;
        Iterator it = fVar.f59118l.iterator();
        int i11 = 0;
        int i12 = -1;
        while (it.hasNext()) {
            int i13 = ((f) it.next()).f59113g;
            if (i12 == -1 || i13 < i12) {
                i12 = i13;
            }
            if (i11 < i13) {
                i11 = i13;
            }
        }
        if (i5 == 0 || i5 == 2) {
            fVar.d(i12 + aVar.f57056t0);
        } else {
            fVar.d(i11 + aVar.f57056t0);
        }
    }

    @Override // h4.o
    public final void d() {
        g4.d dVar = this.f59133b;
        if (dVar instanceof g4.a) {
            f fVar = this.f59139h;
            fVar.f59108b = true;
            ArrayList arrayList = fVar.f59118l;
            g4.a aVar = (g4.a) dVar;
            int i5 = aVar.f57054r0;
            boolean z11 = aVar.f57055s0;
            int i11 = 0;
            if (i5 == 0) {
                fVar.f59111e = 4;
                while (i11 < aVar.f57165q0) {
                    g4.d dVar2 = aVar.f57164p0[i11];
                    if (z11 || dVar2.f57093f0 != 8) {
                        f fVar2 = dVar2.f57088d.f59139h;
                        fVar2.f59117k.add(fVar);
                        arrayList.add(fVar2);
                    }
                    i11++;
                }
                m(this.f59133b.f57088d.f59139h);
                m(this.f59133b.f57088d.f59140i);
                return;
            }
            if (i5 == 1) {
                fVar.f59111e = 5;
                while (i11 < aVar.f57165q0) {
                    g4.d dVar3 = aVar.f57164p0[i11];
                    if (z11 || dVar3.f57093f0 != 8) {
                        f fVar3 = dVar3.f57088d.f59140i;
                        fVar3.f59117k.add(fVar);
                        arrayList.add(fVar3);
                    }
                    i11++;
                }
                m(this.f59133b.f57088d.f59139h);
                m(this.f59133b.f57088d.f59140i);
                return;
            }
            if (i5 == 2) {
                fVar.f59111e = 6;
                while (i11 < aVar.f57165q0) {
                    g4.d dVar4 = aVar.f57164p0[i11];
                    if (z11 || dVar4.f57093f0 != 8) {
                        f fVar4 = dVar4.f57090e.f59139h;
                        fVar4.f59117k.add(fVar);
                        arrayList.add(fVar4);
                    }
                    i11++;
                }
                m(this.f59133b.f57090e.f59139h);
                m(this.f59133b.f57090e.f59140i);
                return;
            }
            if (i5 != 3) {
                return;
            }
            fVar.f59111e = 7;
            while (i11 < aVar.f57165q0) {
                g4.d dVar5 = aVar.f57164p0[i11];
                if (z11 || dVar5.f57093f0 != 8) {
                    f fVar5 = dVar5.f57090e.f59140i;
                    fVar5.f59117k.add(fVar);
                    arrayList.add(fVar5);
                }
                i11++;
            }
            m(this.f59133b.f57090e.f59139h);
            m(this.f59133b.f57090e.f59140i);
        }
    }

    @Override // h4.o
    public final void e() {
        g4.d dVar = this.f59133b;
        if (dVar instanceof g4.a) {
            int i5 = ((g4.a) dVar).f57054r0;
            f fVar = this.f59139h;
            if (i5 == 0 || i5 == 1) {
                dVar.X = fVar.f59113g;
            } else {
                dVar.Y = fVar.f59113g;
            }
        }
    }

    @Override // h4.o
    public final void f() {
        this.f59134c = null;
        this.f59139h.c();
    }

    @Override // h4.o
    public final boolean k() {
        return false;
    }

    public final void m(f fVar) {
        f fVar2 = this.f59139h;
        fVar2.f59117k.add(fVar);
        fVar.f59118l.add(fVar2);
    }
}
