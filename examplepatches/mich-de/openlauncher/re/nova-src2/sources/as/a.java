package as;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f15569t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ b f15570u;

    /* renamed from: v, reason: collision with root package name */
    public int f15571v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15570u = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15569t = obj;
        this.f15571v |= Integer.MIN_VALUE;
        return this.f15570u.a(null, this);
    }
}
