package c50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f19679t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e f19680u;

    /* renamed from: v, reason: collision with root package name */
    public int f19681v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f19680u = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f19679t = obj;
        this.f19681v |= Integer.MIN_VALUE;
        return this.f19680u.a(null, this);
    }
}
