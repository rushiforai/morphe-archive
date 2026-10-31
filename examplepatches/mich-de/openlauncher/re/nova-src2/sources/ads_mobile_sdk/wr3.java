package ads_mobile_sdk;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class wr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11371a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11372b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f11373c;

    /* renamed from: d, reason: collision with root package name */
    public th3 f11374d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f11375e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ bs3 f11376f;

    /* renamed from: g, reason: collision with root package name */
    public int f11377g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11376f = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11375e = obj;
        this.f11377g |= Integer.MIN_VALUE;
        return this.f11376f.b((List) null, this);
    }
}
