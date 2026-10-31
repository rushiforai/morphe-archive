package gx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f58011t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f58012u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f58013v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ d f58014w;

    /* renamed from: x, reason: collision with root package name */
    public int f58015x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58014w = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58013v = obj;
        this.f58015x |= Integer.MIN_VALUE;
        return this.f58014w.a(this);
    }
}
