package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y08 extends q28 implements u22, sp6 {
    public LinkedHashMap o;

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        float f = ((vj3) bo.K(this, g56.c)).a;
        if (f < 0.0f) {
            f = 0.0f;
        }
        t99 t99VarS = tk7Var.s(j);
        boolean z = this.n && !Float.isNaN(f) && vj3.a(f, 0.0f) > 0;
        int iI0 = !Float.isNaN(f) ? bl7Var.i0(f) : 0;
        int iMax = t99VarS.a;
        if (z) {
            iMax = Math.max(iMax, iI0);
        }
        int iMax2 = t99VarS.b;
        if (z) {
            iMax2 = Math.max(iMax2, iI0);
        }
        if (z) {
            LinkedHashMap linkedHashMap = this.o;
            if (linkedHashMap == null) {
                linkedHashMap = new LinkedHashMap(2);
                this.o = linkedHashMap;
            }
            sse sseVar = g56.b;
            int iRound = Math.round((iI0 - t99VarS.a) / 2.0f);
            if (iRound < 0) {
                iRound = 0;
            }
            linkedHashMap.put(sseVar, Integer.valueOf(iRound));
            fr5 fr5Var = g56.a;
            int iRound2 = Math.round((iI0 - t99VarS.b) / 2.0f);
            linkedHashMap.put(fr5Var, Integer.valueOf(iRound2 >= 0 ? iRound2 : 0));
        }
        Map map = this.o;
        if (map == null) {
            map = fy3.a;
        }
        return bl7Var.q0(iMax, iMax2, map, new cl0(iMax, t99VarS, iMax2, 3));
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
