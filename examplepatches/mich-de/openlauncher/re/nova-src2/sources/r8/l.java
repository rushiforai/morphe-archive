package r8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public m f85633t;

    /* renamed from: u, reason: collision with root package name */
    public p8.f f85634u;

    /* renamed from: v, reason: collision with root package name */
    public Object f85635v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f85636w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ m f85637x;

    /* renamed from: y, reason: collision with root package name */
    public int f85638y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85637x = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85636w = obj;
        this.f85638y |= Integer.MIN_VALUE;
        return this.f85637x.a(this);
    }
}
