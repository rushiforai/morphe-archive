package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final class n0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f93960a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f93961b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f93962c;

    public n0(Ref.IntRef intRef, n nVar, Object obj) {
        this.f93960a = intRef;
        this.f93961b = nVar;
        this.f93962c = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        m0 m0Var;
        if (continuation instanceof m0) {
            m0Var = (m0) continuation;
            int i5 = m0Var.f93959v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m0Var.f93959v = i5 - Integer.MIN_VALUE;
            } else {
                m0Var = new m0(this, continuation);
            }
        }
        Object obj2 = m0Var.f93957t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m0Var.f93959v;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Ref.IntRef intRef = this.f93960a;
            int i12 = intRef.f71861a + 1;
            intRef.f71861a = i12;
            n nVar = this.f93961b;
            if (i12 >= 1) {
                m0Var.f93959v = 2;
                q0.a(nVar, obj, this.f93962c, m0Var);
                return coroutineSingletons;
            }
            m0Var.f93959v = 1;
            if (nVar.emit(obj, m0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj2);
                return Unit.f71706a;
            }
            ResultKt.b(obj2);
        }
        return Unit.f71706a;
    }
}
