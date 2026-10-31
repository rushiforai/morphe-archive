package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f56581t;

    /* renamed from: u, reason: collision with root package name */
    public v2.n f56582u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f56583v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56584w;

    /* renamed from: x, reason: collision with root package name */
    public int f56585x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56584w = obj;
        this.f56585x |= Integer.MIN_VALUE;
        return t2.b(null, false, null, this);
    }
}
