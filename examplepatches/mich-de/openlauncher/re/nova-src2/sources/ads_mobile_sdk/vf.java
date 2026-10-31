package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class vf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10766a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ag f10767b;

    /* renamed from: c, reason: collision with root package name */
    public int f10768c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10767b = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10766a = obj;
        this.f10768c |= Integer.MIN_VALUE;
        return this.f10767b.a((byte[]) null, this);
    }
}
