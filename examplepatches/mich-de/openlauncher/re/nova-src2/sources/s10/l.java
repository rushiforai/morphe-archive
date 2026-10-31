package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public m f86610t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86611u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m f86612v;

    /* renamed from: w, reason: collision with root package name */
    public int f86613w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86612v = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86611u = obj;
        this.f86613w |= Integer.MIN_VALUE;
        return this.f86612v.c(null, this);
    }
}
