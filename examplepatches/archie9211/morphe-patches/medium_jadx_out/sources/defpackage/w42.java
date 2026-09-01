package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class w42 {
    public static final k68 a;

    static {
        dkb dkbVar = lv1.e;
        int i = dkbVar.c;
        t42 t42Var = new t42(dkbVar, dkbVar, 1);
        int i2 = dkbVar.c;
        xp8 xp8Var = lv1.x;
        int i3 = (xp8Var.c << 6) | i2;
        v42 v42Var = new v42(dkbVar, xp8Var, 0);
        int i4 = (i2 << 6) | xp8Var.c;
        v42 v42Var2 = new v42(xp8Var, dkbVar, 0);
        k68 k68Var = j46.a;
        k68 k68Var2 = new k68();
        k68Var2.i(i | (i << 6), t42Var);
        k68Var2.i(i3, v42Var);
        k68Var2.i(i4, v42Var2);
        a = k68Var2;
    }
}
