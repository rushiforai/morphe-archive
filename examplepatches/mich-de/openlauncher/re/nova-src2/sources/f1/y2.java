package f1;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class y2 implements u2.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y f54130a;

    public y2(y yVar) {
        g0.d1 d1Var = g0.d1.f56493a;
        this.f54130a = yVar;
    }

    public final long a(float f11) {
        g0.d1 d1Var = g0.d1.f56493a;
        g0.d1 d1Var2 = g0.d1.f56493a;
        return (Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(f11) & 4294967295L);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11, long j12, Continuation continuation) {
        w2 w2Var;
        if (continuation instanceof w2) {
            w2Var = (w2) continuation;
            int i5 = w2Var.f54070w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w2Var.f54070w = i5 - Integer.MIN_VALUE;
            } else {
                w2Var = new w2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = w2Var.f54068u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w2Var.f54070w;
        if (i11 == 0) {
            ResultKt.b(obj);
            g0.d1 d1Var = g0.d1.f56493a;
            float fE = y3.r.e(j12);
            w2Var.f54067t = j12;
            w2Var.f54070w = 1;
            if (this.f54130a.o(fE, w2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j12 = w2Var.f54067t;
            ResultKt.b(obj);
        }
        return new y3.r(j12);
    }

    @Override // u2.a
    public final long g(int i5, long j11) {
        g0.d1 d1Var = g0.d1.f56493a;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 & 4294967295L));
        if (fIntBitsToFloat >= 0.0f || i5 != 1) {
            return 0L;
        }
        return a(this.f54130a.f(fIntBitsToFloat));
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        if (i5 != 1) {
            return 0L;
        }
        g0.d1 d1Var = g0.d1.f56493a;
        return a(this.f54130a.f(Float.intBitsToFloat((int) (4294967295L & j12))));
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object t(long j11, Continuation continuation) {
        x2 x2Var;
        if (continuation instanceof x2) {
            x2Var = (x2) continuation;
            int i5 = x2Var.f54096w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x2Var.f54096w = i5 - Integer.MIN_VALUE;
            } else {
                x2Var = new x2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = x2Var.f54094u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x2Var.f54096w;
        if (i11 == 0) {
            ResultKt.b(obj);
            g0.d1 d1Var = g0.d1.f56493a;
            float fE = y3.r.e(j11);
            y yVar = this.f54130a;
            float fL = yVar.l();
            if (fE >= 0.0f) {
                j11 = 0;
            } else {
                Float fN1 = b70.g.n1(yVar.g().f53702a.values());
                if (fL > (fN1 != null ? fN1.floatValue() : Float.NaN)) {
                    x2Var.f54093t = j11;
                    x2Var.f54096w = 1;
                    if (yVar.o(fE, x2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = x2Var.f54093t;
            ResultKt.b(obj);
        }
        return new y3.r(j11);
    }
}
