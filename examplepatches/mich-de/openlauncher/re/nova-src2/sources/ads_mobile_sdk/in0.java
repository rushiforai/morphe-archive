package ads_mobile_sdk;

import b.y4;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class in0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public jy0 f4880a;

    /* renamed from: b, reason: collision with root package name */
    public z1 f4881b;

    /* renamed from: c, reason: collision with root package name */
    public wf0 f4882c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4883d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ y4 f4884e;

    /* renamed from: f, reason: collision with root package name */
    public int f4885f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public in0(y4 y4Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4884e = y4Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4883d = obj;
        this.f4885f |= Integer.MIN_VALUE;
        return y4.a(this.f4884e, null, null, null, this);
    }
}
