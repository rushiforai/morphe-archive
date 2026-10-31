package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t f66571t;

    /* renamed from: u, reason: collision with root package name */
    public f80.a f66572u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f66573v;

    /* renamed from: w, reason: collision with root package name */
    public int f66574w;

    public d0(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66573v = obj;
        this.f66574w |= Integer.MIN_VALUE;
        return f0.k(null, null, this);
    }
}
