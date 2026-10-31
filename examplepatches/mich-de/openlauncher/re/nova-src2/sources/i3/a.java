package i3;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import y3.l;

/* loaded from: classes2.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f61216t;

    /* renamed from: u, reason: collision with root package name */
    public l f61217u;

    /* renamed from: v, reason: collision with root package name */
    public int f61218v;

    /* renamed from: w, reason: collision with root package name */
    public int f61219w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f61220x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ c f61221y;

    /* renamed from: z, reason: collision with root package name */
    public int f61222z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f61221y = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f61220x = obj;
        this.f61222z |= Integer.MIN_VALUE;
        return c.a(this.f61221y, null, null, this);
    }
}
