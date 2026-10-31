package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f10804a;

    /* renamed from: b, reason: collision with root package name */
    public d f10805b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10806c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fl2 f10807d;

    /* renamed from: e, reason: collision with root package name */
    public int f10808e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10807d = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10806c = obj;
        this.f10808e |= Integer.MIN_VALUE;
        return fl2.b(this.f10807d, this);
    }
}
