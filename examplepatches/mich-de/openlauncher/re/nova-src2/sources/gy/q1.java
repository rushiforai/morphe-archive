package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;
import p1.y2;

/* loaded from: classes4.dex */
public final class q1 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f58507a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f58508b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f58509c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ g0.l0 f58510d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ y2 f58511e;

    public q1(Ref.LongRef longRef, boolean z11, float f11, g0.l0 l0Var, y2 y2Var) {
        this.f58507a = longRef;
        this.f58508b = z11;
        this.f58509c = f11;
        this.f58510d = l0Var;
        this.f58511e = y2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(i0.h hVar, Continuation continuation) {
        p1 p1Var;
        q1 q1Var;
        if (continuation instanceof p1) {
            p1Var = (p1) continuation;
            int i5 = p1Var.f58490w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p1Var.f58490w = i5 - Integer.MIN_VALUE;
            } else {
                p1Var = new p1(this, continuation);
            }
        }
        Object obj = p1Var.f58488u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p1Var.f58490w;
        if (i11 == 0) {
            ResultKt.b(obj);
            boolean z11 = hVar instanceof i0.b;
            g0.l0 l0Var = this.f58510d;
            Ref.LongRef longRef = this.f58507a;
            if (z11) {
                if (!h2.b.b(longRef.f71862a, 9205357640488583168L)) {
                    float fIntBitsToFloat = Float.intBitsToFloat((int) (longRef.f71862a >> 32));
                    if (this.f58508b) {
                        fIntBitsToFloat = this.f58509c - fIntBitsToFloat;
                    }
                    l0Var.a(fIntBitsToFloat - ((Number) this.f58511e.getValue()).floatValue());
                    longRef.f71862a = 9205357640488583168L;
                }
            } else if (hVar instanceof i0.k) {
                longRef.f71862a = ((i0.k) hVar).f61089a;
            } else if (hVar instanceof i0.l) {
                e0.f1 f1Var = e0.f1.f49977b;
                o1 o1Var = new o1(hVar, this.f58508b, this.f58509c, this.f58511e, null, 0);
                p1Var.f58487t = this;
                p1Var.f58490w = 1;
                if (l0Var.b(f1Var, o1Var, p1Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                q1Var = this;
            } else if (hVar instanceof i0.j) {
                longRef.f71862a = 9205357640488583168L;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        q1Var = p1Var.f58487t;
        ResultKt.b(obj);
        q1Var.f58507a.f71862a = 9205357640488583168L;
        return Unit.f71706a;
    }
}
