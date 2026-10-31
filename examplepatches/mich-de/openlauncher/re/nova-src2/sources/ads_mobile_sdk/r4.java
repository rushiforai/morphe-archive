package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class r4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f8921a;

    /* renamed from: b, reason: collision with root package name */
    public d f8922b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8923c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f5 f8924d;

    /* renamed from: e, reason: collision with root package name */
    public int f8925e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8924d = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8923c = obj;
        this.f8925e |= Integer.MIN_VALUE;
        return f5.i(this.f8924d, this);
    }
}
