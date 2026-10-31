package vt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f93017t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e f93018u;

    /* renamed from: v, reason: collision with root package name */
    public int f93019v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93018u = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93017t = obj;
        this.f93019v |= Integer.MIN_VALUE;
        return this.f93018u.c(null, this);
    }
}
