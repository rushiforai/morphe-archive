package vx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f93341t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f93342u;

    /* renamed from: v, reason: collision with root package name */
    public long f93343v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93344w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ p f93345x;

    /* renamed from: y, reason: collision with root package name */
    public int f93346y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93345x = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93344w = obj;
        this.f93346y |= Integer.MIN_VALUE;
        return this.f93345x.d(null, this);
    }
}
