package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class wt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f11391a;

    /* renamed from: b, reason: collision with root package name */
    public d33 f11392b;

    /* renamed from: c, reason: collision with root package name */
    public d f11393c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11394d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f11395e;

    /* renamed from: f, reason: collision with root package name */
    public int f11396f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wt2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11395e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11394d = obj;
        this.f11396f |= Integer.MIN_VALUE;
        return this.f11395e.a((d33) null, this);
    }
}
