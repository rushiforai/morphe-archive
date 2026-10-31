package q10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public b f83427t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f83428u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b f83429v;

    /* renamed from: w, reason: collision with root package name */
    public int f83430w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83429v = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83428u = obj;
        this.f83430w |= Integer.MIN_VALUE;
        return this.f83429v.b(this);
    }
}
