package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gy0 implements zk7 {
    public final xd a;
    public final boolean b;

    public gy0(xd xdVar, boolean z) {
        this.a = xdVar;
        this.b = z;
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int a(y66 y66Var, List list, int i) {
        return ev6.c(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        int iJ;
        int i;
        t99 t99VarS;
        boolean zIsEmpty = list.isEmpty();
        fy3 fy3Var = fy3.a;
        if (zIsEmpty) {
            return bl7Var.q0(f72.j(j), f72.i(j), fy3Var, new nx(21));
        }
        long j2 = this.b ? j : j & (-8589934589L);
        if (list.size() == 1) {
            tk7 tk7Var = (tk7) list.get(0);
            Object objW = tk7Var.w();
            cy0 cy0Var = objW instanceof cy0 ? (cy0) objW : null;
            if (cy0Var != null ? cy0Var.p : false) {
                iJ = f72.j(j);
                i = f72.i(j);
                int iJ2 = f72.j(j);
                int i2 = f72.i(j);
                if (!((i2 >= 0) & (iJ2 >= 0))) {
                    d26.a("width and height must be >= 0");
                }
                t99VarS = tk7Var.s(h72.h(iJ2, iJ2, i2, i2));
            } else {
                t99VarS = tk7Var.s(j2);
                iJ = Math.max(f72.j(j), t99VarS.a);
                i = Math.max(f72.i(j), t99VarS.b);
            }
            int i3 = i;
            int i4 = iJ;
            return bl7Var.q0(i4, i3, fy3Var, new ey0(t99VarS, tk7Var, bl7Var, i4, i3, this));
        }
        t99[] t99VarArr = new t99[list.size()];
        pya pyaVar = new pya();
        pyaVar.a = f72.j(j);
        pya pyaVar2 = new pya();
        pyaVar2.a = f72.i(j);
        int size = list.size();
        boolean z = false;
        for (int i5 = 0; i5 < size; i5++) {
            tk7 tk7Var2 = (tk7) list.get(i5);
            Object objW2 = tk7Var2.w();
            cy0 cy0Var2 = objW2 instanceof cy0 ? (cy0) objW2 : null;
            if (cy0Var2 != null ? cy0Var2.p : false) {
                z = true;
            } else {
                t99 t99VarS2 = tk7Var2.s(j2);
                t99VarArr[i5] = t99VarS2;
                pyaVar.a = Math.max(pyaVar.a, t99VarS2.a);
                pyaVar2.a = Math.max(pyaVar2.a, t99VarS2.b);
            }
        }
        if (z) {
            int i6 = pyaVar.a;
            int i7 = i6 != Integer.MAX_VALUE ? i6 : 0;
            int i8 = pyaVar2.a;
            long jA = h72.a(i7, i6, i8 != Integer.MAX_VALUE ? i8 : 0, i8);
            int size2 = list.size();
            for (int i9 = 0; i9 < size2; i9++) {
                tk7 tk7Var3 = (tk7) list.get(i9);
                Object objW3 = tk7Var3.w();
                cy0 cy0Var3 = objW3 instanceof cy0 ? (cy0) objW3 : null;
                if (cy0Var3 != null ? cy0Var3.p : false) {
                    t99VarArr[i9] = tk7Var3.s(jA);
                }
            }
        }
        return bl7Var.q0(pyaVar.a, pyaVar2.a, fy3Var, new fy0(t99VarArr, list, bl7Var, pyaVar, pyaVar2, this, 0));
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int c(y66 y66Var, List list, int i) {
        return ev6.g(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int d(y66 y66Var, List list, int i) {
        return ev6.a(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int e(y66 y66Var, List list, int i) {
        return ev6.e(this, y66Var, list, i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gy0)) {
            return false;
        }
        gy0 gy0Var = (gy0) obj;
        return g76.L(this.a, gy0Var.a) && this.b == gy0Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BoxMeasurePolicy(alignment=");
        sb.append(this.a);
        sb.append(", propagateMinConstraints=");
        return ev6.A(sb, this.b, ')');
    }
}
