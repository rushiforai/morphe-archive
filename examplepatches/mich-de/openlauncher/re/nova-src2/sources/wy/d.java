package wy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x80.e0;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94892t;

    /* renamed from: u, reason: collision with root package name */
    public int f94893u;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94892t = obj;
        this.f94893u |= Integer.MIN_VALUE;
        e0 e0Var = e.f94894a;
        return e.a(null, this);
    }
}
