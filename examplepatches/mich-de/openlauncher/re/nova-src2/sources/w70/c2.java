package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final class c2 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f93873a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f93874b;

    public c2(Ref.BooleanRef booleanRef, n nVar) {
        this.f93873a = booleanRef;
        this.f93874b = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(int i5, Continuation continuation) {
        b2 b2Var;
        if (continuation instanceof b2) {
            b2Var = (b2) continuation;
            int i11 = b2Var.f93864v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                b2Var.f93864v = i11 - Integer.MIN_VALUE;
            } else {
                b2Var = new b2(this, continuation);
            }
        }
        Object obj = b2Var.f93862t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = b2Var.f93864v;
        if (i12 == 0) {
            ResultKt.b(obj);
            if (i5 > 0) {
                Ref.BooleanRef booleanRef = this.f93873a;
                if (!booleanRef.f71859a) {
                    booleanRef.f71859a = true;
                    w1 w1Var = w1.f94061a;
                    b2Var.f93864v = 1;
                    if (this.f93874b.emit(w1Var, b2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
            return Unit.f71706a;
        }
        if (i12 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        return Unit.f71706a;
    }

    @Override // w70.n
    public final /* bridge */ /* synthetic */ Object emit(Object obj, Continuation continuation) {
        return a(((Number) obj).intValue(), continuation);
    }
}
