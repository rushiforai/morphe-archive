package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gw extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public vw f4097a;

    /* renamed from: b, reason: collision with root package name */
    public d f4098b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f4099c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4100d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ vw f4101e;

    /* renamed from: f, reason: collision with root package name */
    public int f4102f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gw(vw vwVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4101e = vwVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4100d = obj;
        this.f4102f |= Integer.MIN_VALUE;
        return vw.a(this.f4101e, false, null, this);
    }
}
