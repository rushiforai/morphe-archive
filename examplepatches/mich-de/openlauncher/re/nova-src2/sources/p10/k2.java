package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public m.w f81809t;

    /* renamed from: u, reason: collision with root package name */
    public long f81810u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f81811v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m.w f81812w;

    /* renamed from: x, reason: collision with root package name */
    public int f81813x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k2(m.w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81812w = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81811v = obj;
        this.f81813x |= Integer.MIN_VALUE;
        return this.f81812w.w(this);
    }
}
