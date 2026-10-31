package t70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final class o2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f88847t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88848u;

    /* renamed from: v, reason: collision with root package name */
    public int f88849v;

    public o2(Continuation continuation) {
        super(continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88848u = obj;
        this.f88849v |= Integer.MIN_VALUE;
        return p2.d(0L, null, this);
    }
}
