package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class rf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f9145a;

    /* renamed from: b, reason: collision with root package name */
    public d f9146b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9147c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ag f9148d;

    /* renamed from: e, reason: collision with root package name */
    public int f9149e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9148d = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9147c = obj;
        this.f9149e |= Integer.MIN_VALUE;
        return ag.d(this.f9148d, this);
    }
}
