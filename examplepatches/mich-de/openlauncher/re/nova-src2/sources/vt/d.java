package vt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f93027t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f93028u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e f93029v;

    /* renamed from: w, reason: collision with root package name */
    public int f93030w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93029v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93028u = obj;
        this.f93030w |= Integer.MIN_VALUE;
        return this.f93029v.a(null, null, null, this);
    }
}
