package p10;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.math.MathKt;

/* loaded from: classes4.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final h2 f81968a;

    /* renamed from: b, reason: collision with root package name */
    public final m.w f81969b;

    /* renamed from: c, reason: collision with root package name */
    public final n00.d f81970c;

    /* renamed from: d, reason: collision with root package name */
    public final o00.d f81971d;

    /* renamed from: e, reason: collision with root package name */
    public final o00.d f81972e;

    /* renamed from: f, reason: collision with root package name */
    public final o00.d f81973f;

    public y(h2 h2Var, n00.d dVar) {
        m.w wVar = new m.w(6);
        o00.d dVar2 = new o00.d(13);
        o00.d dVar3 = new o00.d(14);
        o00.d dVar4 = new o00.d(15);
        this.f81968a = h2Var;
        this.f81969b = wVar;
        this.f81970c = dVar;
        this.f81971d = dVar2;
        this.f81972e = dVar3;
        this.f81973f = dVar4;
    }

    public final long a(int i5) {
        long jC = MathKt.c(((Number) this.f81971d.invoke()).doubleValue() * d(i5) * this.f81969b.G((String) this.f81970c.invoke()));
        if (jC < 1) {
            return 1L;
        }
        return jC;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(Continuation continuation) throws Throwable {
        u uVar;
        y yVar;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i5 = uVar.f81928w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f81928w = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(this, continuation);
            }
        }
        Object objY = uVar.f81926u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f81928w;
        if (i11 == 0) {
            ResultKt.b(objY);
            uVar.f81925t = this;
            uVar.f81928w = 1;
            h2 h2Var = this.f81968a;
            h2Var.getClass();
            a80.e eVar = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new g2(h2Var, null), uVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = uVar.f81925t;
            ResultKt.b(objY);
        }
        i2 i2Var = (i2) objY;
        return new t(yVar.a(i2Var.f81794a), i2Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) throws Throwable {
        v vVar;
        y yVar;
        if (continuation instanceof v) {
            vVar = (v) continuation;
            int i5 = vVar.f81939w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f81939w = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(this, continuation);
            }
        }
        Object objY = vVar.f81937u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vVar.f81939w;
        if (i11 == 0) {
            ResultKt.b(objY);
            vVar.f81936t = this;
            vVar.f81939w = 1;
            h2 h2Var = this.f81968a;
            h2Var.getClass();
            a80.e eVar = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new g2(h2Var, null), vVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = vVar.f81936t;
            ResultKt.b(objY);
        }
        i2 i2Var = (i2) objY;
        return new t(yVar.g(i2Var.f81794a), i2Var);
    }

    public final double d(int i5) {
        double dDoubleValue = ((Number) this.f81972e.invoke()).doubleValue();
        int iIntValue = ((Number) this.f81973f.invoke()).intValue();
        if (iIntValue > 1) {
            double dE0 = (((1.0d - dDoubleValue) / (iIntValue - 1)) * kotlin.ranges.a.e0(i5 - 1, 0, r2)) + dDoubleValue;
            if (dE0 <= 1.0d) {
                return dE0;
            }
        }
        return 1.0d;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) throws Throwable {
        w wVar;
        y yVar;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f81950w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f81950w = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuationImpl);
            }
        }
        Object objY = wVar.f81948u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f81950w;
        if (i11 == 0) {
            ResultKt.b(objY);
            wVar.f81947t = this;
            wVar.f81950w = 1;
            h2 h2Var = this.f81968a;
            h2Var.getClass();
            a80.e eVar = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new mx.e0(h2Var, (Continuation) null, 14), wVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = wVar.f81947t;
            ResultKt.b(objY);
        }
        return new Long(yVar.a(((Number) objY).intValue()));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(ContinuationImpl continuationImpl) throws Throwable {
        x xVar;
        y yVar;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f81957w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f81957w = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object objY = xVar.f81955u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f81957w;
        if (i11 == 0) {
            ResultKt.b(objY);
            xVar.f81954t = this;
            xVar.f81957w = 1;
            h2 h2Var = this.f81968a;
            h2Var.getClass();
            a80.e eVar = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new mx.e0(h2Var, (Continuation) null, 14), xVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
            yVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            yVar = xVar.f81954t;
            ResultKt.b(objY);
        }
        return new Long(yVar.g(((Number) objY).intValue()));
    }

    public final long g(int i5) {
        long jC = MathKt.c(d(i5) * this.f81969b.G((String) this.f81970c.invoke()));
        if (jC < 1) {
            return 1L;
        }
        return jC;
    }
}
