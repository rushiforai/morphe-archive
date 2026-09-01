package defpackage;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j3f {
    public static int f;
    public ArrayList a;
    public int b;
    public int c;
    public ArrayList d;
    public int e;

    public final void a(ArrayList arrayList) {
        int size = this.a.size();
        if (this.e != -1 && size > 0) {
            for (int i = 0; i < arrayList.size(); i++) {
                j3f j3fVar = (j3f) arrayList.get(i);
                if (this.e == j3fVar.b) {
                    c(this.c, j3fVar);
                }
            }
        }
        if (size == 0) {
            arrayList.remove(this);
        }
    }

    public final int b(wz6 wz6Var, int i) {
        int iN;
        int iN2;
        ArrayList arrayList = this.a;
        if (arrayList.size() == 0) {
            return 0;
        }
        c72 c72Var = ((b72) arrayList.get(0)).V;
        wz6Var.t();
        c72Var.c(wz6Var, false);
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            ((b72) arrayList.get(i2)).c(wz6Var, false);
        }
        if (i == 0 && c72Var.A0 > 0) {
            gsa.T(c72Var, wz6Var, arrayList, 0);
        }
        if (i == 1 && c72Var.B0 > 0) {
            gsa.T(c72Var, wz6Var, arrayList, 1);
        }
        try {
            wz6Var.p();
        } catch (Exception e) {
            System.err.println(e.toString() + "\n" + Arrays.toString(e.getStackTrace()).replace("[", "   at ").replace(",", "\n   at").replace("]", ""));
        }
        this.d = new ArrayList();
        for (int i3 = 0; i3 < arrayList.size(); i3++) {
            b72 b72Var = (b72) arrayList.get(i3);
            u3b u3bVar = new u3b(25);
            new WeakReference(b72Var);
            wz6.n(b72Var.J);
            wz6.n(b72Var.K);
            wz6.n(b72Var.L);
            wz6.n(b72Var.M);
            wz6.n(b72Var.N);
            this.d.add(u3bVar);
        }
        if (i == 0) {
            iN = wz6.n(c72Var.J);
            iN2 = wz6.n(c72Var.L);
            wz6Var.t();
        } else {
            iN = wz6.n(c72Var.K);
            iN2 = wz6.n(c72Var.M);
            wz6Var.t();
        }
        return iN2 - iN;
    }

    public final void c(int i, j3f j3fVar) {
        int i2 = j3fVar.b;
        for (b72 b72Var : this.a) {
            ArrayList arrayList = j3fVar.a;
            if (!arrayList.contains(b72Var)) {
                arrayList.add(b72Var);
            }
            if (i == 0) {
                b72Var.p0 = i2;
            } else {
                b72Var.q0 = i2;
            }
        }
        this.e = i2;
    }

    public final String toString() {
        int i = this.c;
        StringBuilder sb = new StringBuilder(i == 0 ? "Horizontal" : i == 1 ? "Vertical" : i == 2 ? "Both" : "Unknown");
        sb.append(" [");
        String strH = ho2.H(sb, this.b, "] <");
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            strH = strH + " " + ((b72) it2.next()).j0;
        }
        return strH.concat(" >");
    }
}
