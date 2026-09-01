package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j5f {
    public static final k68 a;
    public static final h5f[] b;

    static {
        k68 k68Var = new k68(8);
        h5f.a.getClass();
        i5f i5fVar = g5f.g;
        k68Var.i(1, i5fVar);
        i5f i5fVar2 = g5f.f;
        k68Var.i(2, i5fVar2);
        i5f i5fVar3 = g5f.b;
        k68Var.i(4, i5fVar3);
        i5f i5fVar4 = g5f.d;
        k68Var.i(8, i5fVar4);
        i5f i5fVar5 = g5f.h;
        k68Var.i(16, i5fVar5);
        i5f i5fVar6 = g5f.e;
        k68Var.i(32, i5fVar6);
        i5f i5fVar7 = g5f.i;
        k68Var.i(64, i5fVar7);
        i5f i5fVar8 = g5f.c;
        k68Var.i(128, i5fVar8);
        a = k68Var;
        b = new h5f[]{i5fVar, i5fVar2, i5fVar3, i5fVar7, i5fVar5, i5fVar6, i5fVar4, g5f.j, i5fVar8};
    }

    public static final void a(cb7 cb7Var, m26 m26Var, long j, int i, int i2) {
        if (lk7.t(j, -1L)) {
            return;
        }
        cb7Var.c(m26Var.b, (int) ((j >>> 48) & 65535));
        cb7Var.c(m26Var.c, (int) ((j >>> 32) & 65535));
        cb7Var.c(m26Var.d, i - ((int) ((j >>> 16) & 65535)));
        cb7Var.c(m26Var.e, i2 - ((int) (j & 65535)));
    }
}
