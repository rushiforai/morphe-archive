package ads_mobile_sdk;

import bm.t;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class p03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8048a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f8049b;

    /* renamed from: c, reason: collision with root package name */
    public int f8050c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p03(t tVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8049b = tVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8048a = obj;
        this.f8050c |= Integer.MIN_VALUE;
        return this.f8049b.d(this);
    }
}
