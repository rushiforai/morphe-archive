package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93879t;

    /* renamed from: u, reason: collision with root package name */
    public int f93880u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93879t = obj;
        this.f93880u |= Integer.MIN_VALUE;
        return u1.y(null, null, this);
    }
}
