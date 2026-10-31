package mq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f76608t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f76609u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e f76610v;

    /* renamed from: w, reason: collision with root package name */
    public int f76611w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76610v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76609u = obj;
        this.f76611w |= Integer.MIN_VALUE;
        return this.f76610v.e(null, this);
    }
}
