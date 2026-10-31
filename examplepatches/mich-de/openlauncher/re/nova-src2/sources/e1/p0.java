package e1;

import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import z2.r1;

/* loaded from: classes2.dex */
public final /* synthetic */ class p0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51363a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a1 f51364b;

    public /* synthetic */ p0(a1 a1Var, int i5) {
        this.f51363a = i5;
        this.f51364b = a1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x013d  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        h2.c cVar;
        char c11;
        long j11;
        float fIntBitsToFloat;
        z2.y yVarC;
        z2.y yVarC2;
        z2.y yVarC3;
        z2.y yVarC4;
        int i5 = this.f51363a;
        a1 a1Var = this.f51364b;
        switch (i5) {
            case 0:
                z2.y yVar = (z2.y) obj;
                t0.y0 y0Var = a1Var.f51232d;
                h2.c cVar2 = h2.c.f59017e;
                if (y0Var == null) {
                    cVar = cVar2;
                } else {
                    if (y0Var.f88292p) {
                        y0Var = null;
                    }
                    if (y0Var != null) {
                        r3.s sVar = a1Var.f51230b;
                        long j12 = a1Var.o().f85472b;
                        int i11 = m3.o0.f75945c;
                        int iO = sVar.o((int) (j12 >> 32));
                        int iO2 = a1Var.f51230b.o((int) (a1Var.o().f85472b & 4294967295L));
                        t0.y0 y0Var2 = a1Var.f51232d;
                        long jM = 0;
                        long jM2 = (y0Var2 == null || (yVarC4 = y0Var2.c()) == null) ? 0L : yVarC4.M(a1Var.m(true));
                        t0.y0 y0Var3 = a1Var.f51232d;
                        if (y0Var3 != null && (yVarC3 = y0Var3.c()) != null) {
                            jM = yVarC3.M(a1Var.m(false));
                        }
                        t0.y0 y0Var4 = a1Var.f51232d;
                        float fIntBitsToFloat2 = 0.0f;
                        if (y0Var4 == null || (yVarC2 = y0Var4.c()) == null) {
                            c11 = ' ';
                            j11 = jM;
                            fIntBitsToFloat = 0.0f;
                        } else {
                            c11 = ' ';
                            j11 = jM;
                            fIntBitsToFloat = Float.intBitsToFloat((int) (yVarC2.M((Float.floatToRawIntBits(y0Var.d() != null ? r5.f88262a.c(iO).f59019b : 0.0f) & 4294967295L) | (Float.floatToRawIntBits(0.0f) << 32)) & 4294967295L));
                        }
                        t0.y0 y0Var5 = a1Var.f51232d;
                        if (y0Var5 != null && (yVarC = y0Var5.c()) != null) {
                            fIntBitsToFloat2 = Float.intBitsToFloat((int) (yVarC.M((Float.floatToRawIntBits(0.0f) << c11) | (Float.floatToRawIntBits(y0Var.d() != null ? r8.f88262a.c(iO2).f59019b : 0.0f) & 4294967295L)) & 4294967295L));
                        }
                        int i12 = (int) (jM2 >> c11);
                        int i13 = (int) (j11 >> c11);
                        cVar = new h2.c(Math.min(Float.intBitsToFloat(i12), Float.intBitsToFloat(i13)), Math.min(fIntBitsToFloat, fIntBitsToFloat2), Math.max(Float.intBitsToFloat(i12), Float.intBitsToFloat(i13)), (y0Var.f88279a.f87988g.getDensity() * 25) + Math.max(Float.intBitsToFloat((int) (jM2 & 4294967295L)), Float.intBitsToFloat((int) (j11 & 4294967295L))));
                    }
                }
                t0.y0 y0Var6 = a1Var.f51232d;
                z2.y yVarC5 = y0Var6 != null ? y0Var6.c() : null;
                if (yVarC5 != null) {
                    return (yVarC5.isAttached() && yVar.isAttached()) ? bh.g.p(yVar.m(r1.f(yVarC5), cVar.d()), cVar.c()) : cVar2;
                }
                j0.b.d("Required value was null.");
                throw new KotlinNothingValueException();
            case 1:
                return new a1.j(a1Var, 15);
            default:
                a1Var.s();
                return Unit.f71706a;
        }
    }
}
