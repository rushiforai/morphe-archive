package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c00 implements h68 {
    public final xl2 a = new xl2();
    public final ArrayList b = new ArrayList();
    public final ArrayList c = new ArrayList();
    public final ArrayList d = new ArrayList();
    public final ArrayList e = new ArrayList();
    public final ArrayList f;
    public final ArrayList g;
    public final ArrayList h;
    public final ArrayList i;
    public s44 j;
    public Boolean k;
    public String l;
    public hf6 m;
    public x50 n;

    public c00() {
        ArrayList arrayList = new ArrayList();
        this.f = arrayList;
        this.g = arrayList;
        ArrayList arrayList2 = new ArrayList();
        this.h = arrayList2;
        this.i = arrayList2;
        this.j = by3.a;
    }

    public static void b(c00 c00Var, g00 g00Var) {
        ArrayList arrayList;
        f00 f00Var = f00.BeforeCache;
        f00Var.getClass();
        int i = b00.a[f00Var.ordinal()];
        if (i == 1) {
            arrayList = c00Var.b;
        } else if (i == 2) {
            arrayList = c00Var.c;
        } else if (i == 3) {
            arrayList = c00Var.d;
        } else {
            if (i != 4) {
                ygf.a();
                return;
            }
            arrayList = c00Var.e;
        }
        arrayList.add(g00Var);
    }

    @Override // defpackage.h68
    public final Object a(q44 q44Var) {
        this.j = this.j.c(q44Var);
        return this;
    }

    public final ArrayList c() {
        return bu1.Q0(this.e, bu1.Q0(this.d, bu1.Q0(this.c, this.b)));
    }
}
