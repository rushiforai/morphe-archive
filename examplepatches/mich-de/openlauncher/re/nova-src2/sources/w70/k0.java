package w70;

import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class k0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f93947t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93948u;

    /* renamed from: v, reason: collision with root package name */
    public int f93949v;

    public k0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93948u = obj;
        this.f93949v |= Integer.MIN_VALUE;
        q0.a(null, null, null, this);
        return CoroutineSingletons.f71806a;
    }
}
