package h6;

import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class s0 implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s f59433a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f59434b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f59435c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s f59436d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ t70.m f59437e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ c80.d f59438f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f59439g;

    /* JADX WARN: Multi-variable type inference failed */
    public s0(s sVar, Ref.ObjectRef objectRef, t70.j0 j0Var, s sVar2, t70.m mVar, c80.d dVar, Function2 function2) {
        this.f59433a = sVar;
        this.f59434b = objectRef;
        this.f59435c = j0Var;
        this.f59436d = sVar2;
        this.f59437e = mVar;
        this.f59438f = dVar;
        this.f59439g = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        s sVar2 = this.f59433a;
        Ref.ObjectRef objectRef = this.f59434b;
        if (sVar == sVar2) {
            objectRef.f71863a = t70.m0.t(this.f59435c, null, null, new androidx.room.p(this.f59438f, (Function2) this.f59439g, (Continuation) null), 3);
            return;
        }
        if (sVar == this.f59436d) {
            t70.r1 r1Var = (t70.r1) objectRef.f71863a;
            if (r1Var != null) {
                r1Var.c(null);
            }
            objectRef.f71863a = null;
        }
        if (sVar == s.ON_DESTROY) {
            int i5 = Result.f71687b;
            this.f59437e.resumeWith(Unit.f71706a);
        }
    }
}
