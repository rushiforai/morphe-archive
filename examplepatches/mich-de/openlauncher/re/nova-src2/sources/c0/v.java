package c0;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;

/* loaded from: classes2.dex */
public abstract class v {

    /* renamed from: a, reason: collision with root package name */
    public static final float[] f18985a = new float[91];

    public static final j0 a(n0 n0Var, float f11, float f12, i0 i0Var, String str, p1.o oVar, int i5, int i11) {
        if ((i11 & 8) != 0) {
            str = "FloatAnimation";
        }
        Float fValueOf = Float.valueOf(f11);
        Float fValueOf2 = Float.valueOf(f12);
        FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
        return b(n0Var, fValueOf, fValueOf2, f.f18784i, i0Var, str, oVar, (i5 & 1022) | SQLiteDatabase.OPEN_NOMUTEX | ((i5 << 3) & 458752), 0);
    }

    public static final j0 b(n0 n0Var, Number number, Number number2, i2 i2Var, i0 i0Var, String str, p1.o oVar, int i5, int i11) {
        n0 n0Var2;
        Number number3;
        p1.t tVar = (p1.t) oVar;
        Object objP = tVar.P();
        p1.g1 g1Var = p1.n.f81514a;
        if (objP == g1Var) {
            n0Var2 = n0Var;
            j0 j0Var = new j0(n0Var2, number, number2, i2Var, i0Var);
            number3 = number2;
            tVar.m0(j0Var);
            objP = j0Var;
        } else {
            n0Var2 = n0Var;
            number3 = number2;
        }
        j0 j0Var2 = (j0) objP;
        boolean z11 = true;
        boolean z12 = ((((i5 & 112) ^ 48) > 32 && tVar.h(number)) || (i5 & 48) == 32) | ((((i5 & 896) ^ 384) > 256 && tVar.h(number3)) || (i5 & 384) == 256);
        if ((((57344 & i5) ^ 24576) <= 16384 || !tVar.h(i0Var)) && (i5 & 24576) != 16384) {
            z11 = false;
        }
        boolean z13 = z12 | z11;
        Object objP2 = tVar.P();
        if (z13 || objP2 == g1Var) {
            b10.u uVar = new b10.u(number, j0Var2, number3, i0Var, 2);
            tVar.m0(uVar);
            objP2 = uVar;
        }
        p1.o0.h((Function0) objP2, tVar);
        boolean zH = tVar.h(n0Var2);
        Object objP3 = tVar.P();
        if (zH || objP3 == g1Var) {
            objP3 = new b00.p0(4, n0Var2, j0Var2);
            tVar.m0(objP3);
        }
        p1.o0.b(j0Var2, (Function1) objP3, tVar);
        return j0Var2;
    }

    public static final n0 c(String str, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        Object objP = tVar.P();
        if (objP == p1.n.f81514a) {
            objP = new n0();
            tVar.m0(objP);
        }
        n0 n0Var = (n0) objP;
        n0Var.a(tVar, 0);
        return n0Var;
    }
}
