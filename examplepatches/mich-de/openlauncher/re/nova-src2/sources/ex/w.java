package ex;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f53114t;

    /* renamed from: u, reason: collision with root package name */
    public String f53115u;

    /* renamed from: v, reason: collision with root package name */
    public Object f53116v;

    /* renamed from: w, reason: collision with root package name */
    public c80.d f53117w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f53118x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ y f53119y;

    /* renamed from: z, reason: collision with root package name */
    public int f53120z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53119y = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53118x = obj;
        this.f53120z |= Integer.MIN_VALUE;
        return this.f53119y.b(null, this);
    }
}
