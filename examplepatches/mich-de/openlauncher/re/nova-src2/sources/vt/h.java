package vt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93050t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ k f93051u;

    /* renamed from: v, reason: collision with root package name */
    public int f93052v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93051u = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93050t = obj;
        this.f93052v |= Integer.MIN_VALUE;
        return this.f93051u.c(null, null, null, null, this);
    }
}
