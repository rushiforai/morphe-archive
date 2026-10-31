package e0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f50001t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f50002u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ k f50003v;

    /* renamed from: w, reason: collision with root package name */
    public int f50004w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f50003v = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f50002u = obj;
        this.f50004w |= Integer.MIN_VALUE;
        return this.f50003v.b(0L, null, this);
    }
}
