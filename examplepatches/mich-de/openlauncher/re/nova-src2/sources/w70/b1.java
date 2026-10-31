package w70;

import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class b1 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f93859a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f93860b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t70.s f93861c;

    public b1(Ref.ObjectRef objectRef, t70.j0 j0Var, t70.s sVar) {
        this.f93859a = objectRef;
        this.f93860b = j0Var;
        this.f93861c = sVar;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        Ref.ObjectRef objectRef = this.f93859a;
        m1 m1Var = (m1) objectRef.f71863a;
        if (m1Var != null) {
            ((i2) m1Var).j(obj);
        } else {
            i2 i2VarC = u1.c(obj);
            int i5 = Result.f71687b;
            t70.m0.n(this.f93860b.getCoroutineContext());
            this.f93861c.X(new Result(new o1(i2VarC)));
            objectRef.f71863a = i2VarC;
        }
        return Unit.f71706a;
    }
}
