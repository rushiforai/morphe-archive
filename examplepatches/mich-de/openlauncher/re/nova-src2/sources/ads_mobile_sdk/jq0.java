package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qq0 f5338a;

    /* renamed from: b, reason: collision with root package name */
    public cq0 f5339b;

    /* renamed from: c, reason: collision with root package name */
    public d f5340c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5341d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ qq0 f5342e;

    /* renamed from: f, reason: collision with root package name */
    public int f5343f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5342e = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5341d = obj;
        this.f5343f |= Integer.MIN_VALUE;
        return this.f5342e.b(this);
    }
}
