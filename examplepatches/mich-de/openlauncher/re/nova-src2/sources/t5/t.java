package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c0 f88692t;

    /* renamed from: u, reason: collision with root package name */
    public int f88693u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88694v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c0 f88695w;

    /* renamed from: x, reason: collision with root package name */
    public int f88696x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88695w = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88694v = obj;
        this.f88696x |= Integer.MIN_VALUE;
        return this.f88695w.h(this);
    }
}
