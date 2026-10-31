package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class oq0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public qq0 f7982a;

    /* renamed from: b, reason: collision with root package name */
    public cq0 f7983b;

    /* renamed from: c, reason: collision with root package name */
    public d f7984c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7985d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ qq0 f7986e;

    /* renamed from: f, reason: collision with root package name */
    public int f7987f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oq0(qq0 qq0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7986e = qq0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7985d = obj;
        this.f7987f |= Integer.MIN_VALUE;
        return qq0.a(this.f7986e, null, null, false, this);
    }
}
