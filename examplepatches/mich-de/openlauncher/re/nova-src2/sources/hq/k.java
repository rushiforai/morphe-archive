package hq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f59974t;

    /* renamed from: u, reason: collision with root package name */
    public f f59975u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f59976v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ l f59977w;

    /* renamed from: x, reason: collision with root package name */
    public int f59978x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f59977w = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59976v = obj;
        this.f59978x |= Integer.MIN_VALUE;
        return this.f59977w.a(null, this);
    }
}
