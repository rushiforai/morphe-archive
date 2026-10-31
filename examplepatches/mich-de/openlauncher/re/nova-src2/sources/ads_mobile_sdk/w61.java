package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f11064a;

    /* renamed from: b, reason: collision with root package name */
    public ni.g0 f11065b;

    /* renamed from: c, reason: collision with root package name */
    public d f11066c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11067d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ b71 f11068e;

    /* renamed from: f, reason: collision with root package name */
    public int f11069f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11068e = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11067d = obj;
        this.f11069f |= Integer.MIN_VALUE;
        return b71.a(this.f11068e, (ni.g0) null, this);
    }
}
