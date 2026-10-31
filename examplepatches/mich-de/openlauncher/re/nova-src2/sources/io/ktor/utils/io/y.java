package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66680t;

    /* renamed from: u, reason: collision with root package name */
    public e80.a f66681u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f66682v;

    /* renamed from: w, reason: collision with root package name */
    public int f66683w;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66682v = obj;
        this.f66683w |= Integer.MIN_VALUE;
        return f0.e(null, this);
    }
}
