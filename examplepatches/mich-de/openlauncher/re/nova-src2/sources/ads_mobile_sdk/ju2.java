package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class ju2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f5411a;

    /* renamed from: b, reason: collision with root package name */
    public Function1 f5412b;

    /* renamed from: c, reason: collision with root package name */
    public d f5413c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5414d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f5415e;

    /* renamed from: f, reason: collision with root package name */
    public int f5416f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ju2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5415e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5414d = obj;
        this.f5416f |= Integer.MIN_VALUE;
        return this.f5415e.a((Function1) null, this);
    }
}
