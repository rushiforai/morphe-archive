package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class e0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f93887a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f93888b;

    public e0(n nVar, Ref.ObjectRef objectRef) {
        this.f93887a = nVar;
        this.f93888b = objectRef;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        d0 d0Var;
        e0 e0Var;
        if (continuation instanceof d0) {
            d0Var = (d0) continuation;
            int i5 = d0Var.f93878w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d0Var.f93878w = i5 - Integer.MIN_VALUE;
            } else {
                d0Var = new d0(this, continuation);
            }
        }
        Object obj2 = d0Var.f93876u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d0Var.f93878w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            e0Var = d0Var.f93875t;
            try {
                ResultKt.b(obj2);
                return Unit.f71706a;
            } catch (Throwable th2) {
                th = th2;
                e0Var.f93888b.f71863a = th;
                throw th;
            }
        }
        ResultKt.b(obj2);
        try {
            n nVar = this.f93887a;
            d0Var.f93875t = this;
            d0Var.f93878w = 1;
            if (nVar.emit(obj, d0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } catch (Throwable th3) {
            th = th3;
            e0Var = this;
            e0Var.f93888b.f71863a = th;
            throw th;
        }
    }
}
