package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import p1.y2;

/* loaded from: classes4.dex */
public final class o1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f58469t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58470u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i0.h f58471v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f58472w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ float f58473x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ y2 f58474y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o1(i0.h hVar, boolean z11, float f11, y2 y2Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f58469t = i5;
        this.f58471v = hVar;
        this.f58472w = z11;
        this.f58473x = f11;
        this.f58474y = y2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f58469t) {
            case 0:
                o1 o1Var = new o1(this.f58471v, this.f58472w, this.f58473x, this.f58474y, continuation, 0);
                o1Var.f58470u = obj;
                return o1Var;
            default:
                o1 o1Var2 = new o1(this.f58471v, this.f58472w, this.f58473x, this.f58474y, continuation, 1);
                o1Var2.f58470u = obj;
                return o1Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        f1.w wVar = (f1.w) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f58469t) {
        }
        return ((o1) create(wVar, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f58469t;
        y2 y2Var = this.f58474y;
        float f11 = this.f58473x;
        boolean z11 = this.f58472w;
        i0.h hVar = this.f58471v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                f1.w wVar = (f1.w) this.f58470u;
                float fIntBitsToFloat = Float.intBitsToFloat((int) (((i0.l) hVar).f61090a.f61089a >> 32));
                if (z11) {
                    fIntBitsToFloat = f11 - fIntBitsToFloat;
                }
                wVar.a(fIntBitsToFloat - ((Number) y2Var.getValue()).floatValue());
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                f1.w wVar2 = (f1.w) this.f58470u;
                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (((i0.l) hVar).f61090a.f61089a >> 32));
                if (z11) {
                    fIntBitsToFloat2 = f11 - fIntBitsToFloat2;
                }
                wVar2.a(fIntBitsToFloat2 - ((Number) y2Var.getValue()).floatValue());
                break;
        }
        return Unit.f71706a;
    }
}
