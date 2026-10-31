package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f3863a;

    /* renamed from: b, reason: collision with root package name */
    public Object f3864b;

    /* renamed from: c, reason: collision with root package name */
    public d f3865c;

    /* renamed from: d, reason: collision with root package name */
    public long f3866d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f3867e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ fl2 f3868f;

    /* renamed from: g, reason: collision with root package name */
    public int f3869g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3868f = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3867e = obj;
        this.f3869g |= Integer.MIN_VALUE;
        return fl2.c(this.f3868f, 0L, this);
    }
}
