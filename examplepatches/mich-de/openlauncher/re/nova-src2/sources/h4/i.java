package h4;

/* loaded from: classes2.dex */
public final class i extends o {
    @Override // h4.d
    public final void a(d dVar) {
        f fVar = this.f59139h;
        if (fVar.f59109c && !fVar.f59116j) {
            fVar.d((int) ((((f) fVar.f59118l.get(0)).f59113g * ((g4.h) this.f59133b).f57158p0) + 0.5f));
        }
    }

    @Override // h4.o
    public final void d() {
        g4.d dVar = this.f59133b;
        g4.h hVar = (g4.h) dVar;
        int i5 = hVar.f57159q0;
        int i11 = hVar.f57160r0;
        int i12 = hVar.f57162t0;
        f fVar = this.f59139h;
        if (i12 == 1) {
            if (i5 != -1) {
                fVar.f59118l.add(dVar.S.f57088d.f59139h);
                this.f59133b.S.f57088d.f59139h.f59117k.add(fVar);
                fVar.f59112f = i5;
            } else if (i11 != -1) {
                fVar.f59118l.add(dVar.S.f57088d.f59140i);
                this.f59133b.S.f57088d.f59140i.f59117k.add(fVar);
                fVar.f59112f = -i11;
            } else {
                fVar.f59108b = true;
                fVar.f59118l.add(dVar.S.f57088d.f59140i);
                this.f59133b.S.f57088d.f59140i.f59117k.add(fVar);
            }
            m(this.f59133b.f57088d.f59139h);
            m(this.f59133b.f57088d.f59140i);
            return;
        }
        if (i5 != -1) {
            fVar.f59118l.add(dVar.S.f57090e.f59139h);
            this.f59133b.S.f57090e.f59139h.f59117k.add(fVar);
            fVar.f59112f = i5;
        } else if (i11 != -1) {
            fVar.f59118l.add(dVar.S.f57090e.f59140i);
            this.f59133b.S.f57090e.f59140i.f59117k.add(fVar);
            fVar.f59112f = -i11;
        } else {
            fVar.f59108b = true;
            fVar.f59118l.add(dVar.S.f57090e.f59140i);
            this.f59133b.S.f57090e.f59140i.f59117k.add(fVar);
        }
        m(this.f59133b.f57090e.f59139h);
        m(this.f59133b.f57090e.f59140i);
    }

    @Override // h4.o
    public final void e() {
        g4.d dVar = this.f59133b;
        int i5 = ((g4.h) dVar).f57162t0;
        f fVar = this.f59139h;
        if (i5 == 1) {
            dVar.X = fVar.f59113g;
        } else {
            dVar.Y = fVar.f59113g;
        }
    }

    @Override // h4.o
    public final void f() {
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
