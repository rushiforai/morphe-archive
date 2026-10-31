package g0;

import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class q0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.x f56664t;

    /* renamed from: u, reason: collision with root package name */
    public Function2 f56665u;

    /* renamed from: v, reason: collision with root package name */
    public CoroutineContext f56666v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56667w;

    /* renamed from: x, reason: collision with root package name */
    public int f56668x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56667w = obj;
        this.f56668x |= Integer.MIN_VALUE;
        return u2.c(null, null, this);
    }
}
