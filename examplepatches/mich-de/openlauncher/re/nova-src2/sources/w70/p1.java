package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class p1 implements m, d {

    /* renamed from: a, reason: collision with root package name */
    public final SuspendLambda f93986a;

    /* JADX WARN: Multi-variable type inference failed */
    public p1(Function2 function2) {
        this.f93986a = (SuspendLambda) function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r6v3, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        a aVar;
        Throwable th2;
        x70.v vVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f93844w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f93844w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuation);
            }
        }
        Object obj = aVar.f93842u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = aVar.f93844w;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            vVar = aVar.f93841t;
            try {
                ResultKt.b(obj);
                vVar.releaseIntercepted();
                return Unit.f71706a;
            } catch (Throwable th3) {
                th2 = th3;
                vVar.releaseIntercepted();
                throw th2;
            }
        }
        ResultKt.b(obj);
        x70.v vVar2 = new x70.v(nVar, aVar.getContext());
        try {
            aVar.f93841t = vVar2;
            aVar.f93844w = 1;
            Object objInvoke = this.f93986a.invoke(vVar2, aVar);
            if (objInvoke != obj2) {
                objInvoke = Unit.f71706a;
            }
            if (objInvoke == obj2) {
                return obj2;
            }
            vVar = vVar2;
            vVar.releaseIntercepted();
            return Unit.f71706a;
        } catch (Throwable th4) {
            th2 = th4;
            vVar = vVar2;
            vVar.releaseIntercepted();
            throw th2;
        }
    }
}
