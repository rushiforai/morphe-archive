package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public m f86617t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86618u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m f86619v;

    /* renamed from: w, reason: collision with root package name */
    public int f86620w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86619v = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86618u = obj;
        this.f86620w |= Integer.MIN_VALUE;
        return this.f86619v.c(null, this);
    }
}
