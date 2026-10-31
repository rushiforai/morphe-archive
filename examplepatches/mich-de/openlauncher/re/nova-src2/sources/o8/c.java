package o8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f79687t;

    /* renamed from: u, reason: collision with root package name */
    public c80.f f79688u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f79689v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ d f79690w;

    /* renamed from: x, reason: collision with root package name */
    public int f79691x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f79690w = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79689v = obj;
        this.f79691x |= Integer.MIN_VALUE;
        return this.f79690w.a(this);
    }
}
