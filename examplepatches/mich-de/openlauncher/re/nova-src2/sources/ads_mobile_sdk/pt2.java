package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class pt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f8379a;

    /* renamed from: b, reason: collision with root package name */
    public d f8380b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8381c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ lu2 f8382d;

    /* renamed from: e, reason: collision with root package name */
    public int f8383e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pt2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8382d = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8381c = obj;
        this.f8383e |= Integer.MIN_VALUE;
        return this.f8382d.c(this);
    }
}
