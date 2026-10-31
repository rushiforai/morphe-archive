package us;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f91524t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f91525u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e f91526v;

    /* renamed from: w, reason: collision with root package name */
    public int f91527w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f91526v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91525u = obj;
        this.f91527w |= Integer.MIN_VALUE;
        return e.e(this.f91526v, null, null, null, this);
    }
}
