package cn;

import java.util.Iterator;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class b extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public Map f20133t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f20134u;

    /* renamed from: v, reason: collision with root package name */
    public d f20135v;

    /* renamed from: w, reason: collision with root package name */
    public Map f20136w;

    /* renamed from: x, reason: collision with root package name */
    public Object f20137x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f20138y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ c f20139z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f20139z = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f20138y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f20139z.b(this);
    }
}
