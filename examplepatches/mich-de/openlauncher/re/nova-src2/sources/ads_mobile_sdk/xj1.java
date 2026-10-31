package ads_mobile_sdk;

import java.util.List;
import java.util.concurrent.Executor;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public List f11740a;

    /* renamed from: b, reason: collision with root package name */
    public Executor f11741b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f11742c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f11743d;

    /* renamed from: e, reason: collision with root package name */
    public int f11744e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11743d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11742c = obj;
        this.f11744e |= Integer.MIN_VALUE;
        return this.f11743d.a((List) null, (Executor) null, this);
    }
}
