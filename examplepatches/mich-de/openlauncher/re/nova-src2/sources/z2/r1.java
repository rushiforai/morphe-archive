package z2;

import androidx.compose.ui.node.LayoutNode;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class r1 {

    /* renamed from: a, reason: collision with root package name */
    public static final b1 f98148a = new b1(4);

    public static final void a(b2.t tVar, Function2 function2, p1.o oVar, int i5, int i11) {
        int i12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1298353104);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= tVar2.h(function2) ? 32 : 16;
        }
        if (tVar2.S(i12 & 1, (i12 & 19) != 18)) {
            if (i13 != 0) {
                tVar = b2.r.f17024a;
            }
            Object objP = tVar2.P();
            if (objP == p1.n.f81514a) {
                objP = new v1(b1.f98025b);
                tVar2.m0(objP);
            }
            b((v1) objP, tVar, function2, tVar2, (i12 << 3) & 1008);
        } else {
            tVar2.V();
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new q1(tVar, function2, i5, i11);
        }
    }

    public static final void b(v1 v1Var, b2.t tVar, Function2 function2, p1.o oVar, int i5) {
        int i11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-511989831);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.h(v1Var) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= tVar2.f(tVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= tVar2.h(function2) ? 256 : 128;
        }
        if (tVar2.S(i11 & 1, (i11 & 147) != 146)) {
            int iHashCode = Long.hashCode(tVar2.T);
            androidx.compose.runtime.a aVarI = p1.a0.i(tVar2);
            b2.t tVarI = fg.a.I(tVar, tVar2);
            p1.n1 n1VarL = tVar2.l();
            LayoutNode.Companion.getClass();
            Function0 function0 = LayoutNode.Constructor;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            p1.a0.j(v1Var, v1Var.f98162c, tVar2);
            p1.a0.j(aVarI, v1Var.f98163d, tVar2);
            p1.a0.j(function2, v1Var.f98164e, tVar2);
            b3.l.Po.getClass();
            p1.a0.j(n1VarL, b3.k.f17274f, tVar2);
            p1.a0.j(tVarI, b3.k.f17272d, tVar2);
            b3.i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            tVar2.p(true);
            if (tVar2.E()) {
                tVar2.b0(-1259216055);
                tVar2.p(false);
            } else {
                tVar2.b0(-1259274676);
                boolean zH = tVar2.h(v1Var);
                Object objP = tVar2.P();
                if (zH || objP == p1.n.f81514a) {
                    objP = new y5.e(v1Var, 1);
                    tVar2.m0(objP);
                }
                p1.o0.h((Function0) objP, tVar2);
                tVar2.p(false);
            }
        } else {
            tVar2.V();
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c4.c(v1Var, tVar, function2, i5, 2);
        }
    }

    public static final float c(long j11, long j12) {
        return Math.min(Float.intBitsToFloat((int) (j12 >> 32)) / Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)) / Float.intBitsToFloat((int) (j11 & 4294967295L)));
    }

    public static final h2.c d(y yVar) {
        y yVarI = yVar.I();
        return yVarI != null ? yVarI.i(yVar, true) : new h2.c(0.0f, 0.0f, (int) (yVar.g() >> 32), (int) (yVar.g() & 4294967295L));
    }

    public static final h2.c e(y yVar) {
        y yVarF = f(yVar);
        float fG = (int) (yVarF.g() >> 32);
        float fG2 = (int) (yVarF.g() & 4294967295L);
        h2.c cVarI = yVarF.i(yVar, true);
        float f11 = cVarI.f59018a;
        if (f11 < 0.0f) {
            f11 = 0.0f;
        }
        if (f11 > fG) {
            f11 = fG;
        }
        float f12 = cVarI.f59019b;
        if (f12 < 0.0f) {
            f12 = 0.0f;
        }
        if (f12 > fG2) {
            f12 = fG2;
        }
        float f13 = cVarI.f59020c;
        if (f13 < 0.0f) {
            f13 = 0.0f;
        }
        if (f13 <= fG) {
            fG = f13;
        }
        float f14 = cVarI.f59021d;
        float f15 = f14 >= 0.0f ? f14 : 0.0f;
        if (f15 <= fG2) {
            fG2 = f15;
        }
        if (f11 == fG || f12 == fG2) {
            return h2.c.f59017e;
        }
        long jX = yVarF.x((Float.floatToRawIntBits(f11) << 32) | (Float.floatToRawIntBits(f12) & 4294967295L));
        long jX2 = yVarF.x((Float.floatToRawIntBits(f12) & 4294967295L) | (Float.floatToRawIntBits(fG) << 32));
        long jX3 = yVarF.x((Float.floatToRawIntBits(fG) << 32) | (Float.floatToRawIntBits(fG2) & 4294967295L));
        long jX4 = yVarF.x((Float.floatToRawIntBits(fG2) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32));
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jX >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jX2 >> 32));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (jX4 >> 32));
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (jX3 >> 32));
        float fMin = Math.min(fIntBitsToFloat, Math.min(fIntBitsToFloat2, Math.min(fIntBitsToFloat3, fIntBitsToFloat4)));
        float fMax = Math.max(fIntBitsToFloat, Math.max(fIntBitsToFloat2, Math.max(fIntBitsToFloat3, fIntBitsToFloat4)));
        float fIntBitsToFloat5 = Float.intBitsToFloat((int) (jX & 4294967295L));
        float fIntBitsToFloat6 = Float.intBitsToFloat((int) (jX2 & 4294967295L));
        float fIntBitsToFloat7 = Float.intBitsToFloat((int) (jX4 & 4294967295L));
        float fIntBitsToFloat8 = Float.intBitsToFloat((int) (jX3 & 4294967295L));
        return new h2.c(fMin, Math.min(fIntBitsToFloat5, Math.min(fIntBitsToFloat6, Math.min(fIntBitsToFloat7, fIntBitsToFloat8))), fMax, Math.max(fIntBitsToFloat5, Math.max(fIntBitsToFloat6, Math.max(fIntBitsToFloat7, fIntBitsToFloat8))));
    }

    public static final y f(y yVar) {
        y yVar2;
        y yVarI = yVar.I();
        while (true) {
            y yVar3 = yVarI;
            yVar2 = yVar;
            yVar = yVar3;
            if (yVar == null) {
                break;
            }
            yVarI = yVar.I();
        }
        b3.t1 t1Var = yVar2 instanceof b3.t1 ? (b3.t1) yVar2 : null;
        if (t1Var == null) {
            return yVar2;
        }
        b3.t1 t1Var2 = t1Var.f17360q;
        while (true) {
            b3.t1 t1Var3 = t1Var2;
            b3.t1 t1Var4 = t1Var;
            t1Var = t1Var3;
            if (t1Var == null) {
                return t1Var4;
            }
            t1Var2 = t1Var.f17360q;
        }
    }

    public static final x1.e g(b2.t tVar) {
        return new x1.e(new b0(tVar), true, -2123382363);
    }

    public static final x1.e h(b2.t tVar) {
        return new x1.e(new b0.f(tVar, 6), true, -511438721);
    }

    public static final long i(long j11, long j12) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j12 >> 32)) * Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j12 & 4294967295L)) * Float.intBitsToFloat((int) (j11 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }
}
