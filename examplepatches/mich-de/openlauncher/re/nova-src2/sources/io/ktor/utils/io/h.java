package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public int f66584t;

    /* renamed from: u, reason: collision with root package name */
    public m f66585u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f66586v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ m f66587w;

    /* renamed from: x, reason: collision with root package name */
    public int f66588x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66587w = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66586v = obj;
        this.f66588x |= Integer.MIN_VALUE;
        return this.f66587w.g(0, this);
    }
}
