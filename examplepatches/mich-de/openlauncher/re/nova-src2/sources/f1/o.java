package f1;

import androidx.compose.material.AnchoredDragFinishedSignal;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class o implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f53810a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f53811b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f53812c;

    public o(Ref.ObjectRef objectRef, t70.j0 j0Var, Function2 function2) {
        this.f53810a = objectRef;
        this.f53811b = j0Var;
        this.f53812c = function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        n nVar;
        if (continuation instanceof n) {
            nVar = (n) continuation;
            int i5 = nVar.f53787x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f53787x = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuation);
            }
        }
        Object obj2 = nVar.f53785v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f53787x;
        Ref.ObjectRef objectRef = this.f53810a;
        if (i11 == 0) {
            ResultKt.b(obj2);
            t70.r1 r1Var = (t70.r1) objectRef.f71863a;
            if (r1Var != null) {
                r1Var.c(new AnchoredDragFinishedSignal());
                nVar.f53783t = obj;
                nVar.f53784u = r1Var;
                nVar.f53787x = 1;
                if (r1Var.K(nVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            t70.r1 r1Var2 = nVar.f53784u;
            obj = nVar.f53783t;
            ResultKt.b(obj2);
        }
        Object obj3 = obj;
        t70.l0 l0Var = t70.l0.f88816d;
        t70.j0 j0Var = this.f53811b;
        objectRef.f71863a = t70.m0.t(j0Var, null, l0Var, new m(this.f53812c, obj3, j0Var, null, 0), 1);
        return Unit.f71706a;
    }
}
