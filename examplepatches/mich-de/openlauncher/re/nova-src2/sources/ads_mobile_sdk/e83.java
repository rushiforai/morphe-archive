package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class e83 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f2781a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f2782b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2783c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ x2 f2784d;

    /* renamed from: e, reason: collision with root package name */
    public int f2785e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e83(x2 x2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2784d = x2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2783c = obj;
        this.f2785e |= Integer.MIN_VALUE;
        return x2.b(this.f2784d, this);
    }
}
