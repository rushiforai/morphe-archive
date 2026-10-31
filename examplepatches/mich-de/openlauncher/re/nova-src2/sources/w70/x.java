package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class x implements m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f94065a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f94066b;

    /* JADX WARN: Multi-variable type inference failed */
    public x(m mVar, Function3 function3) {
        this.f94065a = mVar;
        this.f94066b = (SuspendLambda) function3;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x009f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:56:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v4, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function3] */
    /* JADX WARN: Type inference failed for: r9v6, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function3] */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        w wVar;
        x xVar;
        k2 k2Var;
        ?? r22;
        x70.v vVar;
        Throwable th2;
        x70.v vVar2;
        ?? r92;
        if (continuation instanceof w) {
            wVar = (w) continuation;
            int i5 = wVar.f94053u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f94053u = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(this, continuation);
            }
        }
        Object obj = wVar.f94052t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f94053u;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                m mVar = this.f94065a;
                wVar.f94055w = this;
                wVar.f94056x = nVar;
                wVar.f94053u = 1;
                if (mVar.collect(nVar, wVar) != coroutineSingletons) {
                    xVar = this;
                    vVar = new x70.v(nVar, wVar.getContext());
                    r92 = xVar.f94066b;
                    wVar.f94055w = vVar;
                    wVar.f94056x = null;
                    wVar.f94053u = 3;
                    if (r92.invoke(vVar, null, wVar) != coroutineSingletons) {
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                xVar = this;
                k2Var = new k2(th);
                r22 = xVar.f94066b;
                wVar.f94055w = th;
                wVar.f94056x = null;
                wVar.f94053u = 2;
                if (a0.a(k2Var, r22, th, wVar) != coroutineSingletons) {
                    return coroutineSingletons;
                }
                throw th;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                Throwable th4 = (Throwable) wVar.f94055w;
                ResultKt.b(obj);
                throw th4;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            vVar2 = (x70.v) wVar.f94055w;
            try {
                ResultKt.b(obj);
                vVar2.releaseIntercepted();
                return Unit.f71706a;
            } catch (Throwable th5) {
                th2 = th5;
                vVar2.releaseIntercepted();
                throw th2;
            }
        }
        nVar = wVar.f94056x;
        xVar = (x) wVar.f94055w;
        try {
            ResultKt.b(obj);
            vVar = new x70.v(nVar, wVar.getContext());
            try {
                r92 = xVar.f94066b;
                wVar.f94055w = vVar;
                wVar.f94056x = null;
                wVar.f94053u = 3;
                if (r92.invoke(vVar, null, wVar) != coroutineSingletons) {
                    vVar2 = vVar;
                    vVar2.releaseIntercepted();
                    return Unit.f71706a;
                }
            } catch (Throwable th6) {
                th2 = th6;
                vVar2 = vVar;
                vVar2.releaseIntercepted();
                throw th2;
            }
        } catch (Throwable th7) {
            th = th7;
            k2Var = new k2(th);
            r22 = xVar.f94066b;
            wVar.f94055w = th;
            wVar.f94056x = null;
            wVar.f94053u = 2;
            if (a0.a(k2Var, r22, th, wVar) != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
