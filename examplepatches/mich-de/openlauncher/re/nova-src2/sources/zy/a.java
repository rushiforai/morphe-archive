package zy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f98815t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c f98816u;

    /* renamed from: v, reason: collision with root package name */
    public int f98817v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f98816u = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f98815t = obj;
        this.f98817v |= Integer.MIN_VALUE;
        return this.f98816u.a(this);
    }
}
