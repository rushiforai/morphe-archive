package v5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f92077t;

    /* renamed from: u, reason: collision with root package name */
    public b f92078u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f92079v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f92080w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ h f92081x;

    /* renamed from: y, reason: collision with root package name */
    public int f92082y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92081x = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92080w = obj;
        this.f92082y |= Integer.MIN_VALUE;
        return this.f92081x.a(null, this);
    }
}
