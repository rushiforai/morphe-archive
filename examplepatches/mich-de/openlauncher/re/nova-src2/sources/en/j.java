package en;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52838t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ k f52839u;

    /* renamed from: v, reason: collision with root package name */
    public int f52840v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52839u = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52838t = obj;
        this.f52840v |= Integer.MIN_VALUE;
        return this.f52839u.b(this);
    }
}
