package cy;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d0 f48506t;

    /* renamed from: u, reason: collision with root package name */
    public Context f48507u;

    /* renamed from: v, reason: collision with root package name */
    public c f48508v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f48509w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ d0 f48510x;

    /* renamed from: y, reason: collision with root package name */
    public int f48511y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48510x = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48509w = obj;
        this.f48511y |= Integer.MIN_VALUE;
        return this.f48510x.g(null, null, null, null, null, this);
    }
}
