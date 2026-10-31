package e10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p2 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51738a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.n f51739b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s2 f51740c;

    public /* synthetic */ p2(w70.n nVar, s2 s2Var, int i5) {
        this.f51738a = i5;
        this.f51739b = nVar;
        this.f51740c = s2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        o2 o2Var;
        r2 r2Var;
        switch (this.f51738a) {
            case 0:
                if (continuation instanceof o2) {
                    o2Var = (o2) continuation;
                    int i5 = o2Var.f51718u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        o2Var.f51718u = i5 - Integer.MIN_VALUE;
                    } else {
                        o2Var = new o2(this, continuation);
                    }
                }
                Object obj2 = o2Var.f51717t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = o2Var.f51718u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    if (Intrinsics.b((String) obj, this.f51740c.d())) {
                        o2Var.f51718u = 1;
                        if (this.f51739b.emit(obj, o2Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            default:
                if (continuation instanceof r2) {
                    r2Var = (r2) continuation;
                    int i12 = r2Var.f51786u;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        r2Var.f51786u = i12 - Integer.MIN_VALUE;
                    } else {
                        r2Var = new r2(this, continuation);
                    }
                }
                Object obj3 = r2Var.f51785t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = r2Var.f51786u;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    s2 s2Var = this.f51740c;
                    Object objE = s2Var.e(s2Var.f51806a, (String) obj);
                    r2Var.f51786u = 1;
                    if (this.f51739b.emit(objE, r2Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
        }
    }
}
