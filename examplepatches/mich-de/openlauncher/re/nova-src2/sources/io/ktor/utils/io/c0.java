package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public t f66561t;

    /* renamed from: u, reason: collision with root package name */
    public Appendable f66562u;

    /* renamed from: v, reason: collision with root package name */
    public AutoCloseable f66563v;

    /* renamed from: w, reason: collision with root package name */
    public e80.a f66564w;

    /* renamed from: x, reason: collision with root package name */
    public int f66565x;

    /* renamed from: y, reason: collision with root package name */
    public int f66566y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f66567z;

    public c0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66567z = obj;
        this.A |= Integer.MIN_VALUE;
        return f0.i(null, null, 0, 0, this);
    }
}
