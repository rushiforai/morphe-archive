package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class z implements m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94088a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f94089b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f94090c;

    /* JADX WARN: Multi-variable type inference failed */
    public z(Function2 function2, m mVar) {
        this.f94090c = (SuspendLambda) function2;
        this.f94089b = mVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v11, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function3] */
    /* JADX WARN: Type inference failed for: r2v14, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r2v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        y yVar;
        Throwable th2;
        x70.v vVar;
        z zVar;
        n nVar2;
        m mVar;
        b0 b0Var;
        z zVar2;
        switch (this.f94088a) {
            case 0:
                if (continuation instanceof y) {
                    yVar = (y) continuation;
                    int i5 = yVar.f94076u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        yVar.f94076u = i5 - Integer.MIN_VALUE;
                    } else {
                        yVar = new y(this, continuation);
                    }
                }
                Object obj = yVar.f94075t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = yVar.f94076u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    x70.v vVar2 = new x70.v(nVar, yVar.getContext());
                    try {
                        ?? r22 = this.f94090c;
                        yVar.f94078w = this;
                        yVar.f94079x = nVar;
                        yVar.f94080y = vVar2;
                        yVar.f94076u = 1;
                        if (r22.invoke(vVar2, yVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        zVar = this;
                        nVar2 = nVar;
                        vVar = vVar2;
                        vVar.releaseIntercepted();
                        mVar = zVar.f94089b;
                        yVar.f94078w = null;
                        yVar.f94079x = null;
                        yVar.f94080y = null;
                        yVar.f94076u = 2;
                        if (mVar.collect(nVar2, yVar) == coroutineSingletons) {
                        }
                    } catch (Throwable th3) {
                        th2 = th3;
                        vVar = vVar2;
                        vVar.releaseIntercepted();
                        throw th2;
                    }
                } else if (i11 == 1) {
                    vVar = yVar.f94080y;
                    nVar2 = yVar.f94079x;
                    zVar = yVar.f94078w;
                    try {
                        ResultKt.b(obj);
                        vVar.releaseIntercepted();
                        mVar = zVar.f94089b;
                        yVar.f94078w = null;
                        yVar.f94079x = null;
                        yVar.f94080y = null;
                        yVar.f94076u = 2;
                        if (mVar.collect(nVar2, yVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } catch (Throwable th4) {
                        th2 = th4;
                        vVar.releaseIntercepted();
                        throw th2;
                    }
                } else {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                if (continuation instanceof b0) {
                    b0Var = (b0) continuation;
                    int i12 = b0Var.f93855u;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        b0Var.f93855u = i12 - Integer.MIN_VALUE;
                    } else {
                        b0Var = new b0(this, continuation);
                    }
                }
                Object objG = b0Var.f93854t;
                Object obj2 = CoroutineSingletons.f71806a;
                int i13 = b0Var.f93855u;
                if (i13 == 0) {
                    ResultKt.b(objG);
                    b0Var.f93857w = this;
                    b0Var.f93858x = nVar;
                    b0Var.f93855u = 1;
                    objG = u1.g(b0Var, this.f94089b, nVar);
                    if (objG == obj2) {
                        return obj2;
                    }
                    zVar2 = this;
                } else {
                    if (i13 != 1) {
                        if (i13 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(objG);
                        return Unit.f71706a;
                    }
                    nVar = b0Var.f93858x;
                    zVar2 = b0Var.f93857w;
                    ResultKt.b(objG);
                }
                Throwable th5 = (Throwable) objG;
                if (th5 != null) {
                    ?? r23 = zVar2.f94090c;
                    b0Var.f93857w = null;
                    b0Var.f93858x = null;
                    b0Var.f93855u = 2;
                    if (r23.invoke(nVar, th5, b0Var) == obj2) {
                        return obj2;
                    }
                }
                return Unit.f71706a;
            default:
                Object objCollect = this.f94089b.collect(new j0(new Ref.BooleanRef(), nVar, this.f94090c), continuation);
                return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public z(m mVar, Function2 function2) {
        this.f94089b = mVar;
        this.f94090c = (SuspendLambda) function2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public z(m mVar, Function3 function3) {
        this.f94089b = mVar;
        this.f94090c = (SuspendLambda) function3;
    }
}
