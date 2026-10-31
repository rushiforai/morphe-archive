package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qq0 f4021a;

    /* renamed from: b, reason: collision with root package name */
    public Object f4022b;

    /* renamed from: c, reason: collision with root package name */
    public d f4023c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4024d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ qq0 f4025e;

    /* renamed from: f, reason: collision with root package name */
    public int f4026f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4025e = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4024d = obj;
        this.f4026f |= Integer.MIN_VALUE;
        return qq0.b(this.f4025e, this);
    }
}
