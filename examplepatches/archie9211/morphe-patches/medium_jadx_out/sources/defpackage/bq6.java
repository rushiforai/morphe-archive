package defpackage;

import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bq6 {
    public final de a;
    public boolean c;
    public boolean d;
    public boolean e;
    public boolean f;
    public boolean g;
    public de h;
    public final /* synthetic */ int j;
    public boolean b = true;
    public final HashMap i = new HashMap();

    public bq6(de deVar, int i) {
        this.j = i;
        this.a = deVar;
    }

    public final void a(yd ydVar, int i, eh8 eh8Var) {
        float f = i;
        long jFloatToRawIntBits = ((long) Float.floatToRawIntBits(f)) << 32;
        long jFloatToRawIntBits2 = ((long) Float.floatToRawIntBits(f)) & 4294967295L;
        while (true) {
            long jW = jFloatToRawIntBits | jFloatToRawIntBits2;
            do {
                switch (this.j) {
                    case 0:
                        lx8 lx8Var = eh8Var.L;
                        if (lx8Var != null) {
                            rf5 rf5Var = (rf5) lx8Var;
                            float[] fArrB = rf5Var.b();
                            if (!rf5Var.s) {
                                jW = pk7.b(jW, fArrB);
                            }
                        }
                        jW = d46.W(jW, eh8Var.z);
                        break;
                    default:
                        hb7 hb7VarM0 = eh8Var.M0();
                        hb7VarM0.getClass();
                        long j = hb7VarM0.p;
                        jW = ip8.e((((long) Float.floatToRawIntBits((int) (j & 4294967295L))) & 4294967295L) | (((long) Float.floatToRawIntBits((int) (j >> 32))) << 32), jW);
                        break;
                }
                eh8Var = eh8Var.q;
                eh8Var.getClass();
                if (eh8Var.equals(this.a.e())) {
                    int iRound = Math.round(ydVar instanceof fr5 ? Float.intBitsToFloat((int) (jW & 4294967295L)) : Float.intBitsToFloat((int) (jW >> 32)));
                    HashMap map = this.i;
                    if (map.containsKey(ydVar)) {
                        int iIntValue = ((Number) ei7.N(ydVar, map)).intValue();
                        fr5 fr5Var = be.a;
                        iRound = ((Number) ydVar.a.invoke(Integer.valueOf(iIntValue), Integer.valueOf(iRound))).intValue();
                    }
                    map.put(ydVar, Integer.valueOf(iRound));
                    return;
                }
            } while (!b(eh8Var).containsKey(ydVar));
            float fC = c(eh8Var, ydVar);
            long jFloatToRawIntBits3 = Float.floatToRawIntBits(fC);
            long jFloatToRawIntBits4 = Float.floatToRawIntBits(fC);
            jFloatToRawIntBits = jFloatToRawIntBits3 << 32;
            jFloatToRawIntBits2 = jFloatToRawIntBits4 & 4294967295L;
        }
    }

    public final Map b(eh8 eh8Var) {
        switch (this.j) {
            case 0:
                return eh8Var.w0().c();
            default:
                hb7 hb7VarM0 = eh8Var.M0();
                hb7VarM0.getClass();
                return hb7VarM0.w0().c();
        }
    }

    public final int c(eh8 eh8Var, yd ydVar) {
        switch (this.j) {
            case 0:
                return eh8Var.M(ydVar);
            default:
                hb7 hb7VarM0 = eh8Var.M0();
                hb7VarM0.getClass();
                return hb7VarM0.M(ydVar);
        }
    }

    public final boolean d() {
        return this.c || this.e || this.f || this.g;
    }

    public final boolean e() {
        h();
        return this.h != null;
    }

    public final void f() {
        this.b = true;
        de deVar = this.a;
        de deVarG = deVar.g();
        if (deVarG == null) {
            return;
        }
        if (this.c) {
            deVarG.K();
        } else if (this.e || this.d) {
            deVarG.requestLayout();
        }
        if (this.f) {
            deVar.K();
        }
        if (this.g) {
            deVar.requestLayout();
        }
        deVarG.c().f();
    }

    public final void g() {
        HashMap map = this.i;
        map.clear();
        ce ceVar = new ce(0, this);
        de deVar = this.a;
        deVar.A(ceVar);
        map.putAll(b(deVar.e()));
        this.b = false;
    }

    public final void h() {
        bq6 bq6VarC;
        bq6 bq6VarC2;
        boolean zD = d();
        de deVar = this.a;
        if (!zD) {
            de deVarG = deVar.g();
            if (deVarG == null) {
                return;
            }
            deVar = deVarG.c().h;
            if (deVar == null || !deVar.c().d()) {
                de deVar2 = this.h;
                if (deVar2 == null || deVar2.c().d()) {
                    return;
                }
                de deVarG2 = deVar2.g();
                if (deVarG2 != null && (bq6VarC2 = deVarG2.c()) != null) {
                    bq6VarC2.h();
                }
                de deVarG3 = deVar2.g();
                deVar = (deVarG3 == null || (bq6VarC = deVarG3.c()) == null) ? null : bq6VarC.h;
            }
        }
        this.h = deVar;
    }
}
