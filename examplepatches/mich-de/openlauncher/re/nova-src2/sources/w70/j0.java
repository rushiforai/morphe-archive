package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class j0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f93939a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f93940b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f93941c;

    /* JADX WARN: Multi-variable type inference failed */
    public j0(Ref.BooleanRef booleanRef, n nVar, Function2 function2) {
        this.f93939a = booleanRef;
        this.f93940b = nVar;
        this.f93941c = (SuspendLambda) function2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0052, code lost:
    
        if (r6.f93940b.emit(r7, r0) == r1) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0081, code lost:
    
        if (r8.emit(r7, r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r8v4, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        i0 i0Var;
        j0 j0Var;
        if (continuation instanceof i0) {
            i0Var = (i0) continuation;
            int i5 = i0Var.f93929x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i0Var.f93929x = i5 - Integer.MIN_VALUE;
            } else {
                i0Var = new i0(this, continuation);
            }
        }
        Object objInvoke = i0Var.f93927v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = i0Var.f93929x;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            if (this.f93939a.f71859a) {
                i0Var.f93929x = 1;
            } else {
                i0Var.f93925t = this;
                i0Var.f93926u = obj;
                i0Var.f93929x = 2;
                objInvoke = this.f93941c.invoke(obj, i0Var);
                if (objInvoke != coroutineSingletons) {
                    j0Var = this;
                    if (!((Boolean) objInvoke).booleanValue()) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objInvoke);
            return Unit.f71706a;
        }
        if (i11 != 2) {
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objInvoke);
            return Unit.f71706a;
        }
        obj = i0Var.f93926u;
        j0Var = i0Var.f93925t;
        ResultKt.b(objInvoke);
        if (!((Boolean) objInvoke).booleanValue()) {
            return Unit.f71706a;
        }
        j0Var.f93939a.f71859a = true;
        n nVar = j0Var.f93940b;
        i0Var.f93925t = null;
        i0Var.f93926u = null;
        i0Var.f93929x = 3;
    }
}
