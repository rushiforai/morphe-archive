package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h1 implements e1, y3.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y3.c f56553a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f56554b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f56555c;

    /* renamed from: d, reason: collision with root package name */
    public final c80.d f56556d = new c80.d();

    public h1(y3.c cVar) {
        this.f56553a = cVar;
    }

    public final void a() {
        this.f56555c = true;
        c80.d dVar = this.f56556d;
        if (dVar.d()) {
            dVar.g(null);
        }
    }

    public final void b() {
        this.f56554b = true;
        c80.d dVar = this.f56556d;
        if (dVar.d()) {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(ContinuationImpl continuationImpl) {
        f1 f1Var;
        if (continuationImpl instanceof f1) {
            f1Var = (f1) continuationImpl;
            int i5 = f1Var.f56521v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f1Var.f56521v = i5 - Integer.MIN_VALUE;
            } else {
                f1Var = new f1(this, continuationImpl);
            }
        }
        Object obj = f1Var.f56519t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f1Var.f56521v;
        if (i11 == 0) {
            ResultKt.b(obj);
            f1Var.f56521v = 1;
            if (this.f56556d.e(f1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f56554b = false;
        this.f56555c = false;
        return Unit.f71706a;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f56553a.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f56553a.getFontScale();
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public final int mo95roundToPxR2X_6o(long j11) {
        return this.f56553a.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public final int mo96roundToPx0680j_4(float f11) {
        return this.f56553a.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public final float mo97toDpGaN1DYA(long j11) {
        return this.f56553a.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo98toDpu2uoSUM(float f11) {
        return this.f56553a.mo98toDpu2uoSUM(f11);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public final long mo100toDpSizekrfVVM(long j11) {
        return this.f56553a.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public final float mo101toPxR2X_6o(long j11) {
        return this.f56553a.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public final float mo102toPx0680j_4(float f11) {
        return this.f56553a.mo102toPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public final long mo103toSizeXkaWNTQ(long j11) {
        return this.f56553a.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public final long mo104toSp0xMU5do(float f11) {
        return this.f56553a.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo105toSpkPz2Gy4(float f11) {
        return this.f56553a.mo105toSpkPz2Gy4(f11);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // g0.e1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object tryAwaitRelease(Continuation continuation) {
        g1 g1Var;
        if (continuation instanceof g1) {
            g1Var = (g1) continuation;
            int i5 = g1Var.f56544v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g1Var.f56544v = i5 - Integer.MIN_VALUE;
            } else {
                g1Var = new g1(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = g1Var.f56542t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g1Var.f56544v;
        c80.d dVar = this.f56556d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!this.f56554b && !this.f56555c) {
                g1Var.f56544v = 1;
                if (dVar.e(g1Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Boolean.valueOf(this.f56554b);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        dVar.g(null);
        return Boolean.valueOf(this.f56554b);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public final float mo99toDpu2uoSUM(int i5) {
        return this.f56553a.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public final long mo106toSpkPz2Gy4(int i5) {
        return this.f56553a.mo106toSpkPz2Gy4(i5);
    }
}
