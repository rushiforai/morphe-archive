package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wg5 extends zpe {
    public float[] b;
    public final ArrayList c = new ArrayList();
    public boolean d = true;
    public long e = uu1.h;
    public List f;
    public boolean g;
    public br h;
    public x45 i;
    public final ce j;
    public String k;
    public float l;
    public float m;
    public float n;
    public float o;
    public float p;
    public float q;
    public float r;
    public boolean s;

    public wg5() {
        int i = fre.a;
        this.f = ey3.a;
        this.g = true;
        this.j = new ce(24, this);
        this.k = "";
        this.o = 1.0f;
        this.p = 1.0f;
        this.s = true;
    }

    @Override // defpackage.zpe
    public final void a(zl3 zl3Var) {
        if (this.s) {
            float[] fArrA = this.b;
            if (fArrA == null) {
                fArrA = pk7.a();
                this.b = fArrA;
            } else {
                pk7.d(fArrA);
            }
            pk7.h(fArrA, this.q + this.m, this.r + this.n);
            pk7.f(fArrA, this.l);
            float f = this.o;
            float f2 = this.p;
            if (fArrA.length >= 16) {
                fArrA[0] = fArrA[0] * f;
                fArrA[1] = fArrA[1] * f;
                fArrA[2] = fArrA[2] * f;
                fArrA[3] = fArrA[3] * f;
                fArrA[4] = fArrA[4] * f2;
                fArrA[5] = fArrA[5] * f2;
                fArrA[6] = fArrA[6] * f2;
                fArrA[7] = fArrA[7] * f2;
                fArrA[8] = fArrA[8] * 1.0f;
                fArrA[9] = fArrA[9] * 1.0f;
                fArrA[10] = fArrA[10] * 1.0f;
                fArrA[11] = fArrA[11] * 1.0f;
            }
            pk7.h(fArrA, -this.m, -this.n);
            this.s = false;
        }
        if (this.g) {
            if (!this.f.isEmpty()) {
                br brVarA = this.h;
                if (brVarA == null) {
                    brVarA = er.a();
                    this.h = brVarA;
                }
                yo7.w(this.f, brVarA);
            }
            this.g = false;
        }
        m50 m50VarB0 = zl3Var.b0();
        long jB = m50VarB0.B();
        m50VarB0.x().h();
        try {
            m50 m50Var = (m50) ((md5) m50VarB0.b).b;
            float[] fArr = this.b;
            if (fArr != null) {
                m50Var.x().m(fArr);
            }
            br brVar = this.h;
            if (!this.f.isEmpty() && brVar != null) {
                m50Var.x().n(brVar);
            }
            ArrayList arrayList = this.c;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                ((zpe) arrayList.get(i)).a(zl3Var);
            }
        } finally {
            y30.x(m50VarB0, jB);
        }
    }

    @Override // defpackage.zpe
    public final x45 b() {
        return this.i;
    }

    @Override // defpackage.zpe
    public final void d(ce ceVar) {
        this.i = ceVar;
    }

    public final void e(int i, zpe zpeVar) {
        ArrayList arrayList = this.c;
        if (i < arrayList.size()) {
            arrayList.set(i, zpeVar);
        } else {
            arrayList.add(zpeVar);
        }
        g(zpeVar);
        zpeVar.d(this.j);
        c();
    }

    public final void f(long j) {
        if (this.d && j != 16) {
            long j2 = this.e;
            if (j2 == 16) {
                this.e = j;
                return;
            }
            int i = fre.a;
            if (uu1.g(j2) == uu1.g(j) && uu1.f(j2) == uu1.f(j) && uu1.d(j2) == uu1.d(j)) {
                return;
            }
            this.d = false;
            this.e = uu1.h;
        }
    }

    public final void g(zpe zpeVar) {
        if (!(zpeVar instanceof k59)) {
            if (zpeVar instanceof wg5) {
                wg5 wg5Var = (wg5) zpeVar;
                if (wg5Var.d && this.d) {
                    f(wg5Var.e);
                    return;
                } else {
                    this.d = false;
                    this.e = uu1.h;
                    return;
                }
            }
            return;
        }
        k59 k59Var = (k59) zpeVar;
        ez0 ez0Var = k59Var.b;
        if (this.d && ez0Var != null) {
            if (ez0Var instanceof dkc) {
                f(((dkc) ez0Var).a);
            } else {
                this.d = false;
                this.e = uu1.h;
            }
        }
        ez0 ez0Var2 = k59Var.g;
        if (this.d && ez0Var2 != null) {
            if (ez0Var2 instanceof dkc) {
                f(((dkc) ez0Var2).a);
            } else {
                this.d = false;
                this.e = uu1.h;
            }
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("VGroup: ");
        sb.append(this.k);
        ArrayList arrayList = this.c;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            zpe zpeVar = (zpe) arrayList.get(i);
            sb.append("\t");
            sb.append(zpeVar.toString());
            sb.append("\n");
        }
        return sb.toString();
    }
}
