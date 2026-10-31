package l1;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g7 {

    /* renamed from: a, reason: collision with root package name */
    public final c80.d f73352a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f73353b = androidx.compose.runtime.d.k(null);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r8v0, types: [l1.e7] */
    /* JADX WARN: Type inference failed for: r8v11, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(e7 e7Var, ContinuationImpl continuationImpl) {
        f7 f7Var;
        c80.d dVar;
        g7 g7Var;
        e7 e7Var2;
        Throwable th2;
        g7 g7Var2;
        c80.a aVar;
        if (continuationImpl instanceof f7) {
            f7Var = (f7) continuationImpl;
            int i5 = f7Var.f73307y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f7Var.f73307y = i5 - Integer.MIN_VALUE;
            } else {
                f7Var = new f7(this, continuationImpl);
            }
        }
        Object obj = f7Var.f73305w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f7Var.f73307y;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(obj);
                    f7Var.f73302t = this;
                    f7Var.f73303u = e7Var;
                    dVar = this.f73352a;
                    f7Var.f73304v = dVar;
                    f7Var.f73307y = 1;
                    if (dVar.e(f7Var) != coroutineSingletons) {
                        g7Var = this;
                        e7Var2 = e7Var;
                    }
                    return coroutineSingletons;
                }
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = f7Var.f73304v;
                    g7Var2 = f7Var.f73302t;
                    try {
                        ResultKt.b(obj);
                        ((p1.s2) g7Var2.f73353b).setValue(null);
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        ((p1.s2) g7Var2.f73353b).setValue(null);
                        throw th2;
                    }
                }
                ?? r82 = f7Var.f73304v;
                e7 e7Var3 = f7Var.f73303u;
                g7Var = f7Var.f73302t;
                ResultKt.b(obj);
                dVar = r82;
                e7Var2 = e7Var3;
                f7Var.f73302t = g7Var;
                f7Var.f73303u = e7Var2;
                f7Var.f73304v = dVar;
                f7Var.f73307y = 2;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(f7Var));
                mVar.t();
                ((p1.s2) g7Var.f73353b).setValue(new d7(e7Var2, mVar));
                Object objS = mVar.s();
                if (objS != coroutineSingletons) {
                    c80.d dVar2 = dVar;
                    obj = objS;
                    aVar = dVar2;
                    g7Var2 = g7Var;
                    ((p1.s2) g7Var2.f73353b).setValue(null);
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                th2 = th4;
                g7Var2 = g7Var;
                ((p1.s2) g7Var2.f73353b).setValue(null);
                throw th2;
            }
        } catch (Throwable th5) {
            ((c80.d) e7Var).g(null);
            throw th5;
        }
    }
}
