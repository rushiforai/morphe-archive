package m1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import t70.r1;

/* loaded from: classes2.dex */
public final class k implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f75707a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f75708b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f75709c;

    public k(Ref.ObjectRef objectRef, t70.j0 j0Var, Function2 function2) {
        this.f75707a = objectRef;
        this.f75708b = j0Var;
        this.f75709c = function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        j jVar;
        k kVar;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i5 = jVar.f75704y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f75704y = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuation);
            }
        }
        Object obj2 = jVar.f75702w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f75704y;
        if (i11 == 0) {
            ResultKt.b(obj2);
            r1 r1Var = (r1) this.f75707a.f71863a;
            if (r1Var != null) {
                r1Var.c(new f());
                jVar.f75699t = this;
                jVar.f75700u = obj;
                jVar.f75701v = r1Var;
                jVar.f75704y = 1;
                if (r1Var.K(jVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            kVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r1 r1Var2 = jVar.f75701v;
            obj = jVar.f75700u;
            kVar = jVar.f75699t;
            ResultKt.b(obj2);
        }
        Object obj3 = obj;
        Ref.ObjectRef objectRef = kVar.f75707a;
        t70.j0 j0Var = kVar.f75708b;
        objectRef.f71863a = t70.m0.t(j0Var, null, t70.l0.f88816d, new f1.m(kVar.f75709c, obj3, j0Var, null, 1), 1);
        return Unit.f71706a;
    }
}
