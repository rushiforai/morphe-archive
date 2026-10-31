package dq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f49374t;

    /* renamed from: u, reason: collision with root package name */
    public int f49375u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49374t = obj;
        this.f49375u |= Integer.MIN_VALUE;
        return x.b(null, null, null, null, this);
    }
}
