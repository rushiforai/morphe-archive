package ads_mobile_sdk;

import b.p5;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10811a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ wk3 f10812b;

    /* renamed from: c, reason: collision with root package name */
    public int f10813c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vk3(wk3 wk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10812b = wk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10811a = obj;
        this.f10813c |= Integer.MIN_VALUE;
        return this.f10812b.a((p5) null, this);
    }
}
