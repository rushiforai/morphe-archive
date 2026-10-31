package s10;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public List f86642t;

    /* renamed from: u, reason: collision with root package name */
    public Function1 f86643u;

    /* renamed from: v, reason: collision with root package name */
    public d0 f86644v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f86645w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ d0 f86646x;

    /* renamed from: y, reason: collision with root package name */
    public int f86647y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86646x = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86645w = obj;
        this.f86647y |= Integer.MIN_VALUE;
        return this.f86646x.f(null, null, null, this);
    }
}
