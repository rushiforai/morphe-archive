package defpackage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class s05 extends ch4 {
    public final ch4 c;

    public s05(ch4 ch4Var) {
        ch4Var.getClass();
        this.c = ch4Var;
    }

    @Override // defpackage.ch4
    public final void B(g59 g59Var) {
        g59Var.getClass();
        this.c.B(g59Var);
    }

    @Override // defpackage.ch4
    public final void D(g59 g59Var) {
        g59Var.getClass();
        this.c.D(g59Var);
    }

    @Override // defpackage.ch4
    public final List N(g59 g59Var) {
        List<g59> listN = this.c.N(g59Var);
        ArrayList arrayList = new ArrayList();
        for (g59 g59Var2 : listN) {
            g59Var2.getClass();
            arrayList.add(g59Var2);
        }
        eu1.l0(arrayList);
        return arrayList;
    }

    @Override // defpackage.ch4
    public final w73 R(g59 g59Var) {
        g59Var.getClass();
        w73 w73VarR = this.c.R(g59Var);
        if (w73VarR == null) {
            return null;
        }
        g59 g59Var2 = (g59) w73VarR.d;
        if (g59Var2 == null) {
            return w73VarR;
        }
        boolean z = w73VarR.b;
        boolean z2 = w73VarR.c;
        Long l = (Long) w73VarR.e;
        Long l2 = (Long) w73VarR.f;
        Long l3 = (Long) w73VarR.g;
        Long l4 = (Long) w73VarR.h;
        Map map = (Map) w73VarR.i;
        map.getClass();
        return new w73(z, z2, g59Var2, l, l2, l3, l4, map);
    }

    @Override // defpackage.ch4
    public final we6 T(g59 g59Var) {
        return this.c.T(g59Var);
    }

    @Override // defpackage.ch4, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.c.close();
    }

    @Override // defpackage.ch4
    public final bfc f(g59 g59Var) {
        g59Var.getClass();
        return this.c.f(g59Var);
    }

    @Override // defpackage.ch4
    public final ikc g0(g59 g59Var) {
        g59Var.getClass();
        return this.c.g0(g59Var);
    }

    @Override // defpackage.ch4
    public final void m(g59 g59Var, g59 g59Var2) {
        g59Var.getClass();
        g59Var2.getClass();
        this.c.m(g59Var, g59Var2);
    }

    public final String toString() {
        return n1b.a.b(getClass()).j() + '(' + this.c + ')';
    }
}
