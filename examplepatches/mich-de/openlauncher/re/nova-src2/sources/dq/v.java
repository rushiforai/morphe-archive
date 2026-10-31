package dq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49372t;

    /* renamed from: u, reason: collision with root package name */
    public int f49373u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49372t = obj;
        this.f49373u |= Integer.MIN_VALUE;
        return x.a(null, null, null, null, this);
    }
}
