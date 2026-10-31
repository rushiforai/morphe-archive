package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class jj3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f5269a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f5270b;

    /* renamed from: c, reason: collision with root package name */
    public nj3 f5271c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5272d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ nj3 f5273e;

    /* renamed from: f, reason: collision with root package name */
    public int f5274f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jj3(nj3 nj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5273e = nj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5272d = obj;
        this.f5274f |= Integer.MIN_VALUE;
        return this.f5273e.j(this);
    }
}
