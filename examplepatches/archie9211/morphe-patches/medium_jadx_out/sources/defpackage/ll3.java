package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ll3 extends q28 implements sp6 {
    public tl o;
    public b55 p;
    public hw8 q;
    public boolean r;

    @Override // defpackage.q28
    public final void A0() {
        this.r = false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        if (!bl7Var.W() || !this.r) {
            f09 f09Var = (f09) this.p.invoke(new s46((((long) t99VarS.b) & 4294967295L) | (((long) t99VarS.a) << 32)), new f72(j));
            tl tlVar = this.o;
            gh7 gh7Var = (gh7) f09Var.a;
            Object obj = f09Var.b;
            if (!g76.L(tlVar.g(), gh7Var)) {
                ((k49) tlVar.i).setValue(gh7Var);
                a98 a98Var = ((i66) tlVar.e).b;
                boolean zE = a98Var.e(null);
                if (zE) {
                    try {
                        ol olVar = (ol) tlVar.m;
                        float fD = tlVar.g().d(obj);
                        if (!Float.isNaN(fD)) {
                            lv8.b(olVar, fD);
                            tlVar.m(null);
                        }
                        tlVar.l(obj);
                        a98Var.f(null);
                    } catch (Throwable th) {
                        a98Var.f(null);
                        throw th;
                    }
                }
                if (!zE) {
                    tlVar.m(obj);
                }
            }
        }
        this.r = bl7Var.W() || this.r;
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new o8(bl7Var, this, t99VarS, 12));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }
}
