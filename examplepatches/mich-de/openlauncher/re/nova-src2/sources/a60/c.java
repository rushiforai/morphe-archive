package a60;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public int f415t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f416u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e f417v;

    /* renamed from: w, reason: collision with root package name */
    public int f418w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f417v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f416u = obj;
        this.f418w |= Integer.MIN_VALUE;
        return this.f417v.g(0, this);
    }
}
