package d50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public x50.a f48973t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48974u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b f48975v;

    /* renamed from: w, reason: collision with root package name */
    public int f48976w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48975v = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48974u = obj;
        this.f48976w |= Integer.MIN_VALUE;
        return this.f48975v.a(null, this);
    }
}
