package v5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import m90.d0;

/* loaded from: classes2.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f92058t;

    /* renamed from: u, reason: collision with root package name */
    public d0 f92059u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f92060v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ b f92061w;

    /* renamed from: x, reason: collision with root package name */
    public int f92062x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92061w = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92060v = obj;
        this.f92062x |= Integer.MIN_VALUE;
        return b.f(this.f92061w, this);
    }
}
