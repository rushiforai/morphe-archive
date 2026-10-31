package m10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75796t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b f75797u;

    /* renamed from: v, reason: collision with root package name */
    public int f75798v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75797u = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75796t = obj;
        this.f75798v |= Integer.MIN_VALUE;
        return this.f75797u.a(0L, 0L, null, this);
    }
}
