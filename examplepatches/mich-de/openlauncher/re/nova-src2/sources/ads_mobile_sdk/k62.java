package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f5525a;

    /* renamed from: b, reason: collision with root package name */
    public jy0 f5526b;

    /* renamed from: c, reason: collision with root package name */
    public d f5527c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5528d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ w62 f5529e;

    /* renamed from: f, reason: collision with root package name */
    public int f5530f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5529e = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5528d = obj;
        this.f5530f |= Integer.MIN_VALUE;
        return this.f5529e.a((jy0) null, (ContinuationImpl) this);
    }
}
