package v2;

import androidx.compose.ui.input.pointer.CancelTimeoutCancellationException;
import androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException;
import g0.j2;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import t70.g2;
import t70.m0;

/* loaded from: classes.dex */
public final class j0 implements b, y3.c, Continuation {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l0 f91947a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.m f91948b;

    /* renamed from: c, reason: collision with root package name */
    public t70.m f91949c;

    /* renamed from: d, reason: collision with root package name */
    public n f91950d = n.f91981b;

    /* renamed from: e, reason: collision with root package name */
    public final EmptyCoroutineContext f91951e = EmptyCoroutineContext.f71803a;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ l0 f91952f;

    public j0(l0 l0Var, t70.m mVar) {
        this.f91952f = l0Var;
        this.f91947a = l0Var;
        this.f91948b = mVar;
    }

    public final Object f(n nVar, BaseContinuationImpl baseContinuationImpl) {
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(baseContinuationImpl));
        mVar.t();
        this.f91950d = nVar;
        this.f91949c = mVar;
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return this.f91951e;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f91947a.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f91947a.getFontScale();
    }

    public final long j() {
        l0 l0Var = this.f91952f;
        long jMo103toSizeXkaWNTQ = l0Var.mo103toSizeXkaWNTQ(l0Var.E().d());
        long j11 = l0Var.f91974j;
        float fMax = Math.max(0.0f, Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ >> 32)) - ((int) (j11 >> 32))) / 2.0f;
        float fMax2 = Math.max(0.0f, Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ & 4294967295L)) - ((int) (j11 & 4294967295L))) / 2.0f;
        return (Float.floatToRawIntBits(fMax) << 32) | (Float.floatToRawIntBits(fMax2) & 4294967295L);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(long j11, Function2 function2, ContinuationImpl continuationImpl) throws Throwable {
        h0 h0Var;
        g2 g2VarT;
        Throwable th2;
        t70.m mVar;
        if (continuationImpl instanceof h0) {
            h0Var = (h0) continuationImpl;
            int i5 = h0Var.f91937w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h0Var.f91937w = i5 - Integer.MIN_VALUE;
            } else {
                h0Var = new h0(this, continuationImpl);
            }
        }
        Object objInvoke = h0Var.f91935u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = h0Var.f91937w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            g2VarT = h0Var.f91934t;
            try {
                ResultKt.b(objInvoke);
                g2VarT.c(CancelTimeoutCancellationException.f14150a);
                return objInvoke;
            } catch (Throwable th3) {
                th2 = th3;
                g2VarT.c(CancelTimeoutCancellationException.f14150a);
                throw th2;
            }
        }
        ResultKt.b(objInvoke);
        if (j11 <= 0 && (mVar = this.f91949c) != null) {
            int i12 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(new PointerEventTimeoutCancellationException(j11)));
        }
        g2VarT = m0.t(this.f91952f.getCoroutineScope(), null, null, new b4.j(j11, this, (Continuation) null, 7), 3);
        try {
            h0Var.f91934t = g2VarT;
            h0Var.f91937w = 1;
            objInvoke = function2.invoke(this, h0Var);
            if (objInvoke == obj) {
                return obj;
            }
            g2VarT.c(CancelTimeoutCancellationException.f14150a);
            return objInvoke;
        } catch (Throwable th4) {
            th2 = th4;
            g2VarT.c(CancelTimeoutCancellationException.f14150a);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m(long j11, j2 j2Var, BaseContinuationImpl baseContinuationImpl) throws Throwable {
        i0 i0Var;
        if (baseContinuationImpl instanceof i0) {
            i0Var = (i0) baseContinuationImpl;
            int i5 = i0Var.f91940v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i0Var.f91940v = i5 - Integer.MIN_VALUE;
            } else {
                i0Var = new i0(this, baseContinuationImpl);
            }
        }
        Object obj = i0Var.f91938t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = i0Var.f91940v;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            i0Var.f91940v = 1;
            Object objK = k(j11, j2Var, i0Var);
            return objK == obj2 ? obj2 : objK;
        } catch (PointerEventTimeoutCancellationException unused) {
            return null;
        }
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        l0 l0Var = this.f91952f;
        synchronized (l0Var.f91971g) {
            l0Var.f91970f.j(this);
            Unit unit = Unit.f71706a;
        }
        this.f91948b.resumeWith(obj);
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public final int mo95roundToPxR2X_6o(long j11) {
        return this.f91947a.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public final int mo96roundToPx0680j_4(float f11) {
        return this.f91947a.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public final float mo97toDpGaN1DYA(long j11) {
        return this.f91947a.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo99toDpu2uoSUM(int i5) {
        return this.f91947a.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public final long mo100toDpSizekrfVVM(long j11) {
        return this.f91947a.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public final float mo101toPxR2X_6o(long j11) {
        return this.f91947a.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public final float mo102toPx0680j_4(float f11) {
        return this.f91947a.getDensity() * f11;
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public final long mo103toSizeXkaWNTQ(long j11) {
        return this.f91947a.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public final long mo104toSp0xMU5do(float f11) {
        return this.f91947a.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo105toSpkPz2Gy4(float f11) {
        return this.f91947a.mo105toSpkPz2Gy4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo98toDpu2uoSUM(float f11) {
        return f11 / this.f91947a.getDensity();
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo106toSpkPz2Gy4(int i5) {
        return this.f91947a.mo106toSpkPz2Gy4(i5);
    }
}
