package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66548t;

    /* renamed from: u, reason: collision with root package name */
    public e80.a f66549u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f66550v;

    /* renamed from: w, reason: collision with root package name */
    public int f66551w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66550v = obj;
        this.f66551w |= Integer.MIN_VALUE;
        return f0.h(null, this);
    }
}
