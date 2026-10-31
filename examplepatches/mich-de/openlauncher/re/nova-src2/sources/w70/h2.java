package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class h2 extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public i2 f93915t;

    /* renamed from: u, reason: collision with root package name */
    public n f93916u;

    /* renamed from: v, reason: collision with root package name */
    public j2 f93917v;

    /* renamed from: w, reason: collision with root package name */
    public t70.r1 f93918w;

    /* renamed from: x, reason: collision with root package name */
    public Object f93919x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f93920y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ i2 f93921z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h2(i2 i2Var, Continuation continuation) {
        super(continuation);
        this.f93921z = i2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93920y = obj;
        this.A |= Integer.MIN_VALUE;
        this.f93921z.collect(null, this);
        return CoroutineSingletons.f71806a;
    }
}
