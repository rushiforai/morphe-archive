package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j32 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public p32 f5108a;

    /* renamed from: b, reason: collision with root package name */
    public pu0 f5109b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f5110c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f5111d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5112e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p32 f5113f;

    /* renamed from: g, reason: collision with root package name */
    public int f5114g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j32(p32 p32Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5113f = p32Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5112e = obj;
        this.f5114g |= Integer.MIN_VALUE;
        return p32.a(this.f5113f, (pu0) null, this);
    }
}
