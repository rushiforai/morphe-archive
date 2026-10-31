package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10388a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ vk2 f10389b;

    /* renamed from: c, reason: collision with root package name */
    public int f10390c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk2(vk2 vk2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10389b = vk2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10388a = obj;
        this.f10390c |= Integer.MIN_VALUE;
        return this.f10389b.c(this);
    }
}
