package g0;

import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class i extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.FloatRef f56570t;

    /* renamed from: u, reason: collision with root package name */
    public c0.n f56571u;

    /* renamed from: v, reason: collision with root package name */
    public int f56572v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f56573w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ j f56574x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ d2 f56575y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(float f11, j jVar, d2 d2Var, Continuation continuation) {
        super(2, continuation);
        this.f56573w = f11;
        this.f56574x = jVar;
        this.f56575y = d2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new i(this.f56573w, this.f56574x, this.f56575y, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        float f11;
        Ref.FloatRef floatRef;
        c0.n nVar;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f56572v;
        if (i5 == 0) {
            ResultKt.b(obj);
            f11 = this.f56573w;
            if (Math.abs(f11) > 1.0f) {
                floatRef = new Ref.FloatRef();
                floatRef.f71860a = f11;
                Ref.FloatRef floatRef2 = new Ref.FloatRef();
                c0.n nVarB = c0.f.b(28, 0.0f, f11);
                try {
                    j jVar = this.f56574x;
                    c0.y yVar = jVar.f56586a;
                    b10.q qVar = new b10.q(floatRef2, this.f56575y, floatRef, jVar);
                    this.f56570t = floatRef;
                    this.f56571u = nVarB;
                    this.f56572v = 1;
                    if (c0.s1.d(nVarB, yVar, false, qVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } catch (CancellationException unused) {
                    nVar = nVarB;
                    floatRef.f71860a = ((Number) nVar.a()).floatValue();
                    f11 = floatRef.f71860a;
                    return new Float(f11);
                }
                f11 = floatRef.f71860a;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            nVar = this.f56571u;
            floatRef = this.f56570t;
            try {
                ResultKt.b(obj);
            } catch (CancellationException unused2) {
                floatRef.f71860a = ((Number) nVar.a()).floatValue();
                f11 = floatRef.f71860a;
                return new Float(f11);
            }
            f11 = floatRef.f71860a;
        }
        return new Float(f11);
    }
}
