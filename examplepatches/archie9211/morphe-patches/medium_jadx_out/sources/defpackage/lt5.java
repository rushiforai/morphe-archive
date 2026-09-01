package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lt5 {
    public final int a;
    public final ArrayList b;
    public final zz0 c;
    public final h21 d;

    public lt5(int i, ArrayList arrayList, zz0 zz0Var, h21 h21Var) {
        this.a = i;
        this.b = arrayList;
        this.c = zz0Var;
        this.d = h21Var;
    }

    public final zz0 a() {
        zz0 zz0Var = this.c;
        if (zz0Var != null) {
            return zz0Var;
        }
        h21 h21Var = this.d;
        if (h21Var == null) {
            return null;
        }
        kz0 kz0Var = new kz0();
        kz0Var.J0(h21Var);
        return kz0Var;
    }
}
