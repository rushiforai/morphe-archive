package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import l1.a2;

/* loaded from: classes2.dex */
public final class b1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public a2 f88536t;

    /* renamed from: u, reason: collision with root package name */
    public c80.a f88537u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88538v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ a2 f88539w;

    /* renamed from: x, reason: collision with root package name */
    public int f88540x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(a2 a2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88539w = a2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88538v = obj;
        this.f88540x |= Integer.MIN_VALUE;
        return this.f88539w.h(this);
    }
}
