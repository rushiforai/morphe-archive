package hu;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f60078t;

    /* renamed from: u, reason: collision with root package name */
    public Object f60079u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f60080v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m f60081w;

    /* renamed from: x, reason: collision with root package name */
    public int f60082x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f60081w = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f60080v = obj;
        this.f60082x |= Integer.MIN_VALUE;
        return m.e(this.f60081w, this);
    }
}
