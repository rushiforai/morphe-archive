package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sh4 extends q28 implements sp6 {
    public ef3 o;
    public float p;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        int iJ;
        int iH;
        int iG;
        int i;
        if (!f72.d(j) || this.o == ef3.Vertical) {
            iJ = f72.j(j);
            iH = f72.h(j);
        } else {
            int iRound = Math.round(f72.h(j) * this.p);
            int iJ2 = f72.j(j);
            iJ = f72.h(j);
            if (iRound < iJ2) {
                iRound = iJ2;
            }
            if (iRound <= iJ) {
                iJ = iRound;
            }
            iH = iJ;
        }
        if (!f72.c(j) || this.o == ef3.Horizontal) {
            int i2 = f72.i(j);
            int iG2 = f72.g(j);
            iG = i2;
            i = iG2;
        } else {
            int iRound2 = Math.round(f72.g(j) * this.p);
            int i3 = f72.i(j);
            iG = f72.g(j);
            if (iRound2 < i3) {
                iRound2 = i3;
            }
            if (iRound2 <= iG) {
                iG = iRound2;
            }
            i = iG;
        }
        t99 t99VarS = tk7Var.s(h72.a(iJ, iH, iG, i));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 5));
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
