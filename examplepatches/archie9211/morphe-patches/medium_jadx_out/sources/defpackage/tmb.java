package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tmb {
    public m3f a;
    public ArrayList b;

    public static long a(y73 y73Var, long j) {
        m3f m3fVar = y73Var.d;
        ArrayList arrayList = y73Var.k;
        if (m3fVar instanceof ij5) {
            return j;
        }
        int size = arrayList.size();
        long jMin = j;
        for (int i = 0; i < size; i++) {
            t73 t73Var = (t73) arrayList.get(i);
            if (t73Var instanceof y73) {
                y73 y73Var2 = (y73) t73Var;
                if (y73Var2.d != m3fVar) {
                    jMin = Math.min(jMin, a(y73Var2, ((long) y73Var2.f) + j));
                }
            }
        }
        y73 y73Var3 = m3fVar.i;
        y73 y73Var4 = m3fVar.h;
        if (y73Var != y73Var3) {
            return jMin;
        }
        long j2 = j - m3fVar.j();
        return Math.min(Math.min(jMin, a(y73Var4, j2)), j2 - ((long) y73Var4.f));
    }

    public static long b(y73 y73Var, long j) {
        m3f m3fVar = y73Var.d;
        ArrayList arrayList = y73Var.k;
        if (m3fVar instanceof ij5) {
            return j;
        }
        int size = arrayList.size();
        long jMax = j;
        for (int i = 0; i < size; i++) {
            t73 t73Var = (t73) arrayList.get(i);
            if (t73Var instanceof y73) {
                y73 y73Var2 = (y73) t73Var;
                if (y73Var2.d != m3fVar) {
                    jMax = Math.max(jMax, b(y73Var2, ((long) y73Var2.f) + j));
                }
            }
        }
        y73 y73Var3 = m3fVar.h;
        y73 y73Var4 = m3fVar.i;
        if (y73Var != y73Var3) {
            return jMax;
        }
        long j2 = m3fVar.j() + j;
        return Math.max(Math.max(jMax, b(y73Var4, j2)), j2 - ((long) y73Var4.f));
    }
}
