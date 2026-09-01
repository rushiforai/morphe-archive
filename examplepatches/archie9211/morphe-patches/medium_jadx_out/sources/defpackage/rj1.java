package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rj1 extends m3f {
    public final ArrayList k;
    public int l;

    public rj1(b72 b72Var, int i) {
        b72 b72Var2;
        super(b72Var);
        ArrayList<m3f> arrayList = new ArrayList();
        this.k = arrayList;
        this.f = i;
        b72 b72Var3 = this.b;
        b72 b72VarN = b72Var3.n(i);
        while (true) {
            b72Var2 = b72Var3;
            b72Var3 = b72VarN;
            if (b72Var3 == null) {
                break;
            } else {
                b72VarN = b72Var3.n(this.f);
            }
        }
        this.b = b72Var2;
        int i2 = this.f;
        arrayList.add(i2 == 0 ? b72Var2.d : i2 == 1 ? b72Var2.e : null);
        b72 b72VarM = b72Var2.m(this.f);
        while (b72VarM != null) {
            int i3 = this.f;
            arrayList.add(i3 == 0 ? b72VarM.d : i3 == 1 ? b72VarM.e : null);
            b72VarM = b72VarM.m(this.f);
        }
        for (m3f m3fVar : arrayList) {
            int i4 = this.f;
            if (i4 == 0) {
                m3fVar.b.b = this;
            } else if (i4 == 1) {
                m3fVar.b.c = this;
            }
        }
        if (this.f == 0 && this.b.V.w0 && arrayList.size() > 1) {
            this.b = ((m3f) y30.m(1, arrayList)).b;
        }
        int i5 = this.f;
        b72 b72Var4 = this.b;
        this.l = i5 == 0 ? b72Var4.k0 : b72Var4.l0;
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00de  */
    @Override // defpackage.t73
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a(defpackage.t73 r27) {
        /*
            Method dump skipped, instruction units count: 954
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rj1.a(t73):void");
    }

    @Override // defpackage.m3f
    public final void d() {
        ArrayList arrayList = this.k;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((m3f) it2.next()).d();
        }
        int size = arrayList.size();
        if (size < 1) {
            return;
        }
        b72 b72Var = ((m3f) arrayList.get(0)).b;
        b72 b72Var2 = ((m3f) arrayList.get(size - 1)).b;
        int i = this.f;
        y73 y73Var = this.i;
        y73 y73Var2 = this.h;
        if (i == 0) {
            l52 l52Var = b72Var.J;
            l52 l52Var2 = b72Var2.L;
            y73 y73VarI = m3f.i(l52Var, 0);
            int iE = l52Var.e();
            b72 b72VarM = m();
            if (b72VarM != null) {
                iE = b72VarM.J.e();
            }
            if (y73VarI != null) {
                m3f.b(y73Var2, y73VarI, iE);
            }
            y73 y73VarI2 = m3f.i(l52Var2, 0);
            int iE2 = l52Var2.e();
            b72 b72VarN = n();
            if (b72VarN != null) {
                iE2 = b72VarN.L.e();
            }
            if (y73VarI2 != null) {
                m3f.b(y73Var, y73VarI2, -iE2);
            }
        } else {
            l52 l52Var3 = b72Var.K;
            l52 l52Var4 = b72Var2.M;
            y73 y73VarI3 = m3f.i(l52Var3, 1);
            int iE3 = l52Var3.e();
            b72 b72VarM2 = m();
            if (b72VarM2 != null) {
                iE3 = b72VarM2.K.e();
            }
            if (y73VarI3 != null) {
                m3f.b(y73Var2, y73VarI3, iE3);
            }
            y73 y73VarI4 = m3f.i(l52Var4, 1);
            int iE4 = l52Var4.e();
            b72 b72VarN2 = n();
            if (b72VarN2 != null) {
                iE4 = b72VarN2.M.e();
            }
            if (y73VarI4 != null) {
                m3f.b(y73Var, y73VarI4, -iE4);
            }
        }
        y73Var2.a = this;
        y73Var.a = this;
    }

    @Override // defpackage.m3f
    public final void e() {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.k;
            if (i >= arrayList.size()) {
                return;
            }
            ((m3f) arrayList.get(i)).e();
            i++;
        }
    }

    @Override // defpackage.m3f
    public final void f() {
        this.c = null;
        Iterator it2 = this.k.iterator();
        while (it2.hasNext()) {
            ((m3f) it2.next()).f();
        }
    }

    @Override // defpackage.m3f
    public final long j() {
        ArrayList arrayList = this.k;
        int size = arrayList.size();
        long j = 0;
        for (int i = 0; i < size; i++) {
            m3f m3fVar = (m3f) arrayList.get(i);
            j = ((long) m3fVar.i.f) + m3fVar.j() + j + ((long) m3fVar.h.f);
        }
        return j;
    }

    @Override // defpackage.m3f
    public final boolean k() {
        ArrayList arrayList = this.k;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (!((m3f) arrayList.get(i)).k()) {
                return false;
            }
        }
        return true;
    }

    public final b72 m() {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.k;
            if (i >= arrayList.size()) {
                return null;
            }
            b72 b72Var = ((m3f) arrayList.get(i)).b;
            if (b72Var.i0 != 8) {
                return b72Var;
            }
            i++;
        }
    }

    public final b72 n() {
        ArrayList arrayList = this.k;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            b72 b72Var = ((m3f) arrayList.get(size)).b;
            if (b72Var.i0 != 8) {
                return b72Var;
            }
        }
        return null;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ChainRun ");
        sb.append(this.f == 0 ? "horizontal : " : "vertical : ");
        for (m3f m3fVar : this.k) {
            sb.append("<");
            sb.append(m3fVar);
            sb.append("> ");
        }
        return sb.toString();
    }
}
