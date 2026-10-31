package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class tm0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public um0 f10000a;

    /* renamed from: b, reason: collision with root package name */
    public d f10001b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10002c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ um0 f10003d;

    /* renamed from: e, reason: collision with root package name */
    public int f10004e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tm0(um0 um0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10003d = um0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10002c = obj;
        this.f10004e |= Integer.MIN_VALUE;
        return um0.a(this.f10003d, this);
    }
}
