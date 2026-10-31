package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public m f66596t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f66597u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m f66598v;

    /* renamed from: w, reason: collision with root package name */
    public int f66599w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66598v = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66597u = obj;
        this.f66599w |= Integer.MIN_VALUE;
        return this.f66598v.c(this);
    }
}
