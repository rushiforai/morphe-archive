package e1;

import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v2.b f51402t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f51403u;

    /* renamed from: v, reason: collision with root package name */
    public int f51404v;

    public w(BaseContinuationImpl baseContinuationImpl) {
        super(baseContinuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51403u = obj;
        this.f51404v |= Integer.MIN_VALUE;
        return b0.a(null, this);
    }
}
