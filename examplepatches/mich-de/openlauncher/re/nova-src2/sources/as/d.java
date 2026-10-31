package as;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f15582t;

    /* renamed from: u, reason: collision with root package name */
    public e f15583u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f15584v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ e f15585w;

    /* renamed from: x, reason: collision with root package name */
    public int f15586x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15585w = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15584v = obj;
        this.f15586x |= Integer.MIN_VALUE;
        return e.a(this.f15585w, this);
    }
}
