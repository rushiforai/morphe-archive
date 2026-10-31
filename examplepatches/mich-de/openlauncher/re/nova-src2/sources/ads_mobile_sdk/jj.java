package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public xj f5255a;

    /* renamed from: b, reason: collision with root package name */
    public d f5256b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5257c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ xj f5258d;

    /* renamed from: e, reason: collision with root package name */
    public int f5259e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jj(xj xjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5258d = xjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5257c = obj;
        this.f5259e |= Integer.MIN_VALUE;
        return xj.a(this.f5258d, this);
    }
}
