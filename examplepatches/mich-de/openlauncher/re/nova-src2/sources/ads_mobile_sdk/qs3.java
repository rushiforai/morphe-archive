package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class qs3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ts3 f8788a;

    /* renamed from: b, reason: collision with root package name */
    public qo3 f8789b;

    /* renamed from: c, reason: collision with root package name */
    public d f8790c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f8791d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ts3 f8792e;

    /* renamed from: f, reason: collision with root package name */
    public int f8793f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qs3(ts3 ts3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8792e = ts3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8791d = obj;
        this.f8793f |= Integer.MIN_VALUE;
        return this.f8792e.b(null, this);
    }
}
