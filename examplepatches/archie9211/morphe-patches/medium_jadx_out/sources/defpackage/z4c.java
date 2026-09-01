package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class z4c {
    public static final sn3 a = new sn3(1, new lg9(26));

    public static final m3c a(z3c z3cVar, x12 x12Var) {
        w4c w4cVar = (w4c) ((p65) x12Var).j(a);
        switch (y4c.a[z3cVar.ordinal()]) {
            case 1:
                return w4cVar.e;
            case 2:
                return w4cVar.g;
            case 3:
                return w4cVar.h;
            case 4:
                return b(w4cVar.e);
            case 5:
                return w4cVar.a;
            case 6:
                return b(w4cVar.a);
            case 7:
                return bmb.a;
            case 8:
                return w4cVar.d;
            case 9:
                return w4cVar.f;
            case 10:
                amb ambVar = w4cVar.d;
                wj3 wj3Var = u3c.i;
                return amb.b(ambVar, wj3Var, null, null, wj3Var, 6);
            case 11:
                return b(w4cVar.d);
            case 12:
                return w4cVar.c;
            case 13:
                return rv8.r;
            case 14:
                return w4cVar.b;
            case 15:
                amb ambVar2 = w4cVar.d;
                wj3 wj3Var2 = u3c.i;
                return amb.b(ambVar2, null, wj3Var2, wj3Var2, null, 9);
            default:
                ygf.a();
                return null;
        }
    }

    public static amb b(amb ambVar) {
        wj3 wj3Var = u3c.i;
        return amb.b(ambVar, null, null, wj3Var, wj3Var, 3);
    }
}
