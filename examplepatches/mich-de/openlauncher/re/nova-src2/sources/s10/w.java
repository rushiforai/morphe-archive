package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f86639t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d0 f86640u;

    /* renamed from: v, reason: collision with root package name */
    public int f86641v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86640u = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86639t = obj;
        this.f86641v |= Integer.MIN_VALUE;
        return this.f86640u.e(this);
    }
}
