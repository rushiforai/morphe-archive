package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b76 extends q28 implements sp6 {
    public final /* synthetic */ int o;

    public abstract long I0(tk7 tk7Var, long j);

    public abstract boolean J0();

    @Override // defpackage.sp6
    public int a(fb7 fb7Var, tk7 tk7Var, int i) {
        switch (this.o) {
        }
        return tk7Var.n(i);
    }

    @Override // defpackage.sp6
    public al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        long jI0 = I0(tk7Var, j);
        if (J0()) {
            jI0 = h72.e(j, jI0);
        }
        t99 t99VarS = tk7Var.s(jI0);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 7));
    }

    @Override // defpackage.sp6
    public int d(fb7 fb7Var, tk7 tk7Var, int i) {
        switch (this.o) {
        }
        return tk7Var.a(i);
    }

    @Override // defpackage.sp6
    public int e(fb7 fb7Var, tk7 tk7Var, int i) {
        switch (this.o) {
        }
        return tk7Var.L(i);
    }

    @Override // defpackage.sp6
    public int g(fb7 fb7Var, tk7 tk7Var, int i) {
        switch (this.o) {
        }
        return tk7Var.k(i);
    }
}
