package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class h0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f93912a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f93913b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ n f93914c;

    public h0(Ref.IntRef intRef, int i5, n nVar) {
        this.f93912a = intRef;
        this.f93913b = i5;
        this.f93914c = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        g0 g0Var;
        if (continuation instanceof g0) {
            g0Var = (g0) continuation;
            int i5 = g0Var.f93905v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.f93905v = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(this, continuation);
            }
        }
        Object obj2 = g0Var.f93903t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g0Var.f93905v;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Ref.IntRef intRef = this.f93912a;
            int i12 = intRef.f71861a;
            if (i12 < this.f93913b) {
                intRef.f71861a = i12 + 1;
                return Unit.f71706a;
            }
            g0Var.f93905v = 1;
            if (this.f93914c.emit(obj, g0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj2);
        }
        return Unit.f71706a;
    }
}
