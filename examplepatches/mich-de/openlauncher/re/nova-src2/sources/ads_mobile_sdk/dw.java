package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class dw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f2649a;

    /* renamed from: b, reason: collision with root package name */
    public com.google.gson.r f2650b;

    /* renamed from: c, reason: collision with root package name */
    public d f2651c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2652d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ vw f2653e;

    /* renamed from: f, reason: collision with root package name */
    public int f2654f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2653e = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2652d = obj;
        this.f2654f |= Integer.MIN_VALUE;
        return this.f2653e.a((Function1) null, this);
    }
}
