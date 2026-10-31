package j20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f68748t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f68749u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h f68750v;

    /* renamed from: w, reason: collision with root package name */
    public int f68751w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68750v = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68749u = obj;
        this.f68751w |= Integer.MIN_VALUE;
        return this.f68750v.f(0, null, this);
    }
}
