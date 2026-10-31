package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hu2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f4541a;

    /* renamed from: b, reason: collision with root package name */
    public d f4542b;

    /* renamed from: c, reason: collision with root package name */
    public long f4543c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4544d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f4545e;

    /* renamed from: f, reason: collision with root package name */
    public int f4546f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hu2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4545e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4544d = obj;
        this.f4546f |= Integer.MIN_VALUE;
        return lu2.a(0L, this.f4545e, this);
    }
}
