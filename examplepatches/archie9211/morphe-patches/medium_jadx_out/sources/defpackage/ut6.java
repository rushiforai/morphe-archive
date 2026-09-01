package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ut6 {
    public final nob a;
    public final ei4 b;
    public final f78 c;

    public ut6(nob nobVar, ei4 ei4Var) {
        this.a = nobVar;
        this.b = ei4Var;
        long[] jArr = hqb.a;
        this.c = new f78();
    }

    public final b55 a(Object obj, int i, Object obj2) {
        f78 f78Var = this.c;
        tt6 tt6Var = (tt6) f78Var.g(obj);
        int i2 = 16;
        if (tt6Var != null && tt6Var.c == i && g76.L(tt6Var.b, obj2)) {
            mz1 mz1Var = tt6Var.d;
            if (mz1Var != null) {
                return mz1Var;
            }
            mz1 mz1Var2 = new mz1(new hm4(tt6Var.e, i2, tt6Var), true, 818252804);
            tt6Var.d = mz1Var2;
            return mz1Var2;
        }
        tt6 tt6Var2 = new tt6(this, i, obj, obj2);
        f78Var.m(obj, tt6Var2);
        mz1 mz1Var3 = tt6Var2.d;
        if (mz1Var3 != null) {
            return mz1Var3;
        }
        mz1 mz1Var4 = new mz1(new hm4(this, i2, tt6Var2), true, 818252804);
        tt6Var2.d = mz1Var4;
        return mz1Var4;
    }

    public final Object b(Object obj) {
        if (obj == null) {
            return null;
        }
        tt6 tt6Var = (tt6) this.c.g(obj);
        if (tt6Var != null) {
            return tt6Var.b;
        }
        wt6 wt6Var = (wt6) this.b.invoke();
        int iE = wt6Var.e(obj);
        if (iE != -1) {
            return wt6Var.d(iE);
        }
        return null;
    }
}
