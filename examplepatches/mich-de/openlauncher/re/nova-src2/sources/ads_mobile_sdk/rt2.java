package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class rt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f9302a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9303b;

    /* renamed from: c, reason: collision with root package name */
    public ni.g0 f9304c;

    /* renamed from: d, reason: collision with root package name */
    public d f9305d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f9306e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ lu2 f9307f;

    /* renamed from: g, reason: collision with root package name */
    public int f9308g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rt2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9307f = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9306e = obj;
        this.f9308g |= Integer.MIN_VALUE;
        return lu2.a(this.f9307f, this);
    }
}
