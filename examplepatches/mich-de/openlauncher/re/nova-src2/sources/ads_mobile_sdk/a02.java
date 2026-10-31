package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class a02 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b02 f789a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f790b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b02 f791c;

    /* renamed from: d, reason: collision with root package name */
    public int f792d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a02(b02 b02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f791c = b02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f790b = obj;
        this.f792d |= Integer.MIN_VALUE;
        return b02.b(this.f791c, this);
    }
}
