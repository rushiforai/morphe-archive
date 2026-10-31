package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qq0 f4483a;

    /* renamed from: b, reason: collision with root package name */
    public d f4484b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4485c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ qq0 f4486d;

    /* renamed from: e, reason: collision with root package name */
    public int f4487e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4486d = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4485c = obj;
        this.f4487e |= Integer.MIN_VALUE;
        return qq0.c(this.f4486d, this);
    }
}
