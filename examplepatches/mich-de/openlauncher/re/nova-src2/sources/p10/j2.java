package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81799t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m.w f81800u;

    /* renamed from: v, reason: collision with root package name */
    public int f81801v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j2(m.w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81800u = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81799t = obj;
        this.f81801v |= Integer.MIN_VALUE;
        return this.f81800u.m(this);
    }
}
